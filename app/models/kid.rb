class Kid < ApplicationRecord
  belongs_to :group, optional: true
  
  scope :sort_by_last_name, -> { order( last_name: :asc ) }
  
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
end
