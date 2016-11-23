class ChangeColumnName < ActiveRecord::Migration
  def change
  	rename_column :ロールメンバ, :abc, :氏名
  end
end
