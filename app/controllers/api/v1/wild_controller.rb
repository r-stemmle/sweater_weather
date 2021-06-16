class Api::V1::WildController < ActionController::Base
  def index
    require "pry"; binding.pry
    render 'wild/index'
  end
end
