require 'rails_helper'

feature "page contains header" do
  scenario "header loads on page" do
    visit root_path

    expect(page).to have_css "h1", text: "Welcome to Paul's Blog"
  end
end