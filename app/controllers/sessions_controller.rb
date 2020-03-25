class SessionsController < ApplicationController


   def login
       user = User.find_by(email: params[:user][:email])
       if user && user.authenticate(params[:user][:password])
           session[:user_id] = user.id
           render json: user
       else
           render json: { error: "Invalid Authentication"}, status: 401
       end

   end

    def getUser 
        user = User.find_by(id: session[:user_id])
        # binding.pry
        if user && logged_in?
            render json: user
        else
            render json: { error: "Invalid Authentication"}, status: 401
        end
    end


    def logout
        session.clear
        cookies["logged_in"] = logged_in?
        render json: {message: "Logged Out", status: 200}
    end
   
end