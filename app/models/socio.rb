class Socio < ActiveRecord::Base
  has_many :imovels, :dependent => :delete_all
  has_many :veiculos, :dependent => :delete_all
  belongs_to :empresa
end
