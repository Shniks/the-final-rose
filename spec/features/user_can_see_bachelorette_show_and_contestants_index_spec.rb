require 'rails_helper'

RSpec.describe 'When I visit the bachelorette show page' do
  describe 'I see details for that season' do
    describe 'and when I click on link to see its contestants' do
      it 'I see a contestants index for that bachelorette' do

        bach = Bachelorette.create!(name: 'Amy Winehouse', season_number: 10, description: 'Wildest Season Ever!')
        bach_2 = Bachelorette.create!(name: 'Amy Schumer', season_number: 10, description: 'Most Boring Season!')

        con_1 = bach.contestants.create!(name: 'Pete Buttigieg', age: 28, hometown: 'Los Angeles, CA')
        con_2 = bach.contestants.create!(name: 'Adam Sandler', age: 25, hometown: 'St George, UT')
        con_3 = bach.contestants.create!(name: 'Mike Tyson', age: 29, hometown: 'Las Vegas, NV')
        con_4 = bach_2.contestants.create!(name: 'Chris Pratt', age: 23, hometown: 'Irving, TX')
        con_5 = bach_2.contestants.create!(name: 'Trevor Noah', age: 35, hometown: 'Denver, CO')

        visit "/bachelorettes/#{bach.id}"

        expect(page).to have_content(bach.name)
        expect(page).to have_content(bach.season_number)
        expect(page).to have_content(bach.description)
        expect(page).to have_link('Contestants')

        click_on 'Contestants'

        expect(current_path).to eq("/bachelorettes/#{bach.id}/contestants")
        expect(page).to have_content(con_1.name)
        expect(page).to have_content(con_1.age)
        expect(page).to have_content(con_1.hometown)
        expect(page).to have_content(con_2.name)
        expect(page).to have_content(con_2.age)
        expect(page).to have_content(con_2.hometown)
        expect(page).to have_content(con_3.name)
        expect(page).to have_content(con_3.age)
        expect(page).to have_content(con_3.hometown)
        expect(page).to_not have_content(con_4.name)
        expect(page).to_not have_content(con_4.age)
        expect(page).to_not have_content(con_5.hometown)
      end
    end
  end
end
