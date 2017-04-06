require "rails_helper"

RSpec.describe Concern::ModelGenerator, type: :generator do
  destination File.expand_path("../../tmp", __FILE__)

  before { prepare_destination }

  after { prepare_destination }

  context "generate files" do
    before { run_generator %w(ilohas/orange) }

    it { expect(file("app/models/concerns/ilohas/orange.rb")).to exist }
    it { expect(file("spec/models/concerns/ilohas/orange_spec.rb")).to exist }
  end
end
