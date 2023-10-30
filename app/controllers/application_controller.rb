class ApplicationController < ActionController::Base
  
  def after_sign_out_path_for(resource)
    flash[:notice] = "サインアウト成功"
     root_path
  end

end
