class Show < ApplicationRecord
  mount_uploader :attachment, AttachmentUploader
  has_many :seasons, :dependent => :destroy
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
  has_many :rating # shouldn't this be plural?
  has_many :reviews
end
