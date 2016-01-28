require 'spec_helper'

RSpec.describe Imgflip::Cucumber do
  subject(:cucumber) { described_class.new(config) }
  let(:config) { {
    :browser => browser,
    :config_hash => config_hash
  } }
  let(:browser) { "chrome" }
  let(:config_hash) { }

  describe '#version' do
    it 'has a version number' do
      expect(Imgflip::Cucumber::VERSION).not_to be nil
    end
  end

  describe '#initialize' do
    it 'filters out empty settings and assigns the rest' do
      expect(cucumber.config).to eq(
        :browser => browser
      )
    end
  end

describe '#browser' do
    context 'when a browser is created' do
      after { cucumber.browser.close }

      it 'returns a browser' do
          expect(cucumber.browser).to be_instance_of(Watir::Browser)
      end
    end
  end
end
