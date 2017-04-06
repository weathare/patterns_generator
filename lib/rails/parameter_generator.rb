class Rails::ParameterGenerator < Rails::Generators::NamedBase
  source_root File.expand_path("../templates", __FILE__)

  def create_parameters
    template "parameter.erb", File.join("app/parameters", class_path, "#{file_name}_parameter.rb")
    template "parameter_spec.erb", File.join("spec/parameters", class_path, "#{file_name}_parameter_spec.rb")
  end

  # @note only when first generatedd
  def inject_code
    apps_file = Rails.root.join(*%w[app controllers application_controller.rb])

    inject_into_file apps_file, before: /^end/ do <<-'CODE'

  private
    def controller_class_name
      params[:controller].singularize
    end

    def controller_class
      controller_class_name.camelize.constantize
    end

    def permitted_params_class
      "#{controller_class_name}_parameter".camelize.constantize
    end

    def permitted_params
      permitted_params_class.request_params(params)
    end
    CODE
    end if injectable?(apps_file)
  end

  private
    def injectable?(file_path)
      if self.behavior == :invoke
        !methods_defined?(file_path)
      else
        !parameters_file_exists?
      end
    end

    def methods_defined?(file_path)
      !!(File.read(file_path) =~ /controller_class_name/)
    end

    def parameters_file_exists?
      f = (class_path << file_name) * "/"
      targets = Dir.glob(Rails.root.join(*%w[app parameters ** *.rb]))
      targets.delete_if { |file| file =~ /#{f}_parameter\.rb+/ }.size > 0
    end
end
