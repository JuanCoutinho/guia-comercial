class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def is_admin?
    redirect_to root_path, alert: "Acesso não permitido" unless current_user&.admin?
  end
  
end
