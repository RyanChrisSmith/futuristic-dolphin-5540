class Ride < ApplicationRecord
  belongs_to :amusement_park
  has_many :ride_mechanics
  has_many :mechanics, through: :ride_mechanics

  validates_presence_of :name
  validates_numericality_of :thrill_rating
  validates_inclusion_of :open, in: [true, false]

  def self.open_rides
    where("open = true").order(thrill_rating: :desc)
  end
end