module FlashHelper
  def flash_alert(msg)
    flash_msg(msg, 'flash alert')
  end

  def flash_notice(msg)
    flash_msg(msg, 'flash notice')
  end

  def flash_msg(msg, class_name)
    content_tag :p, msg, class: class_name
  end
end
