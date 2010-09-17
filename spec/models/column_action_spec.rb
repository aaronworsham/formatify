require 'spec_helper'

describe "Column Action" do
  before(:each) do
    @column_action = ColumnAction.create
    @rule = ColumnRule.create(:action => @column_action)
  end

  it "should delete a column using the action name" do
    array = [1,2,3]
    @column_action.name = "delete_column"
    @rule.column_name = 1
    r = @column_action.send(@column_action.name, array, @rule)
    r.size.should == 2
    r.should == [2,3]
  end

  it "should add a column using the action name" do
    array = [1,2,3]
    @column_action.name = "add_column"
    @rule.column_name = 4
    r = @column_action.send(@column_action.name, array, @rule)
    r.size.should == 4
    r.should == [1,2,3,4]
  end

  it "should change a column name using the action name" do
    array = ["bob", "sam", "joe"]
    @column_action.name = "change_column_name"
    @rule.before = "sam"
    @rule.after = "tom"
    r = @column_action.send(@column_action.name, array, @rule)
    r.should == ["bob", "tom", "joe"]
  end
  it "should move a column to a position using the action name" do
    array = ["bob", "sam", "joe"]
    @column_action.name = "move_column"
    @rule.column_name = "joe"
    @rule.position = 1
    r = @column_action.send(@column_action.name, array, @rule)
    r.should == ["bob", "joe", "sam"]
  end

  it "should apply all three column rules to a header" do
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
    array.should == ["sue","tim","joe"]
  end  
end
