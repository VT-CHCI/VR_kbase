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
//= require bootstrap.min

function remove_fields(link) {
  console.log($(link));
  $(link).prev("input[type=hidden]").val("true");
  $(link).parent().hide();
}

function remove_author_fields(link) {
  console.log($(link));
  $(link).prev("input[type=hidden]").val("true");
  $(link).parent().parent().parent().hide();
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

  $('#submit-doi').click(function() {
    if ($('#paper_doi').val()) {
      $('#submit-doi').button('loading');
      $(paper_doi).addClass('uneditable-input');

      $('.doi-field').removeClass('control-group error');
      $('.doi-field div span').remove(); //this removes error message

      //Clear all fields, hide all previous inputs except the first text field
      $('.author').each( function() {
        $(this).find('input[type=hidden]').val('false');
        $(this).hide();
      });
      
      $('.paper input[type=text]:visible').not(':eq(0)').val('')
      $('.paper input[type=number]').val('');

      // var surl = "http://www.crossref.org/openurl/?id=doi:" + $('#paper_doi').val() + "&noredirect=true&pid=scerbo@vt.edu&format=unixref";
      var surl = "http://people.cs.vt.edu/scerbo/doi-lookup.php?doi=" + $('#paper_doi').val();
  
      $.ajax({
        type: "GET",
        url: surl,
        dataType: "jsonp",
        success: function(data) {
          $('#submit-doi').button('reset');
          $(paper_doi).removeClass('uneditable-input');

          xmlDoc = $.parseXML( data );
          $xml = $( xmlDoc );
          
          // console.log($xml.find('error').length);

          if ($xml.find('error').length != 0) {
            $('.doi-well').after('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button><strong>DOI Error!</strong> There seems to be an error retrieving the DOI. Please re-enter the DOI and try again, or input the publication details manually.</div>');
          } else {
            $('.doi-well').after('<div class="alert alert-success"><button type="button" class="close" data-dismiss="alert">×</button><strong>Success!</strong> Paper has been populated with available information, please review before proceeding.</div>');

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
                $('.authors a').trigger('click');
                $('.author:visible').eq(a_index).children('.inline-group').children('.field').children('input').eq(0).val($(this).find('surname').text());
                $('.author:visible').eq(a_index).children('.inline-group').children('.field').children('input').eq(1).val($(this).find('given_name').text());
                a_index++;
              }
            });
          }
        },
        error: function(tmp) {
          console.log("error");
          $('.doi-well').after('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button><strong>Server Error!</strong> There was trouble communicating with the lookup server, we are sorry for the inconvenience. Please try again later or input the publication details manually.</div>');
          $('#submit-doi').button('reset');
          $(paper_doi).removeClass('uneditable-input');
        }
      });
    } else {
      $('.doi-field').addClass('control-group error');
      $('.doi-field div').append('<span class="help-inline">Field cannot be blank</span>');
    }
  });
});