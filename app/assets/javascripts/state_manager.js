//##########################################################################
//Paper Manager 
//##########################################################################

var paperManager = {
  authors: new counter('.author_paper'),
  experiments: [],
  addExperiment: function(link, association, content) {
    var regexp = new RegExp("new_" + association, "g");

    //create experiment and add it to the list of experiments
    var exp = new experiment(this.experiments.length);
    this.experiments.push(exp);

    //Add to HTML with corrent number
    $(link).parent().parent().after(content.replace(regexp, exp.count));
    
    //Set counts for everything and return the DOM element
    return exp.setup();
  },
  removeExperiment: function(focus) {

  },
  addTask: function(link, association, content) {
    var regexp = new RegExp("new_" + association, "g");
    var e_index = $(link).parent().data('experiment');

    //create task for the proper experiment
    var task = this.experiments[e_index].addTask();

    //Add to HTML with corrent number
    $(link).parent().parent().after(content.replace(regexp, task.count));

    //Set counts for everything and return the DOM element
    return task.setup();
  },
  removeTask: function(focus) {

  },
  cleanUp: function () {
    $('.readonly').prop('readonly', true);

    $('.generated._destroy').each(function () {
      var type = $(this).data('type');
      var instance = $(this).data(type);

      $('[id*='+type.split('-').join('_')+'s_attributes_'+instance+'_id]').remove();
    });

    if ($('._destroy').remove().length > 0) {
      console.log('Stuff was destroyed so we are going to recount!');

      this.authors.setCounts();
      // $(this.experiments).each( function() {
      //   $(this).recount();
      // });
    }
  }
}

function experiment(count) {
  this.count = count;

  this.display = new counter('.display');
  this.inputs = new counter('.input');
  this.visual_fidelity = new counter ('.visual_fidelity');
  this.aural_fidelity = new counter ('.aural_fidelity');
  this.haptic_fidelity = new counter ('.haptic_fidelity');
  this.biomechanical_symmetry = new counter ('.biomechanical_symmetry');
  this.control_symmetry = new counter ('.control_symmetry');
  this.system_appropriateness = new counter ('.system_appropriateness');
  this.indyVariables = new counter('.indy-variable');
  this.tasks = [];

  //This should only be called once! It allows us to find the experiment in the DOM even after name changes.
  this.setup = function() {
    this.focus = $('#experiment_'+this.count);
    // this.recount();

    //createTokenInput();
    $(this.focus).find('.accordion-group').on('hidden', function () {
      $(this).find('.icon-chevron-right').show();
      $(this).find('.icon-chevron-down').hide();
    });
    $(this.focus).find('.accordion-group').on('shown', function () {
      $(this).find('.icon-chevron-right').hide();
      $(this).find('.icon-chevron-down').show();
    });

    createTokenInput(this.focus);

    return this.focus;
  };

  this.recount = function() {
    console.log('recounting experiment '+this.count+'!');
    var e_index = this.count;

    $(this.focus).prop('id', 'experiment_'+e_index);
    $(this.focus).data('experiment', e_index);

    $(this.focus).find('.new_task').data('expId', e_index);

    $(this.focus).find('.exp-field').each( function(index) { 
      $(this).find('label').each( function() {
        $(this).prop('for', 'paper_experiment_attributes_'+e_index+'_'+$(this).data('attribute'));
      });
      $(this).find('input').each( function() {
        if ($(this).data('prefix')) {
          $(this).prop('id', $(this).data('prefix')+'paper_experiments_attributes_'+e_index+'_software_tokens');
        } else {
          $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_'+$(this).data('attribute'));
          $(this).prop('name', 'paper[experiments_attributes]['+e_index+']['+$(this).data('attribute')+']');
        }
      });
      $(this).find('textarea').each( function() {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+']['+$(this).data('attribute')+']');
      });
    });

    //recount gender
    $(this.focus).find('.gender input').each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      label.prop('for', 'paper_experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).prop('name', 'paper[experiments_attributes]['+e_index+']['+$(this).data('attribute')+']');
    });

    //recount fidelity pills and descriptions
    $('.fidelity-list input').each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      label.prop('for', 'experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).data('experiment', e_index);
    });
    $('.fidelity-desc').each( function() {
      $(this).prop('id', 'experiment_'+e_index+'_experiment_'+$(this).data('attribute'));
    });

    //recount counters
    this.display.setCounts(e_index);
    this.inputs.setCounts(e_index);
    this.visual_fidelity.setCounts(e_index);
    this.aural_fidelity.setCounts(e_index);
    this.haptic_fidelity.setCounts(e_index);
    this.biomechanical_symmetry.setCounts(e_index);
    this.control_symmetry.setCounts(e_index);
    this.system_appropriateness.setCounts(e_index);
    this.indyVariables.setCounts(e_index);

    //recount tasks now
    $(this.tasks).each( function() {
      $(this).recount();
    });
  };

  this.addTask = function() {
    var t = new task(this.tasks.length, this.count);
    this.tasks.push(t);

    return t;
  };

  this.removeTask = function(index) {

  };
}

