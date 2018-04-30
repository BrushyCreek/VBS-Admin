class Guardian < ApplicationRecord
  belongs_to :relationship, polymorphic: true

  validates :address, :city, :zipcode 
  validates :state 
  validates :first_name, presence: true
  validates :last_name, presence: true
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  #TODO: we will need to make sure this is a valid phone number
  validates :phone, presence: true
end
