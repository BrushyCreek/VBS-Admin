class Family < ApplicationRecord
  has_many :guardians, dependent: :destroy
  has_many :kids

  def head
    #find guardian for this family that has the isHead boolean true
  end

  def contacts
    #find the guardians for this family that ahve the isHead boolean false
  end
end
