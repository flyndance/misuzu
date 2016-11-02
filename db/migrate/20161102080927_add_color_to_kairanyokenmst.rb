class AddColorToKairanyokenmst < ActiveRecord::Migration
  def change
    add_column :回覧用件マスタ, :color, :string
  end
end
