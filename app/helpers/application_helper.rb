module ApplicationHelper
  def numofcases(instance)
    total = instance.total_count
    min = instance.offset_value + 1
    max = instance.length + min - 1

    return "#{total}件中#{min}~#{max}件"

  end
end
