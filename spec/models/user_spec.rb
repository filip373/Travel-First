require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has valid factory' do
    expect(build_stubbed(:user)).to be_valid
  end

  context 'when email is empty' do
    subject { build_stubbed(:user, email: '') }
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when email is not correct' do
    subject { build(:user, email: 'something') }
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when password is empty' do
    subject { build_stubbed(:user, password: '') }
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when password and confirmation do not match' do
    subject do
      build_stubbed(:user, password: 'qwerty', password_confirmation: 'asdfgh')
    end
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end

  context 'when password is too short' do
    subject do
      build_stubbed(:user, password: 'qwe', password_confirmation: 'qwe')
    end
    it 'is invalid' do
      expect(subject).to be_invalid
    end
  end
end
