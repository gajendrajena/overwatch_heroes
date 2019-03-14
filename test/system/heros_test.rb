require "application_system_test_case"

class HerosTest < ApplicationSystemTestCase
  setup do
    @hero = heros(:one)
  end

  test "visiting the index" do
    visit heros_url
    assert_selector "h1", text: "Heros"
  end

  test "creating a Hero" do
    visit heros_url
    click_on "New Hero"

    fill_in "Image card background", with: @hero.image_card_background
    fill_in "Image portrait", with: @hero.image_portrait
    fill_in "Image splash", with: @hero.image_splash
    fill_in "Name", with: @hero.name
    fill_in "Slug", with: @hero.slug
    fill_in "Type", with: @hero.type
    click_on "Create Hero"

    assert_text "Hero was successfully created"
    click_on "Back"
  end

  test "updating a Hero" do
    visit heros_url
    click_on "Edit", match: :first

    fill_in "Image card background", with: @hero.image_card_background
    fill_in "Image portrait", with: @hero.image_portrait
    fill_in "Image splash", with: @hero.image_splash
    fill_in "Name", with: @hero.name
    fill_in "Slug", with: @hero.slug
    fill_in "Type", with: @hero.type
    click_on "Update Hero"

    assert_text "Hero was successfully updated"
    click_on "Back"
  end

  test "destroying a Hero" do
    visit heros_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hero was successfully destroyed"
  end
end
