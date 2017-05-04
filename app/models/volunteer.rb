class Volunteer < ApplicationRecord
  belongs_to :leader, polymorphic: true
end
