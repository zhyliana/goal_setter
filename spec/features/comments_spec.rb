require 'spec_helper'

feature "create comment" do
  before :each do
    sign_up
  end

  it "user should not be able to leave comments on their own page" do
    expect(page).to_not have_content "Leave a comment"
  end

  it "user should be able to create comment on another user" do
    create_goal("Public")
    click_button "Sign Out"
    sign_up_friend
    click_link "All Goals"
    click_link "test"
    fill_in "Comment", with: "Keep Railing"
    click_button "Create comment"

    expect(page).to have_content "Keep Railing"
  end

  it "user should be able to create comment on another's goal" do
    create_goal("Public")
    click_button "Sign Out"
    sign_up_friend
    click_link "All Goals"
    click_link "Finish Rails Public"
    fill_in "Comment", with: "Keep Railing Goal"
    click_button "Create comment"

    expect(page).to have_content "Keep Railing Goal"
  end

  it "user should be able to see comments on self" do
    create_goal("Public")
    click_button "Sign Out"
    sign_up_friend
    click_link "All Goals"
    click_link "test"
    fill_in "Comment", with: "Keep Railing"
    click_button "Create comment"
    click_button "Sign Out"
    fill_in "Username", with: "test"
    fill_in "Password", with: "123"
    click_button "Sign In"
    expect(page).to have_content "Keep Railing"
  end

  it "user should be able to see comments on goals" do
    create_goal("Public")
    click_button "Sign Out"
    sign_up_friend
    click_link "All Goals"
    click_link "Finish Rails Public"
    fill_in "Comment", with: "Keep Railing Goal"
    click_button "Create comment"
    click_button "Sign Out"
    sign_up_buddy
    click_link "All Goals"
    click_link "Finish Rails Public"

    expect(page).to have_content "Keep Railing Goal"
  end

end
