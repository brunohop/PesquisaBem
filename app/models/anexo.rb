class Anexo < ActiveRecord::Base
  belongs_to :empresa
  has_attached_file :arquivo
  validates_attachment :arquivo, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document) }

end
