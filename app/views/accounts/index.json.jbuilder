json.array!(@accounts) do |account|
  json.extract! account, :id, :name, :buy_price, :num, :buy_date, :buy_store, :store_id
  json.url account_url(account, format: :json)
end
