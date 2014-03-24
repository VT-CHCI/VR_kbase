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
//= require parsley

// ##########################################################################
// Auto Generation of Detail Fields
// ##########################################################################

function create_component_description(focus, name, componentId, throughTable, component, descriptor) {
  var new_id = new Date().getTime(); //this isn't the being used it is a backup in case the id isn't set
  var experimentId = $(focus).data('experiment');
  var taskId = $(focus).data('task');

  if (taskId != undefined) {
    console.log(new_id);

    var selector = '#experiment_'+ experimentId+'_task_'+taskId+'_'+component+'_'+componentId;
    new_id = eval('paperManager.experiments['+experimentId+'].tasks['+taskId+'].'+component+'.addCount()');
    
    var container = '#experiment_'+ experimentId+'_task_'+taskId+'_'+throughTable;
  
    var divId = 'experiment_'+ experimentId+'_task_'+taskId+'_'+component+'_'+componentId;

    var componentIdId = 'paper_experiments_attributes_'+experimentId+'_tasks_attributes_'+taskId+'_'+throughTable+'s_attributes_'+new_id+'_'+component+'_id';
    var componentIdName = 'paper[experiments_attributes]['+experimentId+'][tasks_attributes]['+taskId+']['+throughTable+'s_attributes]['+new_id+']['+component+'_id]';

    var componentDescId = 'paper_experiments_attributes_'+experimentId+'_tasks_attributes_'+taskId+'_'+throughTable+'s_attributes_'+new_id+'_desc';
    var componentDescName = 'paper[experiments_attributes]['+experimentId+'][tasks_attributes]['+taskId+']['+throughTable+'s_attributes]['+new_id+'][desc]';

    var componentDestroyId = 'paper_experiments_attributes_'+experimentId+'_tasks_attributes_'+taskId+'_'+throughTable+'s_attributes_'+new_id+'__destroy';
    var componentDestroyName = 'paper[experiments_attributes]['+experimentId+'][tasks_attributes]['+taskId+']['+throughTable+'s_attributes]['+new_id+'][_destroy]';

  } else {
    var selector = '#experiment_'+ experimentId+'_'+component+'_'+componentId;
    new_id = eval('paperManager.experiments['+experimentId+'].'+component+'.addCount()');

    var container = '#experiment_'+ experimentId+'_'+throughTable;

    var divId = 'experiment_'+ experimentId+'_'+component+'_'+componentId;

    var componentIdId = 'paper_experiments_attributes_'+experimentId+'_'+throughTable+'s_attributes_'+new_id+'_'+component+'_id';
    var componentIdName = 'paper[experiments_attributes]['+experimentId+']['+throughTable+'s_attributes]['+new_id+']['+component+'_id]';

    var componentDescId = 'paper_experiments_attributes_'+experimentId+'_'+throughTable+'s_attributes_'+new_id+'_desc';
    var componentDescName = 'paper[experiments_attributes]['+experimentId+']['+throughTable+'s_attributes]['+new_id+'][desc]';

    var componentDestroyId = 'paper_experiments_attributes_'+experimentId+'_'+throughTable+'s_attributes_'+new_id+'__destroy';
    var componentDestroyName = 'paper[experiments_attributes]['+experimentId+']['+throughTable+'s_attributes]['+new_id+'][_destroy]';
  }

  if (focus.checked) {
    //fires when component of immersion is checked
    //checks to see if there is a detail that already exists for that component
    if($(selector).length) {
      //the detail existed (i.e. the user changed their mind) so we show it and mark destroy as false
      $(selector).show();
      $(selector).removeClass('_destroy');
      $(selector+' input.destroy').val(false);
    }
    else {
      //the detail doesn't exist, so we need to create it
      $(container).append(
        '<div data-id="'+new_id+'" id="'+divId+'" class="'+component+'"><div class="field">\
        <input data-attribute="'+component+'_id" id="'+componentIdId+'" name="'+componentIdName+'" type="hidden" value="'+componentId+'">\
        <label data-attribute="desc" for="'+componentDescId+'">'+name+' '+descriptor+'</label>\
        <input data-attribute="desc" class="span12" id="'+componentDescId+'" name="'+componentDescName+'" size="30" type="text">\
        <input data-attribute="_destroy" class="destroy" id="'+componentDestroyId+'" name="'+componentDestroyName+'" type="hidden" value="false">\
        </div></div>'
      );
    }
  } else {
    //this means the user unchecked the component so we make sure the detail exists, if it does we hide it and mark it to be destroyed
    if($(selector).length) {
      $(selector).hide();
      $(selector).addClass('_destroy');
      $(selector+' input.destroy').val(true);
    }
  }  
}

