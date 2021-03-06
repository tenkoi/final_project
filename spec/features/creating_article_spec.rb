require "rails_helper"

RSpec.feature "Creating Articles" do
  scenario "A user create a new article" do
    visit '/'
    click_link "New Article"

    fill_in "Title", with: "Creating blog"
    fill_in "Body", with: "lorem ipsum"

    click_button "Create Post"

    expect(page).to have_content("Post has been created")
    expect(page.current_path).to eq(articles_path)

  end

  scenario " A user fails to create a new article " do
    visit '/'
    click_link "New Article"

    fill_in "Title", with: ""
    fill_in "Body", with: ""

    click_button "Create Post"

    expect(page).to have_content("Post has not been created")
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("Body can't be blank")
  end

end
