require 'spec_helper'

describe "Transform Column Test" do
  before(:each) do
    caction = ColumnAction.create(:name => "delete_column")
    crule = ColumnRule.create(:action => caction, :column_name => "column1") 
    @t = Transformer.new("test/files/test.csv", [crule])
  end

  it "can get full header" do
    @t.get_header.size.should == 4
  end

  it "can get transformed header" do
    @t.get_transformed_header.size.should == 3
  end

  it "returns an array of 3 rows" do
    @t.format.class.should == Array
  end

  it "returns a transformed map" do
    @t.format[1].size.should == 3
  end

end
