module CommentsHelper
  def sanitizeComment(content)
    sanitize(content, tags: %(p, sup, sub, s, u, em, strong, a))
  end
end
