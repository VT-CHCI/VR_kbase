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
//= require underscore
//= require json2
//= require judge

// ##########################################################################
// Validation
// ##########################################################################

var paperValid = true;
var scrolledTo = false;

function validate_all_fields () {
  paperValid = true;
  scrolledTo = false;  

  $($('.core-element:visible .validated-field:visible')).each( function() {
    validate_field(this);
    scrollToErrorField(this);
  });

  if ($('.core-element:visible').hasClass('paper')) {
    checkAuthorsCount();
  }
  
  if ($('.core-element:visible').hasClass('experiment')) {
    checkGenderBalance();
    checkVariables();
    checkBlanks();
  }

  if ($('.core-element:visible').hasClass('task')) {
    checkCategories();
    checkEnvironmentVariables();
    checkMetrics();
  }

  if ($('.core-element:visible').hasClass('finding')) {

  }

  if ($('.finding').length > 0 && paperValid) {
    $('#submit-button').show();
  } else {
    $('#submit-button').hide();
  }
}

function validate_field (focus) {
  judge.validate(focus, {
    valid: function(element) {
      $(element).parent().addClass('success');
      $(element).parent().removeClass('error');
      $(element).prev().removeClass('error');

      paperValid = paperValid && true;
    },
    invalid: function(element, messages) {
      $(element).parent().addClass('error');
      $(element).parent().removeClass('success');
      $(element).prev().addClass('error');
      
      console.log('not valid!', messages.join(','));
      paperValid = paperValid && false;
    }
  });
}

function setUrlClasses (valid) {
  var focus = $('#paper .field-url input');

  if (valid) {
    $(focus).parent().addClass('success');
    $(focus).parent().removeClass('error');
    $(focus).prev().removeClass('error');
  }
  else {
    $(focus).parent().addClass('error');
    $(focus).parent().removeClass('success');
    $(focus).prev().addClass('error');

    scrollToErrorField($('#paper .field-url input'));
  } 
}

function checkAuthorsCount () {
  if ($('.authors input:visible').length/3 > 0 ) {
    paperValid = paperValid && true;
    
    $('.authors-title .nested-validation-text').addClass('hidden');
  } else {
    paperValid = paperValid && false;
    
    $('.authors-title .nested-validation-text').removeClass('hidden');
    scrollToErrorField($('.authors-title'), 120);
  }
}

function checkGenderBalance () {
  if ($('.core-element:visible .gender input:checked').length > 0 ) {
    paperValid = paperValid && true;
    
    $('.core-element:visible .field-gender label').eq(0).removeClass('error');
  } else {
    paperValid = paperValid && false;
    
    $('.core-element:visible .field-gender label').eq(0).addClass('error');
    scrollToErrorField($('.core-element:visible .field-gender'));
  }
}

function checkVariables () {
  var empty = true;

  $('.core-element:visible .variables_group[data-attribute=indy_variable_tokens]').each( function() {
    if ($(this).val().length > 0) {
      console.log()
      empty = false;
    }
   });

  if ($('.core-element:visible .variables_group:checked').length > 0 || !empty) {
    paperValid = paperValid && true;

    $('.core-element:visible .variables-validation-text span').addClass('hidden');
  } else {
    paperValid = paperValid && false;
    
    $('.core-element:visible .variables-validation-text span').removeClass('hidden');
    scrollToErrorField($('.core-element:visible .variables-validation-text').eq(0), 120);
  }
}

function checkBlanks () {
  if (paperValid) {
    $('.core-element:visible .hardwares .generated:visible').each( function () {
      if ($(this).children().find('.token-input input[data-type=hardware]').val() == '') {
        $(this).children().find('button').click();
      }
    });

    $('.core-element:visible .indy-variables .generated:visible').each( function () {
      if ($(this).children().find('.token-input input[data-type=variable]').val() == '') {
        $(this).children().find('button').click();
      }
    });
  }
}

function checkCategories () {
  if ($('.core-element:visible .task-categories input:checked').length > 0) {
    paperValid = paperValid && true;

    $('.core-element:visible .categories-validation-text span').addClass('hidden');
  } else {
    paperValid = paperValid && false;
    
    $('.core-element:visible .categories-validation-text span').removeClass('hidden');
    scrollToErrorField($('.core-element:visible .categories-validation-text').eq(0), 120);
  }
}

function checkEnvironmentVariables () {
  $('.core-element:visible .environment-group').each(function() {
    if ($(this).find('input:checked').length > 0) {
      paperValid = paperValid && true;

      $(this).find('label').eq(0).removeClass('error');
    } else {
      paperValid = paperValid && false;
    
      $(this).find('label').eq(0).addClass('error');
      scrollToErrorField($(this).find('label').eq(0));
    }
  });
}

function checkMetrics () {
  if ($('.core-element:visible .metrics input:checked').length > 0) {
    paperValid = paperValid && true;

    $('.core-element:visible .metrics-validation-text span').addClass('hidden');
  } else {
    paperValid = paperValid && false;
    
    $('.core-element:visible .metrics-validation-text span').removeClass('hidden');
    scrollToErrorField($('.core-element:visible .metrics-validation-text').eq(0), 120);
  }
}

function checkAutoComplete (focus) {
  if ($(focus).val().length > 0) {
    $(focus).parent().next().find('label').addClass('required');
    $(focus).parent().next().find('input:text').addClass('validated-field');
    $(focus).parent().next().find('input:text').change(function() { validate_field(this) });
  } else {
    $(focus).parent().next().find('label').removeClass('required');
    $(focus).parent().next().find('input:text').removeClass('validated-field');
    $(focus).parent().next().find('input:text').onchange = undefined;
  }
}

