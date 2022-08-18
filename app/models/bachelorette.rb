class Bachelorette <ApplicationRecord
  validates_presence_of :name, :season_number, :description
  has_many :contestants

  def average_age
    contestants.average(:age)
  end

  def unique_hometowns
    contestants.pluck(:hometown).uniq.join(", ")
  end

end
