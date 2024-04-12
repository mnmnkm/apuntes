class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    root_path
     # 投稿一覧（topページ）
  end
  
  
  def after_sign_out_path_for(resource)
    root_path
    # 投稿一覧（topページ）
  end
  
  def article_params
      params.require(:article).permit(:title, :content)
  end
  
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

end