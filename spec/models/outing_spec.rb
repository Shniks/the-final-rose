require 'rails_helper'

RSpec.describe Outing, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :date }
  end

  describe 'relationships' do
    it { should have_many :contestant_outings }
    it { should have_many(:contestants).through(:contestant_outings) }
  end

  it 'instance methods' do
    bach = Bachelorette.create!(name: 'Amy Winehouse', season_number: 10, description: 'Wildest Season Ever!')

    con_1 = bach.contestants.create!(name: 'Pete Buttigieg', age: 28, hometown: 'Los Angeles, CA')
    con_2 = bach.contestants.create!(name: 'Adam Sandler', age: 25, hometown: 'St George, UT')
    con_3 = bach.contestants.create!(name: 'Mike Tyson', age: 29, hometown: 'Las Vegas, NV')

    outing_1 = Outing.create!(name: 'Kickball', location: 'Las Vegas', date: '08/10/2022')

    con_1.outings << outing_1
    con_3.outings << outing_1

    expect(outing_1.contestant_count).to eq(2)
  end
end
