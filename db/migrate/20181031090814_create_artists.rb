class CreateArtists < ActiveRecord::Migration[5.2]
  def up
    return if Artist.table_exists?

    create_table :artists do |t|
      t.timestamps
      t.references :language, foreign_key: true
      t.boolean :visible, default: true, null: false
      t.date :birthday
      t.string :surname
      t.string :name
      t.string :patronymic
      t.string :image
      t.string :lead
      t.text :description
    end
  end

  def down
    drop_table :artists if Artist.table_exists?
  end
end
