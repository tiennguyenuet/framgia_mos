class Advertisment < ActiveRecord::Base
  validates :description, presence: true
  validates :url, presence: true
  mount_uploader :image, AdvertismentImageUploader
end
