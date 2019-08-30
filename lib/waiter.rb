class Waiter
    
    attr_reader :name, :experience
    @@all = []
    
    def self.all
        @@all
    end

    def initialize name, experience
        @name = name
        @experience = experience
        self.class.all << self
    end

    def new_meal(customer, total, tip=0)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select { |meal| meal.waiter == self }
    end

    def best_tipper
        meals.max_by { |meal| meal.tip }.customer
    end

end