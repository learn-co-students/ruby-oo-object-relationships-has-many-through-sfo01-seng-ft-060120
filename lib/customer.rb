require 'pry'

class Customer
    
    attr_reader :name, :age

    @@all = []

    def initialize(customer_name, customer_age) # initializes with a name and age
        @name = customer_name
        @age = customer_age
        @@all << self
    end
    
    def self.all # is class method that returns the contents of @@all
        @@all
    end

    def new_meal(waiter, total, tip) # initializes a meal using the current Customer instance, a provided Waiter instance and a total and tip
        Meal.new(waiter, self, total, tip)
    end
    
    def meals # returns an Array of Meal instances associated with this customer
        Meal.all.find_all { |meal| meal.customer == self }
    end
    
    def waiters # returns an Array of Waiter instances associated with this customer's meals
        meals.map { |meal| meal.waiter }
    end
  
end