class Volunteer < ApplicationRecord
  include PgSearch
  belongs_to :leader, polymorphic: true, optional: true
  validates :first_name, :last_name, :email, :phone, :presence => true

  pg_search_scope :search_for, against: %i(first_name last_name)

  scope :sort_by_last_name, -> { order( last_name: :asc ) }

  def full_name
    "#{first_name} #{last_name}"
  end
end
