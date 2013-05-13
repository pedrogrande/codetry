class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable 
  devise :omniauthable, :omniauth_providers => [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :about, :picture, :location, :facebook, :twitter, :website, :provider, :uid, :ban, :provider, :image, :first_name, :last_name, :link, :gender

  # Carrierwave avatar uploading
  mount_uploader :picture, AvatarUploader

  has_many :poems
  has_many :comments
  
  def self.find_for_facebook_oauth(auth, signed_in_resource=nil)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      unless user
      user = User.create(name:auth.extra.raw_info.name,
                    provider:auth.provider,
                uid:auth.uid,
                email:auth.info.email,
                 link:auth.extra.raw_info.link,
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
  
end
