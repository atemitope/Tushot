class Detail < ActiveRecord::Base
 # scope :link_details, -> {select('country, count("id") as count').where(shorter_id: link_id).order("count desc").group('country').limit(5)}
 
  belongs_to :link
end
