require 'rails_helper'

RSpec.describe 'When I visit a bachelorette contestants index' do
  describe 'and click on their name' do
    it 'I get taken to the contestant show page' do

      bach = Bachelorette.create!(name: 'Amy Winehouse', season_number: 10, description: 'Wildest Season Ever!')
      bach_2 = Bachelorette.create!(name: 'Amy Schumer', season_number: 10, description: 'Most Boring Season!')

      con_1 = bach.contestants.create!(name: 'Pete Buttigieg', age: 28, hometown: 'Los Angeles, CA')
      con_2 = bach.contestants.create!(name: 'Adam Sandler', age: 25, hometown: 'St George, UT')
      con_3 = bach.contestants.create!(name: 'Mike Tyson', age: 29, hometown: 'Las Vegas, NV')
      con_4 = bach_2.contestants.create!(name: 'Chris Pratt', age: 23, hometown: 'Irving, TX')
      con_5 = bach_2.contestants.create!(name: 'Trevor Noah', age: 35, hometown: 'Denver, CO')

      visit "/bachelorettes/#{bach.id}"
      click_on 'Contestants'
      click_on 'Mike Tyson'

      expect(current_path).to eq("/contestants/#{con_3.id}")
    end
  end
end