function scrollToErrorField (focus, offset) {
  if (offset == undefined) {
    offset = 225
  }

  if (!scrolledTo && !paperValid) {
    console.log('scrolling!', focus);
    $('html, body').animate({
        scrollTop: $(focus).offset().top - offset
    }, 1000);

    scrolledTo = true;
  }
}

function clear_validation_text (focus) {
  $(focus).parent().removeClass('error');
  $(focus).prev().removeClass('error');
}

// ##########################################################################
// Auto Generation of Detail Fields
// ##########################################################################

function create_component_description(focus, name, componentId, throughTable, component, descriptor, tooltip) {
  var new_id = new Date().getTime(); //this isn't the being used it is a backup in case the id isn't set
  var experimentId = $(focus).data('experiment');
  var taskId = $(focus).data('task');

  if (taskId != undefined) {
    var selector = '#experiment_'+ experimentId+'_task_'+taskId+'_'+component+'_'+componentId;
    new_id = eval('paperManager.experiments['+experimentId+'].tasks['+taskId+'].'+component+'.addCount()');
    
    var container = '#experiment_'+ experimentId+'_task_'+taskId+'_'+throughTable;
  
    var divId = 'experiment_'+ experimentId+'_task_'+taskId+'_'+component+'_'+componentId;
    var throughTableId = '#paper_experiments_attributes_'+experimentId+'_tasks_attributes_'+taskId+'_'+throughTable+'s_attributes_'+$(selector).data('id')+'_id';

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
    var throughTableId = '#paper_experiments_attributes_'+experimentId+'_'+throughTable+'s_attributes_'+$(selector).data('id')+'_id';

    var componentIdId = 'paper_experiments_attributes_'+experimentId+'_'+throughTable+'s_attributes_'+new_id+'_'+component+'_id';
    var componentIdName = 'paper[experiments_attributes]['+experimentId+']['+throughTable+'s_attributes]['+new_id+']['+component+'_id]';

    var componentDescId = 'paper_experiments_attributes_'+experimentId+'_'+throughTable+'s_attributes_'+new_id+'_desc';
    var componentDescName = 'paper[experiments_attributes]['+experimentId+']['+throughTable+'s_attributes]['+new_id+'][desc]';

    var componentDestroyId = 'paper_experiments_attributes_'+experimentId+'_'+throughTable+'s_attributes_'+new_id+'__destroy';
    var componentDestroyName = 'paper[experiments_attributes]['+experimentId+']['+throughTable+'s_attributes]['+new_id+'][_destroy]';
  
  }

  if (tooltip) {
    var tooltipText = ' ref="tooltip" data-original-title="Enter the different levels or conditions of this component varied in this experiment" data-container="body" data-placement="left"';
  } else {
    var tooltipText = '';
  }

  if (focus.checked) {
    //fires when component of immersion is checked
    //checks to see if there is a detail that already exists for that component
    if($(selector).length) {
      //the detail existed (i.e. the user changed their mind) so we show it and mark destroy as false
      $(selector).show();
      $(selector).removeClass('_destroy');
      $(selector+' input.destroy').val(false);
      $(throughTableId).removeClass('_destroy');
    }
    else {
      //the detail doesn't exist, so we need to create it
      $(container).append(
        '<div data-id="'+new_id+'" id="'+divId+'" class="'+component+'"><div class="field control-group">\
        <input data-attribute="'+component+'_id" id="'+componentIdId+'" name="'+componentIdName+'" type="hidden" value="'+componentId+'">\
        <label data-attribute="desc" for="'+componentDescId+'" class="required">'+name+' '+descriptor+'</label>\
        <input data-attribute="desc" data-validate="[{&quot;kind&quot;:&quot;presence&quot;,&quot;options&quot;:{},&quot;messages&quot;:{&quot;blank&quot;:&quot;can\'t be blank&quot;}}]" class="span12 validated-field" onchange="validate_field(this)" id="'+componentDescId+'" name="'+componentDescName+'"'+tooltipText+' size="30" type="text" required="required">\
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
      $(throughTableId).addClass('_destroy');
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
        <input data-attribute="'+attribute+'" '+newOtherData+' id="'+newOtherId+'_'+(new_id+1)+'" onchange="create_component_description(this, \'Other\', \'other'+'_'+(new_id+1)+'\', \''+throughTable+'\', \''+component+'\', \''+descriptor+'\');create_other(this, \'Other\', \'other'+'_'+(new_id+1)+'\', \''+throughTable+'\', \''+component+'\', \''+type+'\', \''+descriptor+'\', \'<%= form_authenticity_token %>\')" type="checkbox" value="other">\
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
  $(link).prev('input[type=hidden]').val('true');

  if (parentLevel == 4) {
    var focus = $(link).parent().parent().parent().parent();
    var coreParentId = $(link).parents('.experiment').data('experiment');
  } else {
    var focus = $(link).parent().parent().parent();
    var coreParentId = '';
  }

  focus.hide();
  focus.addClass('_destroy');

  var type = focus.data('type');
  var instance = focus.data(type);
  
  $('[id*='+coreParentId+'_'+type.split('-').join('_')+'s_attributes_'+instance+'_id]').addClass('_destroy');

  update_author_order();
}

// ##########################################################################
// Update Author
// ##########################################################################

function update_author_order() {
  //console.log('Update author order');
  $('.author_paper:visible').each( function(index) {
    $(this).children('.inline-group').children('.order').children('input').eq(0).val(index);
  });
}

// ##########################################################################
// Progress Heading
// ##########################################################################

function add_progress_heading(association, focus, repopulate) {
  var experimentId = $(focus).data('experiment');
  var taskId = $(focus).data('task');
  var findingId = $(focus).data('finding');

  //Create heading
  if (association == 'experiments') {
    var heading = 'experiment-block-'+experimentId;
    var link = '<a class="label nav-core-element-add" data-loading-text="Saving..." onclick="add_core_element(this); return false;">Save and Add Task</a>';

    $('#progress-headings .nav-experiments').append(
      '<div id="'+heading+'" class="nav-core-element-block experiment-block">\
        <a class="experiment-heading" data-target="'+focus.selector+'" onclick="show_element(this)">\
          <div class="title-field">Unnamed Experiment</div>\
          <div class="close-field">\
            <button type="button" class="close">×</button>\
          </div>\
        </a>\
        <div class="nav-tasks"></div><div class="new-add-links">'+link+'</div>\
      </div>'
    );
    var collapse = '#'+heading+' .nav-tasks';
    heading = '#'+heading+' .experiment-heading';

  }
  else if (association == 'tasks') {
    var heading = 'task-block-'+taskId;
    var link = '<a class="label nav-core-element-add" data-loading-text="Saving..." onclick="add_core_element(this); return false;">Save and Add Finding</a>';

    $('#experiment-block-'+experimentId+' .nav-tasks').append(
      '<div id="'+heading+'" class="nav-core-element-block task-block">\
        <a class="task-heading open" data-target="'+focus.selector+'" onclick="show_element(this)">\
          <div class="collapse-field">\
            <i class="icon-chevron-right" data-toggle="collapse" data-target="#'+heading+' .nav-findings"></i>\
            <i class="icon-chevron-down" data-toggle="collapse" data-target="#'+heading+' .nav-findings"></i>\
          </div>\
          <div class="title-field">Unnamed Task</div>\
          <div class="badge-field hidden">\
            <span class="badge badge-info">8</span>\
          </div>\
          <div class="close-field">\
            <button type="button" class="close">×</button>\
          </div>\
        </a>\
        <div class="nav-findings collapse in"></div><div class="new-add-links">'+link+'</div>\
      </div>'
    );
    var collapse = '#experiment-block-'+experimentId+' #'+heading+' .nav-findings';
    heading = '#experiment-block-'+experimentId+' #'+heading+' .task-heading';

  } 
  else if (association == 'findings') {
    var heading = 'finding-block-'+findingId;

    $('#experiment-block-'+experimentId+' #task-block-'+taskId+' .nav-findings').append(
      '<div id="'+heading+'" class="nav-core-element-block finding-block">\
        <a class="finding-heading" data-target="'+focus.selector+'" onclick="show_element(this)">\
          <div class="title-field">Unnamed Finding</div>\
          <div class="close-field">\
            <button type="button" class="close">×</button>\
          </div>\
        </a>\
      </div>'
    );
    var collapse = undefined;
    heading = '#experiment-block-'+experimentId+' #task-block-'+taskId+' #'+heading+' .finding-heading';
  
  }

  $('#progress-headings .task-block').css('padding-left', (6 - 500/Math.round($('#progress-headings .experiment-block').width()))+'%');
  $('#progress-headings .experiment-block .new-add-links').css('padding-left', (6 - 500/Math.round($('#progress-headings .experiment-block').width()))+'%');

  $('#progress-headings .finding-block').css('padding-left', (6 - 500/Math.round($('#progress-headings .task-block').width()))+'%');
  $('#progress-headings .task-block .new-add-links').css('padding-left', (6 - 500/Math.round($('#progress-headings .task-block').width()))+'%');

  //Bind element title to heading title
  $(focus.selector + ' .field-title input').eq(0).keyup( function() {
    var newTitle = $(this).val();
    
    if (newTitle.length < 1) {
      newTitle = 'Unnamed ' + association.slice(0,-1);
    }

    $('#progress-headings '+heading+' .title-field').text(newTitle);
  });

  //Remove element when close is clicked and prevent the show_element functionality
  $('#progress-headings '+heading+' .close').click( function(e) {
    var type = $(this).parent().parent().prop('id').split('-')[0];
    var target = $(this).parent().parent().data('target').split('_');
    var navTarget;
    var targetDestroyId = '#paper_';  

    for (var i = 0; i< target.length; i++) {
      if (i == 1) {
        navTarget = '#experiment-block-'+target[i];
        targetDestroyId = targetDestroyId+'experiments_attributes_'+target[i];
      } 
      else if (i == 3) {
        navTarget = navTarget+' #task-block-'+target[i];
        targetDestroyId = targetDestroyId+'_tasks_attributes_'+target[i];
      } 
      else if (i == 5) {
        navTarget = navTarget+' #finding-block-'+target[i];
        targetDestroyId = targetDestroyId+'_findings_attributes_'+target[i];
      }
    };

    $('#element-title-to-delete').html($(this).parent().parent().children('.title-field').html());
    $('.element-type-to-delete').each( function () {
      $(this).html(type);
    });

    if (type == 'finding') {
      $('.element-dependants').each( function () {
        $(this).html('');
      });
    } else {
      $('.element-dependants').each( function () {
        $(this).html(' and its dependants');
      });
    }

    $('#element-nav-id-to-delete').html(navTarget);
    $('#element-destroy-id-to-delete').html(targetDestroyId+'__destroy');

    $('#delete-core-element-modal').modal('show');

    e.preventDefault();
    e.stopPropagation();
  });

  $('#progress-headings '+heading+' i').click( function(e) {
    $($(this).data('target')).collapse('toggle');

    e.preventDefault();
    e.stopPropagation();
  });

  if (collapse != undefined) {
    $(collapse).on('hidden', function (e) {
      $(e.target).addClass('closed');
      $(e.target).removeClass('open');
    });

    $(collapse).on('shown', function (e) {
      console.log($(e));

      $(e.target).removeClass('closed');
      $(e.target).addClass('open');
    })
  }

  if (repopulate) {
    //Keep publicaiton info visible and rename if title is present
    $($('#progress-headings '+heading).data('target')).hide();
    $(focus.selector + ' .field-title input').keyup();

    if (association == 'findings') {
      //repopulate buttons of findings
      repopulate_buttons($(focus.selector));
    }
  } else {
    //Set newely created heading to current and show it
    show_element($('#progress-headings '+heading), true);
  }
}

function show_element (focus, slide) {
  var scrolled = false;
  var scrollTimeout;

  if (!$(focus).hasClass('current')) {
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

    //If this is a finding, we need to populate buttons
    if ($(focus).data('target').search('finding') > -1) {
      repopulate_buttons($(focus).data('target'));
    }

    //The rest of the code is to prevent over scrolling 
    if (($("html, body").scrollTop() < 10) && !scrolled) {
      $("html, body").animate({ scrollTop: 0 }, 500);
      scrolled = true;
    }

    //Reset the timer
    clearTimeout(scrollTimeout);

    //If the user stops scrolling for 500 millis, they can trigger click w/ next scroll
    scrollTimeout = setTimeout( function(){
        scrolled = false;
    }, 500);
  }   
}

function delete_element () {
  $($('#element-nav-id-to-delete').html()).hide();
  $($('#element-nav-id-to-delete').html()).addClass('_destroy');

  $($('#element-destroy-id-to-delete').html()).val('true');
  $($('#element-destroy-id-to-delete').html()).addClass('_destroy');

  $('#delete-core-element-modal').modal('hide');
}

// ##########################################################################
// Token Input Instantiation
// ##########################################################################

function createTokenInput (focus) {
  $('#' + focus.prop('id') + ' .token-input input').each( function() {
    createSingleTokenInput(this)
  });
}

function createSingleTokenInput (focus) {
  var dataType = $(focus).data("type");
  var currentData;
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
  
  if ($(focus).data("pre") === null || $(focus).data("pre") instanceof Array) {
    currentData = $(focus).data("pre");
  } else {
    currentData = [$(focus).data("pre")];
  }

  $(focus).tokenInput('/' + database + 's.json', {
    crossDomain: false,
    preventDuplicates: true,
    propertyToSearch: dataType,
    prePopulate: currentData,
    tokenLimit: limit
  });
}

// ##########################################################################
// Finding & Finding Summary
// ##########################################################################

function repopulate_buttons(focus) {
  var e_index = $(focus).data('experiment');
  var t_index = $(focus).data('task');
  var f_index = $(focus).data('finding');

  displayFidelities = {
    "displayFidelity": [
      { "name":"Visual Fidelity", "table":"visual_fidelity" , "throughTable":"experiment_visuals", "preDataTable":"finding_visuals" },
      { "name":"Auditory Fidelity", "table":"aural_fidelity" , "throughTable":"experiment_aurals", "preDataTable":"finding_aurals" }, 
      { "name":"Haptic Fidelity", "table":"haptic_fidelity" , "throughTable":"experiment_haptics", "preDataTable":"finding_haptics" }, 
      { "name":"Biomechanical Symmetry", "table":"biomechanical_symmetry" , "throughTable":"experiment_biomechanicals", "preDataTable":"finding_biomechanicals" }, 
      { "name":"Control Symmetry", "table":"control_symmetry" , "throughTable":"experiment_controls", "preDataTable":"finding_controls" },
      { "name":"System Appropriateness", "table":"system_appropriateness" , "throughTable":"experiment_system_apps", "preDataTable":"finding_system_apps" }
    ]
  }

  $(displayFidelities.displayFidelity).each( function(i) {
    var target = $('#experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index+' .'+this.table);
    
    $(target).html('');
    create_inputs('hidden', '', target, '', this.table, 'component', [], true);

    if (eval('paperJSON.experiments['+e_index+'].'+this.throughTable+'.length') > 0) {
      var fidelity = this;
      var preData = new Array;

      if (eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+']')) {
        if (eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+'].'+fidelity.preDataTable+'.length') > 0) {
          $(eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+'].'+fidelity.preDataTable)).each( function () {
            preData.push(eval('this.'+fidelity.table+'_id'));
          });
        }
      }

      $(eval('paperJSON.experiments['+e_index+'].'+fidelity.throughTable)).each( function () {
        create_inputs('checkbox', eval('this.'+fidelity.table), target, fidelity.name+' - ', fidelity.table, 'component', preData);
      });
    }
  });

  var target = $('#experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index+' .indy-variables-container');
  
  $(target).html('');
  create_inputs('hidden', '', target, '', 'indy_variable', 'variable', [], true);

  if(eval('paperJSON.experiments['+e_index+'].experiment_indy_variables.length') > 0) {
    $('#experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index+' .indy-variables-container').append('<label>Independent Variables</label><div class="indy-variables"></div>');
  
    var preData = new Array;
    if (eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+']')) {
      if (eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+'].finding_indy_variables.length') > 0) {
        $(eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+'].finding_indy_variables')).each( function () {
          preData.push(this.indy_variable_id);
        });
      }
    }

    $(eval('paperJSON.experiments['+e_index+'].experiment_indy_variables')).each( function() {
      var target = $('#experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index+' .indy-variables');

      create_inputs('checkbox', this.indy_variable, target, '', 'indy_variable', 'variable', preData);
    });
  }

  $('#experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index+' .metrics').html('');

  $(eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].task_metrics')).each( function() {
    var target = $('#experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index+' .metrics');
    var preData = new Array;
    
    if (eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+']')) {
      preData.push(eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+'].metric_id'));
    }

    create_inputs('radio', this.metric, target, '', 'metric', 'metric', preData);
  });

  var preData = new Array;
  if (eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+']')) {
    if (eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+'].finding_categories.length') > 0) {
      $(eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].findings['+f_index+'].finding_categories')).each( function () {
        preData.push(this.category_id);
      });
    }  
  }

  $('#experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index+' .tasks').html('');

  $(eval('paperJSON.experiments['+e_index+'].tasks['+t_index+'].task_categories')).each( function() {
    var target = $('#experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index+' .tasks');

    create_inputs('checkbox', this.category, target, '', 'category', 'task_category', preData);
  });

  function create_inputs(inputType, object, target, name, type, title, idArrays, empty) {
    if (inputType != 'hidden') {
      var typeName = eval('object.'+title);
    }

    if (empty == true && empty != undefined) {
      var value = '';
    } else {
      var value = object.id;
    }

    if ($.inArray(value, idArrays) > -1) {
      var checked = 'checked';
    }
    else {
      var checked = '';
    }

    if (inputType == 'checkbox' || inputType == 'hidden') {
      var inputHtml = '<input data-attribute="'+type+'_id" data-text="'+typeName+'" id="experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_findings_attributes_'+f_index+'_'+type+'_id_'+value+'" name="paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+'][findings_attributes]['+f_index+']['+type+'_ids][]" onchange="create_finding_summary(this)" type="'+inputType+'" value="'+value+'" '+checked+'>'
    } else {
      var inputHtml = '<input data-attribute="'+type+'_id" data-text="'+typeName+'" id="experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_findings_attributes_'+f_index+'_'+type+'_id_'+value+'" name="paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+'][findings_attributes]['+f_index+']['+type+'_id]" onchange="create_finding_summary(this)" type="'+inputType+'" value="'+value+'" '+checked+'>'
    }

    if (inputType == 'hidden') {
      var label = '';
    } else {
      var label = '<label data-attribute="'+type+'_id" for="experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_findings_attributes_'+f_index+'_'+type+'_id_'+value+'">'+name+typeName+'</label>'
    }
    
    $(target).append ('<div class="'+inputType+' inline pill">'+inputHtml+label+'</div>');
  }
}