// ##########################################################################
// Other Fields Functionality
// ##########################################################################

function create_other(focus, name, componentId, throughTable, component, type, descriptor, authenticityToken) {
  var label = $('label[for="'+$(focus).prop('id')+'"]');
  var experimentId = $(focus).data('experiment');
  var taskId = $(focus).data('task');
  var attribute = $(focus).data('attribute');

  if (taskId != undefined) {
    var selector = '#experiment_'+ experimentId+'_task_'+taskId+'_'+component+'_'+componentId;
    var new_id = $(selector).data('id');
    
    var idSelector = '#paper_experiments_attributes_'+experimentId+'_tasks_attributes_'+taskId+'_'+throughTable+'s_attributes_'+new_id+'_'+component+'_id';
    var newRecordId = 'paper_experiments_attributes_'+experimentId+'_tasks_attributes_'+taskId+'_'+throughTable+'s_attributes_'+new_id+'_'+component+'_'+type;
    
    var newOtherId = 'experiments_attributes_'+experimentId+'_tasks_attributes_'+taskId+'_'+attribute+'_other';
    var newOtherData =  'data-experiment="'+experimentId+'" data-task="'+taskId+'"';
  } else {
    var selector = '#experiment_'+ experimentId+'_'+component+'_'+componentId;
    var new_id = $(selector).data('id');
    
    var idSelector = '#paper_experiments_attributes_'+experimentId+'_'+throughTable+'s_attributes_'+new_id+'_'+component+'_id';
    var newRecordId = 'paper_experiments_attributes_'+experimentId+'_'+throughTable+'s_attributes_'+new_id+'_'+component+'_'+type;
    
    var newOtherId = 'experiments_attributes_'+experimentId+'_'+attribute+'_other';
    var newOtherData = 'data-experiment="'+experimentId+'"';
  }

  if (!$(label).find('input').is(':visible')) {
    //Show input field
    $(label).find('input').show();
    $(label).find('span').show();

    //Create new item
    var uid = generateUniqueId($(focus).parent().parent().children().find('input'), 1E8);

    $(selector+' div.field').prepend(
      '<form class="hidden other-form other-add" data-remote="true">\
        <input name="utf8" type="hidden" value="✓"><input name="authenticity_token" type="hidden" value="'+authenticityToken+'">\
        <input id="'+newRecordId+'" name="'+component+'['+type+']" type="text" value="">\
      </form>'
    );

    //Set value of the id (this needs to set by form callback)
    $(idSelector).val(uid);

    //Set value of component name
    $(label).find('input').on('keyup change', function() {
      $('#'+newRecordId).val($(this).val());
      $(selector+' label').text($(this).val()+' '+descriptor);
    });

    //Add new other field
    $('.'+component+'-checkboxes').eq(0).append(
      '<div class="checkbox inline pill other">\
        <input data-attribute="'+attribute+'" '+newOtherData+' id="'+newOtherId+'_'+(new_id+1)+'" onchange="create_component_description(this, \'Other\', \'other'+'_'+(new_id+1)+'\', \''+throughTable+'\', \''+component+'\');create_other(this, \'Other\', \'other'+'_'+(new_id+1)+'\', \''+throughTable+'\', \''+component+'\', \''+type+'\', \'<%= form_authenticity_token %>\')" type="checkbox" value="other">\
        <label data-attribute="'+attribute+'" for="'+newOtherId+'_'+(new_id+1)+'">Other<span class="colon">:</span> <input class="input-small" type="text"></label>\
      </div>'
    ); 
  } else {
    if (focus.checked) {
      $(selector+' form').addClass('other-add');
      $(selector+' form').removeClass('other-destroy');
    } else {
      $(selector+' form').removeClass('other-add');
      $(selector+' form').addClass('other-destroy');
    }
  }
}

// ##########################################################################
// Unique ID Generator
// ##########################################################################

function generateUniqueId(inputs, size) {
  var notUnique = true;

  if ($(inputs).val() != undefined) {
    while (notUnique) {
      var uniqueId = Math.floor(Math.random()*size);

      $(inputs).each( function() {
        if ($(this).val() != uniqueId) {
          notUnique = false;
        } else {
          notUnique = true;
          return false;
        }
      });
    }
    return uniqueId;
  }
}

