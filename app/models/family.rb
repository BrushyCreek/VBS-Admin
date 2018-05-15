class Family < ApplicationRecord
  
  has_many :guardians, dependent: :destroy
  has_many :kids, dependent: :destroy
  accepts_nested_attributes_for :kids, allow_destroy: true, reject_if: lambda { |attributes| attributes['last_name'].blank? } 
  accepts_nested_attributes_for :guardians, allow_destroy: true, reject_if: :all_blank

  #  validates :address, :city, :zipcode 
  #  validates :state

  def head
    guardians.head
  end

  def contacts
    guardians.contacts
  end
end
