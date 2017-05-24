class Team < ApplicationRecord
  has_many :volunteers, as: :leader
end
