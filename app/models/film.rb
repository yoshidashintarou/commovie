class Film < ApplicationRecord
  belongs_to :user
  has_many :film_favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true


  #いいね機能
  def filmfavorited?(user)
   FilmFavorite.where(user_id: user.id, film_id: self.id).exists?
  end

  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @film = Film.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @film = Film.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @film = Film.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @film = Film.where("name LIKE?","%#{word}%")
    else
      @film = Film.all
    end
  end
end