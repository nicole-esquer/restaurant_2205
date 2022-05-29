class Restaurant
  attr_reader :opening_time,
              :name,
              :dishes

  def initialize(opening_time, name)
    @opening_time = opening_time
    @name = name
    @dishes = []
  end

  def closing_time(hours)
      closing = @opening_time.to_i + hours
      "#{closing}:00"
  end

  def add_dish(dish)
    @dishes << dish
  end

  def open_for_lunch?
    @opening_time.to_i < 12
  end

  def menu_dish_names
    capitalized_dishes = []
    @dishes.each do |dish|
      capitalized_dishes << dish.upcase
    end
    capitalized_dishes
  end

  def announce_closing_time(time)
    if closing_time(time).to_i < 12
        "#{@name} will be closing at #{closing_time(time).to_i}:00AM"
      else
        "#{@name} will be closing at #{closing_time(time).to_i - 12 }:00PM"
      end
  end

end
