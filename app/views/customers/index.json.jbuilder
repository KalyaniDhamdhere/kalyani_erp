json.array!(@customers) do |customer|
  json.extract! customer, :id, :first_name, :last_name, :mob_no, :address
  json.url customer_url(customer, format: :json)
end
