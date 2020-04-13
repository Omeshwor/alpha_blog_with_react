require "test_helper"

class UserTest < ActiveSupport::TestCase
    def setup
        @user = User.create(username: "John", email: "john@example.com", password: "123456", password_confirmation: "123456")
    end

    test "user should be valid" do
        assert @user.valid?
    end

    test "username should be valid" do
        @user.username = " "
        assert_not @user.valid?
    end

    test "username should atleast 3 characters long" do
        @user.username = "aa"
        assert_not @user.valid?
    end

    test "username should not be more than 25 characters long" do
        @user.username = "a"* 26
        assert_not @user.valid?
    end

    test "username should be unique" do
        @user.save
        user2 = User.new(username: "John")
        assert_not user2.valid?
    end

    test "email should be unique" do
        @user.save
        user2 = User.new(email: "john@example.com")
        assert_not user2.valid?
    end

    test "email should be empty" do
        @user.email = " "
        assert_not @user.valid?
    end

    test "password should not be empty" do
        @user.password = " "
        assert_not @user.valid?
    end

    test "password should be atleast 6 characters long" do
        @user.password = "a" * 5
        assert_not @user.valid?
    end

    test "password should not be to long" do
        @user.password = "a" * 9
        assert_not @user.valid?
    end

    test "passwords should match" do
        @user.password = "123456"
        @user.password_confirmation = "12345678"
        assert_not @user.valid?
    end




end
