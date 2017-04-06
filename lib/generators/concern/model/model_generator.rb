class Concern::ModelGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../../templates", __FILE__)

  def create_concerns
    template "base.erb", File.join("app/models/concerns", class_path, "#{file_name}.rb")
    template "model_spec.erb", File.join("spec/models/concerns", class_path, "#{file_name}_spec.rb")
  end
end
