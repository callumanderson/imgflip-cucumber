require "imgflip/cucumber/version"
require 'nokogiri'

module Imgflip
  class Validator

    def initialize
    end

    def validate_html(fragment)
      valid_html = Nokogiri::HTML::DocumentFragment.parse(fragment).to_html
      valid_html
    end
  end
end
