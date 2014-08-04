require 'rails_helper'

RSpec.describe Post, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"

  it "has a valid factory" do
    expect(build(:post)).to be_valid
  end

  it "is invalid without title" do
    expect(build(:post, title: nil)).to have(1).errors_on(:title)
  end

  it "is invalid without content" do
    expect(build(:post, content: nil)). to have(1).errors_on(:content)
  end

  it "is invalid without user" do
    expect(build(:post, user: nil)). to have(1).errors_on(:user)
  end
end
