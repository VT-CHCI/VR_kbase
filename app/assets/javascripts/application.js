// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

function remove_fields(link) {
  console.log($(link));
  $(link).prev("input[type=hidden]").val("true");
  $(link).parent().hide();
}

function add_progress_heading(association, new_id) {
  $('#progress_headings h3').each(function() {
    $(this).removeClass('current');
  });

  //Add to progress entry list
  var singular = association.slice(0,-1);
  var base = $('#' + singular + '_' + new_id + ' .field-title label').attr('for').replace('_title','');

  var parentSelector = $('#progress_headings');

  $('#progress_headings h3').each(function() {
    var mySplitResult = $(this).data('id').split("_");
    mySplitResult = mySplitResult[0] + 's_attributes_' + mySplitResult[1];
    
    if (base.match(mySplitResult)) {
      parentSelector = $(this).next();
    } 
  });

  if (parentSelector[0] == $('#progress_headings')[0]) {
    parentSelector = $('#progress_headings h3.papers');
  }

  parentSelector.after('<a href="#" data-target="' + base + '__destroy">Remove</a>');
  parentSelector.after('<h3 class="current ' + association + '" data-id=' + singular + '_' + new_id + ' data-target="' + base + '_title">Unnamed ' + singular + '</h3>');
  
  //Update headings
  $('.field-title input').on('keyup',function() {
    var field = $(this).attr('id');
    var newTitle = $(this).val();
    if (newTitle.length < 1) {
      newTitle = 'Unnamed ' + singular;       
    }

    $('#progress_headings h3').each( function() {
      if ($(this).data('target') == field) {
        $(this).text(newTitle);
      }
    });
  });

  //Jump to correct section and hide all other sections
  $('#progress_headings h3').on('click', function() {
    var heading = $(this);
    $('#progress_headings h3').each(function() {
      $(this).removeClass('current');
    });
    $(this).addClass('current');

    $('#paper_entry_form').children('div').each(function() {
      if ($(this).attr('id') == heading.data('id')){
        $(this).slideDown();
      } else {
        $(this).slideUp();
      }
    });

    if($("html, body").scrollTop() < 10) {
      $("html, body").animate({ scrollTop: 0 }, 500);
    }
  });

  //Remove a component from the left
  $('#progress_headings a').on('click',function() {
    $('#'+ $(this).data('target')).val('true');
    $('#'+ $(this).data('target')).parent().hide();
    $(this).prev().remove();
    $(this).remove();
  });

  return $('#' + singular + '_' + new_id)
}

function createTokenInput (focus) {
  $('#' + focus.attr('id') + ' .token-input input').each(function() {
    var dataType = $(this).data("type");
    var database;
    
    if ($(this).data("database")) {
      database = $(this).data("database");
    } else {
      database = dataType;
    }

    $(this).tokenInput('/' + database + 's.json', {
      crossDomain: false,
      preventDuplicates: true,
      propertyToSearch: dataType,
      prePopulate: $(this).data("pre")
    });
  });
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

   //console.log(new_id);
   //console.log(regexp);

  $(link).parent().before(content.replace(regexp, new_id));

  if (association != 'authors') {  
    var focus = add_progress_heading(association, new_id);
    $("html, body").animate({ scrollTop: 0 }, 500);
    $('#paper_entry_form').children('div').not(focus).slideUp();

    console.log(focus);
    createTokenInput(focus);
  }
}

$(document).ready(function(){
  if(window.location.href.indexOf("new") > -1) {
     $('.authors a').trigger('click');
  }

  $('.token-input input').each(function() {
    var dataType = $(this).data("type");

    $(this).tokenInput('/' + dataType + 's.json', {
      crossDomain: false,
      preventDuplicates: true,
      propertyToSearch: dataType,
      prePopulate: $(this).data("pre")
    });
  });

  $('#submit_doi').click(function() {
    if ($('#paper_doi').val()) {
      $('.loading_content').css('z-index','1')
      $('.loading_content').animate({opacity: '1'},500)
      // var surl = "http://www.crossref.org/openurl/?id=doi:" + $('#paper_doi').val() + "&noredirect=true&pid=scerbo@vt.edu&format=unixref";
      var surl = "http://people.cs.vt.edu/scerbo/doi-lookup.php?doi=" + $('#paper_doi').val();
  
      $.ajax({
        type: "GET",
        url: surl,
        dataType: "jsonp",
        success: function(data) {
          xmlDoc = $.parseXML( data );
          $xml = $( xmlDoc );

          function autofill(selector,xmlString) {
            if (xmlString.length > 1) {
              $(selector).val($xml.find(xmlString).first().text());
            } else {
              $(selector).val($xml.find(xmlString).text());
            }
          }

          autofill('#paper_title',"title");

          if ($xml.find("journal").length) {
            autofill('#paper_venue_attributes_name',"full_title");
          } else if ($xml.find("conference").length) {
            autofill('#paper_venue_attributes_name',"proceedings_title");
          }
          
          autofill('#paper_year_1i',"year");
          autofill('#paper_volume',"volume");
          autofill('#paper_issue',"issue");
          autofill('#paper_start_page',"first_page");
          autofill('#paper_end_page',"last_page");
          autofill('#paper_paper_url',"resource");

          var authors = new Array();

          var len = $xml.find('person_name').length;
          var a_index = 0;
          $xml.find('person_name').each(function(index) {
            if ($(this).attr('contributor_role') == "author") {
              // console.log($(this).find('surname').text());
              $('.author').eq(a_index).children('.field').children('input').eq(0).val($(this).find('surname').text());
              $('.author').eq(a_index).children('.field').children('input').eq(1).val($(this).find('given_name').text());
              a_index++;
              if (index != len - 1) {
                $('.authors a').trigger('click');
              }
            }
          });

          // console.log($xml);
          $('.loading_content').animate({
            opacity: '0'
          }, 500, function() {
            $('.loading_content').css('z-index','-1')
          });
        },
        error: function(tmp) {
          console.log(tmp);
          console.log("error");
          $('.loading_content').animate({
            opacity: '0'
          }, 500, function() {
            $('.loading_content').css('z-index','-1')
          });
        }
      });
    }
  });
});