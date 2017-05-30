class Volunteer < ApplicationRecord
  include PgSearch
  belongs_to :leader, polymorphic: true, optional: true

  pg_search_scope :search_for, against: %i(first_name last_name)

  scope :sort_by_last_name, -> { order( last_name: :asc ) }
end
