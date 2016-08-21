class Empresa < ActiveRecord::Base
  has_many :imovels
  has_many :veiculos
  has_many :socios
  has_many :anexos
end
