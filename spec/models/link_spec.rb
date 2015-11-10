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

    it "should allow the given url to be short url if it hasnt been previously " do
      @link = Link.new(long_url: long_url)
      @link.short_url = "checkpoint"
      @link.save
      expect(@link.short_url).to eql("checkpoint")
    end

  end
end