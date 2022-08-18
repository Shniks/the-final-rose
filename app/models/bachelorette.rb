class Bachelorette <ApplicationRecord
  validates_presence_of :name, :season_number, :description
  has_many :contestants

  def average_age
    contestants.average(:age)
  end 

end
