class FieldRulesController < RulesController
  def new
    @rule = FieldRule.new
  end
  def create
    @rule = FieldRule.create(params[:field_rule])
    super
  end
end
