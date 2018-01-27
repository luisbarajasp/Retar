class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  self.primary_key = :username

  ## Paperclip
  has_attached_file :avatar, styles: { large: "500x500>", medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"

  ## Validations
  validates :username, presence: :true, uniqueness: { case_sensitive: false }
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, :multiline => true
  validates_attachment_content_type :avatar, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  # ## Relations
  has_many :authentication_tokens, dependent: :destroy, foreign_key: 'user_username'
  has_many :done_retos, class_name: 'Reto', foreign_key: 'retador_username'
  has_many :judging_retos, class_name: 'Reto', foreign_key: 'judge_username'
  has_many :being_retados, class_name: 'Retado', foreign_key: 'user_username'
  has_many :friendships, dependent: :destroy, foreign_key: 'user_username'
  has_many :inverse_friendships, class_name: "Friendship", foreign_key: "friend_username", dependent: :destroy
  
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
  def is_friend_with?(friend)
    Friendship.where(user: self).where(friend: friend).exists?
  end

  ## Retos
  def unanswered_retos
    Reto.joins(:retados).where('retados.status = ? AND retados.user_username = ?', 0, self.username)
  end
  def accepted_retos
    Reto.joins(:retados).where('retados.status = ? AND retados.user_username = ?', 1, self.username)
    # Reto.joins(being_retados)
  end
  def live_retos
    (done_retos.where(status: "inprogress") + accepted_retos.where(status: "inprogress")).sort{|a,b| a.began_at <=> b.began_at }
  end
  def upcoming_retos
    (done_retos.where(status: "scheduled") + accepted_retos.where(status: "scheduled")).sort{|a,b| a.scheduled_at <=> b.scheduled_at }
  end
  def finished_retos
    (done_retos.where(status: "finished") + accepted_retos.where(status: "finished")).sort{|a,b| a.finished_at <=> b.finished_at }
  end

end
