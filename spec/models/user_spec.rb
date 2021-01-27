require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensure nickname presence' do
      user = User.new(email: 'sim@email.com', category: 'Financial', password: '123456').save
      expect(user).to eq(false)
    end

    it 'ensure email presence' do
      user = User.new(nickname: 'sim', category: 'Financial', password: '123456').save
      expect(user).to eq(false)
    end

    it 'ensure category presence' do
      user = User.new(nickname: 'sim', email: 'sim@email.com', password: '123456').save
      expect(user).to eq(false)
    end

    it 'ensure save successfully' do
      user = User.new(nickname: 'sim', email: 'sim@email.com', category: 'Financial', password: '123456').save
      expect(user).to eq(true)
    end
  end
end
