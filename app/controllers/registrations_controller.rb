# Registrations Controller
class RegistrationsController < Devise::RegistrationsController
	def eg
		
    end
  private

  def sign_up_params
    params.require(:user).permit!
  end

  def account_update_params
    params.require(:user).permit!
  end

end
