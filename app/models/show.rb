class Show < ApplicationRecord
  has_many :seasons, :dependent => :destroy
  has_many :favorites
  has_many :favorited_by, through: :favorites, source: :user
end
