class Challenge < ActiveRecord::Base
  attr_accessible :description, :task
  belongs_to :user
  validates :user_id, presence: true
  has_many :updates, dependent: :destroy
  default_scope order: 'challenges.created_at DESC'

  has_many :competitors, foreign_key: "challenger_id", dependent: :destroy
  has_many :challengers, through: :competitors, source: :challenger
  has_many :reverse_relationships, foreign_key: "challenger_id",
                                   class_name:  "Competition",
                                   dependent:   :destroy

  def uncompete!(other_user)
    competitors.find_by_challenger_id(other_user.id).destroy
  end

  def competing?(other_user)
    competitors.find_by_challenger_id(other_user.id)
  end

  def compete!(other_user)
    competitors.create!(challenger_id: current_user.id)
  end
end
