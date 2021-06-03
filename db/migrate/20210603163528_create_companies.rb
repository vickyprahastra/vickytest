class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies, id: :uuid do |t|
      t.string :name
      t.text :description
      t.text :website
      t.integer :company_size
      t.text :timezone
      t.integer :category
      t.text :internal_note
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
