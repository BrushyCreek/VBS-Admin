class Kid < ApplicationRecord
  belongs_to :group, optional: true
  
  scope :sort_by_last_name, -> { order( last_name: :asc ) }
  scope :sort_by_grade, -> { order( last_grade_id: :asc ) }
  
  validates :first_name, :last_name, presence: true

  validates :birthdate, presence: true

  validates :gender, presence: true
  
  validates :address, :city, :zipcode, presence: true
  validates :state, presence: true
  validates :parent_name, presence: true
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :parent_email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  #TODO: we will need to make sure this is a valid phone number
  validates :parent_phone, presence: true

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
    
end

