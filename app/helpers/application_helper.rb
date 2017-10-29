module ApplicationHelper
  # 引数のコメントが誰の手によるものかで表示を変更
  def make_comment(comment)
    if current_user.id == comment.user.id then
      render partial: 'layouts/own_comment', locals: {comment: comment}
    else
      render partial: 'layouts/other_comment', locals: {comment: comment}
    end
  end

  def numofcases(instance)
    total = instance.total_count
    min = instance.offset_value + 1
    max = instance.length + min - 1

    return "#{total}件中#{min}~#{max}件"

  end
end
