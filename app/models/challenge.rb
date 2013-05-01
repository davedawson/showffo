class Challenge < ActiveRecord::Base
  attr_accessible :description, :task
  belongs_to :user
  # validates :user_id, presence: true
  default_scope order: 'challenges.created_at DESC'
  has_many :updates, dependent: :destroy
  has_many :competitions, dependent: :destroy
  has_many :competitors, through: :competitions, source: :competitor
  has_many :reverse_relationships, foreign_key: "competitor_id",
                                   class_name:  "Competitor",
                                   dependent:   :destroy
end
