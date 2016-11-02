class AddColorToDengonyoken < ActiveRecord::Migration
  def change
    add_column :伝言用件マスタ, :color, :string
  end
end
