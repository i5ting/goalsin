json.array!(@backbones) do |backbone|
  json.extract! backbone, :id, :name, :detail
  json.url backbone_url(backbone, format: :json)
end
