require 'test_helper'

class AssistedsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @assisted = assisteds(:one)
  end

  test "should get index" do
    get assisteds_url
    assert_response :success
  end

  test "should get new" do
    get new_assisted_url
    assert_response :success
  end

  test "should create assisted" do
    assert_difference('Assisted.count') do
      post assisteds_url, params: { assisted: { address: @assisted.address, email: @assisted.email, gender: @assisted.gender, name: @assisted.name, name_father: @assisted.name_father, name_mother: @assisted.name_mother, observation: @assisted.observation, phone1: @assisted.phone1, phone2: @assisted.phone2 } }
    end

    assert_redirected_to assisted_url(Assisted.last)
  end

  test "should show assisted" do
    get assisted_url(@assisted)
    assert_response :success
  end

  test "should get edit" do
    get edit_assisted_url(@assisted)
    assert_response :success
  end

  test "should update assisted" do
    patch assisted_url(@assisted), params: { assisted: { address: @assisted.address, email: @assisted.email, gender: @assisted.gender, name: @assisted.name, name_father: @assisted.name_father, name_mother: @assisted.name_mother, observation: @assisted.observation, phone1: @assisted.phone1, phone2: @assisted.phone2 } }
    assert_redirected_to assisted_url(@assisted)
  end

  test "should destroy assisted" do
    assert_difference('Assisted.count', -1) do
      delete assisted_url(@assisted)
    end

    assert_redirected_to assisteds_url
  end
end
