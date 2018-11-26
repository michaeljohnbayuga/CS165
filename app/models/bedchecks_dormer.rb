class Bedchecks_dormer < ApplicationRecord
  has_many :bedchecks, class_name:"Bedcheck"
  has_many :dormers, class_name:"Dormer"
  #Bedchecks_dormer.left_outer_joins(Dormer)
end
