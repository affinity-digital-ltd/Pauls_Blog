require 'rails_helper'

feature "page contains header" do
  scenario "header loads on page" do
    visit articles_path

    expect(page).to have_css "h1", text: "List of all Articles"
    expect(page).should have_no_content("No content")
  end
end