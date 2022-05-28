class CreateFilmFavorites < ActiveRecord::Migration[6.1]
  def change
    create_table :film_favorites do |t|

      t.references :user, null: false, foreign_key: true
      t.references :film
      t.timestamps
    end
  end
end
