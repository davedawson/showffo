class Competition < ActiveRecord::Base
  attr_accessible :challenger_id, :challenged_id
  
  belongs_to :challenger, class_name: "Challenge"
  belongs_to :challenged, class_name: "Challenge"

  validates :challenger_id, presence: true
  validates :challenged_id, presence: true

end
