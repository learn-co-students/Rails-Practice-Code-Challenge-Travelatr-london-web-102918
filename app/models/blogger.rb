class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts
  validates :name, uniqueness: true
  validates :age, numericality: {:greater_than => 0}
  validates :age, numericality: true
  validates :bio, length: {:minimum => 30}

  def featured_post
    self.posts.sort_by {|post| post.likes}.first
  end
end
