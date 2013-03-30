require 'test_helper'

class AboborasControllerTest < ActionController::TestCase
  setup do
    @abobora = aboboras(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aboboras)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create abobora" do
    assert_difference('Abobora.count') do
      post :create, abobora: { nome: @abobora.nome }
    end

    assert_redirected_to abobora_path(assigns(:abobora))
  end

  test "should show abobora" do
    get :show, id: @abobora
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @abobora
    assert_response :success
  end

  test "should update abobora" do
    put :update, id: @abobora, abobora: { nome: @abobora.nome }
    assert_redirected_to abobora_path(assigns(:abobora))
  end

  test "should destroy abobora" do
    assert_difference('Abobora.count', -1) do
      delete :destroy, id: @abobora
    end

    assert_redirected_to aboboras_path
  end
end
