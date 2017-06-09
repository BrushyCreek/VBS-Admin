class Location < ApplicationRecord
  has_many :volunteers, as: :leader, dependent: :nullify

  scope :sort_by_name, -> { order(name: :asc) }
end
