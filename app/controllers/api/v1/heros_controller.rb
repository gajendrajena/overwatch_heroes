module Api
  module V1
    class HerosController < Api::ApiController
      before_action :set_hero, only: [:show]

      # GET /api/heros
      # GET /api/heros.json
      def index
        paginate_params = {page: params[:page]}
        if params[:name]
          @heros = Hero.where("LOWER(name) like ?", "%#{params[:name].downcase}%").paginate(paginate_params)
        else
          @heros = Hero.paginate(paginate_params)
        end
        @heros
      end

      # GET /api/heros/1
      # GET /api/heros/1.json
      def show
      end

      private
      # Use callbacks to share common setup or constraints between actions.
      def set_hero
        @hero = Hero.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def hero_params
        params.require(:hero).permit(:type, :name, :slug, :image_portrait, :image_splash, :image_card_background)
      end
    end
  end
end
