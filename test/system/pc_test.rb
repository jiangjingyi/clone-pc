require "application_system_test_case"

class pcsTest < ApplicationSystemTestCase
  setup do
    @pc = pcs(:one)
  end

  test "visiting the index" do
    visit pcs_url
    assert_selector "h1", text: "pcs"
  end

  test "creating a pc" do
    visit pcs_url
    click_on "登録"

    
    
  end

  test "updating a pc" do
    visit pcs_url
    click_on "Edit", match: :first

    fill_in "Name", with: @pc.name
    fill_in "Profile", with: @pc.profile
    click_on "Update pc"

    assert_text "pc was successfully updated"
    click_on "Back"
  end

  test "destroying a pc" do
    visit pcs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "pc was successfully destroyed"
  end
end
