module ApplicationHelper
	def link_to_remove_fields(name, f)
    f.hidden_field(:_destroy) # + link_to_function(name, "remove_fields(this)")
  end

  def link_to_add_fields(name, f, association, css_class = 'btn', position = 'after')
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end

    if position == 'before'
       link_to_function(name, "add_fields_before(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => css_class)
    else
       link_to_function(name, "add_fields_after(this, \"#{association}\", \"#{escape_javascript(fields)}\")", :class => css_class)
    end
    
  end

  def add_fields(f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    
  end
end
