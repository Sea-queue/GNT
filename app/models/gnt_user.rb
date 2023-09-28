class GntUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # dependent: destroy means delete the avatar if delete the user
  has_one_attached :avatar, dependent: :destroy
  has_one_attached :RN_License
  validates :avatar, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'is not an image' } 
  after_commit :add_default_avatar, on: %i[create update]
  
  # enum role: [:candidate, :employer, :recruiter, :admin]
  # after_initialize :set_default_role, :if => :new_record?
  # def set_default_role
  #   self.role ||= :candidate
  # end

  def admin?
    role == "admin"
  end

  def candidate?
    role == 'candidate'
  end

  def employer?
    role == 'employer'
  end
  # validates :email, presence: true, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}


  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize_to_limit: [50, 50]).processed
    end
  end


  private

  def add_default_avatar
    return if avatar.attached?
    
      avatar.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'gnt_logo.png')),
        filename: 'gnt_logo.png',
        content_type: 'image/png'
      )
  end 
end
