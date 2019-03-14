require 'test_helper'

module Api
  module V1
    class HerosControllerTest < ActionDispatch::IntegrationTest
      setup do
        heros(:one)
        heros(:two)
      end

      test "should list index" do
        get '/api/heros'
        json = JSON.parse(response.body)

        assert_response :success
        assert_equal(json['heros'].length, Hero.count)
      end

      test "should filter on index" do
        get '/api/heros?name=doom'
        json = JSON.parse(response.body)

        assert_response :success
        assert_equal(json['heros'][0]['name'], 'Doomfist')
      end

      test "should support endless pagination on index" do
        get '/api/heros?page=2'
        json = JSON.parse(response.body)

        assert_response :success
        assert_equal(json['heros'], [])
      end


      test "should show hero json" do
        hero = Hero.first
        get "/api/heros/#{hero.id}"

        json = JSON.parse(response.body)

        assert_response :success
        assert_equal(json['name'], hero.name)
      end

    end
  end
end
