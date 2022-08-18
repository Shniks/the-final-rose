class ContestantOutings < ApplicationRecord
  belongs_to  :contestant
  belongs_to  :outing 

end