function task(count, e_index) {
  this.count = count;
  this.e_index = e_index;

  this.metric = new counter('.metric');
  this.findings = [];

  //This should only be called once! It allows us to find the experiment in the DOM even after name changes.
  this.setup = function() {
    this.focus = $('#experiment_'+this.e_index+'_task_'+this.count);
    //this.recount();

    return this.focus;
  };

  this.recount = function() {
    console.log('recounting task '+this.count+'!');
    var e_index = this.e_index;
    var t_index = this.count;

    $(this.focus).prop('id', 'experiment_'+this.e_index+'_task_'+this.count);
    $(this.focus).data('experiment', e_index);
    $(this.focus).data('task', this.count);

    $(this.focus).find('.task-field').each( function(index) { 
      $(this).find('label').each( function() {
        $(this).prop('for', 'paper_experiment_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute'));
      });
      $(this).find('input').each( function() {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+']['+$(this).data('attribute')+']');
      });
      $(this).find('textarea').each( function() {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+']['+$(this).data('attribute')+']');
      });
    });

    //recount dimension, scale, density, realism
    this.recountRadioButtons(this.focus, '.dimension input', e_index, t_index);
    this.recountRadioButtons(this.focus, '.scale input', e_index, t_index);
    this.recountRadioButtons(this.focus, '.density input', e_index, t_index);
    this.recountRadioButtons(this.focus, '.realism input', e_index, t_index);

    //recount task categories
    $(this.focus).find('.task-category input').each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      label.prop('for', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+']['+$(this).data('attribute')+'s][]');
    });

    //recount counters
    this.metric.setCounts(e_index, t_index);
  };

  this.recountRadioButtons = function(parent, focus, e_index, t_index) {
    $(parent).find(focus).each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      label.prop('for', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+']['+$(this).data('attribute')+']');
    });
  }
}

// ##########################################################################
// Counter Functionality
// ##########################################################################


function counter(type) {
  this.count = null;
  this.type = type;
};
 
