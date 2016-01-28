require 'spec_helper'

RSpec.describe Imgflip::Validator do
  subject(:validator) { described_class.new }
  let(:valid_fragment) { "<div><a>foo</a></div>"}
  let(:invalid_fragment) { "f<div>oo<oo>cvnfd <&/jedn" }

  describe "#initialize" do
    it "instantiates a new validator" do
      expect(validator).to be_kind_of(Imgflip::Validator)
    end
  end

  describe "#validate_hmtl" do
    it "should return true when given a valid html fragment" do
      expect(validator.validate_html(valid_fragment)).to eq(valid_fragment)
    end

    it "should return false when given an invalid html fragment" do
      expect(validator.validate_html(invalid_fragment)).not_to eq(invalid_fragment)
    end
  end
end
