class Link < ActiveRecord::Base

  scope  :most_recent_links, -> {order("created_at desc").select("long_url","short_url","clicks","created_at")}
  scope  :most_popular_links, -> {order("clicks desc").select("long_url","short_url","clicks","created_at")}
 


  belongs_to :user, :counter_cache => true
  # counter_culture :user
  before_create :generate_short_url

  validates :long_url, :url => true, presence: true

  def generate_short_url
    begin
      generate_url = SecureRandom.urlsafe_base64
      if short_url 
        unless short_url_already_exists?
          # require 'pry'; binding.pry
          return false
        else
          self.short_url = short_url
        end
      else
        self.short_url = generate_url[0...6]
      end
    end while self.class.exists?(short_url: short_url)
  end


  def short_url_already_exists?
    Link.find_by(short_url: short_url).nil? ? true : false 

  end

  # def self.most_popular_users
  #   group(:user_id).count
  # end

end
