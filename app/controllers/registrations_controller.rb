class RegistrationsController < Devise::RegistrationsController

   respond_to :json

   def create

      begin
         super
      rescue ActiveRecord::RecordInvalid => e
         render_resource(e.record)
      rescue ActiveRecord::RecordNotUnique => e
         err = OpenStruct.new(errors: { user: 'Already exists!' } )
         validation_error(err)
      end

   end

   private

   def respond_with(resource, _opts = {})
       render json: resource
   end

   def respond_to_on_destroy
       head :no_content
   end


end