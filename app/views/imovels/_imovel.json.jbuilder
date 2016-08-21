json.extract! imovel, :id, :logradouro, :cep, :bairro, :cidade, :uf, :matricula, :cri, :observacoes, :created_at, :updated_at
json.url imovel_url(imovel, format: :json)