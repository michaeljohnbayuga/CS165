class Dormer < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  has_many :bedchecks_dormers
  has_many :bedchecks
  #has_many :studentassistants, :dependent => :destroy
end
