class ApplicationController < ActionController::Base

    # command prevents Rails from using its authenticity token. 
    # This is a security token that Rails generates from our session data and adds to the parameters sent 
    # from a Rails form to a controller action 
    # to prevent cross-site request forgery (CSRF) attacks.
    
    # may not need this since I'm not using actionController::api
    include ::ActionController::Cookies 
    skip_before_action :verify_authenticity_token
    helper_method :login!, :logged_in?, :current_user, :authorized_user?, :logout!


    def login!
        session[:user_id] = user.id
    end

    def logged_in?
        !!current_user
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

    def authorized_user?
        @user == current_user
    end

    def authenticate
        raise AppError::AuthenticationError if !logged_in?
    end

    def logout!
        session.clear
    end

end