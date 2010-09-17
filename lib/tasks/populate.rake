namespace :fy do
  namespace :populate do
    desc "Add Rules"
    task :actions => :environment do 
      %W(delete_column add_column move_column change_column_name).each do |x|
        ColumnAction.create(:name => x)
      end
      %W(delete_row_containing delete_row_matching).each do |x|
        RowAction.create(:name => x)
      end
    end
  end
end
