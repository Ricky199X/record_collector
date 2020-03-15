class SessionsController < ApplicationController


   def login
       user = User.find_by(email: params[:user][:email])
       if user && user.authenticate(params[:user][:password])
           session[:user_id] = user.id
        #    cookies["logged_in"] = true
        #    binding.pry
           render json: user
       else
           render json: { error: "Invalid Authentication"}, status: 401
       end

   end

    def getUser 
        user = User.find_by(id: session[:user_id])
        # binding.pry
        if user && logged_in?
            # binding.pry
            render json: user
        else
            render json: { error: "Invalid Authentication"}, status: 401
        end
    end

#    def auth_check
#        cookies["logged_in"] = logged_in?
#        render json: {csrf_auth_token: form_authenticity_token}
#    end



   def logout
       authenticate
       session.clear
   end
   
end