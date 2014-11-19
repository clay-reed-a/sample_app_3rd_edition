require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new name: "Clayton Albachten", email: "clay@example.com"
  end 

  test "should be valid" do 
    assert @user.valid? 
  end 

  test "name should be present" do 
    @user.name = "      "
    assert_not @user.valid? 
  end 

  test "email should be present" do 
    @user.email = "     "
    assert_not @user.valid? 
  end 

  test "name should not be too long" do
    @user.name = 'a' * 51 
    assert_not @user.valid?  
  end 

  test "email should not be too long" do
    @user.email = 'a' * 256 
    assert_not @user.valid? 
  end 

  test "should accept valid emails" do 
    valid_emails = %w[clay.reed.a@gmail.com fred@amazon.co.uk this+that@things.nyc A_US-ER@upcase.com neel.patel@generalassemb.ly]
    valid_emails.each do |valid_email|
      @user.email = valid_email 
      assert @user.valid? 
    end 
  end 

  test "should reject invalid emails" do 
    invalid_emails = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]
    invalid_emails.each do |invalid_email|
      @user.email = invalid_email
      assert_not @user.valid?
    end 
  end 

  test "email addresses should be unique" do 
    duplicate_user = @user.dup 
    duplicate_user.email.upcase 
    @user.save 
    assert_not duplicate_user.valid? 
  end 
end
