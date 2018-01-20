class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Mongoid::Paperclip

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  ## Database authenticatable
  field :_id,                type: String, default: ->{ username }
  field :name,               type: String
  field :username,           type: String
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Confirmable
  field :confirmation_token,   type: String
  field :confirmed_at,         type: Time
  field :confirmation_sent_at, type: Time
  field :unconfirmed_email,    type: String # Only if using reconfirmable

  ## Omniauthable (custom)
  field :fb_token, type: String

  ## Lockable
  # field :failed_attempts, type: Integer, default: 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    type: String # Only if unlock strategy is :email or :both
  # field :locked_at,       type: Time


  ## Paperclip
  has_mongoid_attached_file :avatar,
    :path           => ':attachment/:id/:style.:extension',
    # :storage        => :s3,
    # :url            => ':s3_alias_url',
    # :s3_host_alias  => 'something.cloudfront.net',
    # :s3_credentials => File.join(Rails.root, 'config', 's3.yml'),
    :styles => {
      :original => ['1920x1680>', :jpg],
      :small    => ['100x100#',   :jpg],
      :medium   => ['250x250',    :jpg],
      :large    => ['500x500>',   :jpg]
    }
    # :convert_options => { :all => '-background white -flatten +matte' }

  ## Validations
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  ## Relations
  has_many :authentication_tokens, dependent: :destroy
  has_many :done_retos, class_name: 'Reto', foreign_key: 'retador_id'
  has_many :judging_retos, class_name: 'Reto', foreign_key: 'judge_id'
  has_many :answered_retos, class_name: 'Retado', foreign_key: 'user_id'
  has_many :friendships, dependent: :destroy
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_id", dependent: :destroy
  
  def picture_from_url(url)
    self.avatar = URI.parse(url)
  end

  def self.find_by_login(login)
    where(:username => login).first || where(:email => login).first
  end

  ## Friendships
  def all_friendships
    all_friendships = []
    all_friendships << friendships
    all_friendships << inverse_friendships
    all_friendships.flatten(1)
  end
  def friends
    friends = []
    friends << User.in(id: friendships.where(status: 1).pluck(:friend_id))
    friends << User.in(id: inverse_friendships.where(status: 1).pluck(:user_id))
    friends.flatten(1)
  end
  def pending_friendships
    friendships.where(status: 0)
  end
end
