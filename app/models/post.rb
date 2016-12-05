class Post < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable

  enum status: [:admin_create, :waiting, :accepted, :rejected]
  enum post_type: [:normal, :audio]

  mount_uploader :image, PostPictureUploader
  mount_uploader :audio, PostMusicUploader

  validates :title, presence: true
  validates :category_id, presence: true
  validates :description, presence: true
  validates :content, presence: true
  validates :image, presence: true
  validates :post_type, presence: true
  validate :validate_audio, on: :create

  class << self
    def each_month year
      posts_per_month = (1..12).map do |month|
        {name: Date::MONTHNAMES[month], y: Post.posts_of_month(month, year)}
      end
    end

    def posts_of_month month, year
      Post.accepted.where("year(created_at) = #{year} and month(created_at) = #{month}").size
    end
  end

  def label_status
    case self.status
    when "accepted"
      "<label class= 'label label-success'>#{self.status}</label>"
    when "rejected"
      "<label class= 'label label-danger'>#{self.status}</label>"
    when "waiting"
      "<label class= 'label label-info'>#{self.status}</label>"
    end
  end

  private
  def validate_audio
    if self.post_type == Settings.admin.posts.audio_post
      if self.audio.nil?
        self.errors.add :create,
          I18n.t(".error_audio")
      end
    end
  end
end
