class Family < ApplicationRecord
  has_many :guardians, as: :relationship, dependent: :destroy
  has_one :head, -> { where relationship_type: :head }, class_name: "Guardian", as: :relationship, dependent: :destroy
  has_many :kids
end
