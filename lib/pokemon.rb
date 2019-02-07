class Pokemon
  attr_reader :id, :name, :type, :db, :hp

  @@all =[]

  def initialize(id: , name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
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
    my_pokemon = Pokemon.new(id: results[0][0], name: results[0][1],
      type: results[0][2],db:  db, hp: results[0][3])
  end

  def alter_hp(num, db)
    @hp = num
    db.execute("UPDATE pokemon SET hp = #{num} WHERE id = #{self.id};")
  end
end
