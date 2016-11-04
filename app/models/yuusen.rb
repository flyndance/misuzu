class Yuusen < ActiveRecord::Base
	self.table_name = :優先
	self.primary_key = :優先さ

  validates :優先さ, presence: true
	has_many :kairanyokenmsts, dependent: :destroy, foreign_key: :優先さ
	has_many :dengonyokens, dependent: :destroy, foreign_key: :優先さ
end

