require File.dirname(__FILE__) + "/../../../lib/imgflip/lib_require.rb"

LOG ||= Imgflip::Log.new(STDOUT)
LOG.datetime_format = '%Y-%m-%d %X' # simplify time output
LOG.level = Imgflip::Log::DEBUG

@browser = nil

Before do |scenario|
  cucumber = Imgflip::Cucumber.new({:browser => "chrome"})
  @browser = cucumber.browser
end

After do |scenario|
  @browser.close
end
