require 'rails_helper'

RSpec.describe Bachelorette, type: :model do
  describe 'relationships' do
    it {should have_many :contestants}
  end

  describe 'validations' do
    it { should validate_presence_of  :name }
    it { should validate_presence_of  :season_number }
    it { should validate_presence_of  :description }
  end

  describe 'instance methods' do
    it 'can find average age' do
      bach = Bachelorette.create!(name: 'Amy Winehouse', season_number: 10, description: 'Wildest Season Ever!')

      con_1 = bach.contestants.create!(name: 'Pete Buttigieg', age: 28, hometown: 'Los Angeles, CA')
      con_2 = bach.contestants.create!(name: 'Adam Sandler', age: 25, hometown: 'St George, UT')
      con_3 = bach.contestants.create!(name: 'Mike Tyson', age: 29, hometown: 'Las Vegas, NV')

      expect(bach.average_age.round(1)).to eq(27.3)
    end

    it 'can find find unique hometowns' do
      bach = Bachelorette.create!(name: 'Amy Winehouse', season_number: 10, description: 'Wildest Season Ever!')

      con_1 = bach.contestants.create!(name: 'Pete Buttigieg', age: 28, hometown: 'Los Angeles, CA')
      con_2 = bach.contestants.create!(name: 'Adam Sandler', age: 25, hometown: 'St George, UT')
      con_3 = bach.contestants.create!(name: 'Mike Tyson', age: 29, hometown: 'Los Angeles, CA')

      expect(bach.unique_hometowns).to eq("#{con_1.hometown}, #{con_2.hometown}")
    end
  end
end