function create_finding_summary (focus) {
  var findingFields = $(focus).parents('.finding');

  var replaceSentence = 4;
  var autoGenSentence = 'There was a significant _relationship_ effect of _component_ on _metric_ for a _task_ task.';

  var componentText = new Array;
  var taskText = new Array;
  var indyVariableText = new Array;

  $(findingFields).children().find('.fidelities input:checked').each( function() {
    componentText.push($(this).data('text'));
  });

  $(findingFields).children().find('.tasks input:checked').each( function() {
    taskText.push($(this).data('text'));
  });

  $(findingFields).children().find('.indy-variables input:checked').each( function() {
    indyVariableText.push($(this).data('text'));
  });

  var relationshipText = $(findingFields).children().find('.relationships input:checked').data('text');
  var metricText = $(findingFields).children().find('.metrics input:checked').data('text');

  if (componentText != '' || indyVariableText != '') {
    var mergedText = componentText.concat(indyVariableText);
    
    if (mergedText.length > 2) {
      var text = mergedText.splice(0,mergedText.length-1).join(', ') + ', and ' + mergedText;
      $(findingFields).children().find('.relationships input').prop('checked', false);
      $(findingFields).children().find('.relationships input').last().prop('checked', true);
      $(findingFields).children().find('.relationships input').prop('disabled', true);
      $(findingFields).children().find('.relationships input').last().prop('disabled', false);

      relationshipText = 'Interaction';
    }
    else if (mergedText.length > 1) {
      var text = mergedText.join(' and ');
      $(findingFields).children().find('.relationships input').prop('checked', false);
      $(findingFields).children().find('.relationships input').last().prop('checked', true);
      $(findingFields).children().find('.relationships input').prop('disabled', true);
      $(findingFields).children().find('.relationships input').last().prop('disabled', false);

      relationshipText = 'Interaction';
    }
    else {
      var text = mergedText[0];
      $(findingFields).children().find('.relationships input').prop('disabled', false);
      $(findingFields).children().find('.relationships input').last().prop('checked', false);
      $(findingFields).children().find('.relationships input').last().prop('disabled', true);
      
      if (relationshipText == 'Interaction') {
        relationshipText = '';
      }
    }

    autoGenSentence = autoGenSentence.replace(new RegExp('_component_','g'), text);
    replaceSentence = replaceSentence - 1;
  }

  if (relationshipText != '') {
    if (relationshipText == 'Interaction') {
      autoGenSentence = autoGenSentence.replace(new RegExp('_relationship_ effect of','g'), relationshipText + ' between');
    } else {
      autoGenSentence = autoGenSentence.replace(new RegExp('_relationship_','g'), relationshipText);
    }
    replaceSentence = replaceSentence - 1;
  }

  if (metricText != '' || metricText != undefined) {
    autoGenSentence = autoGenSentence.replace(new RegExp('_metric_','g'), metricText);
    replaceSentence = replaceSentence - 1;
  }

  if (taskText != '') {
    if (taskText.length > 2) {
      var text = taskText.splice(0,taskText.length-1).join(', ') + ', and ' + taskText;
    }
    else if (taskText.length > 1) {
      var text = taskText.join(' and ');
    }
    else {
      var text = taskText[0];
    }

    autoGenSentence = autoGenSentence.replace(new RegExp('_task_','g'), text);
    replaceSentence = replaceSentence - 1;
  } 

  if (replaceSentence == 0) {
    $(findingFields).find('.field-summary input').val(autoGenSentence.charAt(0) + autoGenSentence.slice(1).toLowerCase());
  } else {
    $(findingFields).find('.field-summary input').val('');
  }
}

