class Family < ApplicationRecord
  has_many :guardians, dependent: :destroy
  has_many :kids
  accepts_nested_attributes_for :kids, allow_destroy: true, reject_if: :all_blank
  accepts_nested_attributes_for :guardians, allow_destroy: true, reject_if: :all_blank

  #  validates :address, :city, :zipcode 
  #  validates :state 
end
