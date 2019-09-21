class Micropost < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 255 }

  has_many :favorites, foreign_key: 'micropost_id'
  has_many :favorite_users, through: :favorites, source: :user 
  
  def favorite(other_user)
    self.favorites.find_or_create_by(user_id: other_user.id)
  end
  
  def unfavorite(other_user)
    favorite = self.favorites.find_by(user_id: other_user.id)
    favorite.destroy if favorite
  end
  
  def favorite?(other_user)
    self.favorite_users.include?(other_user)
  end

end
