require File.dirname(__FILE__) + "/../../../lib/imgflip/lib_require.rb"

LOG ||= Imgflip::Log.new(STDOUT)
LOG.datetime_format = '%Y-%m-%d %X' # simplify time output
LOG.level = Imgflip::Log::DEBUG

cucumber = Imgflip::Cucumber.new({:browser => "chrome"})
browser = cucumber.browser

Before do
  @browser = browser
end

After do |scenario|
  browser.cookies.clear
end

# "after all"
at_exit do
  browser.close
end

#For debugging steps
AfterStep('@pause') do
  LOG.info 'Press Return to continue'
  STDIN.getc
end
