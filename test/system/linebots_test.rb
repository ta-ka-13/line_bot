require "application_system_test_case"

class LinebotsTest < ApplicationSystemTestCase
  setup do
    @linebot = linebots(:one)
  end

  test "visiting the index" do
    visit linebots_url
    assert_selector "h1", text: "Linebots"
  end

  test "creating a Linebot" do
    visit linebots_url
    click_on "New Linebot"

    fill_in "Body", with: @linebot.body
    fill_in "Title", with: @linebot.title
    click_on "Create Linebot"

    assert_text "Linebot was successfully created"
    click_on "Back"
  end

  test "updating a Linebot" do
    visit linebots_url
    click_on "Edit", match: :first

    fill_in "Body", with: @linebot.body
    fill_in "Title", with: @linebot.title
    click_on "Update Linebot"

    assert_text "Linebot was successfully updated"
    click_on "Back"
  end

  test "destroying a Linebot" do
    visit linebots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Linebot was successfully destroyed"
  end
end
