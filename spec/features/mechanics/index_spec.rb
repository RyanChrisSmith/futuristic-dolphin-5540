require 'rails_helper'

RSpec.describe 'Mechanics index page' do 
  describe 'story 1' do
    it 'displays All Mechanics at the top of the page' do
      ryan = Mechanic.create!(name: "Ryan", years_experience: 12)
      katy = Mechanic.create!(name: "Katy", years_experience: 5)
      kyle = Mechanic.create!(name: "Kyle", years_experience: 3)

      visit "/mechanics"

      expect(page).to have_content("All Mechanics")
    end

    it 'lists all the mechanics, their names, and years of experience' do
      ryan = Mechanic.create!(name: "Ryan", years_experience: 12)
      katy = Mechanic.create!(name: "Katy", years_experience: 5)
      kyle = Mechanic.create!(name: "Kyle", years_experience: 3)

      visit "/mechanics"

      within("#mechanic-#{ryan.id}") do
        expect(page).to have_content("Ryan")
        expect(page).to have_content("Years of Experience : 12")
        expect(page).to_not have_content("Years of Experience : 5")
      end

      within("#mechanic-#{katy.id}") do
        expect(page).to have_content("Katy")
        expect(page).to_not have_content("Ryan")
        expect(page).to have_content("Years of Experience : 5")
      end
      within("#mechanic-#{kyle.id}") do
        expect(page).to have_content("Kyle")
        expect(page).to have_content("Years of Experience : 3")
      end
    end

    it 'displays the average years of experience of all mechanics' do
      ryan = Mechanic.create!(name: "Ryan", years_experience: 12)
      katy = Mechanic.create!(name: "Katy", years_experience: 5)
      kyle = Mechanic.create!(name: "Kyle", years_experience: 3)


      visit "/mechanics"

      expect()
    end
  end
  
end