class ColumnRulesController < RulesController
  def new
    @rule = ColumnRule.new
  end
  def create
    @rule = ColumnRule.create(params[:column_rule])
    super
  end
end
