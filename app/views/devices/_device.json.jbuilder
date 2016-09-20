json.extract! device, :id, :name, :brand, :model, :operating_system, :users, :udid, :purchase_date, :created_at, :updated_at
json.url device_url(device, format: :json)