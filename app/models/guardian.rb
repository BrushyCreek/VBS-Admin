class Guardian < ApplicationRecord
  belongs_to :family

  scope :head, -> {where(is_head: true)} #guardians.head returns the objects with is_head set true
  scope :contacts, -> {where(is_head: false)} #guardians.contacts returns the objects with is_head set false
  
#  validates :first_name, presence: true
#  validates :last_name, presence: true
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
#  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

  #TODO: we will need to make sure this is a valid phone number
 # validates :phone, presence: true
end
