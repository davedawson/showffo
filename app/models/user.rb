class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :name, :followed_id
  validates_presence_of :email
  has_many :challenges, dependent: :destroy
  has_many :updates, dependent: :destroy, :through => :challenges
  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed
  has_many :reverse_relationships, foreign_key: "followed_id",
                                   class_name:  "Relationship",
                                   dependent:   :destroy
  has_many :followers, through: :reverse_relationships, source: :follower
  has_many :competitions, foreign_key: "competitor_id", dependent: :destroy


	def self.new_with_session(params, session)
	  if session["devise.user_attributes"]
	    new(session["devise.user_attributes"], without_protection: true) do |user|
	      user.attributes = params
	      user.valid?
	    end
	  else
	    super
	  end    
	end

	def password_required?
	  super && provider.blank?
	end

	def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_create do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.username = auth.info.nickname
	    user.authtoken = auth.credentials.token
	    user.secrettoken = auth.credentials.secret
	  end
	end

	def update_with_password(params, *options)
	  if encrypted_password.blank?
	    update_attributes(params, *options)
	  else
	    super
	  end
	end

  def fitbit_client
    raise "Account is not linked with a Fitbit account" unless linked?
    return @fitbit_client if @fitbit_client

    @fitbit_client = Fitgem::Client.new(
      :consumer_key => "d4c64a56227a46a7950cf851f516748e",
      :consumer_secret => "405f2b469313493da01215e1ae10e05e",
      :token => current_user.authtoken,
      :secret => current_user.secrettoken
    )
  end

  def grab_data
    @activity = @fitbit_client.activities_on_date(Date.today.to_s)
  end

  def setUser
    user = User.find(params[:id])
  end

  def to_param
    username
  end

  def following?(other_user)
    relationships.find_by_followed_id(other_user.id)
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by_followed_id(other_user.id).destroy
  end

  def competing?(current_user)
    competitions.find_by_competitor_id(current_user.id)
  end

  def uncompete!(current_user)
    competitions.find_by_competitor_id(current_user).destroy
  end


end