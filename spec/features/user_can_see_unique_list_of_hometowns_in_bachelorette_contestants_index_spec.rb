require 'rails_helper'

RSpec.describe 'When I visit a bachelorette contestants index page' do
  it 'I see the unique list of all hometowns' do

    bach = Bachelorette.create!(name: 'Amy Winehouse', season_number: 10, description: 'Wildest Season Ever!')
    bach_2 = Bachelorette.create!(name: 'Amy Schumer', season_number: 12, description: 'Most Boring Season!')

    con_1 = bach.contestants.create!(name: 'Pete Buttigieg', age: 28, hometown: 'Los Angeles, CA')
    con_2 = bach.contestants.create!(name: 'Adam Sandler', age: 25, hometown: 'St George, UT')
    con_3 = bach.contestants.create!(name: 'Mike Tyson', age: 29, hometown: 'Los Angeles, CA')
    con_4 = bach_2.contestants.create!(name: 'Chris Pratt', age: 23, hometown: 'Denver, CO')
    con_5 = bach_2.contestants.create!(name: 'Trevor Noah', age: 35, hometown: 'Denver, CO')

    visit "/bachelorettes/#{bach.id}/contestants"

    expect(page).to have_content("These Contestants are from these hometowns: #{con_1.hometown}, #{con_2.hometown}")

    visit "/bachelorettes/#{bach_2.id}/contestants"

    expect(page).to have_content("These Contestants are from these hometowns: #{con_4.hometown}")
  end
end