// ##########################################################################
// Remove Auto Generated Fields
// ##########################################################################

function remove_auto_gen_field(link, parentLevel) {
  $(link).prev("input[type=hidden]").val("true");

  if (parentLevel == 4) {
    $(link).parent().parent().parent().parent().hide();
    $(link).parent().parent().parent().parent().addClass('_destroy');
  } else {
    $(link).parent().parent().parent().hide();
    $(link).parent().parent().parent().addClass('_destroy');
  }
}

// ##########################################################################
// Update Author
// ##########################################################################

function update_author_order() {
  //console.log('Update author order');
  $('.author_paper:visible').each(function(index) {
    $(this).children('.inline-group').children('.order').children('input').eq(0).val(index);
  });

  $('[ref=tooltip]').tooltip();
}

// function click_add_finding(task_id) {
//   //console.log(task_id);
//   $('p.new_finding').each(function() {
//     //console.log($(this).parent().attr('id').indexOf(String(task_id)));
//     if($(this).parent().attr('id').indexOf(String(task_id)) > 0)
//       $(this).children().click();
//   });
//   //$('p.new_finding').children().click();

//   $('[ref=tooltip]').tooltip();
// }

// function click_add_task(experiment_id) {
//   //console.log(experiment_id);
//   $('p.new_task').each(function() {
//     //console.log($(this).parent().attr('id').indexOf(String(experiment_id)));
//     if($(this).parent().attr('id').indexOf(String(experiment_id)) > 0)
//       $(this).children().click();
//   });
//   //$('p.new_task').children().click();

//   $('[ref=tooltip]').tooltip();
// }

// function click_add_experiment() {
//   $('p.new_experiment').children().click();
// }

// ##########################################################################
// Progress Heading
// ##########################################################################

function add_progress_heading(association, focus) {
  var experimentId = $(focus).data('experiment');
  var taskId = $(focus).data('task');
  var findingId = $(focus).data('finding');

  var headingIndex = [experimentId+1];

  if (taskId != undefined) {
    headingIndex.push(taskId+1);
  }
  if (findingId != undefined) {
    headingIndex.push(findingId+1);
  }

  //Create heading
  if (association == 'experiments') {
    var heading = 'experiment-block-'+experimentId;

    $('#progress-headings').append(
      '<div class="'+heading+'">\
        <a class="experiment-heading" data-target="'+focus.selector+'" onclick="show_element(this)">\
          <div class="number-field">'+headingIndex.join('.')+'</div>\
          <div class="title-field">Unnamed Experiment</div>\
          <div class="close-field">\
            <button type="button" class="close">×</button>\
          </div>\
        </a>\
      </div>'
    );
    heading = '.'+heading+' .experiment-heading';
    
  }
  else if (association == 'tasks') {
    var heading = 'task-block-'+taskId;

    $('.experiment-block-'+experimentId).append(
      '<div class="'+heading+'">\
        <a class="task-heading" data-target="'+focus.selector+'" onclick="show_element(this)">\
          <div class="number-field">'+headingIndex.join('.')+'</div>\
          <div class="title-field">Unnamed Task</div>\
          <div class="close-field">\
            <button type="button" class="close">×</button>\
          </div>\
        </a>\
        <div class="finding-block"></div>\
      </div>'
    );
    heading = '.experiment-block-'+experimentId+' .'+heading+' .task-heading';
    
  } 
  else if (association == 'findings') {
    
  
  }

  //Set newely created heading to current and show it
  $('#progress-headings a.current').removeClass('current');
  $('#progress-headings '+heading).addClass('current');

  show_element($('#progress-headings '+heading), true);

  //Bind element title to heading title
  $(focus.selector + ' .field-title input').on('keyup',function() {
    var newTitle = $(this).val();
    
    if (newTitle.length < 1) {
      var singular = association.slice(0,-1);

      newTitle = 'Unnamed ' + singular;
    }

    $('#progress-headings '+heading+' .title-field').text(newTitle);
  });
}

