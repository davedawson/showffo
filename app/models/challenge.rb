class Challenge < ActiveRecord::Base
  attr_accessible :description, :task
  belongs_to :user
  validates :user_id, presence: true
  has_many :updates, dependent: :destroy
  default_scope order: 'challenges.created_at DESC'
end
