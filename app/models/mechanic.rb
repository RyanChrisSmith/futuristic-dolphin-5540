class Mechanic < ApplicationRecord
  has_many :ride_mechanics
  has_many :rides, through: :ride_mechanics

  validates_presence_of :name
  validates_numericality_of :years_experience

  def self.avg_years
    average(:years_experience)
  end
end