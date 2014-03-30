//##########################################################################
//Paper Manager 
//##########################################################################

var paperManager = {
  authors: new counter('.author_paper', 'author_paper'),
  experiments: [],
  addExperiment: function(link, association, content) {
    console.log('adding experiment from', $(link).parent());
    //create experiment and add it to the list of experiments
    var exp = new experiment(this.experiments.length);
    this.experiments.push(exp);
    
    if (!(link == undefined && association == undefined && content == undefined)) {
      //Add to HTML with current number
      var regexp = new RegExp("new_" + association, "g");
      $(link).parent().parent().after(content.replace(regexp, exp.count));
    }

    //Set counts for everything and return the DOM element
    return exp.setup();
  },
  removeExperiment: function(focus) {

  },
  addTask: function(link, association, content) {
    console.log('adding task from', $(link).parent());

    var regexp = new RegExp("new_" + association, "g");
    var e_index = $(link).parent().data('experiment');

    //create task for the proper experiment
    var task = this.experiments[e_index].addTask();

    //Add to HTML with current number
    $(link).parent().parent().after(content.replace(regexp, task.count));

    //Set counts for everything and return the DOM element
    return task.setup();
  },
  removeTask: function(focus) {

  },
  addFinding: function(link, association, content) {
    var regexp = new RegExp("new_" + association, "g");
    var e_index = $(link).parent().data('experiment');
    var t_index = $(link).parent().data('task');

    //create finding for the proper experiment
    var finding = this.experiments[e_index].tasks[t_index].addFinding();

    //Add to HTML with current number
    $(link).parent().parent().after(content.replace(regexp, finding.count));

    //Set counts for everything and return the DOM element
    return finding.setup();
  },
  removeFinding: function(focus) {

  },
  setCounts: function() {
    var e_array = this.experiments;
    var self = this; //change scope to use inside each

    this.authors.setCounts();

    //Splits all the components out so that they can be hidden properly
    $('.experiment').each( function(e) {
      // console.log('e', e, this);
      $(this).prop('id', 'experiment_'+e);
      $(this).data('experiment', e);

      $(this).appendTo($('#paper_entry_form'));
      add_progress_heading('experiments', self.addExperiment(), true);
      

      $(this).find('.task').each( function(t) {
        // console.log('t', e, t, this);
        $(this).prop('id', 'experiment_'+e+'_task_'+t);
        $(this).data('experiment', e);
        $(this).data('task', t);

        $(this).appendTo($('#paper_entry_form'));
        add_progress_heading('tasks', self.experiments[e].addTask().setup(), true);
        

        $(this).find('.finding').each( function(f) {
          // console.log('f', e, t, f, this);
          $(this).prop('id', 'experiment_'+e+'_task_'+t+'_finding_'+f);
          $(this).data('experiment', e);
          $(this).data('task', t);
          $(this).data('finding', f);

          $(this).appendTo($('#paper_entry_form'));
          add_progress_heading('findings', self.experiments[e].tasks[t].addFinding().setup(), true);
          

        });
      });
    });

    // var e_array = this.experiments;

    // $('.experiment').each( function() {
    //   //create experiment and add it to the list of experiments
    //   var exp = new experiment(e_array.length);
    //   e_array.push(exp);
      
    //   add_progress_heading('experiments', exp.setup($(this)), true);

    //   e_array
    // });
  },
  cleanUp: function () {
    $('.readonly').prop('readonly', true);

    // $('.generated._destroy').each(function () {
    //   var type = $(this).data('type');
    //   var instance = $(this).data(type);

    //   //[id*=author_papers_attributes_3_id]
    //   $('[id*='+type.split('-').join('_')+'s_attributes_'+instance+'_id]').remove();
    // });

    if ($('._destroy').remove().length > 0) {
      console.log('Stuff was destroyed so we are going to recount!');

      this.authors.setCounts();
      $(this.experiments).each( function(i) {
        this.recount();
        $(this.tasks).each( function() {
          this.recount();
          $(this.findings).each( function() {
            this.recount();
          });
        });
      });
    }
  }
}

// ##########################################################################
// Experiment Data Structure
// ##########################################################################

