require 'rails_helper'

RSpec.describe 'Mechanics show page' do
  describe 'story 2' do
    it 'I see their name, years of experience, and the names of rides they’re working on' do
      ryan = Mechanic.create!(name: "Ryan", years_experience: 12)
      katy = Mechanic.create!(name: "Katy", years_experience: 5)
      kyle = Mechanic.create!(name: "Kyle", years_experience: 3)
      six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
      hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
      jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
      RideMechanic.create!(ride: hurler, mechanic: ryan)
      RideMechanic.create!(ride: scrambler, mechanic: ryan)
      RideMechanic.create!(ride: ferris, mechanic: ryan)
      RideMechanic.create!(ride: jaws, mechanic: ryan)
      RideMechanic.create!(ride: hurler, mechanic: katy)
      RideMechanic.create!(ride: scrambler, mechanic: katy)
      RideMechanic.create!(ride: ferris, mechanic: katy)
      RideMechanic.create!(ride: ferris, mechanic: kyle)
      RideMechanic.create!(ride: scrambler, mechanic: kyle)

      visit "/mechanics/#{ryan.id}"

      expect(page).to have_content("Ryan")
      expect(page).to have_content("Years of Experience : 12")
      expect(page).to have_content("Rides working on:")
      expect(page).to have_content("The Hurler")
      expect(page).to have_content("The Scrambler")
      expect(page).to have_content("Jaws")
    end

    it 'And I only see rides that are open' do
      ryan = Mechanic.create!(name: "Ryan", years_experience: 12)
      katy = Mechanic.create!(name: "Katy", years_experience: 5)
      kyle = Mechanic.create!(name: "Kyle", years_experience: 3)
      six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
      universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)
      hurler = six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
      scrambler = six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
      ferris = six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)
      jaws = universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)
      RideMechanic.create!(ride: hurler, mechanic: ryan)
      RideMechanic.create!(ride: scrambler, mechanic: ryan)
      RideMechanic.create!(ride: ferris, mechanic: ryan)
      RideMechanic.create!(ride: jaws, mechanic: ryan)
      RideMechanic.create!(ride: hurler, mechanic: katy)
      RideMechanic.create!(ride: scrambler, mechanic: katy)
      RideMechanic.create!(ride: ferris, mechanic: katy)
      RideMechanic.create!(ride: ferris, mechanic: kyle)
      RideMechanic.create!(ride: scrambler, mechanic: kyle)

      visit "/mechanics/#{katy.id}"

      expect(page).to have_content("The Scrambler")
      expect(page).to_not have_content("Ferris Wheel")
    end

    it 'And the rides are listed by thrill rating in descending order (most thrills first)'

  end
end