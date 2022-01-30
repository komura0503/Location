class Post < ApplicationRecord
  belongs_to :user
  has_many :maps, dependent: :destroy
  has_many :tag_maps, dependent: :destroy
  has_many :tags, through: :tag_maps
  has_many :favorites, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  # いいね機能
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  # キーワード検索機能
  def self.search(search)
    if search
      Post.where(["title LIKE ?", "%#{search}%"])
    else
      Post.all
    end
  end

  # タグ検索機能
  def save_tag(sent_tags)
    current_tags = self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags = current_tags - sent_tags
    new_tags = sent_tags - current_tags

    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name: old)
    end

    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(tag_name: new)
      self.tags << new_post_tag
    end
  end

  attachment :image

  validates :title, presence: true
  validates :image, presence: true
  validates :url, presence: true
  validates :address, presence: true
end