counter.prototype.setCounts = function(e_index, t_index, f_index) { //experiment_index, task_index, finding_index
  var a_index = null;
  var a_type = this.type;

  if (e_index) {
    var focus = '#experiment_'+e_index+' '+this.type;
  } else if (t_index) {
    var focus = this.type;
  } else if (f_index) {
    var focus = this.type;
  } else {
    var focus = this.type;
  }

  $(focus).each( function(index) { 
    a_index = index;
    $(this).children().find('label').each( function() {
      if (a_type == '.author_paper') {
        $(this).prop('for', 'paper_author_papers_attributes_'+a_index+'_author_attributes_'+$(this).data('attribute'));
      }
      else if (a_type == '.display') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_displays_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (a_type == '.input') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_hardwares_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (a_type == '.indy-variable') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_indy_variables_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (a_type == '.visual_fidelity') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_visuals_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (a_type == '.aural_fidelity') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_aurals_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (a_type == '.haptic_fidelity') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_haptics_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (a_type == '.biomechanical_symmetry') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_biomechanicals_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (a_type == '.control_symmetry') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_controls_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (a_type == '.system_appropriateness') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_system_apps_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (a_type == '.metric') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_task_metrics_attributes_'+a_index+'_'+$(this).data('attribute'));
      }

    });
    $(this).children().find('input').each( function() {
      if (a_type == '.author_paper') {
        if ($(this).data('attribute')) {
          if ($(this).data('attribute') == 'order' || $(this).data('attribute') == '_destroy') {
            $(this).prop('id', 'paper_author_papers_attributes_'+a_index+'_'+$(this).data('attribute'));
            $(this).prop('name', 'paper[author_papers_attributes]['+a_index+']['+$(this).data('attribute')+']');
          } else {
            $(this).prop('id', 'paper_author_papers_attributes_'+a_index+'_author_attributes_'+$(this).data('attribute'));
            $(this).prop('name', 'paper[author_papers_attributes]['+a_index+'][author_attributes]['+$(this).data('attribute')+']');
          }
        }
      }
      else if (a_type == '.display') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_displays_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_displays_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }
      else if (a_type == '.input') {
        if ($(this).data('prefix')) {
          $(this).prop('id', $(this).data('prefix')+'paper_experiments_attributes_'+e_index+'_experiment_hardwares_attributes_'+a_index+'_hardware_tokens');
        } else {
          $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_hardwares_attributes_'+a_index+'_'+$(this).data('attribute'));
          $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_hardwares_attributes]['+a_index+']['+$(this).data('attribute')+']');
        }
      }
      else if (a_type == '.indy-variable') {
        if ($(this).data('prefix')) {
          $(this).prop('id', $(this).data('prefix')+'paper_experiments_attributes_'+e_index+'_experiment_indy_variables_attributes_'+a_index+'_hardware_tokens');
        } else {
          $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_indy_variables_attributes_'+a_index+'_'+$(this).data('attribute'));
          $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_indy_variables_attributes]['+a_index+']['+$(this).data('attribute')+']');
        }
      }
      else if (a_type == '.visual_fidelity') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_visuals_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_visuals_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }
      else if (a_type == '.aural_fidelity') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_aurals_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_aurals_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }
      else if (a_type == '.haptic_fidelity') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_haptics_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_haptics_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }
      else if (a_type == '.biomechanical_symmetry') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_biomechanicals_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_biomechanicals_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }
      else if (a_type == '.control_symmetry') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_controls_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_controls_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }
      else if (a_type == '.system_appropriateness') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_system_apps_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_system_apps_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }
      else if (a_type == '.metric') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_task_metrics_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+'][task_metrics_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }

    });
  });

  var index = 0;

  if (a_type == '.author_paper') {
    $(a_type).each(function(index) {
      $(this).data('author-paper', index);
    });

    var i = 0;
    $('.authors input').each(function() {
      i = Math.floor(index/2);
      
      if (!$(this).data('attribute')) { 
        console.log(i);
        if($(this).prop('id').search("author_attributes") > -1) {
          $(this).prop('id', 'paper_author_papers_attributes_'+i+'_author_attributes_id');
          $(this).prop('name', 'paper[author_papers_attributes]['+i+'][author_attributes][id]');
        } else {
          $(this).prop('id', 'paper_author_papers_attributes_'+i+'_id');
          $(this).prop('name', 'paper[author_papers_attributes]['+i+'][id]');
        }
        index = index+1;
      }
    });
  }

  this.count = a_index;
};

counter.prototype.getCounts = function() {
  var focus = this.type;

  if ($(focus).length > 0) {
    this.count = $(focus).length-1;
    console.log(focus, this.count);
  }
};

counter.prototype.addCount = function() {
  if (this.count == null) {
    this.count = 0;
  } else {
    this.count = this.count + 1;
  }

  return this.count;
};