// ##########################################################################
// Add Core Elements
// ##########################################################################

function add_fields_after (link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  if (association == 'experiments') {
    var focus = paperManager.addExperiment(link, association, content);
    
  } else if (association == 'tasks') {
    var focus = paperManager.addTask(link, association, content);
    
  } else if (association == 'findings') {
    var focus = paperManager.addFinding(link, association, content);
  }
  else{
    $(link).parent().parent().append(content.replace(regexp, new_id));
  }

  add_progress_heading(association, focus, false);
}

function add_core_element (focus) {
  $($(focus).parent().prevAll('a').data('target')).find('.add-core-element').click();
}

// ##########################################################################
// Add Nested Attributes
// ##########################################################################

function add_fields_before (link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");

  if (association == 'author_papers') {
    new_id = paperManager.authors.addCount();
  } 
  else if (association == 'experiment_displays' || association == 'experiment_hardwares' || association == 'experiment_indy_variables') {
    if (association == 'experiment_hardwares') {
      new_id = paperManager.experiments[$(link).parents().find('.experiment').data('experiment')].inputs.addCount();
    }
    else if (association == 'experiment_indy_variables') {
      new_id = paperManager.experiments[$(link).parents().find('.experiment').data('experiment')].indyVariables.addCount();
    }
  }

  $(link).parent().before(content.replace(regexp, new_id));

  update_author_order();
  createSingleTokenInput($(link).parent().prev().find('.token-input input'));
}

