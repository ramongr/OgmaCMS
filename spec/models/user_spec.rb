require 'rails_helper'

RSpec.describe User, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  it "must have a valid email" do
  	expect(build(:user, email: "email_invalido")).to have(1).errors_on(:email)
  end

  it "must have an email" do
  	expect(build(:user, email: nil)).to have(1).errors_on(:email)
  end

  it "email must be unique" do
    create(:user, email: "admin@example.com")
    user2 = build(:user, email: "admin@example.com")
    expect(user2).to have(1).errors_on(:email)
  end

  it "must have a valid password" do
    expect(build(:user, password: "ola", password_confirmation: "ola")).to have(1).errors_on(:password)
  end

  it "must have a password" do
    expect(build(:user, password: nil)).to have(1).errors_on(:password)
  end

  it "must have a password confirmation" do
    expect(build(:user, password: "teste123", password_confirmation: "")).to have(1).errors_on(:password_confirmation)
  end

  it "password must match password confirmation" do
    expect(build(:user, password: "teste123",password_confirmation: "teste123")).to be_valid
    expect(build(:user, password: "teste123",password_confirmation: "teste1234")).to_not be_valid
  end
end
