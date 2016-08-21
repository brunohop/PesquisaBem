class Veiculo < ActiveRecord::Base
  belongs_to :socio
  belongs_to :empresa
end
