class Meal

    attr_reader :waiter, :customer, :total, :tip

    @@all = []

    def initialize(waiter, customer, total, tip) # initializes with a waiter, a customer, a total and a tip
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        @@all << self
    end

    def self.all # is class method that returns the contents of @@all
        @@all
    end

end