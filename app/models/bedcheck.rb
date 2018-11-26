class Bedcheck < ApplicationRecord
      has_many :dormers
      has_many :bedchecks_dormers
      #Bedcheck.joins(:dormer)
end
