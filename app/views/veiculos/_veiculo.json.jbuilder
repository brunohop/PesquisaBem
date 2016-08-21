json.extract! veiculo, :id, :marca, :modelo, :ano, :placa, :cidade, :uf, :cri, :observacoes, :created_at, :updated_at
json.url veiculo_url(veiculo, format: :json)