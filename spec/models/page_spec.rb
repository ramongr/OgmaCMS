require 'rails_helper'

RSpec.describe Page, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'has a valid factory' do
    expect(build(:page)).to be_valid
    expect(build(:page_sidebars)).to be_valid
  end

  it 'creates a slug from title' do
    # page = Page.create(title: "Ola Mundo", body: "coisas")
    page = create(:page, slug: nil)
    expect(page.slug).to match(/\A[a-z_]+\z/)
  end

  it 'two pages have different slugs' do
    page = Page.create(title: 'Hello World', body: 'Things')
    page2 = Page.create(title: 'Hello World', body: 'More Things')
    expect(page2).to have(1).errors_on(:slug)
  end

  it 'is invalid without title' do
    page = build(:page, title: nil)
    expect(page).to have(1).errors_on(:title)
  end

  it 'is valid without slug' do
    page = build(:page, slug: nil)
    expect(page).to be_valid
  end

  it 'is invalid without body' do
    page = build(:page, body: nil)
    expect(page).to have(1).errors_on(:body)
  end

  it 'has sidebars' do
    expect(create(:page_sidebars).sidebars.count).to eq 4
  end
end
