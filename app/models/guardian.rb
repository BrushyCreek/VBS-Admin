class Guardian < ApplicationRecord
  include PgSearch
  
  belongs_to :family

  scope :head, -> {where(is_head: true).first} #guardians.head returns the objects with is_head set true
  scope :contacts, -> {where(is_head: false)} #guardians.contacts returns the objects with is_head set false

  pg_search_scope :search_for, :against => [:first_name, :last_name]

#  validates :first_name, presence: true
#  validates :last_name, presence: true
  validates :first_name, :last_name, presence: true
  
  VALID_EMAIL_REGEX = /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },
            unless: Proc.new { |a| a.is_head == nil }

  #TODO: we will need to make sure this is a valid phone number
  # validates :phone, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end
end
