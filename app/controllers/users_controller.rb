class UsersController < ApplicationController

   # before_action :authenticate_user!

   def index
      @users = User.all
      render json: UserSerializer.new(@users)
   end

   def create
      
      @user = User.create(user_params)
      if @user
         login!
         # binding.pry
         render json: UserSerializer.new(@user)
      else 
         render json: {
            status: 500,
            error: ['Error creating user!']
         }
      end
   end
  

   def show
      @user = User.find(params[:id])
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