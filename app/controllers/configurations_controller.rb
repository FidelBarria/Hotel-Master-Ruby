class ConfigurationsController < ApplicationController
  before_action :authenticate_user!
  def  index
    authorize :configuration
  end
end
