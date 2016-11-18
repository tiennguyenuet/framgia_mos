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
      posts = Post.accepted.where("year(created_at) = #{Time.now.year}")
        .order(:created_at).group_by {|post| post.created_at.month}
      posts_per_month = posts.map do |post|
        {name: Date::MONTHNAMES[post.first], y: post.last.size}
      end
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
