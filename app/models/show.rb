class Show < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  has_many :seasons, :dependent => :destroy
  has_many :rating
end
