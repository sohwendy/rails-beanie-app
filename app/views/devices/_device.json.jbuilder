json.extract! device, :id, :name, :manufacturer, :model, :operating_system, :users, :udid, :purchase_date, :created_at, :updated_at
json.url device_url(device, format: :json)