class Dog
  def initialize(name, breed, age, bark, favorite_food)
    @name = name
    @breed = breed
    @age = age
    @bark = bark
    @favorite_foods = favorite_food
  end

  def name
    @name
  end

  def breed
    @breed
  end

  def age
    @age
  end

  def age=(new_age)
    @age = new_age
  end

  def bark
    if (@age > 3)
      return "BORK!"
    else
      return "bork!"
    end
  end

  def bark_solution
    if (@age > 3)
      return @bark.upcase
    else
      return @bark.downcase
    end
  end

  def favorite_foods
    @favorite_foods
  end

  def favorite_food?(food)
    @favorite_foods.each do |fav_food|
      if fav_food.downcase == food.downcase
        return true
      end
    end
    return false
  end
end
