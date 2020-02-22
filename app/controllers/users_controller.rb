class UsersController < ApplicationController

   def index
      users = User.all
      render json: { message: users }
   end

end