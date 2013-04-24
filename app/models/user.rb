class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :name
  validates_presence_of :email
  has_many :challenges, dependent: :destroy
  has_many :updates, dependent: :destroy

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

end