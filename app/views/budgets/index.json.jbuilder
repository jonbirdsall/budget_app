json.array!(@budgets) do |budget|
  json.extract! budget, :id, :title
  json.url budget_url(budget, format: :json)
end
