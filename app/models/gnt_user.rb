class GntUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # dependent: destroy means delete the avatar if delete the user
  has_one_attached :avatar, dependent: :destroy
  has_one_attached :rn_license_upload
  has_one_attached :resume
  has_one_attached :diploma
  has_one_attached :diploma_translate
  has_many_attached :transcript
  has_many_attached :transcript_translate
  has_one_attached :cgfns_upload
  has_one_attached :english_proficiency_result
  has_one_attached :nclex_rn_upload
  has_one_attached :birth_certificate
  has_one_attached :birth_certificate_translate
  has_one_attached :passport
  has_many_attached :visa
  has_one_attached :entry_stamp
  validates :avatar, content_type: { in: ['image/png', 'image/jpg', 'image/jpeg'], message: 'is not an image' } 
  after_commit :add_default_avatar, on: %i[create update]
  

  def admin?
    role == "admin"
  end

  def candidate?
    role == 'candidate'
  end

  def employer?
    role == 'employer'
  end
  

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize_to_limit: [50, 50]).processed
    end
  end


  private

  def add_default_avatar
    return if avatar.attached?
    
      avatar.attach(
        io: File.open(Rails.root.join('app', 'assets', 'images', 'profile_2.png')),
        filename: 'profile_2.png',
        content_type: 'image/png/svg'
      )
  end 
end
