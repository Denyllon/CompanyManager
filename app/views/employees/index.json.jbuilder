json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :job
  json.url employee_url(employee, format: :json)
end
