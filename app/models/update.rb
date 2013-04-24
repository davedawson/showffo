class Update < ActiveRecord::Base
  # attr_accessible :challenge_id, :content, :user_id, :data
  belongs_to :user
  belongs_to :challenge
  default_scope order: 'challenges.created_at DESC'
end
