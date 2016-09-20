class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy

  enum status: [:waiting, :accepted, :reject]
  enum post_type: [:normal, :audio]

  mount_uploader :image, PostPictureUploader
  mount_uploader :audio, PostMusicUploader

  validates :title, presence: true
  validates :description, presence: true
  validates :content, presence: true
  validates :image, presence: true
  validates :post_type, presence: true
  validate :validate_audio, on: :create

  private
  def validate_audio
    if self.post_type == Setting.admin.posts.audio_post
      if self.audio.nil?
        self.errors.add :create,
          I18n.t(".error_audio")
      end
    end
  end
end
