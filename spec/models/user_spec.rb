require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    context "on a new user" do

      it "should not be valid without a password" do
        user = User.new(first_name: 'first', last_name: 'last', email: 'first.last@mail.com')
        expect(user).to_not be_valid
        expect(user.errors.messages[:password]).to include('can\'t be blank')
      end

      it "should not be valid without a email" do
        user = User.new(first_name: 'first', last_name: 'last', password: 'password')
        expect(user).to_not be_valid
        expect(user.errors.messages[:email]).to include('can\'t be blank')
      end

      it "should not be valid without a first_name" do
        user = User.new(last_name: 'last', password: 'password', email: 'first.last@mail.com')
        expect(user).to_not be_valid
        expect(user.errors.messages[:first_name]).to include('can\'t be blank')
      end

      it "should not be valid without a last_name" do
        user = User.new(first_name: 'first', password: 'password', email: 'first.last@mail.com')
        expect(user).to_not be_valid
        expect(user.errors.messages[:last_name]).to include('can\'t be blank')
      end

      it "should be not be valid with a short password" do
        user = User.new(first_name: 'first', last_name: 'last', password: 'pass', email: 'first.last@mail.com')
        expect(user).to_not be_valid
        expect(user.errors.messages[:password]).to include('is too short (minimum is 8 characters)')
      end

      it "should not be valid with a confirmation mismatch" do
        user = User.new(first_name: 'first', last_name: 'last', password: 'password', password_confirmation: 'password2', email: 'first.last@mail.com')
        expect(user).to_not be_valid
      end

      it "should not be valid with a non-unique email, case insensitive" do
        User.create!(first_name: 'first', last_name: 'last', password: 'password', email: 'first.last@mail.com')
        user = User.create(first_name: 'first', last_name: 'last', password: 'password', email: 'FIRST.last@mail.com')

        expect(user).to_not be_valid
        expect(user.errors.messages[:email]).to include('has already been taken')
      end
    end
  end

  describe '.authenticate_with_credentials' do
    context "on a new login" do

      it "should be valid for a email with trailing spaces" do
        user = User.create(first_name: 'first', last_name: 'last', password: 'password', email: 'first.last@mail.com')

        user2 = User.authenticate_with_credentials('first.last@mail.com ', user.password)

        expect(user.id).to be(user2.id)
      end

      it "should be valid for a email with different letter case" do
        user = User.create(first_name: 'first', last_name: 'last', password: 'password', email: 'firsT.lasT@mail.com')

        user2 = User.authenticate_with_credentials('First.Last@mail.com', user.password)

        expect(user.id).to be(user2.id)
      end

      it "should be valid for a valid email and password" do
        user = User.create(first_name: 'first', last_name: 'last', password: 'password', email: 'first.last@mail.com')

        user2 = User.authenticate_with_credentials(user.email, user.password)

        expect(user.id).to be(user2.id)
      end
      
      it "should not be valid without a valid email" do
        user = User.create(first_name: 'first', last_name: 'last', password: 'password', email: 'first.last@mail.com')
        
        user2 = User.authenticate_with_credentials('first.first@mail.com', user.password)

        expect(user2).to be(nil)
      end

      it "should not be valid without a valid password" do
        user = User.create(first_name: 'first', last_name: 'last', password: 'password', email: 'first.last@mail.com')
        
        user2 = User.authenticate_with_credentials(user.email, 'pssword')

        expect(user2).to be(nil)
      end

    end
  end

end
