class RowRulesController < RulesController
  def new
    @rule = RowRule.new
  end
  def create
    @rule = RowRule.create(params[:row_rule])
    super
  end
  def edit
    @rule = RowRule.find params[:id]
  end
  def update
    @rule = RowRule.find params[:id]
    super
  end
end
