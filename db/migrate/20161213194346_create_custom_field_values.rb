class CreateCustomFieldValues < ActiveRecord::Migration[5.0]
  def change
    create_table :custom_field_values do |t|
      t.references :contact, foreign_key: true
      t.references :custom_field, foreign_key: true
      t.string :value

      t.timestamps
    end
  end
end
