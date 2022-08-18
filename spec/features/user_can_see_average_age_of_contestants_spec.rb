require 'rails_helper'

RSpec.describe 'When I visit a bachelorette show page' do
  it 'I see the average age of all the contestants' do

    bach = Bachelorette.create!(name: 'Amy Winehouse', season_number: 10, description: 'Wildest Season Ever!')
    bach_2 = Bachelorette.create!(name: 'Amy Schumer', season_number: 12, description: 'Most Boring Season!')

    con_1 = bach.contestants.create!(name: 'Pete Buttigieg', age: 28, hometown: 'Los Angeles, CA')
    con_2 = bach.contestants.create!(name: 'Adam Sandler', age: 25, hometown: 'St George, UT')
    con_3 = bach.contestants.create!(name: 'Mike Tyson', age: 29, hometown: 'Las Vegas, NV')
    con_4 = bach_2.contestants.create!(name: 'Chris Pratt', age: 23, hometown: 'Irving, TX')
    con_5 = bach_2.contestants.create!(name: 'Trevor Noah', age: 35, hometown: 'Denver, CO')

    average_1 = ((con_1.age + con_2.age + con_3.age) / 3.0).round(1)
    average_2 = ((con_4.age + con_5.age) / 2.0).round(1)

    visit "/bachelorettes/#{bach.id}"

    expect(page).to have_content("Average age of contestants: #{average_1}")

    visit "/bachelorettes/#{bach_2.id}"

    expect(page).to have_content("Average age of contestants: #{average_2}")
  end
end
