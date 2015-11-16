require "rails_helper"

RSpec.describe Link, type: :model do
  let(:long_url) { "http://www.andela.com" }
  subject(:link) { Link.new(long_url: long_url) }


  describe "#generate_short_url" do

    it "should generate a random 6 letter string" do
      link.short_url = nil
      link.save
      expect(link.short_url.length).to be(6)
    end

    it "should allow the given url to be short url if it hasnt been previously used" do
      link.short_url = "checkpoint"
      link.save
      expect(link.short_url).to eql("checkpoint")
    end
end

describe "#generate_short_url " do
    it "should not allow the given url to be saved if it has been already used" do
      link.short_url = "andela"
      link.save
      expect(Link.create(long_url: 'www.supersports.com', short_url: "andela")).not_to be(true)
  end
end

end