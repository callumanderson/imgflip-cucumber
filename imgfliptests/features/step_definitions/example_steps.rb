When /^I navigate to google$/ do
  @browser.goto("https://google.com")
end

Then /^I should be on the google homepage$/ do
  expect(@browser.title).to eq("Google")
end
