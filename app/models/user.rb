class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 

  extend FriendlyId
  friendly_id :name, use: :slugged

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :about, :picture, :location, :facebook, :twitter, :website, :provider, :uid, :ban, :slug, :provider, :image, :first_name, :last_name, :link

  devise :omniauthable  

  # Carrierwave avatar uploading
  mount_uploader :picture, AvatarUploader


  has_many :poems
  has_many :comments

  # profile_photo("small") #=> http://url?type=small
  # profile_photo("square") #=> http://url?type=square
  # profile_photo #=> http://url?type=large
  # profile_photo("normal")  #=> http://url?type=normal

  def profile_photo(type="large")
    self.image.split("=")[0] << "=#{type}"
  end
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      unless user
      user = User.create(name:auth.extra.raw_info.name,
                    provider:auth.provider,
                    uid:auth.uid,
                    email:auth.info.email,
                    facebook:auth.extra.raw_info.link,
                    image:auth.info.image,
                    first_name:auth.info.first_name,
                    last_name:auth.info.last_name,
                    password:Devise.friendly_token[0,20]
                )
      end
      user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
      user.email = data["email"] if user.email.blank?
      end
    end
  end

  def valid_password?(password)  
  !provider.nil? || super(password)  
  end
  
  acts_as_voter

end
