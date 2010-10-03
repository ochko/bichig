class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  helper_method :editor?
  def require_editor
    unless current_user && current_user.editor?
      flash[:notice] = "Зөвхөн засварлах зөвшөөрөлтэй хүн л өөрчлөнө"
      redirect_to root_url
    end
  end

  def editor?
    current_user && current_user.editor
  end
end
