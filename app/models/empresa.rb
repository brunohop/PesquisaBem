class Empresa < ActiveRecord::Base
  has_many :imovels
  has_many :veiculos
  has_many :socios
  has_many :anexos

  def self.estados
      ['AC','AL','AP','AM','BA','CE','DF','ES','GO',
        'MA','MT','MS','MG','PA','PB','PR','PE','PI',
        'RJ','RN','RS','RO','RR','SC','SP','SE','TO']
  end

end
