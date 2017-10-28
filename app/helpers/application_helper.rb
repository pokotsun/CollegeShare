module ApplicationHelper
  # 引数のコメントが誰の手によるものかで表示を変更
  def make_comment(comment)
    if current_user.id == comment.user.id then
      render partial: 'layouts/own_comment', locals: {comment: comment}
    else
      render partial: 'layouts/other_comment', locals: {comment: comment}
    end
  end
end
