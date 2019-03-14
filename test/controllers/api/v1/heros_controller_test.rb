require 'test_helper'

module Api
  module V1
    class HerosControllerTest < ActionDispatch::IntegrationTest
      setup do
        @hero = heros(:one)
      end

      test "should list index" do
        heroes_json = [{"id"=>980190962, "name"=>"Doomfist", "slug"=>"doomfist", "image_portrait"=>"https://oversumo-stage.s3-eu-west-1.amazonaws.com/uploads/hero/image_portrait/doomfist/portrait.png", "image_splash"=>"https://oversumo-stage.s3-eu-west-1.amazonaws.com/uploads/hero/image_splash/doomfist/splash.jpg", "image_card_background"=>"https://oversumo-stage.s3-eu-west-1.amazonaws.com/uploads/hero/image_card_background/doomfist/image_card_background.jpg"}]
        get '/api/heros'

        json = JSON.parse(response.body)

        assert_response :success
        assert_equal(json.length, 1)
      end

      test "should show hero json" do
        get "/api/heros/#{@hero.id}"

        json = JSON.parse(response.body)

        assert_response :success
        assert_equal(json, {})
      end

    end
  end
end
