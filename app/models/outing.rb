class Outing < ApplicationRecord
  validates_presence_of :name, :location, :date


end
