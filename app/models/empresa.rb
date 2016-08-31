class Empresa < ActiveRecord::Base
  has_many :imovels, :dependent => :delete_all
  has_many :veiculos, :dependent => :delete_all
  has_many :socios, :dependent => :delete_all
  has_many :anexos, :dependent => :delete_all

  def self.estados
      ['AC','AL','AP','AM','BA','CE','DF','ES','GO',
        'MA','MT','MS','MG','PA','PB','PR','PE','PI',
        'RJ','RN','RS','RO','RR','SC','SP','SE','TO']
  end

end
