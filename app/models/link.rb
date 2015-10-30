class Link < ActiveRecord::Base


  before_validate :generate_short_code

  def generate_short_url
    begin
      generate_url = SecureRandom.urlsafe_base64
      self.short_url = generate_url[0..6]
    end while self.class.exists?(short_url: short_url)
    # require"pry"; binding.pry
  end

  
  def self.increment_click_count
    self.click_count += 1
    self.save (validate: false)
  end
end
