When (/^I go to the image page$/) do
  @browser.a(:text => "Go to image page").when_present.click()

  expect(@browser.title).to eq("One Does Not Simply Meme - Imgflip")
end

Then (/^I should see my meme$/) do
   img = @browser.img(:id => "im")
   expect(img.exists?).to be_truthy
end

Then(/^my text "([^"]*)", "([^"]*)" should be displayed on the image page$/) do |top_line, bottom_line|
    alt = @browser.img(:id => "im").alt
    expect(alt).to include(top_line.upcase)
    expect(alt).to include(bottom_line.upcase)

    description = @browser.div(:text => "IMAGE DESCRIPTION:").parent.text
    expect(description).to include(top_line.upcase)
    expect(description).to include(bottom_line.upcase)
end

Then(/^my text "([^"]*)" should be displayed on the image page$/) do |top_line|
    alt = @browser.img(:id => "im").alt
    expect(alt).to include(top_line.upcase)

    description = @browser.div(:text => "IMAGE DESCRIPTION:").parent.text
    expect(description).to include(top_line.upcase)
end
