class Blogger < ApplicationRecord
  has_many :posts
  has_many :destinations, through: :posts

  validates :name, presence: true
  validates :name, uniqueness: true
  validates :age, numericality: { only_integer: true }
  validates :age, numericality: { greater_than: 0 }
  validates :bio, presence: true
  validates :bio, length: { minimum: 30 }

  def featured_post
    "This is my featured post"
  end

  def most_written_about
    destinations = self.destinations.map {|d| d.name}
    # destinations.max_by {|d| d.count}
  end

end
