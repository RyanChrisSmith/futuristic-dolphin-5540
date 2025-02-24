class AmusementPark < ApplicationRecord
  has_many :rides

  validates_presence_of :name
  validates_numericality_of :admission_cost
end