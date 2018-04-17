class Rating < ApplicationRecord
  belongs_to :show
  belongs_to :user
end
