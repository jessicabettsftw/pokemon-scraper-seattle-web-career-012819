class Pokemon
  attr_reader :id, :name, :type, :db

  @@all =[]

  def initialize(id: , name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save()

  end
end
