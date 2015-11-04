class Link < ActiveRecord::Base

  before_create :generate_short_url

  def generate_short_url
    begin
      generate_url = SecureRandom.urlsafe_base64
      self.short_url = generate_url[0..6]
    end while self.class.exists?(short_url: short_url)
  end
  
end
