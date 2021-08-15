class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
     def after_sign_in_path_for(resource)
      case resource
      when Admin
        admin_orders_path
      when Customer
        items_pat
      end
     end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name_kanji, :last_name_kanji, :first_name_kana, :last_name_kana, :postal_code, :telephone_number])
  end
end
