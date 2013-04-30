class Challenge < ActiveRecord::Base
  attr_accessible :description, :task
  belongs_to :user
  validates :user_id, presence: true
  has_many :updates, dependent: :destroy
  default_scope order: 'challenges.created_at DESC'

  has_many :competitors, foreign_key: "competitor_id", dependent: :destroy
  has_many :challengers, through: :competitors, source: :challenger
  has_many :reverse_relationships, foreign_key: "competitor_id",
                                   class_name:  "Competitor",
                                   dependent:   :destroy
end
