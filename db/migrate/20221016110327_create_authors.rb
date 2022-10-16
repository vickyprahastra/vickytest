class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors, id: :uuid do |t|
      t.string :name
      t.jsonb :countries, default: []
      t.integer :gender, default: 0
      t.jsonb :wikipedia, default: {}
      t.integer :n_books
      t.string :summary
      t.datetime :born
      t.jsonb :books, default: []
      t.integer :int_id
      t.datetime :died

      t.timestamps
    end
  end
end
