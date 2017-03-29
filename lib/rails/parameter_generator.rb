class Rails::ParameterGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  def create_parameters
    template "parameter.erb", File.join("app/parameters", class_path, "#{file_name}_parameter.rb")
    template "parameter_spec.erb", File.join("spec/parameters", class_path, "#{file_name}_parameter_spec.rb")
  end

  # @note only when first generatedd
  def inject_code
    apps_file = Rails.root.join(*%w[app controllers application_controller.rb])

    inject_into_file apps_file, before: /^end/ do <<-"CODE"

  private
    def permitted_params_class
      controller = params.permit(:controller)[:controller]
      controller << "_parameter"
      @permitted_params_class ||= controller.camelize.constantize
    end

    def permitted_params
      @permitted_params ||= permitted_params_class.request_params(params)
    end
    CODE
    end unless self.behavior == :invoke && File.read(apps_file) =~ /permitted_params_class/
  end
end