function show_element (focus, slide) {
  var scrolled = false;
  var scrollTimeout;

  //Set click heading to current
  $('#progress-headings a.current').removeClass('current');
  $(focus).addClass('current');

  //Hide currently visible element and show new element
  if (slide) {
    $('.core-element:visible').fadeOut()
    $($(focus).data('target')).slideDown()
  } else {
    $('.core-element:visible').fadeOut()
    $($(focus).data('target')).fadeIn()
  }

  //The rest of the code is to prevent over scrolling 
  if (($("html, body").scrollTop() < 10) && !scrolled) {
    $("html, body").animate({ scrollTop: 0 }, 500);
    scrolled = true;
  }

  //Reset the timer
  clearTimeout(scrollTimeout);

  //If the user stops scrolling for 500 millis, they can trigger click w/ next scroll
  scrollTimeout = setTimeout(function(){
      scrolled = false;
  }, 500);   
}

function delete_element (focus) {

}

// ##########################################################################
// Token Input Instantiation
// ##########################################################################

function createTokenInput (focus) {
  $('#' + focus.attr('id') + ' .token-input input').each(function() {
    createSingleTokenInput(this)
  });
}

function createSingleTokenInput (focus) {
  var dataType = $(focus).data("type");
  var database;
  var limit;

  if ($(focus).data("database")) {
    database = $(focus).data("database");
  } else {
    database = dataType;
  }

  if ($(focus).data("limit")) {
    limit = $(focus).data("limit");
  } else {
    limit = null;
  }

  $(focus).tokenInput('/' + database + 's.json', {
    crossDomain: false,
    preventDuplicates: true,
    propertyToSearch: dataType,
    prePopulate: $(focus).data("pre"),
    tokenLimit: limit
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

      var tempButtonText = buttonText.split("\"");
      var tempAttributes = tempButtonText[3].split(/[[\]]{1,2}/);

      tempButtonText[1] = 'paper_experiments_attributes_' + tempAttributes[2] + '_tasks_attributes_' + tempAttributes[4] + '_findings_attributes_' + tempAttributes[6] + '_' + tempAttributes[7] + '_' + tempButtonText[7];
      tempButtonText[9] = tempButtonText[1]

      return '<label class="radio inline pill">' + tempButtonText.join('"') + '</label>'
    } else {
      if (type == 'component') {
        console.log('bt',buttonText);
      }
      else {
        buttonText = buttonText.replace(new RegExp('experiment_'+type,'g'), 'experiment_task_finding_'+type);
        buttonText = buttonText.replace(new RegExp(type+'_ids\\]\\[\\]','g'), 'tasks_attributes]['+parentId+'][findings_attributes]['+id+']['+type+'_ids][]');

        var tempButtonText = buttonText.split("\"");
        var tempAttributes = tempButtonText[3].split(/[[\]]{1,2}/);

        tempButtonText[1] = 'paper_experiments_attributes_' + tempAttributes[2] + '_tasks_attributes_' + tempAttributes[4] + '_findings_attributes_' + tempAttributes[6] + '_' + tempAttributes[7] + '_' + tempButtonText[7];
        tempButtonText[9] = tempButtonText[1]
      }
      
      return '<label class="checkbox inline pill">' + tempButtonText.join('"') + '</label>'
    }
  }

  $('#experiment_' + grandParentId + ' .fidelity-component:checked').parent().each ( function() {
    focus.children('.field').children('.fidelity').append(autoReplace($(this).html(), 'component', 'checkbox'));
  });

  $('#task_' + parentId + ' .metrics input:checked').parent().each ( function() {
    focus.children('.field').children('.metrics').append(autoReplace($(this).html(), 'metric', 'radio'));
  });

  $('#task_' + parentId + ' .task-categories input:checked').parent().each ( function() {
    focus.children('.field').children('.tasks').append(autoReplace($(this).html(), 'category', 'radio'));
  });

  $('.finding:visible').on('change', 'input', function() {
    var autoGenSentence = '_component_ had a _relationship_ relationship on _metric_ for _task_';
    var replaceSentence = 4;

    var componentText = $(".finding:visible .fidelity input:checked").map(function() {
        return $(this).next("label").text();
      }).get();
    var relationshipText = $(".finding:visible .relationships input:checked").map(function() {
        return $(this).next("label").text();
      }).get();
    var metricText = $(".finding:visible .metrics input:checked").map(function() {
        return $(this).next("label").text();
      }).get();
    var taskText = $(".finding:visible .tasks input:checked").map(function() {
        return $(this).next("label").text();
      }).get();

    if (componentText != '') {
      autoGenSentence = autoGenSentence.replace(new RegExp('_component_','g'), componentText.join(' and '));
      replaceSentence = replaceSentence - 1;
    }

    if (relationshipText != '') {
      if (relationshipText == 'Interaction') {
        autoGenSentence = autoGenSentence.replace(new RegExp('a _relationship_ relationship on','g'), 'an ' + relationshipText + ' with');
      } else if (relationshipText == 'Inverse') {
        autoGenSentence = autoGenSentence.replace(new RegExp('a _relationship_','g'), 'an ' + relationshipText);
      } else {
        autoGenSentence = autoGenSentence.replace(new RegExp('_relationship_','g'), relationshipText);
      }
      replaceSentence = replaceSentence - 1;
    }

    if (metricText != '') {
      autoGenSentence = autoGenSentence.replace(new RegExp('_metric_','g'), metricText);
      replaceSentence = replaceSentence - 1;
    }

    if (taskText != '') {
      autoGenSentence = autoGenSentence.replace(new RegExp('_task_','g'), taskText);
      replaceSentence = replaceSentence - 1;
    } 

    if (replaceSentence == 0) {

      $(".finding:visible .field-summary input").val(autoGenSentence.charAt(0) + autoGenSentence.slice(1).toLowerCase());
    }
  });
}

