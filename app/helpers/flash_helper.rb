module FlashHelper
  def flash_msg(msg, class_name)
    content_tag :p, msg, class: class_name
  end
end
