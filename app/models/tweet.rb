class Tweet < ApplicationRecord
  belongs_to :user
  has_many :likes

  scope :tweets_for_me, -> (user) { where(user_id: user.friends.pluck(:friend_id).push(user.id)) }

  def add_like(user)
    Like.create(user: user, tweet: self)

  end

  def add_hashtags
    new_array = []
    self.content.split(" ").each do |word|
      if word.start_with?("#")
        word_parsed = word.sub '#','%23'
        word = link_to(word, Rails.application.routes.url_helpers.root_path+"?search="+word_parsed )
      end
      new_array.push(word)
    end
    self.content = new_array.join(" ")
  end


  def remove_like(user)
    Like.where(user: user, tweet: self).first.destroy
    
  end

  def original_tweet
    Tweet.find(self.origin_tweet)
    
  end
end
