Given /^a status of up with message of "([^"]*)"$/ do |message|
  Status.create(status: "up", message: message)
end

When /^I visit the status page$/ do
  visit '/statuses'
end

Then /^I should see the top message listed as up with a message of "([^"]*)"$/ do |message|
  page.should have_content message
end

Given /^(\d+) statuses exist$/ do |number|
  number.to_i.times do |i|
    status = i.even? ? "up" : "down"
    Status.create!(status: status, message: "Message #{i}")
  end
end

Then /^I should see a top message numbered "([^"]*)"$/ do |number|
  within('#top_message') do
    page.should have_content "Message #{number}"
  end
end

Then /^I should see (\d+) older messages$/ do |number|
  within('#older_messages') do
    all('li').size.should == number.to_i
    (1..number.to_i).each do |i|
      within("#status_#{i - 1}") do
        page.should have_content "Message #{(number.to_i + 1) - i}"
      end
    end
  end
end

