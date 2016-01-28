require "imgflip/cucumber/version"
require 'watir-webdriver'

module Imgflip
  class Cucumber
    attr_reader :config

    def initialize(config)
      @config = config.reject { |_, v| v.nil? || v.respond_to?(:empty) && v.empty? }
    end

    def browser
      @browser ||= client
    end

    private
    def client
      browser = config.fetch(:browser)
      config = opts(browser)

      @client ||= Watir::Browser.new(
      browser,
      config
      )
    end

    def opts(browser)
      prefs = {
        :download => {
          :prompt_for_download => false,
          :default_directory => "/Downloads/"
        }
      }
      switches = %w[--ignore-certificate-errors --disable-popup-blocking --disable-translate]

      {:prefs => prefs, :switches => switches}
    end
  end
end
