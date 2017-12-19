require "pry"
class Owner
  attr_reader :species
  attr_accessor :name, :pets #can have name - setting and getting

  @@all = []

 def initialize(species)
   @species = species

   @pets = {
    :fishes => [],
    :dogs => [],
    :cats => []
   }
   @@all << self

 end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def say_species
     "I am a #{@species}."
  end

  def buy_fish(name)
    fish = Fish.new(name)
    @pets[:fishes] << fish
  end

  def buy_cat(name)
    cat = Cat.new(name)
    @pets[:cats] << cat
    #can buy a cat that is an instance of the Cat class (FAILED - 1)
    #knows about its cats
  end

  def buy_dog(name)
    dog = Dog.new(name)
    @pets[:dogs] << dog
  end

  def play_with_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |fish|
      fish.mood = "happy"
    end
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def sell_pets
     @pets.each do | type, pet_arrays |
      pet_arrays.each do |pet|
      pet.mood = "nervous"
     end
    end
    @pets.clear
  end

  def list_pets
  #binding.pry
      "I have #{self.pets[:fishes].count} fish, #{self.pets[:dogs].count} dog(s), and #{self.pets[:cats].count} cat(s)."
   end


end
