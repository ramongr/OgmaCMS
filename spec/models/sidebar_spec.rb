require 'rails_helper'

RSpec.describe Sidebar, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'has a valid factory' do
    expect(build(:left_sidebar)).to be_valid
    expect(build(:right_sidebar)).to be_valid
    expect(build(:top_sidebar)).to be_valid
    expect(build(:bottom_sidebar)).to be_valid
    expect(build(:left_sidebar_pages)).to be_valid
    expect(build(:right_sidebar_pages)).to be_valid
    expect(build(:top_sidebar_pages)).to be_valid
    expect(build(:bottom_sidebar_pages)).to be_valid
  end

  it 'belongs to Pages' do
    expect(create(:left_sidebar_pages).pages.count).to eq 4
    expect(create(:right_sidebar_pages).pages.count).to eq 4
    expect(create(:top_sidebar_pages).pages.count).to eq 4
    expect(create(:bottom_sidebar_pages).pages.count).to eq 4
  end

  it 'is invalid without title' do
    left_sidebar = build(:left_sidebar, title: nil)
    right_sidebar = build(:right_sidebar, title: nil)
    top_sidebar = build(:top_sidebar, title: nil)
    bottom_sidebar = build(:bottom_sidebar, title: nil)
    expect(left_sidebar).to have(1).errors_on(:title)
    expect(right_sidebar).to have(1).errors_on(:title)
    expect(top_sidebar).to have(1).errors_on(:title)
    expect(bottom_sidebar).to have(1).errors_on(:title)
  end

  it 'is invalid without type_mask' do
    left_sidebar = build(:left_sidebar, type_mask: nil)
    right_sidebar = build(:right_sidebar, type_mask: nil)
    top_sidebar = build(:top_sidebar, type_mask: nil)
    bottom_sidebar = build(:bottom_sidebar, type_mask: nil)
    expect(left_sidebar).to_not have(0).errors_on(:type_mask)
    expect(right_sidebar).to_not have(0).errors_on(:type_mask)
    expect(top_sidebar).to_not have(0).errors_on(:type_mask)
    expect(bottom_sidebar).to_not have(0).errors_on(:type_mask)
  end

end
