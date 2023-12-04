class Plane < ApplicationRecord
   has_many :parts
   has_many :airports, through: :parts
   has_one :pilot
   has_many :baggages
end
