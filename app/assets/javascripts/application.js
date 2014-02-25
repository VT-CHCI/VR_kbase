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

function update_author_order() {
  console.log('Update author order');
  var a_index = 0;
  $('.author:visible').each(function(index) {
    $('.author:visible').eq(a_index).children('.inline-group').children('.field').children('input').eq(3).val(a_index);
    a_index++;
  });
}

var scrolled = false;
var scrollTimeout;

function add_progress_heading(association, new_id) {
  $('#progress_headings :header').each(function() {
    $(this).removeClass('current');
  });

  //Add to progress entry list
  var singular = association.slice(0,-1);
  var base = $('#' + singular + '_' + new_id + ' .field-title label').attr('for').replace('_title','');

  var parentSelector = $('#progress_headings');

  $('#progress_headings :header').each(function() {
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
  parentSelector.after('<h5 class="current ' + association + '" data-id=' + singular + '_' + new_id + ' data-target="' + base + '_title"><i class="icon-chevron-right"></i> <span class="title">Unnamed ' + singular + '</span></h5>');

  //Update headings
  $('.field-title input').on('keyup',function() {
    var field = $(this).attr('id');
    var newTitle = $(this).val();
    if (newTitle.length < 1) {
      newTitle = 'Unnamed ' + singular;
    }

    $('#progress_headings :header').each( function() {
      if ($(this).data('target') == field) {
        $(this).children('.title').text(newTitle);
      }
    });
  });

  //Jump to correct section and hide all other sections
  $('#progress_headings :header').on('click', function() {
    var heading = $(this);

    $('#progress_headings :header').each(function() {
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

    if (($("html, body").scrollTop() < 10) && !scrolled) {
      $("html, body").animate({ scrollTop: 0 }, 500);
      scrolled = true;
    }

    // Reset the timer
    clearTimeout(scrollTimeout);

    // If the user stops scrolling for 500 millis, they can trigger click w/ next scroll
    scrollTimeout = setTimeout(function(){
        scrolled = false;
    }, 500);
  });

  //Remove a component from the left
  $('#progress_headings a').on('click',function() {
    $('#'+ $(this).data('target')).val('true');
    $('#'+ $(this).data('target')).parent().hide();
    $(this).prev().remove();
    $(this).remove();
  });

  return $('#' + singular + '_' + new_id);
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

function populate_radio_buttons (focus, id) {
  var parentId = focus.children('.field-title').children('input').attr('name').split('][')[3];
  var grandParentId = focus.children('.field-title').children('input').attr('name').split('][')[1];

  function autoReplace (buttonText, type, ButtonType) {
    if ( ButtonType == 'radio' )  {

      buttonText = buttonText.replace(new RegExp('task_'+type,'g'), 'task_finding_'+type);
      buttonText = buttonText.replace(new RegExp(type+'_ids\\]\\[\\]','g'), 'findings_attributes]['+id+']['+type+'_id]');
      buttonText = buttonText.replace(new RegExp('type="checkbox"','g'), 'type="radio"');

      return '<label class="radio inline pill">' + buttonText + '</label>'
    } else {
      buttonText = buttonText.replace(new RegExp('experiment_'+type,'g'), 'experiment_task_finding_'+type);
      buttonText = buttonText.replace(new RegExp(type+'_ids\\]\\[\\]','g'), 'tasks_attributes]['+parentId+'][findings_attributes]['+id+']['+type+'_ids][]');

      return '<label class="checkbox inline pill">' + buttonText + '</label>'
    }
  }

  $('#experiment_' + grandParentId + ' .components-of-immersion input:checked').parent().each ( function() {
    focus.children('.field').children('.components-of-immersion').append(autoReplace($(this).html(), 'component', 'checkbox'));
  });

  $('#task_' + parentId + ' .metrics input:checked').parent().each ( function() {
    focus.children('.field').children('.metrics').append(autoReplace($(this).html(), 'metric', 'radio'));
  });

  $('#task_' + parentId + ' .task-categories input:checked').parent().each ( function() {
    focus.children('.field').children('.tasks').append(autoReplace($(this).html(), 'category', 'radio'));
  });
}

function add_fields_after (link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  $(link).parent().parent().after(content.replace(regexp, new_id));

  if (association != 'authors') {
    var focus = add_progress_heading(association, new_id);
    $("html, body").animate({ scrollTop: 0 }, 500);
    $('#paper_entry_form').children('div').not(focus).slideUp();

    createTokenInput(focus);

    if (association == 'findings') {
      populate_radio_buttons(focus, new_id);
    }
  }

  update_author_order();
}

function add_fields_before (link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  $(link).parent().before(content.replace(regexp, new_id));

  update_author_order();
}

$(document).ready(function(){
  $(window).bind("popstate", function () {
      $.getScript(location.href);
    });

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
        $(this).find('input[type=hidden]').val('true');
        $(this).hide();
      });

      $('.paper input[type=text]:visible').not(':eq(0)').val('');
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
                //$('.author:visible').eq(a_index).children('.inline-group').children('.field').children('input').eq(2).val($(this).find('middle_initial').text()); // need to get middle initial from somewhere
                $('.author:visible').eq(a_index).children('.inline-group').children('.field').children('input').eq(3).val(a_index);
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