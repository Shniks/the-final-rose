class Bachelorette <ApplicationRecord
  validates_presence_of :name, :season_number, :description
  has_many :contestants

end
