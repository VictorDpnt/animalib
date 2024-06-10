class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: { to_table: :users}

      t.timestamps
    end
  end
end
