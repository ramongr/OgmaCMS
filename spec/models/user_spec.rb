require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  it 'has a valid factory' do
    expect(build(:super_admin)).to be_valid
    expect(build(:admin)).to be_valid
    expect(build(:author)).to be_valid
    expect(build(:registered)).to be_valid
  end

  it 'must have a valid email' do
    expect(build(:admin, email: 'email_invalido')).to have(1).errors_on(:email)
  end

  it 'must have an email' do
    expect(build(:admin, email: nil)).to have(1).errors_on(:email)
  end

  it 'email must be unique' do
    create(:admin, email: 'admin@example.com')
    user2 = build(:admin, email: 'admin@example.com')
    expect(user2).to have(1).errors_on(:email)
  end

  it 'must have a valid password' do
    expect(build(:admin, password: 'ola', password_confirmation: 'ola')).to have(1).errors_on(:password)
  end

  it 'must have a password' do
    expect(build(:admin, password: nil)).to have(1).errors_on(:password)
  end

  it 'must have a password confirmation' do
    expect(build(:admin, password: 'teste123', password_confirmation: '')).to have(1).errors_on(:password_confirmation)
  end

  it 'password must match password confirmation' do
    expect(build(:admin, password: 'teste123', password_confirmation: 'teste123')).to be_valid
    expect(build(:admin, password: 'teste123', password_confirmation: 'teste1234')).to_not be_valid
  end
end
