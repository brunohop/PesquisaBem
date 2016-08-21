json.extract! empresa, :id, :cnpj, :cidade, :uf, :razaoSocial, :created_at, :updated_at
json.url empresa_url(empresa, format: :json)