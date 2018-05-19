class Guardian < ApplicationRecord
  include PgSearch
  
  belongs_to :family

  scope :head, -> {where(head: true).first} #guardians.head returns the objects with head set true
  scope :contacts, -> {where(head: false)} #guardians.contacts returns the objects with head set false

  pg_search_scope :search_for, :against => [:first_name, :last_name]

  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :first_name, :last_name, presence: true
  validates :phone, presence: true   #TODO: we will need to make sure this is a valid phone number

  with_options if: :head? do |head|
    head.validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
    head.validates :address, presence: true
    head.validates :state, presence: true
    head.validates :city, presence: true
    head.validates :zipcode, presence: true
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
