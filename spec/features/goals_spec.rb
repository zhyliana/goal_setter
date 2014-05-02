require 'spec_helper'

feature "create goal" do
  before :each do
    sign_up
  end

  it "user show should have the new goal link" do
    # click_button "Create Goal"
    expect(page).to have_content "Create new goal"
  end


  it "goal page should have create goal" do
    click_link "Create Goal"
    expect(page).to have_content "Create new goal"
  end

  it "goal page can create a new private goal " do
    create_goal("Private")
    expect(page).to have_content "Finish Rails Private"
  end

  it "Other users should not see user's private goals" do
    create_goal("Private")
    click_button "Sign Out"
    sign_up_friend
    click_link "All Goals"
    expect(page).to_not have_content "Finish Rails Private"
  end

  it "goal page can create a new public goal " do
    create_goal("Public")

    expect(page).to have_content "Finish Rails Public"
  end

  it "Other users should see user's public goals" do
    create_goal("Public")
    click_button "Sign Out"
    sign_up_friend
    click_link "All Goals"
    expect(page).to have_content "Finish Rails Public"
  end

end

feature "complete a goal" do
  before :each do
    sign_up
    create_goal("Public")
  end

  it "user show should have complete goal button" do
    # click_button "Create Goal"
    expect(page).to have_button "Completed"
  end

  it "user show should reflect completed goals" do
    click_button "Completed"
    expect(page).to have_content "Complete!"
  end

  it "friends should see other's completed goals" do
    click_button "Completed"
    click_button "Sign Out"
    sign_up_friend
    click_link "All Goals"
    expect(page).to have_content "Complete!"
  end

end
