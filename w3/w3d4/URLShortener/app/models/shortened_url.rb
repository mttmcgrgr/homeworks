class ShortenedUrl < ActiveRecord::Base
  validates :long_url, :short_url, :user_id, presence: true, uniqueness: true

  def self.random_code
    loop do
      random_code = SecureRandom.urlsafe_base64(16)
      return random_code unless ShortenedUrl.exists?(short_url: random_code)
    end
  end

  def self.create_for_user_and_long_url!(user, long_url)

    ShortenedUrl.create!(long_url: long_url, short_url:ShortenedUrl.random_code, user_id: user.id)
  end

  def num_clicks
    self.visits.count
  end

  def num_uniques
    self.visits.uniq.count
  end

belongs_to :submitter,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

has_many :visits,
  primary_key: :id,
  foreign_key: :shortened_url_id,
  class_name: :Visit

has_many :visiters,
through: :visits,
source: :visiter


end
