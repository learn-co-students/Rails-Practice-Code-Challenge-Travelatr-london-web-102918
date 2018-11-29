class Destination < ApplicationRecord
  has_many :posts
  has_many :bloggers, through: :posts

  def latest_5_posts
    self.posts.order(id: :desc).limit(5)
  end

  def average_age
    self.bloggers.average(:age).to_i
  end

  def featured_post
    if self.posts.count != 0
      self.posts.sort_by {|post| post.likes}.first.title
    else
      "Destination has no Posts yet!"
    end
  end
end
