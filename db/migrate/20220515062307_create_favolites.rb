class CreateFavolites < ActiveRecord::Migration[6.1]

  def change
    create_table :favorites do |t|
      t.timestamps

      t.references :user, null: false, foreign_key: true
      t.references :movie
      t.references :film
     end
  end
end