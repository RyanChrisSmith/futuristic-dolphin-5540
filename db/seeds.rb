# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AmusementPark.destroy_all
Ride.destroy_all
Mechanic.destroy_all

@six_flags = AmusementPark.create!(name: 'Six Flags', admission_cost: 75)
@universal = AmusementPark.create!(name: 'Universal Studios', admission_cost: 80)

@hurler = @six_flags.rides.create!(name: 'The Hurler', thrill_rating: 7, open: true)
@scrambler = @six_flags.rides.create!(name: 'The Scrambler', thrill_rating: 4, open: true)
@ferris = @six_flags.rides.create!(name: 'Ferris Wheel', thrill_rating: 7, open: false)

@jaws = @universal.rides.create!(name: 'Jaws', thrill_rating: 5, open: true)

@ryan = Mechanic.create!(name: "Ryan", years_experience: 12)
@katy = Mechanic.create!(name: "Katy", years_experience: 5)
@kyle = Mechanic.create!(name: "Kyle", years_experience: 3)

RideMechanic.create!(ride: @hurler, mechanic: @ryan)
RideMechanic.create!(ride: @scrambler, mechanic: @ryan)
RideMechanic.create!(ride: @ferris, mechanic: @ryan)
RideMechanic.create!(ride: @jaws, mechanic: @ryan)
RideMechanic.create!(ride: @hurler, mechanic: @katy)
RideMechanic.create!(ride: @scrambler, mechanic: @katy)
RideMechanic.create!(ride: @ferris, mechanic: @katy)
RideMechanic.create!(ride: @ferris, mechanic: @kyle)
RideMechanic.create!(ride: @scrambler, mechanic: @kyle)