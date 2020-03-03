class SessionsController < Devise::SessionsController
   respond_to :json


   def new
   end

   def create
      user = User.find_by(email: params[:email])
      if !user.nil && user.authenticate(params[:password])
         login!
         render json: { message: 'welcome back!'}
      else 
         render json: { message: 'Improper credentials given!'}
         # need to figure out what to do about the redirect here
      end
   end

   private


end