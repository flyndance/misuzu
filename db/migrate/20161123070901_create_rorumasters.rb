class CreateRorumasters < ActiveRecord::Migration
  def change
    create_table :ロールマスタ do |t|
	  t.string :ロールコード, :limit => 10, null: false
	  t.string :ロール名, :limit => 40
	  t.string :序列, :limit => 10

	  t.timestamps null: false
    end
    add_index :ロールコード
  end
end
