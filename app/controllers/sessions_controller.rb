class SessionsController < Devise::SessionsController
    respond_to :json


    def new
    end

    # def create
    #     user = User.find_by(email: params[:email])
        


    # end

    private

    def respond_with(resource, _opts = {})
        render json: resource
    end

    def respond_to_on_destroy
        head :no_content
    end

end