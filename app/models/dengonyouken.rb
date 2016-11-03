class Dengonyouken < ActiveRecord::Base
  self.table_name = :伝言用件マスタ

  validates :種類名, presence: true

  # a class method import, with file passed through as an argument
  def self.import(file)
    # a block that runs through a loop in our CSV data
    CSV.foreach(file.path, headers: true) do |row|
      # creates a user for each row in the CSV file
      Dengonyouken.create! row.to_hash
    end
  end

  def self.to_csv
    attributes = %w{id 種類名 備考}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |dengonyouken|
        csv << attributes.map{ |attr| dengonyouken.send(attr) }
      end
    end
  end

end
