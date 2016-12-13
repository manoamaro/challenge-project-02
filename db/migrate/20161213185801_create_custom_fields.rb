class CreateCustomFields < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_fields do |t|
      t.string :title
      t.integer :field_type
      t.string :default_value
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
