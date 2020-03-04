class SessionsController < ApplicationController
   respond_to :json


   def new
   end

   def create
      @user = User.find_by(email: params[:email])
      if !@user.nil && @user.authenticate(params[:password])
         login!
         render json: { 
            logged_in: true,
            user: @user,
            message: 'welcome back!'
         }
      else 
         render json: { 
            status: 401,
            message: 'Improper credentials given!'
         }
         # need to figure out what to do about the redirect here
      end
   end

   def is_logged_in?
      if logged_in? && current_user
        render json: {
          logged_in: true,
          user: current_user
        }
      else
        render json: {
          logged_in: false,
          message: 'no such user'
        }
      end
   end

   def destroy
      logout!
      render json: {
        status: 200,
        logged_out: true
      }
   end

   private

end