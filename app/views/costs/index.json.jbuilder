json.array!(@costs) do |cost|
  json.extract! cost, :id, :cost_name, :cost_price, :cost_period, :store_id
  json.url cost_url(cost, format: :json)
end
