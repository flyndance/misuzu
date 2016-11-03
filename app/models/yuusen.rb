class Yuusen < ActiveRecord::Base
	self.table_name = :優先
	self.primary_key = :優先さ

	has_many :kairanyokenmsts
	has_many :dengonyokens
end

