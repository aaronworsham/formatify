require 'test_helper'

class ColumnActionTest < ActiveSupport::TestCase

  setup do
    @column_action = ColumnAction.create
    @rule = ColumnRule.create(:action => @column_action)
  end

  test "that we can delete a column using the action name" do
    array = [1,2,3]
    @column_action.name = "delete_column"
    @rule.column_name = 1
    r = @column_action.send(@column_action.name, array, @rule)
    assert r.size == 2
    assert r == [2,3]
  end

  test "that we can add a column using the action name" do
    array = [1,2,3]
    @column_action.name = "add_column"
    @rule.column_name = 4
    r = @column_action.send(@column_action.name, array, @rule)
    assert r.size == 4
    assert r == [1,2,3,4]
  end

  test "that we can change a column name using the action name" do
    array = ["bob", "sam", "joe"]
    @column_action.name = "change_column_name"
    @rule.before = "sam"
    @rule.after = "tom"
    r = @column_action.send(@column_action.name, array, @rule)
    assert r == ["bob", "tom", "joe"]
  end
  test "that we can move a column to a position using the action name" do
    array = ["bob", "sam", "joe"]
    @column_action.name = "move_column"
    @rule.column_name = "joe"
    @rule.position = 1
    r = @column_action.send(@column_action.name, array, @rule)
    assert r == ["bob", "joe", "sam"]
  end

  test "that you can apply all three column rules to a header" do
    array = ["bob", "tom", "sue"]
    @rule1 = ColumnRule.create( :column_name => "joe",
                                :action => ColumnAction.create(:name => "add_column")
                              )
    @rule2 = ColumnRule.create( :column_name => "bob",
                                :action => ColumnAction.create(:name => "delete_column")
                              )
    @rule3 = ColumnRule.create( :before => "tom",
                                :after  => "tim",
                                :action => ColumnAction.create(:name => "change_column_name")
                              )
    @rule4 = ColumnRule.create( :column_name => "sue",
                                :position => 0,
                                :action => ColumnAction.create(:name => "move_column")
                              )
    rules = [@rule1,@rule2,@rule3,@rule4]
    rules.each do |r|
      array = r.action.send(r.action.name,array,r)
    end
    assert array == ["sue","tim","joe"]
  end
end
