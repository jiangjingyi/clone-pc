class ExpenceController < ApplicationController
  #モバイル判断
  before_action :detect_devise_variant
  def index
  end

   #アクセス端末判断
   def detect_devise_variant
    ua = request.user_agent
    if(ua.include?('Mobile') || ua.include?('Android'))
      request.variant = :mobile
    end
  end
end
