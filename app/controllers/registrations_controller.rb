class RegistrationsController < Devise::RegistrationsController

   respond_to :json

   def create

      # begin
      #    super
      # rescue ActiveRecord::RecordInvalid => e
      #    render_resource(e.record)
      # rescue ActiveRecord::RecordNotUnique => e
      #    err = OpenStruct.new(errors: { user: 'Already exists!' } )
      #    validation_error(err)
      # end

      def create
         binding.pry
         user = User.new(user_params)
         if user.save
            render json: UserSerializer.new(user)
         else 
            render json: {error: 'Error creating user!'}
         end
      end

   end

   private

   def respond_with(resource, _opts = {})
       render json: resource
   end

   def respond_to_on_destroy
       head :no_content
   end


   def user_params
      params.require(:user).permit(:username, :email, :password)
   end
end