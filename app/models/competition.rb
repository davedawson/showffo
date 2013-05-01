class Competition < ActiveRecord::Base
  attr_accessible :competitor_id, :challenge_id
  # validates_uniqueness_of :challenge_id, :scope => :competitor_id
  # belongs_to :users
  # belongs_to :challenges
  belongs_to :competitor, class_name: "Competitor"
  # belongs_to :challenge_id, class_name: "Challenge"
  

  validates :competitor_id, presence: true
  validates :challenge_id, presence: true

end
