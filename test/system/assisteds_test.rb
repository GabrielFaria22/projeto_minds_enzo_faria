require "application_system_test_case"

class AssistedsTest < ApplicationSystemTestCase
  setup do
    @assisted = assisteds(:one)
  end

  test "visiting the index" do
    visit assisteds_url
    assert_selector "h1", text: "Assisteds"
  end

  test "creating a Assisted" do
    visit assisteds_url
    click_on "New Assisted"

    fill_in "Address", with: @assisted.address
    fill_in "Email", with: @assisted.email
    check "Gender" if @assisted.gender
    fill_in "Name", with: @assisted.name
    fill_in "Name father", with: @assisted.name_father
    fill_in "Name mother", with: @assisted.name_mother
    fill_in "Observation", with: @assisted.observation
    fill_in "Phone1", with: @assisted.phone1
    fill_in "Phone2", with: @assisted.phone2
    click_on "Create Assisted"

    assert_text "Assisted was successfully created"
    click_on "Back"
  end

  test "updating a Assisted" do
    visit assisteds_url
    click_on "Edit", match: :first

    fill_in "Address", with: @assisted.address
    fill_in "Email", with: @assisted.email
    check "Gender" if @assisted.gender
    fill_in "Name", with: @assisted.name
    fill_in "Name father", with: @assisted.name_father
    fill_in "Name mother", with: @assisted.name_mother
    fill_in "Observation", with: @assisted.observation
    fill_in "Phone1", with: @assisted.phone1
    fill_in "Phone2", with: @assisted.phone2
    click_on "Update Assisted"

    assert_text "Assisted was successfully updated"
    click_on "Back"
  end

  test "destroying a Assisted" do
    visit assisteds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Assisted was successfully destroyed"
  end
end
