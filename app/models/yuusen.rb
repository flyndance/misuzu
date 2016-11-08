class Yuusen < ActiveRecord::Base
	self.table_name = :優先
	self.primary_key = :優先さ

  validates :優先さ, presence: true
  validates :優先さ, uniqueness: true
	has_many :kairanyokenmsts, foreign_key: :優先さ
	has_many :dengonyokens, foreign_key: :優先さ
end