// ##########################################################################
// Add Ids
// ##########################################################################

function add_author_ids (data) {
  if (data.author_papers != undefined) {
    var idsFound = $('[id *=author_papers_attributes][id $=_id]').length/2;

    if (data.author_papers.length != idsFound) {
      $(data.author_papers).each( function(a_index) {
        // var index = this.order;

        if (a_index > idsFound-1) {
          console.log('Adding author id ', a_index);
          $('.author_paper').eq(a_index).append('<input id="paper_author_papers_attributes_'+a_index+'_id" name="paper[author_papers_attributes]['+a_index+'][id]" type="hidden" value="'+this.id+'">');
          $('.author_paper').eq(a_index).children().find('.author').append('<input id="paper_author_papers_attributes_'+a_index+'_author_attributes_id" name="paper[author_papers_attributes]['+a_index+'][author_attributes][id]" type="hidden" value="'+this.author_id+'">');
        }
      });
    }
  }
}

function add_experiment_ids (data) {
  if (data.experiments != undefined) {
    var idsFound = $('.paper [id *=experiments_attributes_][id $=_id]').length;

    if (data.experiments.length != idsFound) {
      $(data.experiments).each( function(e_index) {
        if (e_index > idsFound-1) {
          console.log('Adding experiment id ', e_index);
          $('.paper').append('<input id="paper_experiments_attributes_'+e_index+'_id" name="paper[experiments_attributes]['+e_index+'][id]" type="hidden" value="'+this.id+'">');
        }
      });
    }
  }
}

