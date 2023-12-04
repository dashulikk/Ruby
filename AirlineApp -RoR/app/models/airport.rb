class Airport < ApplicationRecord
   has_many :parts
   has_many :planes, through: :parts
end
