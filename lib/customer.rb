require 'pry'

class Customer
    attr_accessor :name, :age

    @@all = []
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all 
    @@all
  end

  def new_meal(waiter, total, tip)
    new_meal = Meal.new(waiter, self, total, tip)
  end

  # In plain English, the customer is going to look at all of the meals, and then select only the ones that belong to them
  def meals
    Meal.all.select do |meal|
      meal.customer == self
    end
  end


 #waiters returns an Array of Waiter instances associated with this customer's meals
  def waiters
    # binding.pry
    meals.map do |meal|
      meal.waiter
    end
  end


end