function experiment(count) {
  // console.log('creating an experiment');
  this.count = count;

  this.display = new counter('.display', 'experiment_display');
  this.inputs = new counter('.input', 'experiment_hardware');
  this.visual_fidelity = new counter ('.visual_fidelity', 'experiment_visual');
  this.aural_fidelity = new counter ('.aural_fidelity', 'experiment_aural');
  this.haptic_fidelity = new counter ('.haptic_fidelity', 'experiment_haptic');
  this.biomechanical_symmetry = new counter ('.biomechanical_symmetry', 'experiment_biomechanical');
  this.control_symmetry = new counter ('.control_symmetry', 'experiment_control');
  this.system_appropriateness = new counter ('.system_appropriateness', 'experiment_system_app');
  this.indyVariables = new counter('.indy-variable', 'experiment_indy_variable');
  this.tasks = [];

  //This should only be called once! It allows us to find the experiment in the DOM even after name changes.
  this.setup = function() {
    this.focus = $('#experiment_'+this.count);
    this.recount();

    $(this.focus).find('.accordion-group').on('hidden', function (e) {
      if (e.target.nodeName != 'LABEL' && e.target.nodeName != 'INPUT') {
        $(this).find('.icon-chevron-right').show();
        $(this).find('.icon-chevron-down').hide();
      }
    });
    $(this.focus).find('.accordion-group').on('shown', function (e) {
      if (e.target.nodeName != 'LABEL' && e.target.nodeName != 'INPUT') {
        $(this).find('.icon-chevron-right').hide();
        $(this).find('.icon-chevron-down').show();
      }
    });

    createTokenInput(this.focus);

    return this.focus;
  };

  this.recount = function() {
    // console.log('recounting experiment '+this.count+'!');
    var e_index = this.count;
    var focus = this.focus;

    $(focus).prop('id', 'experiment_'+e_index);
    $(focus).data('experiment', e_index);

    $(focus).find('.new_task').data('experiment', e_index);

    //change text in create new buttons to add the right experiment number for children
    var regexp = new RegExp("new_experiments", "g");
    $(focus).find('.new_task').html($(focus).find('.new_task').html().replace(regexp, e_index));

    //recount general fields
    $(focus).find('.exp-field').each( function(index) { 
      $(this).find('label').each( function() {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_'+$(this).data('attribute'));
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

    //recount divs for welled items
    $(focus).find('.well').each( function() { 
      $(this).prop('id', 'experiment_'+e_index+'_experiment_'+$(this).prop('class').split(' ')[0]);
    });

    //recount gender
    $(focus).find('.gender input').each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      (focus).find(label).prop('for', 'paper_experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).prop('name', 'paper[experiments_attributes]['+e_index+']['+$(this).data('attribute')+']');
    });

    //recount accordian
    $(focus).find('.accordion').prop('id', 'accordion_'+e_index);
    $(focus).find('.accordion-toggle').each( function(i) {
      $(this).data('parent', '#accordion_'+e_index);
      $(this).prop('href', '#collapse_'+e_index+'_'+i);
    });
    $(focus).find('.accordion-body').each( function(i) {
      $(this).prop('id', 'collapse_'+e_index+'_'+i);
    })

    //recount fidelity pills and descriptions
    $(focus).find('.fidelity-list input').each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      (focus).find(label).prop('for', 'experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).data('experiment', e_index);
    });
    $(focus).find('.fidelity-desc').each( function() {
      $(this).prop('id', 'experiment_'+e_index+'_experiment_'+$(this).data('attribute'));
    });

    //recount display pills and descriptions
    $(focus).find('.display-list input:checkbox').each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      (focus).find(label).prop('for', 'experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'experiments_attributes_'+e_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).data('experiment', e_index);
    });
    $(focus).find('.display-desc').each( function() {
      $(this).prop('id', 'experiment_'+e_index+'_experiment_'+$(this).data('attribute'));
      $(this).parent().prop('id', 'experiment_'+e_index+'_experiment_'+$(this).data('attribute')+'s');
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
      this.recount();
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

// ##########################################################################
// Task Data Structure
// ##########################################################################

function task(count, e_index) {
  // console.log('creating a task');
  this.count = count;
  this.e_index = e_index;

  this.metric = new counter('.metric', 'task_metric');
  this.findings = [];

  //This should only be called once! It allows us to find the experiment in the DOM even after name changes.
  this.setup = function() {
    this.focus = $('#experiment_'+this.e_index+'_task_'+this.count);
    this.recount();

    return this.focus;
  };

  this.recount = function() {
    // console.log('recounting task '+this.count+'!');
    var e_index = this.e_index;
    var t_index = this.count;
    var focus = this.focus;

    $(focus).prop('id', 'experiment_'+e_index+'_task_'+t_index);
    $(focus).data('experiment', e_index);
    $(focus).data('task', t_index);

    $(focus).find('.new_finding').data('experiment', e_index);
    $(focus).find('.new_finding').data('task', t_index);

    var regexp = new RegExp("new_tasks", "g");
    $(focus).find('.new_finding').html($(focus).find('.new_finding').html().replace(regexp, t_index));

    var regexp = new RegExp("new_experiments", "g");
    $(focus).find('.new_finding').html($(focus).find('.new_finding').html().replace(regexp, e_index));

    $(focus).find('.task-field').each( function(index) { 
      $(this).find('label').each( function() {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute'));
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
    this.recountRadioButtons(focus, '.dimension input', e_index, t_index);
    this.recountRadioButtons(focus, '.scale input', e_index, t_index);
    this.recountRadioButtons(focus, '.density input', e_index, t_index);
    this.recountRadioButtons(focus, '.realism input', e_index, t_index);

    //recount task categories
    $(focus).find('.task-category input').each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      label.prop('for', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+']['+$(this).data('attribute')+'s][]');
    });

    //recount metric pills and descriptions
    $(focus).find('.metric-list input:checkbox').each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      (focus).find(label).prop('for', 'experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).data('experiment', e_index);
      $(this).data('task', t_index);
    });
    $(focus).find('.metric-desc').each( function() {
      $(this).prop('id', 'experiment_'+e_index+'_task_'+t_index+'_task_'+$(this).data('attribute'));
      $(this).parent().prop('id', 'experiment_'+e_index+'_task_'+t_index+'_task_'+$(this).data('attribute')+'s');
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

  this.addFinding = function() {
    var f = new finding(this.findings.length, this.e_index, this.count);
    this.findings.push(f);

    return f;
  };

  this.removeTask = function(index) {

  };
}

function finding(count, e_index, t_index) {
  // console.log('creating a finding');
  this.count = count;
  this.e_index = e_index;
  this.t_index = t_index;

  //This should only be called once! It allows us to find the experiment in the DOM even after name changes.
  this.setup = function() {
    this.focus = $('#experiment_'+this.e_index+'_task_'+this.t_index+'_finding_'+this.count);
    this.recount();

    return this.focus;
  };

  this.recount = function() {
    // console.log('recounting finding '+this.count+'!');
    var e_index = this.e_index;
    var t_index = this.t_index;
    var f_index = this.count;
    var focus = this.focus;

    $(focus).prop('id', 'experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index);
    $(focus).data('experiment', e_index);
    $(focus).data('task', t_index);
    $(focus).data('finding', f_index);

    $(focus).find('.finding-field').each( function(index) { 
      $(this).find('label').each( function() {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_findings_attributes_'+f_index+'_'+$(this).data('attribute'));
      });
      $(this).find('input').each( function() {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_findings_attributes_'+f_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+'][findings_attributes]['+f_index+']['+$(this).data('attribute')+']');
      });
      $(this).find('textarea').each( function() {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_findings_attributes_'+f_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+'][findings_attributes]['+f_index+']['+$(this).data('attribute')+']');
      });
    });

    this.recountRadioButtons(focus, '.relationship input', e_index, t_index, f_index);
    this.recountRadioButtons(focus, '.specificity input', e_index, t_index, f_index);
  };

  this.recountRadioButtons = function(parent, focus, e_index, t_index, f_index) {
    $(parent).find(focus).each( function() { 
      var label = $('label[for="'+$(this).prop('id')+'"]');
      label.prop('for', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_findings_attributes_'+f_index+'_'+$(this).data('attribute')+'_'+$(this).val());

      $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_findings_attributes_'+f_index+'_'+$(this).data('attribute')+'_'+$(this).val());
      $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+'][findings_attributes]['+f_index+']['+$(this).data('attribute')+']');
    });
  }
}

// ##########################################################################
// Counter Functionality
// ##########################################################################

function counter(type, throughTable) {
  this.count = null;
  this.type = type;
  this.throughTable = throughTable;
};
 
counter.prototype.setCounts = function(e_index, t_index, f_index) { //experiment_index, task_index, finding_index
  var a_index = null;
  var type = this.type;
  var throughTable = this.throughTable;

  var focus = type;

  if (e_index != undefined) {
    var focus = '#experiment_'+e_index+' '+this.type;
  } 
  if (t_index != undefined) {
    var focus = '#experiment_'+e_index+'_task_'+t_index+' '+this.type;
  } 
  if (f_index != undefined) {
    var focus = '#experiment_'+e_index+'_task_'+t_index+'_finding_'+f_index+' '+this.type;
  }

  $(type).each( function(index) {
    $(this).data(throughTable.split('_').join('-'), index);
  });

  $(focus).each( function(index) {
    a_index = index;

    $(this).children().find('label').each( function() {
      if (type == '.author_paper') {
        $(this).prop('for', 'paper_author_papers_attributes_'+a_index+'_author_attributes_'+$(this).data('attribute'));
      }
      else if (type == '.display') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_displays_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (type == '.input') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_hardwares_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (type == '.indy-variable') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_experiment_indy_variables_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else if (type == '.metric') {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_task_metrics_attributes_'+a_index+'_'+$(this).data('attribute'));
      }
      else {
        $(this).prop('for', 'paper_experiments_attributes_'+e_index+'_'+throughTable+'s_attributes_'+a_index+'_'+$(this).data('attribute'));
      }

    });
    $(this).children().find('input').each( function() {
      if (type == '.author_paper') {
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
      else if (type == '.display') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_displays_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_displays_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }
      else if (type == '.input') {
        if ($(this).data('prefix')) {
          $(this).prop('id', $(this).data('prefix')+'paper_experiments_attributes_'+e_index+'_experiment_hardwares_attributes_'+a_index+'_hardware_tokens');
        } else {
          $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_hardwares_attributes_'+a_index+'_'+$(this).data('attribute'));
          $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_hardwares_attributes]['+a_index+']['+$(this).data('attribute')+']');
        }
      }
      else if (type == '.indy-variable') {
        if ($(this).data('prefix')) {
          $(this).prop('id', $(this).data('prefix')+'paper_experiments_attributes_'+e_index+'_experiment_indy_variables_attributes_'+a_index+'_indy_variable_tokens');
        } else {
          $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_experiment_indy_variables_attributes_'+a_index+'_'+$(this).data('attribute'));
          $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][experiment_indy_variables_attributes]['+a_index+']['+$(this).data('attribute')+']');
        }
      }
      else if (type == '.metric') {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_task_metrics_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+'][task_metrics_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }
      else {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_'+throughTable+'s_attributes_'+a_index+'_'+$(this).data('attribute'));
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+']['+throughTable+'s_attributes]['+a_index+']['+$(this).data('attribute')+']');
      }

    });
  });

  var index = 0;

  if (type == '.author_paper') {
    var i = 0;

    $('.authors input').each( function() {
      i = Math.floor(index/2);
      
      if (!$(this).data('attribute')) { 
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
  else if (!(type == '.author_paper' || type == '.input' || type == '.indy-variable' || type == '.metric')) {
    $('#experiment_'+e_index+' '+type).each( function(i) { 
      var val = $(this).prop('id').split('_');

      $(this).prop('id', 'experiment_'+e_index+'_'+type.slice(1)+'_'+val[val.length-1]);
      $(this).data('id', i);
    });

    var i = 0;
    $('#experiment_'+e_index+' .'+throughTable+'-desc input').each( function() {
      if (!$(this).data('attribute')) { 
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_'+throughTable+'s_attributes_'+i+'_id');
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+']['+throughTable+'s_attributes]['+i+'][id]');
        i = i + 1;
      }
    });
  }
  else if (type == '.input' || type == '.indy-variable') {
    var i = 0;

    $('#experiment_'+e_index+'_'+throughTable+'s input').each( function() {
      if (!($(this).data('attribute') || $(this).data('prefix'))) {
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_'+throughTable+'s_attributes_'+i+'_id');
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+']['+throughTable+'s_attributes]['+i+'][id]');
        i = i + 1;
      }
    });
  }
  else if (type == '.metric') {
    $('#experiment_'+e_index+'_task_'+t_index+' '+type).each( function(i) { 
      var val = $(this).prop('id').split('_');

      $(this).prop('id', 'experiment_'+e_index+'_task_'+t_index+'_'+type.slice(1)+'_'+val[val.length-1]);
      $(this).data('id', i);
    });

    var i = 0;
    $('#experiment_'+e_index+'_task_'+t_index+' .'+throughTable+'-desc input').each( function() {
      if (!$(this).data('attribute')) { 
        $(this).prop('id', 'paper_experiments_attributes_'+e_index+'_tasks_attributes_'+t_index+'_'+throughTable+'s_attributes_'+i+'_id');
        $(this).prop('name', 'paper[experiments_attributes]['+e_index+'][tasks_attributes]['+t_index+']['+throughTable+'s_attributes]['+i+'][id]');
        i = i + 1;
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