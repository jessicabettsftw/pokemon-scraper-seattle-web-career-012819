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

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon ('name', 'type') VALUES ('#{name}','#{type}');")
  end

  def self.find(id, db)
    results = db.execute("SELECT * FROM pokemon WHERE id = #{id};")
    my_pokemon = Pokemon.new(id: results[0][0],name: results[0][1], type: results[0][2],db:  db)
  end
end
