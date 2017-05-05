class Volunteer < ApplicationRecord
  belongs_to :leader, polymorphic: true, optional: true

  scope :sort_by_last_name, -> { order( last_name: :asc ) }
end
