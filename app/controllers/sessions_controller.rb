class SessionsController < Devise::SessionsController
    respond_to :json


    def new
    end

    # def create
    #     user = User.find_by(email: params[:email])
        


    # end

    private


end