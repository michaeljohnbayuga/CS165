class Episode < ApplicationRecord
  belongs_to :season
  has_many :trackers, :dependent => :destroy
end
