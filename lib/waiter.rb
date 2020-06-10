class Waiter
  attr_accessor :name, :age
    
  @@all = []
def initialize(name, yrs_of_exp)
  @name = name
  @yrs_of_exp = yrs_of_exp
  @@all << self
end

def self.all 
  @@all
end

def new_meal(customer, total, tip)
    new_meal = Meal.new(self, customer, total, tip)
  end

  def meals
    # binding.pry
    Meal.all.select do |meal|
      meal.waiter == self
  # returns an Array of Meal instances associated with this customer
      # the waiter needs a way to get all the meals they have served
    end
  end

  # returns the Customer instance associated with the meal that received the largest tip
  def best_tipper(tip = 0)
    # binding.pry
   best_tip =  meals.max do |meal_a, meal_b|
    meal_a.tip <=> meal_b.tip
      end
        best_tip.customer 
  end
end 



  
