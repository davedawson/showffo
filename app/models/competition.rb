class Competition < ActiveRecord::Base
  attr_accessible :competitor_id, :challenge_id
  
  belongs_to :competitor, class_name: "Competitor"
  belongs_to :challenge, class_name: "Challenge"

  validates :competitor_id, presence: true
  validates :challenge_id, presence: true


end
