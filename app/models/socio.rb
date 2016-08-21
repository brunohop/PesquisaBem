class Socio < ActiveRecord::Base
  has_many :imovels
  has_many :veiculos
  belongs_to :empresa
end
