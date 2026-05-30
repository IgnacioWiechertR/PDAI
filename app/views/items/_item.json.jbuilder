json.extract! item, :id, :photo, :name, :description, :categories, :cost, :owner_id, :created_at, :updated_at
json.url item_url(item, format: :json)
