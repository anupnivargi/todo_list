require 'spec_helper'

describe User do

  fixtures :users

  def user_attributes
    {
      :email => "john@gmail.com",
      :first_name => 'John',
      :last_name => 'Dupond',
      :password => 'temp',
      :password_confirmation => 'temp'
    }
  end

  before :each do
    @user = User.new
  end

  it 'should be valid' do
    @user = users(:john)
    @user.should be_valid
  end

  it "should have a email" do
    @user = user_attributes.except(:email)
    @user.should have(4).error_on(:email)
  end

  it 'should say the message' do
    @user = users(:john)
    @user.say("hello").should == "John Dupond says hello"
  end

  describe 'authentication' do
    it "should return the user given valid username and password" do
      @user = users(:john)
      User.authenticate('john@gmail.com','temp123').should == @user
    end

    it "should return nil if the username and password dont match" do
      @user = users(:john)
      User.authenticate('john@gmail.com', 'temp').should == nil
    end

  end
end

