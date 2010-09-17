class ActionsController < ApplicationController
  def index
    @cactions = ColumnAction.all
    @ractions = RowAction.all
    @factions = FieldAction.all
  end
end
