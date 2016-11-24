class Rorumenba < ActiveRecord::Base
	self.table_name = :ロールメンバ
	self.primary_key = :ロールコード
	self.primary_key = :社員番号

	belongs_to :shainmaster, foreign_key: :社員番号
	belongs_to :rorumaster, foreign_key: :ロールコード
end