function add_experiment_nested_ids (data, throughTable) {
  $('.experiment').each( function(e_index) {
    var idsFound = 0;
    
    if (eval('data.experiments['+e_index+']') != undefined) {
      $('#experiment_'+e_index+' [id *='+throughTable+'s_attributes_][id $=_id]').each( function() {
        if ($(this).data('attribute') == undefined) {
          idsFound = idsFound+1;
        }
      });

      if (eval('data.experiments['+e_index+'].'+throughTable+'s.length') != idsFound) {
        eval('$(data.experiments['+e_index+'].'+throughTable+'s)').each( function(i) {
          if (i > idsFound-1) {
            console.log('Adding ', throughTable, ' id ', i, 'for experiment', e_index);
            $('#experiment_'+e_index+'_'+throughTable).append('<input id="paper_experiments_attributes_'+e_index+'_'+throughTable+'s_attributes_'+i+'_id" name="paper[experiments_attributes]['+e_index+']['+throughTable+'s_attributes]['+i+'][id]" type="hidden" value="'+this.id+'">');
            
            if (throughTable == 'experiment_hardware') {
              $('#paper_experiments_attributes_'+e_index+'_'+throughTable+'s_attributes_'+i+'_hardware_tokens').val(this.hardware_id);
              $('#experiment_'+e_index+'_'+throughTable+'s').append('<input id="paper_experiments_attributes_'+e_index+'_'+throughTable+'s_attributes_'+i+'_id" name="paper[experiments_attributes]['+e_index+']['+throughTable+'s_attributes]['+i+'][id]" type="hidden" value="'+this.id+'">');
            }
            else if (throughTable == 'experiment_indy_variable') {
              $('#paper_experiments_attributes_'+e_index+'_'+throughTable+'s_attributes_'+i+'_indy_variable_tokens').val(this.indy_variable_id);
              $('#experiment_'+e_index+'_'+throughTable+'s').append('<input id="paper_experiments_attributes_'+e_index+'_'+throughTable+'s_attributes_'+i+'_id" name="paper[experiments_attributes]['+e_index+']['+throughTable+'s_attributes]['+i+'][id]" type="hidden" value="'+this.id+'">');
            }
          }
        });
      }
    }

    add_task_ids (data, e_index);
    add_task_nested_ids(data, e_index, 'task_metric');
  });
}

