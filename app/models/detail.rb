class Detail < ActiveRecord::Base
 # scope :link_details, -> {select('country, count("id") as count').where(shorter_id: link_id).order("count desc").group('country').limit(5)}

belongs_to :link

 def self.link_details_browser(link_id)
   self.select('browser, count("id") as count').where(link_id: link_id).order("count desc").group('browser').limit(5)
 end

  def self.link_details_location(link_id)
   self.select('location, count("id") as count').where(link_id: link_id).order("count desc").group('location').limit(5)
 end

  def self.link_details_referrer(link_id)
   self.select('referrer, count("id") as count').where(link_id: link_id).order("count desc").group('referrer').limit(5)
 end
 
end
