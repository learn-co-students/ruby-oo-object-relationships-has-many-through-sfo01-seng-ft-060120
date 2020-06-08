require 'pry'

class Waiter

    attr_reader :name, :yrs_experience

    @@all = []

    def initialize(waiter_name, yrs_experience) # initializes with a name and years of experience
        @name = waiter_name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all # is class method that returns the contents of @@all
        @@all
    end

    def new_meal(customer, total, tip) # initializes a meal using the current Waiter instance, a provided Customer instance and a total and tip
        Meal.new(self, customer, total, tip)
    end

    def meals # returns an Array of Meal instances associated with this waiter
        Meal.all.find_all { |meal| meal.waiter == self }
    end

    def best_tipper # returns the Customer instance associated with the meal that received the largest tip
        best_tipped_meal = meals.max { |meal_a, meal_b| meal_a.tip <=> meal_b.tip }
        best_tipped_meal.customer
    end
end