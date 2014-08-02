require 'rails_helper'

RSpec.describe StaticPage, :type => :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  it "has a valid factory" do
    expect(build(:static_page)).to be_valid
  end

  it "creates a slug from title" do
    #staticpage = StaticPage.create(title: "Ola Mundo", body: "coisas")
    static_page = create(:static_page, slug: nil)
    expect(static_page.slug).to match(/\A[a-z_]+\z/)
  end

  it "two pages have different slugs" do
    static_page = StaticPage.create(title: "Hello World", body: "Things")
    static_page2 = StaticPage.create(title: "Hello World", body: "More Things")
    expect(static_page2).to have(1).errors_on(:slug)
  end

  it "is invalid without title" do
    static_page = build(:static_page, title: nil)
    expect(static_page).to have(1).errors_on(:title)
  end

  it "is valid without slug" do
    static_page = build(:static_page, slug: nil)
    expect(static_page).to be_valid
  end

  it "is invalid without body" do
    static_page = build(:static_page, body: nil)
    expect(static_page).to have(1).errors_on(:body)
  end

  it "has sidebars" do
    expect(create(:static_page).sidebars.count).to eq 4
  end
end
