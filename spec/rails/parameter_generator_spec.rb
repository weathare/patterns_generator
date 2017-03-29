require "rails_helper"

RSpec.describe Rails::ParameterGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)

  before do
    prepare_destination
    FileUtils.cp(
      Rails.root.join(*%w[app controllers application_controller.rb]),
      destination_root
    )
  end

  after do
    FileUtils.cp(
      destination_root + "/application_controller.rb",
      Rails.root.join(*%w[app controllers application_controller.rb])
    )
    prepare_destination
  end

  context "generate files" do
    before { run_generator %w(api/resources/regist) }

    it { expect(file("app/parameters/api/resources/regist_parameter.rb")).to exist }
    it { expect(file("spec/parameters/api/resources/regist_parameter_spec.rb")).to exist }
    it(:inject_code) do
      file = File.read(Rails.root.join(*%w[app controllers application_controller.rb]))
      expect(file).to match /permitted_params_class/
      expect(file).to match /permitted_params/
    end
  end
end
