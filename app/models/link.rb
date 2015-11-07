class Link < ActiveRecord::Base

  scope  :most_recent_links, -> {order("created_at desc").select("long_url","short_url","clicks","created_at")}
  scope  :most_popular_links, -> {order("clicks desc").select("long_url","short_url","clicks","created_at")}

  belongs_to :user
  before_create :generate_short_url

  def generate_short_url
    begin
      generate_url = SecureRandom.urlsafe_base64
      if short_url
        self.short_url = Link.find_by(short_url: short_url) == nil ? self.short_url : generate_url[0..6]
      end
    end while self.class.exists?(short_url: short_url)
  end
  
end
