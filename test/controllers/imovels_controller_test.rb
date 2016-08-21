require 'test_helper'

class ImovelsControllerTest < ActionController::TestCase
  setup do
    @imovel = imovels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imovels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create imovel" do
    assert_difference('Imovel.count') do
      post :create, imovel: { bairro: @imovel.bairro, cep: @imovel.cep, cidade: @imovel.cidade, cri: @imovel.cri, logradouro: @imovel.logradouro, matricula: @imovel.matricula, observacoes: @imovel.observacoes, uf: @imovel.uf }
    end

    assert_redirected_to imovel_path(assigns(:imovel))
  end

  test "should show imovel" do
    get :show, id: @imovel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @imovel
    assert_response :success
  end

  test "should update imovel" do
    patch :update, id: @imovel, imovel: { bairro: @imovel.bairro, cep: @imovel.cep, cidade: @imovel.cidade, cri: @imovel.cri, logradouro: @imovel.logradouro, matricula: @imovel.matricula, observacoes: @imovel.observacoes, uf: @imovel.uf }
    assert_redirected_to imovel_path(assigns(:imovel))
  end

  test "should destroy imovel" do
    assert_difference('Imovel.count', -1) do
      delete :destroy, id: @imovel
    end

    assert_redirected_to imovels_path
  end
end
