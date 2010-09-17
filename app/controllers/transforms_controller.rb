class TransformsController < ApplicationController
  def index
    @transforms = Transform.all
  end
end
