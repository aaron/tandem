module Tandem
  class ApplicationController < ActionController::Base
    check_authorization

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to (Configuration::unauthorized_path || root_url) , :alert => exception.message
    end

    def current_user
      Configuration.current_user.call(request)
    end

    private

    def current_ability
      @current_ability ||= ::Tandem::Ability.new(current_user)
    end
  end
end
