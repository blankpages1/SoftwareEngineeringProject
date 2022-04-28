require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validation tests" do
    it "ensures the email is present" do
        user = User.new(password: "aaaaaa", password_confirmation:"aaaaaa");
        expect(user.valid?).to eq(false)
    end

    it "ensures the password is present" do
        user = User.new(email: "a@a.a", password_confirmation:"aaaaaa");
        expect(user.valid?).to eq(false)
    end

    it "should be able to save" do
        user = User.new(email: "a@a.a", password: "aaaaaa", password_confirmation:"aaaaaa");
        expect(user.save).to eq(true)
    end

  end
end
