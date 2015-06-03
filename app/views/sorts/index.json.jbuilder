json.array!(@sorts) do |sort|
  json.extract! sort, :id, :sort_name
  json.url sort_url(sort, format: :json)
end
