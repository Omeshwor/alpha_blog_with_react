require "test_helper"
class UserControllerTest < ActionDispatch::IntegrationTest
    def setup
        @user = User.create(username: "John", email: "john@example.com", password: "123456", password_confirmation: "123456")
    end

    test "should get user path" do
        get user_path(@user)
    end
    
end
