require "application_system_test_case"

class SparesTest < ApplicationSystemTestCase
  setup do
    @spare = spares(:one)
  end

  test "visiting the index" do
    visit spares_url
    assert_selector "h1", text: "Spares"
  end

  test "creating a Spare" do
    visit spares_url
    click_on "New Spare"

    fill_in "Balance", with: @spare.balance
    fill_in "Date delivered", with: @spare.date_delivered
    fill_in "Date warranty", with: @spare.date_warranty
    fill_in "Description", with: @spare.description
    fill_in "Stock", with: @spare.stock
    click_on "Create Spare"

    assert_text "Spare was successfully created"
    click_on "Back"
  end

  test "updating a Spare" do
    visit spares_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @spare.balance
    fill_in "Date delivered", with: @spare.date_delivered
    fill_in "Date warranty", with: @spare.date_warranty
    fill_in "Description", with: @spare.description
    fill_in "Stock", with: @spare.stock
    click_on "Update Spare"

    assert_text "Spare was successfully updated"
    click_on "Back"
  end

  test "destroying a Spare" do
    visit spares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Spare was successfully destroyed"
  end
end
