class Rorumaster < ActiveRecord::Base
	self.table_name = :ロールマスタ
	self.primary_key = :ロールコード
	has_many :rorumenba, foreign_key: :ロールコード
end
