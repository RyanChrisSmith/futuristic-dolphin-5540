require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it {should have_many :ride_mechanics}
    it {should have_many(:rides).through(:ride_mechanics)}
  end

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_numericality_of :years_experience}
  end

  describe 'class methods' do
    ryan = Mechanic.create!(name: "Ryan", years_experience: 10)
    katy = Mechanic.create!(name: "Katy", years_experience: 5)
    kyle = Mechanic.create!(name: "Kyle", years_experience: 3)

    it '#avg_years' do
      expect(Mechanic.avg_years).to eq 6
    end
  end
end