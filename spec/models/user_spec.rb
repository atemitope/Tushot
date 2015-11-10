require "rails_helper"

RSpec.describe User, type: :model do
  subject(:user) { User.new(username: username, email: email, password: password, password_confirmation: password_confirmation) }
  let(:username) { "Oscar" }
  let(:email) { "oscaroranagwa@gmail.com" }
  let(:password) { "oscarpalito" }
  let(:password_confirmation) { "oscarpalito" }

  it { expect(user).to be_valid }

  describe "#username" do
    context "when username is not present" do
      let(:username) { "" }
      it { expect(user).to be_invalid }
    end

    context "when username's length is less than the minimum allowed length" do
      let(:username) { "osc" }
      it { expect(user).to be_invalid }
    end

    context "when name's length is greater than fifty" do
      let(:username) { "oscar"*20 }
      it { expect(user).to be_invalid }
    end
  end

  describe "#email" do
    context "when email is not present" do
      let(:email) { "" }
      it { expect(user).to be_invalid }
    end

    context "when email length is greater than two hundred and fifty five" do
      let(:email) { "oscar"*60 }
      it { expect(user).to be_invalid }
    end
  end

  describe "#password" do
    context "when password is not present" do
      let(:password) { "" }
      it { expect(user).to be_invalid }
    end

    context "when password length is less than eight" do
      let(:password) { "abc" }
      it { expect(user).to be_invalid }
    end
  end

   describe "#password_confirmation" do
    context "when password_confirmation is not present" do
      let(:password) { "" }
      it { expect(user).to be_invalid }
    end

    context "when password_confirmation length is less than eight" do
      let(:password) { "osca" }
      it { expect(user).to be_invalid }
    end
  end

end