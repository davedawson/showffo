class Competition < ActiveRecord::Base
  attr_accessible :competitor_id, :challenge_id
  
  # belongs_to :competitor_id, class_name: "Competition"
  # belongs_to :challenge_id, class_name: "Challenge"

  validates :competitor_id, presence: true
  validates :challenge_id, presence: true

end
