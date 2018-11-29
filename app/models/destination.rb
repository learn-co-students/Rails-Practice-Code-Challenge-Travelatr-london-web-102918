class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def most_recent
    self.posts.last(5)
  end

  def featured_post
    "This is my featured post"
  end

  def average_blogger_age
    15
  end

end
