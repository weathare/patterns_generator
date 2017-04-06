class Concern::ControllerGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../../templates", __FILE__)

  def create_concerns
    template "base.erb", File.join("app/controllers/concerns", class_path, "#{file_name}.rb")
    template "controller_spec.erb", File.join("spec/controllers/concerns", class_path, "#{file_name}_spec.rb")
  end
end
