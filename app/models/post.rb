class Post < ApplicationRecord
  belongs_to :user
  has_many :maps, dependent: :destroy
  # has_many :posttags, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.search(keyword)
    where(["title likes? OR body likes?", "%#{keyword}%", "%#{keyword}%"])
  end

  attachment :image
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
