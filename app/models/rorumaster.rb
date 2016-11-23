class Rorumaster < ActiveRecord::Base
	self.table_name = :ロールマスタ
	self.primary_key = :ロールコード

	# has_many :rorumenba, foreign_key: :社員番号, :ロールコード
end
