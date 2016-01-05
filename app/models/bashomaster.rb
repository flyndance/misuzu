class Bashomaster < ActiveRecord::Base
  self.table_name = :場所マスタ
  self.primary_key = :場所コード


  validates :場所コード, :場所名, presence: true
  validates :会社コード, presence: true, if: :basho_kubun?
  validates :場所コード, uniqueness: true

  has_many :events
  
  belongs_to :kaishamaster, foreign_key: :会社コード

  delegate :name, to: :kaishamaster, prefix: :kaisha, allow_nil: true
  
  alias_attribute :id, :場所コード
  alias_attribute :name, :場所名

  def basho_kubun?
    場所区分 == '2'
  end

  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      row_hash = row.to_hash
      kaishamaster = Kaishamaster.find_by(会社コード: row_hash['会社コード'])
      kaishamaster_id = kaishamaster.id if kaishamaster
      new_hash = row_hash.merge({'kaishamaster_id': kaishamaster_id})
      
      Bashomaster.create! new_hash
      
      # basho.kaishamaster = Kaishamaster.find_by(会社コード: row_hash['会社コード'])
      # basho.save

    end

    # reset foreign key
    # unless Kaishamaster.count == 0
    #   Bashomaster.all.each do |basho|
    #     basho.kaishamaster = Kaishamaster.find_by(会社コード: basho.会社コード)
    #     basho.save
    #   end
    # end
    
  end

end
