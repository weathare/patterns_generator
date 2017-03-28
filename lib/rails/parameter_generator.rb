class Rails::ParameterGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  def create_parameters
    template "parameter.erb", File.join("app/parameters", class_path, "#{file_name}_parameter.rb")
    template "parameter_spec.erb", File.join("spec/parameters", class_path, "#{file_name}_parameter_spec.rb")
  end
end
