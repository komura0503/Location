class Post < ApplicationRecord
  belongs_to :user
  has_many :maps, dependent: :destroy
  # has_many :posttags, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search)
    if search
      Post.where(["title LIKE ?", "%#{search}%"])
    else
      Post.all
    end
  end

  attachment :image
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
