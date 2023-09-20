class GntUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # has_one_attached :profile_picture, dependent: :destroy
  
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
end
