class Kid < ApplicationRecord
  validates :first_name, :last_name, presence: true

  #TODO: we will need to make sure this is a valid date
  validates :birthdate, presence: true

  #TODO: we will need to check and make sure that the default option hasn't been left unchanged
  validates :gender, presence: true
  
  valedates :address, :city, :zipcode, presence: true
  valedates :state, presence: true, length: { is: 2 }
  validates :parents_first_name, :parents_last_name, presence: true
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  #TODO: we will need to make sure this is a valid phone number
  validates :parent_phone, presence: true
end