function add_fields_after (link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  if (association == 'experiments') {
    var focus = paperManager.addExperiment(link, association, content);
    
  } else if (association == 'tasks') {
    var focus = paperManager.addTask(link, association, content);
    
  } else if (association == 'findings') {
    populate_radio_buttons(focus, new_id);
  }
  else{
    $(link).parent().parent().after(content.replace(regexp, new_id));
  }

  add_progress_heading(association, focus);
}

function add_fields_before (link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  if (association == 'author_papers') {
    new_id = paperManager.authors.addCount();
  } 
  else if (association == 'experiment_displays' || association == 'experiment_hardwares' || association == 'experiment_indy_variables') {
    if (association == 'experiment_hardwares') {
      new_id = paperManager.experiments[$(link).parents().find('.experiment').data('id')].inputs.addCount();
    }
    else if (association == 'experiment_indy_variables') {
      new_id = paperManager.experiments[$(link).parents().find('.experiment').data('id')].indyVariables.addCount();
    }
  }

  $(link).parent().before(content.replace(regexp, new_id));
  createSingleTokenInput($(link).parent().prev().find('.token-input input'));
}

// ##########################################################################
// Add Ids
// ##########################################################################

function add_author_ids (data) {
  $(data.author_papers).each( function(i) {
    var index = this.order;
    console.log(i,index);

    $('.author_paper').eq(index).append('<input id="paper_author_papers_attributes_'+index+'_id" name="paper[author_papers_attributes]['+index+'][id]" type="hidden" value="'+this.id+'">');
    $('.author_paper').eq(index).children().find('.author').append('<input id="paper_author_papers_attributes_'+index+'_author_attributes_id" name="paper[author_papers_attributes]['+index+'][author_attributes][id]" type="hidden" value="'+this.author_id+'">');
  });
}


// ##########################################################################
// Ajax Calls
// ##########################################################################

var paperId = null;
var testData;

function save_paper (focus, association, content) {
  update_author_order();
  add_fields_after (focus, association, content);


  // if (paperId == null) {
  //   console.log('first post');
  //   $(focus).button('loading');
    
  //   $.ajax({
  //     type: 'POST',
  //     url: '/papers',
  //     data: $('form.paper-form').serialize(),
  //     dataType: 'json',
  //     success: function(data, status) {
  //       console.log(status, data); //whether successful or not

  //       //Get information and add put method for updating paper
  //       paperId = data.id;
  //       $('form.paper-form').prepend('<input name="_method" type="hidden" value="put">');

  //       //Set readonly inputs to readonly and remove destroyed objects and recount if needed
  //       paperManager.cleanUp();

  //       //Add nested attributes ids to form
  //       testData = data;
  //       add_author_ids(data);

  //       //Reset the button and add element
  //       $(focus).button('reset');
  //       // add_fields_after (focus, association, content)
  //     },
  //     error: function (error) {
  //       alert('There was an error when saving! Please notify an admin.');
  //       $(focus).button('reset');
  //     }
  //   });
  // } else {
  //   console.log('updating');

  //   $.ajax({
  //     type: 'POST',
  //     url: '/papers/'+paperId,
  //     data: $('form.paper-form').serialize(),
  //     dataType: 'json',
  //     success: function(data, status) {
  //       console.log(status, data);

  //       //Set readonly inputs to readonly and remove destroyed objects and recount if needed
  //       paperManager.cleanUp();

  //       //Reset the button and add element
  //       $(focus).button('reset');
  //       // add_fields_after (focus, association, content)
  //     },
  //     error: function (error) {
  //       alert('There was an error when saving! Please notify an admin.');
  //       $(focus).button('reset');
  //     }
  //   });
  // }
}