function add_task_ids (data, e_index) {
  if (eval('data.experiments['+e_index+']') != undefined) {
    var idsFound = $('#experiment_'+e_index+' [id *=tasks_attributes_][id $=_id]').length;

    if (eval('data.experiments['+e_index+'].tasks.length') != idsFound) {
      eval('$(data.experiments['+e_index+'].tasks)').each( function(t_index) {
        if (t_index > idsFound-1) {
          console.log('Adding task id ', t_index, 'for experiment', e_index);
          $('#experiment_'+e_index).append('<input id="paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_id" name="paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+'][id]" type="hidden" value="'+this.id+'">');
        }
      });
    }
  }
}

function add_task_nested_ids (data, e_index, throughTable) {
  $('.task').each( function(r_index) {
    var t_index = 0;
    
    if (eval('data.experiments['+e_index+'].tasks['+t_index+']') != undefined) {
      if ($(this).data('experiment') == e_index) {
        var idsFound = 0;
      
        $('#experiment_'+e_index+'_task_'+t_index+' [id *='+throughTable+'s_attributes_][id $=_id]').each( function() {
          if ($(this).data('attribute') == undefined) {
            idsFound = idsFound+1;
          }
        });

        if (eval('data.experiments['+e_index+'].tasks['+t_index+'].'+throughTable+'s.length') != idsFound) {
          eval('$(data.experiments['+e_index+'].tasks['+t_index+'].'+throughTable+'s)').each( function(i) {
            if (i > idsFound-1) {
              console.log('Adding ', throughTable, 'id ', i, 'for task', t_index, 'in experiment', e_index);
              $('#experiment_'+e_index+'_task_'+t_index+'_'+throughTable).append('<input id="paper_experiments_attributes_'+e_index+'_task_'+t_index+'_'+throughTable+'s_attributes_'+i+'_id" name="paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+']['+throughTable+'s_attributes]['+i+'][id]" type="hidden" value="'+this.id+'">');
            }
          });
        }
        t_index = t_index + 1;
      }
    }

    add_finding_ids (data, e_index, r_index);
  });
}

function add_finding_ids (data, e_index, t_index) {
  if (eval('data.experiments['+e_index+'].tasks['+t_index+']') != undefined) {
    var idsFound = $('#experiment_'+e_index+'_task_'+t_index+' [id *=findings_attributes_][id $=_id]').length;
    
    if (eval('data.experiments['+e_index+'].tasks['+t_index+'].findings.length') != idsFound) {
      eval('$(data.experiments['+e_index+'].tasks['+t_index+'].findings)').each( function(f_index) {
        if (f_index > idsFound-1) {
          console.log('Adding finding id', f_index, ' of task id ', t_index, 'for experiment', e_index);
          $('#experiment_'+e_index+'_task_'+t_index).append('<input id="paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_findings_attributes_'+f_index+'_id" name="paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+'][findings_attributes]['+f_index+'][id]" type="hidden" value="'+this.id+'">');
        }
      });
    }
  }
}

// ##########################################################################
// Ajax Calls
// ##########################################################################

var paperId = null;
var paperJSON;

var paperError;
var keepHidden;

function save_button_clicked (focus) {
  if (keepHidden) {
    if (paperJSON == undefined) {
      console.log('trying to click add experiment');
      $('#paper .add-core-element').click();
    }
    else if (paperJSON.experiments[0] == undefined) {
      console.log('trying to click add task');
      if ($('#experiment_0 .add-core-element') > 0) {
        $('#experiment_0 .add-core-element').click();
      } else {
        $('#paper .add-core-element').click();
      }
    }
    else if (paperJSON.experiments[0].tasks[0] == undefined) {
      console.log('trying to click add finding');
      if ($('#experiment_0_task_0 .add-core-element') > 0) {
        $('#experiment_0_task_0 .add-core-element').click();
      } else {
        $('#experiment_0 .add-core-element').click();
      }
    } 
  } else {
    save_paper(focus);
  }
}

