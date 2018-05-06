# Does not extend ApplicationModel as not stored in database
class FoodOccurrences

  Occurrence = Struct.new(:name, :count)

  def initialize(day_numbers:)
    @day_numbers = day_numbers
  end

  def occurrences
    days
      .flat_map(&method(:food_names_for_day))
      .group_by(&:itself)
      .map { |name, repeats| Occurrence.new(name, repeats.count) }
      .sort_by(&:count)
      .reverse!
  end

private

  def days
    Day.where(number: @day_numbers).includes meals: :foods
  end

  def food_names_for_day(day)
    day.meals.flat_map { |meal| meal.foods.pluck(:name) }
  end

end