function save_other_fields () {

}

function add_test (focus) {
  $.ajax({
    type: 'GET',
    url: '/authors/Scerbo/Siroberto',
    dataType: 'json',
    success: function(data, status) {
      console.log(status, data);
    },
    error: function (error) {
      alert('There was an error when saving! Please notify an admin.');
      console.log(status, data);
    }
  });
}

// ##########################################################################
// Document Ready
// ##########################################################################

$(document).ready(function(){
  $(window).bind("popstate", function () {
      $.getScript(location.href);
    });

  var paperState = $('form').prop('id').split('_');

  if (paperState[0] == 'edit') {
    paperId = paperState[2];
    paperManager.authors.getCounts();
  } else {
    paperManager.authors.setCounts();
  }

  //Prevents users from accidentally leaving the page
  // window.onbeforeunload = function() { 
  //   return "Caution! All unsaved work will be lost. If you need to navigate to another section, please select the section in the Entry Navigation box on the left."; 
  // };

  //Prevents form from being submitted by enter key
  $('#new_paper').bind("keyup keypress", function(e) {
    var code = e.keyCode || e.which; 
    if (code  == 13) {               
      e.preventDefault();
      return false;
    }
  });

  $('[ref=tooltip]').tooltip();

// ##########################################################################
// Getting DOI Information
// ##########################################################################
  var timer;

  $('#submit-doi').click(function() {
    $('.doi-field').removeClass('control-group error');
    $('.doi-field span').remove(); //this removes error message

    window.clearTimeout(timer);
    $('.alert').alert('close');

    if ($('#paper_doi').val()) {
      $('#submit-doi').button('loading');
      $('#paper_doi').addClass('uneditable-input');
      $('#paper_doi').prop('readonly', true);

      //Clear all author fields
      $('.destroy-author:visible button').trigger('click');
      $('.alert').alert('close');

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
          $('#paper_doi').prop('readonly', false);

          xmlDoc = $.parseXML( data );
          $xml = $( xmlDoc );

          // console.log($xml.find('error').length);

          if ($xml.find('error').length != 0) {
            $('.doi-well').after('<div class="alert alert-error fade in"><button type="button" class="close" data-dismiss="alert">×</button><strong>DOI Error!</strong> There seems to be an error retrieving the DOI. Please re-enter the DOI and try again, or input the publication details manually.</div>');
          } else {
            $('.doi-well').after('<div class="alert alert-success fade in"><button type="button" class="close" data-dismiss="alert">×</button><strong>Success!</strong> Paper has been populated with available information, please review before proceeding.</div>');

            function autofill(selector,xmlString) {
              if (xmlString.length > 1) {
                $(selector).val($xml.find(xmlString).first().text());
              } else {
                $(selector).val($xml.find(xmlString).text());
              }
            }

            autofill('#paper_title',"title");

            if ($xml.find("journal").length) {
              autofill('#paper_venues_attributes_0_name',"full_title");
            } else if ($xml.find("conference").length) {
              autofill('#paper_venues_attributes_0_name',"proceedings_title");
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
                $('.author-generator a').trigger('click');
                $('.author:visible').eq(a_index).children('.field').children('input').eq(0).val($(this).find('surname').text());
                $('.author:visible').eq(a_index).children('.field').children('input').eq(1).val($(this).find('given_name').text());
                //$('.author:visible').eq(a_index).children('.field').children('input').eq(2).val($(this).find('middle_initial').text()); // need to get middle initial from somewhere
                a_index++;
              }
            });
          }
        },
        error: function(tmp) {
          console.log("doi error");
          $('.doi-well').after('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button><strong>Server Error!</strong> There was trouble communicating with the lookup server, we are sorry for the inconvenience. Please try again later or input the publication details manually.</div>');
          $('#submit-doi').button('reset');
          $(paper_doi).removeClass('uneditable-input');
          $('#paper_doi').prop('readonly', true);
        }
      });

      timer = window.setTimeout(function() { 
        $('.alert').alert('close'); 
      }, 10000);
    } else {
      $('.doi-field').addClass('control-group error');
      $('.doi-field').append('<span class="help-inline">Field cannot be blank</span>');
    }
  });
});