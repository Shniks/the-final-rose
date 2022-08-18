require 'rails_helper'

RSpec.describe 'When I visit an outings show page' do
  describe 'I see the outings name, location, date, total count of contestants' do
    it 'and I see list of all the names of contestants on this outing' do

      bach = Bachelorette.create!(name: 'Amy Winehouse', season_number: 10, description: 'Wildest Season Ever!')
      bach_2 = Bachelorette.create!(name: 'Amy Schumer', season_number: 12, description: 'Most Boring Season!')

      con_1 = bach.contestants.create!(name: 'Pete Buttigieg', age: 28, hometown: 'Los Angeles, CA')
      con_2 = bach.contestants.create!(name: 'Adam Sandler', age: 25, hometown: 'St George, UT')
      con_3 = bach.contestants.create!(name: 'Mike Tyson', age: 29, hometown: 'Las Vegas, NV')
      con_4 = bach_2.contestants.create!(name: 'Chris Pratt', age: 23, hometown: 'Irving, TX')
      con_5 = bach_2.contestants.create!(name: 'Trevor Noah', age: 35, hometown: 'Denver, CO')

      outing_1 = Outing.create!(name: 'Kickball', location: 'Las Vegas', date: '08/10/2022')
      outing_2 = Outing.create!(name: 'Hot Springs', location: 'Paradise', date: '08/12/2022')
      outing_3 = Outing.create!(name: 'Helicpoter Ride', location: 'Las Vegas', date: '08/14/2022')
      outing_4 = Outing.create!(name: 'Hiking', location: 'Zion', date: '08/15/2022')

      con_1.outings << outing_1
      con_1.outings << outing_3
      con_1.outings << outing_4
      con_2.outings << outing_3
      con_2.outings << outing_4
      con_3.outings << outing_1
      con_3.outings << outing_2
      con_3.outings << outing_4
      con_4.outings << outing_2
      con_4.outings << outing_3
      con_4.outings << outing_4

      visit "/outings/#{outing_3.id}"

      expect(page).to have_content(outing_3.name)
      expect(page).to have_content(outing_3.location)
      expect(page).to have_content(outing_3.date)
      expect(page).to have_content("Count of Contestants: #{outing_3.contestants.count}")
      expect(page).to have_content("Contestants: #{con_1.name} #{con_2.name} #{con_4.name}")

      visit "/outings/#{outing_4.id}"

      expect(page).to have_content(outing_4.name)
      expect(page).to have_content(outing_4.location)
      expect(page).to have_content(outing_4.date)
      expect(page).to have_content("Count of Contestants: #{outing_4.contestants.count}")
      expect(page).to have_content("Contestants: #{con_1.name} #{con_2.name} #{con_3.name} #{con_4.name}")
    end
  end
end
