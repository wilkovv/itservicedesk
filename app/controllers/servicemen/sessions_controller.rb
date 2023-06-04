class Servicemen::SessionsController < Devise::SessionsController
    skip_before_action :verify_authenticity_token
    respond_to :json
    respond_to :html

    private
  
  
  
    def respond_to_on_destroy
    
        respond_to do |format|
            format.all { head :no_content }
            format.any(*navigational_formats) { redirect_to after_sign_out_path_for(resource_name), status: Devise.responder.redirect_status }
            format.json{
                log_out_success && return if current_user
                log_out_failure
            }
        end
    end
  
    def log_out_success
        if request.format.json?
      render json: { message: "You are logged out." }, status: :ok
        end
    end
  
    def log_out_failure
        if request.format.json?
      render json: { message: "Hmm nothing happened."}, status: :unauthorized
        end
    end

  end