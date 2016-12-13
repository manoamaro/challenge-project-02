json.extract! custom_field, :id, :title, :field_type, :default_value, :created_at, :updated_at
json.url custom_field_url(custom_field, format: :json)