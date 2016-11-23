class CreateRorumenbas < ActiveRecord::Migration
  def change
    create_table :ロールメンバ do |t|
      t.string :ロールコード, :limit => 10, null: false
      t.string :社員番号, :limit => 10, null: false
      t.string :氏名, :limit => 30　　　　　　
      t.string :ロール内序列, :limit =>10
      t.timestamps null: false
    end
    add_index :ロールメンバ, [:社員番号,:ロールコード]
  end
end
