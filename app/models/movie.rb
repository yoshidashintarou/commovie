class Movie < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :body, presence: true

  #いいね機能
  def favorited?(user)
   self.favorites.where(user_id: user.id).exists?
  end

  #検索機能
  def self.looks(search, word)
    if search == "perfect_match"
      @movie = Movie.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @movie = Movie.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @movie = Movie.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @movie = Movie.where("title LIKE?","%#{word}%")
    else
      @movie = Movie.all
    end
  end

end