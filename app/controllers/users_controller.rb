class UsersController < ApplicationController

   # before_action :authenticate_user!

   def index
      users = User.all
      render json: UserSerializer.new(users)
   end

   def create
      user = User.new(user_params)
      # binding.pry
      if user.save
         render json: UserSerializer.new(user)
      else 
         render json: {error: 'Error creating user!'}
      end
   end
  

   def show
      user = User.find(params[:id])
      render json: UserSerializer.new(user)
   end


   private

   def user_params
      params.require(:user).permit(:username, :email, :password)
   end

end