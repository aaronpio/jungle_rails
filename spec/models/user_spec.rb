require 'rails_helper'


RSpec.describe User, type: :model do
  describe 'Validations' do
    mock_user = User.new(name: "Aaron", email: "hi@hi.com", password: "12345", password_confirmation: "12345")
    
    it 'should be good if we give it what it wants' do
      expect(mock_user).to be_valid
      mock_user.save
      expect(mock_user.errors.full_messages).to eql([])
    end

    it 'should have pw & pw_confirm match' do
      mock_user.password = "tester"
      mock_user.save
      expect(mock_user.errors.full_messages).to eql(["Password confirmation doesn't match Password"])
    end

    it "should be at least 5 characters" do
      mock_user.password = "123"
      expect(mock_user).not_to be_valid
    end

    it "should have a unique email and not be case-sensitive" do
      mock_user.save
      expect(mock_user).not_to be_valid
    end

    it "should have name" do
      mock_user.name = nil
      mock_user.save
      expect(mock_user).not_to be_valid
    end

    it "should have email" do
      mock_user.email = nil
      mock_user.save
      expect(mock_user).not_to be_valid
    end

  end
    
end