class Kid < ApplicationRecord
  include PgSearch
  
  belongs_to :group, optional: true
  belongs_to :family

  pg_search_scope :search_for, against: %i(first_name last_name)
  pg_search_scope :search_grades, against: %i(last_grade_id)
  
  scope :sort_by_last_name, -> { order( last_name: :asc ) }
  scope :sort_by_grade, -> { order( last_grade_id: :asc ) }

  before_save :update_notes_modified_at

  # validates :first_name, :last_name, presence: true

  # validates :birthdate, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def current_grade
    lg = self.last_grade_id
    if lg == 8
      return "7th"
    else
      return "#{Kid.grade_types.at(lg + 1)}"
    end
  end

  def self.grade_types
    ["Pre-K", "4k", "5k", "1st", "2nd", "3rd", "4th", "5th", "6th"]
  end

  def grade
    lg = self.last_grade_id
    return "#{Kid.grade_types.at(lg)}"
  end

  def template
    @template
  end

  def template=(val)
    @template = val
  end

  private

  def update_notes_modified_at
    #checks t see if the notes field has changed since the last time it saved and updates the modified at field is so
    self.note_modified_at = Time.now if notes_changed?
  end
  
end