function save_paper (focus, association, content) {
  if (paperId == null) {
    var url = '/papers';
    console.log('first post');
  } else {
    var url = '/papers/'+paperId
    console.log('updating');
  }

  $(focus).button('loading');

  validate_all_fields ();

  if (paperValid) {
    $.ajax({
      type: 'POST',
      url: url,
      data: $('form.paper-form').serialize(),
      dataType: 'json',
      success: function(data, status) {
        console.log(status, data); //whether successful or not

        if (paperId == null) {
          //Get information and add put method for updating paper
          paperId = data.id;
          $('form.paper-form').prepend('<input name="_method" type="hidden" value="put">');
        }

        //Set readonly inputs to readonly and remove destroyed objects and recount if needed
        paperManager.cleanUp();
        update_author_order();
        setUrlClasses(true);

        //Add new nested attributes ids to form
        paperJSON = data;
        add_author_ids(data);
        add_experiment_ids(data);
        add_experiment_nested_ids (data, 'experiment_display');
        add_experiment_nested_ids (data, 'experiment_hardware');
        add_experiment_nested_ids (data, 'experiment_visual');
        add_experiment_nested_ids (data, 'experiment_aural');
        add_experiment_nested_ids (data, 'experiment_haptic');
        add_experiment_nested_ids (data, 'experiment_biomechanical');
        add_experiment_nested_ids (data, 'experiment_control');
        add_experiment_nested_ids (data, 'experiment_system_app');
        add_experiment_nested_ids (data, 'experiment_indy_variable');

        if (association != undefined) {
          //Add element and reset stuff
          add_fields_after (focus, association, content)
          handle_one_times();
        }
      },
      error: function (error) {
        console.log('error:', error);
        paperError = error;

        if (error.responseJSON.paper_url == "is not a valid URL") {
          paperValid = paperValid && false;
          setUrlClasses(false);
        } else {
          paperValid = paperValid && true;
          setUrlClasses(true);

          alert('There was an error when saving! Please notify an admin.');
        }
      }
    });
  }

  $(focus).button('reset');
}

function handle_one_times () {
  keepHidden = true;

  if (paperJSON != undefined) {
    // $('.new_experiment').hide();
    keepHidden = false;

    if (paperJSON.experiments[0] != undefined) {
      // $('.new_task').hide();
      keepHidden = false;

      if (paperJSON.experiments[0].tasks[0] != undefined) {
        // $('.new_finding').hide();
        keepHidden = false;

      } else {
        keepHidden = true;
      }
    } else {
      keepHidden = true;
    }
  } else {
    keepHidden = true;
  }

  if (keepHidden) {
    $('#progress-headings .nav-core-element-add').hide();
    $('#save-button button').html('Save and Continue');
  } else {
    $('#progress-headings nav-core-element-add').show();
    $('#save-button button').html('Save');
  }
}

function disable_disclaimer_modal (user_id) {
  console.log($('#first_time_form'));
  $.ajax({
    type: 'PUT',
    url: '/users/'+user_id,
    data: $('#first_time_form').serialize(),
    dataType: 'json',
    success: function(data, status) {
      console.log(status, data);
    }
  });
}

// ##########################################################################
// Document Ready
// ##########################################################################

$(document).ready( function() {
  $(window).bind("popstate", function () {
      $.getScript(location.href);
    });

  if($('form.paper-form').length > 0) {

    var paperState = $('form.paper-form').prop('id').split('_');

    if (paperState[0] == 'edit') {
      paperId = paperState[2];
      
      //Set readonly inputs to uneditable if they have values in them
      $('.author_paper .readonly').prop('readonly', true);

      $.ajax({
        type: 'GET',
        url: '/papers/'+paperId,
        dataType: 'json',
        success: function(data, status) {
          console.log(status, data);
          paperJSON = data;

          paperManager.setCounts();
          handle_one_times();
        }
      });    
    } else {
      paperManager.setCounts();
      handle_one_times();

      user_id = parseInt($('.first-time-cb').attr("id"));

      $.ajax({
        type: 'GET',
        url: '/users/'+user_id,
        dataType: 'json',
        success: function(data, status) {
          console.log(status, data);
          
          if(data.first_time)
            $('#disclaimer-modal').modal();
        }
      });
    }

    $(window).resize( function() {
      $('#progress-headings .task-block').css('padding-left', (6 - 500/Math.round($('#progress-headings .experiment-block').width()))+'%');
      $('#progress-headings .experiment-block .new-add-links').css('padding-left', (6 - 500/Math.round($('#progress-headings .experiment-block').width()))+'%');

      $('#progress-headings .finding-block').css('padding-left', (6 - 500/Math.round($('#progress-headings .task-block').width()))+'%');
      $('#progress-headings .task-block .new-add-links').css('padding-left', (6 - 500/Math.round($('#progress-headings .task-block').width()))+'%');
    });

    //Prevents form from being submitted by enter key
    $('.paper-form').on('keyup keypress', 'input', function(e) {
      var code = e.keyCode || e.which; 
      if (code  == 13) {               
        e.preventDefault();
        return false;
      }
    });

    $('body').tooltip({
      selector: '[ref=tooltip]'
    });

    $('#submit-button').hide();

    //Prevents users from accidentally leaving the page
    // window.onbeforeunload = function() { 
    //   return "Caution! All unsaved work will be lost. If you need to navigate to another section, please select the section in the Entry Navigation box on the left."; 
    // };

    //Prevents form from being submitted by enter key
    // $('#new_paper').bind("keyup keypress", function(e) {
    //   var code = e.keyCode || e.which; 
    //   if (code  == 13) {               
    //     e.preventDefault();
    //     return false;
    //   }
    // });

  // ##########################################################################
  // Getting DOI Information
  // ##########################################################################
    var timer;

    $('#submit-doi').click( function() {
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

              $xml.find('person_name').each( function(index) {
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
            $('.doi-well').after('<div class="alert alert-error"><button type="button" class="close" data-dismiss="alert">×</button><strong>Server Error!</strong> There was trouble communicating with the lookup server, we are sorry for the inconvenience. Please try again later or input the publication details manually.</div>');
            $('#submit-doi').button('reset');
            $(paper_doi).removeClass('uneditable-input');
            $('#paper_doi').prop('readonly', true);
          }
        });

        timer = window.setTimeout( function() { 
          $('.alert').alert('close'); 
        }, 10000);
      } else {
        $('.doi-field').addClass('control-group error');
        $('.doi-field').append('<span class="help-inline">Field cannot be blank</span>');
      }
    });
  }
});