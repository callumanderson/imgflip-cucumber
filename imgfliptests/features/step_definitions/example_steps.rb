When /^I navigate to google$/ do
  LOG.info "Navigating to google"
  @browser.goto("https://google.com")
end

Then /^I should be on the google homepage$/ do
  LOG.info "Checking browser title"
  expect(@browser.title).to eq("Google")
end
