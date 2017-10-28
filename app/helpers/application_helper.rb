module ApplicationHelper
  def numofcases(instance)
    return ((instance.per_page * instance.current_page) + " / " + instance.total_count)
  end
end
