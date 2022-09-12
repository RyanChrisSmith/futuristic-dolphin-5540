require 'rails_helper'

RSpec.describe Ride, type: :model do
  describe 'relationships' do
    it { should belong_to(:amusement_park) }
    it { should have_many :ride_mechanics}
    it { should have_many(:mechanics).through(:ride_mechanics)}
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_numericality_of :thrill_rating}
    it { should validate_inclusion_of(:open).in_array([true, false])}
  end

  describe 'class methods' do
    it '#open_rides' do
      six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
      hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
      jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

      expect(Ride.open_rides).to eq([hurler,scrambler,jaws])
    end
  end
end