module Ecm::CommentsHelper
  def comment_content_for_display(comment)
    if comment.spam?
      return content_tag(:span, :class => "spam") do I18n.t('ecm.comments.replacements.spam') end
    end
    
    if comment.offensive?
      return content_tag(:span, :class => "offensive") do I18n.t('ecm.comments.replacements.offensive') end
    end
    
    return comment.content
  end
end
