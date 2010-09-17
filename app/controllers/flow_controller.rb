class FlowController < ApplicationController
  def index
    @transforms = Transform.all
  end
end
