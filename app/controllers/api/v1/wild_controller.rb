class Api::V1::WildController < ActionController::Base
  def index
    render 'wild/index'
  end
end
