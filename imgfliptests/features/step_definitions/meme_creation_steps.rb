Given (/^I am viewing the imgflip memegenerator$/) do
  url = 'https://imgflip.com/memegenerator'
  LOG.info "Going to #{url}"
  @browser.goto(url)
  expect(@browser.url).to eq(url)
end

When(/^I generate a meme from template with "([^"]*)", "([^"]*)"$/) do |top_line, bottom_line|
  Watir::Wait.until { @browser.textarea(:class => "mm-text").exists? }

  top_box = @browser.textarea(:class => "mm-text", :placeholder => "TOP TEXT")
  bottom_box = @browser.textarea(:class => "mm-text", :placeholder => "BOTTOM TEXT")
  LOG.info "setting top line to #{top_line}"
  top_box.set(top_line)
  LOG.info "setting bottom line to #{bottom_line}"
  bottom_box.set(bottom_line)
  LOG.info "Generating meme"
  @browser.div(:class => "mm-generate").click()
end

Then (/^my meme should be created$/) do
  expect(@browser.img(:id => "doneImage").exists?).to be_truthy
end

Then (/^he html fragment of the lightbox should be valid$/) do
  LOG.info "Checking that html is valid on lightbox"
  fragment = @browser.div(:class => "BOX").html
  validator = Imgflip::Validator.new
  expect(validator.validate_html(fragment)).to eq(fragment)
end
