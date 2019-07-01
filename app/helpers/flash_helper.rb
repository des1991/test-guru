module FlashHelper
  def flash_msg(msg, options = {})
    content_tag :p, msg, class: options[:class_name]
  end
end
