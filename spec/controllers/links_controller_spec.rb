require 'rails_helper'

RSpec.describe LinksController, type: :controller do
  subject(:link)  { Link.new(long_url: long_url, short_url: short_url, user_id: user_id, clicks: clicks)}
  let(:long_url) { "http://www.andela.com" }
  # let(:email) { "oscaroranagwa@gmail.com" }
  # let(:password) { "oscarpalito" }
  # let(:password_confirmation) { "oscarpalito" }
  it { expect(link.save).to be_true}
  
  describe "#create" do
    context "when username is not present" do
      # let(:username) { "" }
      it { expect(link.save).to be_true}
    end
  end
end
