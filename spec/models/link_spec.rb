require "rails_helper"

RSpec.describe Link, type: :model do
  subject(:link) { Link.new(long_url: long_url) }
  let(:long_url) { "http://www.andela.com" }


  describe "#generate_short_url" do

    it "should generate a random 6 letter string" do
      @link = Link.new(long_url: long_url)
      @link.short_url = nil
      @link.save
      expect(@link.short_url.length).to be(6)
    end

    it "should allow the given url to be short url if it hasnt been previously used" do
      @link = Link.new(long_url: long_url)
      @link.short_url = "checkpoint"
      @link.save
      expect(@link.short_url).to eql("checkpoint")
    end

end

describe "#generate_short_url " do
  subject(:link) { Link.new(long_url: long_url, short_url: short_url, user_id: user_id, clicks: clicks) }
    let(:long_url) { "http://www.thisiaandela.com" }
    let(:short_url) { "andela" }


    it "should not allow the given url to be saved if it has been already used" do
      @link = Link.new(long_url: 'www.supersports.com')
      @link.short_url = "andela"
      expect(@link.save).to be(true)
  end
end

end