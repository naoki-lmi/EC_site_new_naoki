module UserHelper
  
 
  def sign_in(user)
    session[:user_id] = user.id
  end

end

  RSpec.configure do |config|
    config.include UserHelper, type: :controller
  end


