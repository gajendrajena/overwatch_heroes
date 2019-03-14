class CreateHeros < ActiveRecord::Migration[6.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.string :slug
      t.string :image_portrait
      t.string :image_splash
      t.string :image_card_background

      t.timestamps
    end
  end
end
