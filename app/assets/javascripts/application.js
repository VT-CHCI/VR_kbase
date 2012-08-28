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

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

   console.log(new_id);
   console.log(regexp);

  $(link).parent().before(content.replace(regexp, new_id));

  if (association == 'experiments') {
    $('.paper').slideUp();
    $("html, body").animate({ scrollTop: 0 }, 600);
    $('#progress_headings h3').each(function() {
      $(this).removeClass('current');
    });

    $('#progress_headings').append('<h3 class="current experiment paper_experiments_attributes_'+ new_id + '_title">Experiment 1</h3>');
    $('#progress_headings').append('<a href="#" class="paper_experiments_attributes_' + new_id + '__destroy">Remove</a>');

    $('.field-title input').on('keyup',function() {
      newTitle = $(this).val();
      if (newTitle.length < 1) {
        newTitle = 'Unnamed Experiment';       
      }
      // console.log($(this).attr('id'));
      $('#progress_headings').children('.' + $(this).attr('id')).text(newTitle);
    });

    $('#progress_headings a').on('click',function() {
      console.log($(this).attr('class'));

      $('#'+ $(this).attr('class')).val('true');
      // console.log($('#'+ $(this).attr('class')).parent());
      $('#'+ $(this).attr('class')).parent().hide();
      $(this).prev(".experiment").remove();
      $(this).remove();
    });
  }
}

$(document).ready(function(){
  $('.authors a').trigger('click');

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