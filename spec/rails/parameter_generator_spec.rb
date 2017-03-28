require "rails_helper"

RSpec.describe Rails::ParameterGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)

  before { prepare_destination }

  context "generate files" do
    before { run_generator %w(api/resources/regist) }

    it { expect(file("app/parameters/api/resources/regist_parameter.rb")).to exist }
    it { expect(file("spec/parameters/api/resources/regist_parameter_spec.rb")).to exist }
  end

  after(:context) { FileUtils.rm_rf(destination_root) }
end
