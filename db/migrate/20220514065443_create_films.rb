class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|

      t.timestamps

      t.string   :title
      t.text     :body
      t.integer  :user_id
     
    end
  end
end
