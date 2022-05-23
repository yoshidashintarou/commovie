class Film < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy

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