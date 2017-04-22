class Kid < ApplicationRecord
  scope :sort_by_last_name, -> { order( last_name: :asc ) }
  
  validates :first_name, :last_name, presence: true

  #TODO: we will need to make sure this is a valid date
  validates :birthdate, presence: true

  #TODO: we will need to check and make sure that the default option hasn't been left unchanged
  validates :gender, presence: true
  
  validates :address, :city, :zipcode, presence: true
  validates :state, presence: true, length: { is: 2 }
  validates :parent_first_name, :parent_last_name, presence: true
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :parent_email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  #TODO: we will need to make sure this is a valid phone number
  validates :parent_phone, presence: true
end
