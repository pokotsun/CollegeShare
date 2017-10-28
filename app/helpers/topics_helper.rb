module TopicsHelper
  def make_comment(comment)
    if current_user.id == comment.user.id
      render partial: 'topics/own_comment', locals: {comment: comment}
    else
      render partial: 'topics/other_comment', locals: {comment: comment}
    end
  end
end
