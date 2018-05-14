require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:charlie) { User.new(
    email: 'charlie@charlie.com',
    password: 'charlie',
    session_token: 'temporary_token'
    )}

  describe 'Validations' do
      it { should validate_presence_of(:email) }
      it { should validate_presence_of(:password_digest) }
      it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'User#reset_session_token' do
    before(:each) { charlie.reset_session_token }

    it 'should change the users session token' do
      expect(charlie.session_token).not_to eq('temporary_token')
    end

    it 'should save the user with a new session token' do
      token = charlie.session_token
      user = User.find_by_session_token(token)
      expect(user).to eq(charlie)
    end
  end

  describe 'User#is_password?' do
    it 'should return true for a correct password' do
      expect(charlie.is_password?('charlie')).to be(true)
    end

    it 'should return false for an incorrect password' do
      expect(charlie.is_password?('funknwaffles')).to be(false)
    end
  end

  describe 'User::find_by_credentials' do

    before(:each) {charlie.save}

    it 'should return nil if user email does not exist' do
      # user = User.find_by_credentials('tinkle', nil)
      user = build(:user, email: "InvalidEmail")
      expect(User.find_by_credentials(user.email, user.password)).to be_nil
    end

    it 'should return nil if users password is incorret' do
      user = User.find_by_credentials(charlie.email, 'funknwaffles')
      expect(user).to be_nil
    end

    it 'should return the user if the email & password match' do
      user = User.find_by_credentials(charlie.email, 'charlie')
      expect(user).to eq(charlie)
    end

  end


end
