class Review < ApplicationRecord
  belongs_to :user
  belongs_to :show
  validates :text, presence: true
end
