require 'test_helper'

class NoteCategoriesControllerTest < ActionController::TestCase
  setup do
    @note_category = note_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:note_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create note_category" do
    assert_difference('NoteCategory.count') do
      post :create, :note_category => @note_category.attributes
    end

    assert_redirected_to note_category_path(assigns(:note_category))
  end

  test "should show note_category" do
    get :show, :id => @note_category.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @note_category.to_param
    assert_response :success
  end

  test "should update note_category" do
    put :update, :id => @note_category.to_param, :note_category => @note_category.attributes
    assert_redirected_to note_category_path(assigns(:note_category))
  end

  test "should destroy note_category" do
    assert_difference('NoteCategory.count', -1) do
      delete :destroy, :id => @note_category.to_param
    end

    assert_redirected_to note_categories_path
  end
end
