class UsersController < ApplicationController

   # before_action :authenticate

   def index
      @users = User.all
      render json: UserSerializer.new(@users), status: 200
   end

   def create
      @user = User.create(user_params)
      if @user
         render json: UserSerializer.new(@user), status: 200
      else 
         render json: {
            status: 500,
            error: ['Error creating user!']
         }
      end
   end
  

   def show
      @user = User.find(params[:id])
      # binding.pry
      if @user 
         render json: UserSerializer.new(@user)
      else 
         render json: {
            status: 500,
            error: ['user not found']
         }
      end
   end


   private

   def user_params
      params.require(:user).permit(:username, :email, :password)
   end

end