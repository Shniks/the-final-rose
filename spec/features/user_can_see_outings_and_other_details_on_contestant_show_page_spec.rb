require 'rails_helper'

RSpec.describe 'When I visit a contestant show page' do
  describe 'I see the contestant details, season details and list of outings' do
    it 'and when I click on an outing name, I see the outing show page' do

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

      ContestantOuting.create!(contestant_id: con_1.id, outing_id: outing_1.id)
      ContestantOuting.create!(contestant_id: con_1.id, outing_id: outing_3.id)
      ContestantOuting.create!(contestant_id: con_1.id, outing_id: outing_4.id)
      ContestantOuting.create!(contestant_id: con_2.id, outing_id: outing_3.id)
      ContestantOuting.create!(contestant_id: con_2.id, outing_id: outing_4.id)
      ContestantOuting.create!(contestant_id: con_3.id, outing_id: outing_1.id)
      ContestantOuting.create!(contestant_id: con_3.id, outing_id: outing_2.id)
      ContestantOuting.create!(contestant_id: con_3.id, outing_id: outing_4.id)
      ContestantOuting.create!(contestant_id: con_4.id, outing_id: outing_2.id)
      ContestantOuting.create!(contestant_id: con_4.id, outing_id: outing_3.id)
      ContestantOuting.create!(contestant_id: con_4.id, outing_id: outing_4.id)

      visit "/contestants/#{con_3.id}"

      expect(page).to have_content(con_3.name)
      expect(page).to have_content(bach.season_number)
      expect(page).to have_content(bach.description)
      expect(page).to have_content(outing_1.name)
      expect(page).to have_content(outing_2.name)
      expect(page).to have_content(outing_4.name)

      click_on outing_2.name

      expect(current_path).to eq("/outings/#{outing_2.id}")

      visit "/contestants/#{con_4.id}"

      expect(page).to have_content(con_4.name)
      expect(page).to have_content(bach_2.season_number)
      expect(page).to have_content(bach_2.description)
      expect(page).to have_content(outing_2.name)
      expect(page).to have_content(outing_3.name)
      expect(page).to have_content(outing_4.name)

      click_on outing_4.name

      expect(current_path).to eq("/outings/#{outing_4.id}")
    end
  end
end
