class Location < ApplicationRecord
  has_many :volunteers, as: :leader
end
