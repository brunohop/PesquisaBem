json.extract! socio, :id, :nome, :cpf, :dataNascimento, :administrador, :created_at, :updated_at
json.url socio_url(socio, format: :json)