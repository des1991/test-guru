module FlashHelper
  def flash_msg(msg, options = {})
    content_tag :p, msg.html_safe, class: options[:class_name]
  end
end
