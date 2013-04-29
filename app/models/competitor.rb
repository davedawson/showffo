class Competitor < ActiveRecord::Base
  attr_accessible :challenger_id, :challenge_id
  
  belongs_to :competitor, class_name: "Challenger"
  belongs_to :challenge_id, class_name: "Challenge"

  validates :competitor_id, presence: true
  validates :challenge_id, presence: true

end
