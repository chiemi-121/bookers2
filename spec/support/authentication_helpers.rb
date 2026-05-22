# spec/support/authentication_helpers.rb
module AuthenticationHelpers
  def sign_in_as(user)
    # Deviseのテストヘルパーを使用する
    login_as(user, scope: :user)
  end
end