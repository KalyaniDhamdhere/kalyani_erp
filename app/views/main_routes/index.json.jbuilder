json.array!(@main_routes) do |main_route|
  json.extract! main_route, :id, :route_name, :cost
  json.url main_route_url(main_route, format: :json)
end
