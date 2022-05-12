class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|

      t.timestamps
      
      t.string   :title
      t.text     :body
      
    end
  end
end
