Given /^a status of up with message of "([^"]*)"$/ do |message|
  Status.create(up: true, message: message)
end

When /^I visit the status page$/ do
  visit '/statuses'
end

Then /^I should see the top message listed as up with a message of "([^"]*)"$/ do |message|
  page.should have_content message
end

Given /^(\d+) statuses exist$/ do |number|
  number.to_i.times do |i|
    Status.create(up: i.even?, message: "Message #{i}")
  end
end

Then /^I should see a top message$/ do
  within('#top_message') do
    page.should have_content "Message 0"
  end
end

Then /^I should see (\d+) older messages$/ do |number|
  within('#older_messages') do
    all('li').size.should == number.to_i
    (1..number.to_i).each do |i|
      within("#status_#{i - 1}") do
        page.should have_content "Message #{i}"
      end
    end
  end
end

