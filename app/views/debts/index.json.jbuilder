json.array!(@debts) do |debt|
  json.extract! debt, :id, :amount, :reason
  json.url debt_url(debt, format: :json)
end
