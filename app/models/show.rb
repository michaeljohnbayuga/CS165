class Show < ApplicationRecord
  has_many :seasons, :dependent => :destroy
  has_many :rating
end
