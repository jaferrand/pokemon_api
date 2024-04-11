require "test_helper"

class PokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get listar" do
    get pokemons_listar_url
    assert_response :success
  end

  test "should get capturar" do
    get pokemons_capturar_url
    assert_response :success
  end

  test "should get capturados" do
    get pokemons_capturados_url
    assert_response :success
  end

  test "should get liberar" do
    get pokemons_liberar_url
    assert_response :success
  end

  test "should get importar" do
    get pokemons_importar_url
    assert_response :success
  end
end
