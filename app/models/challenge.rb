class Challenge < ActiveRecord::Base
  attr_accessible :description, :task
  belongs_to :user
  validates :user_id, presence: true

  default_scope order: 'challenges.created_at DESC'
end
