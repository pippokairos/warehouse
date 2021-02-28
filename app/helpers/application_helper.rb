module ApplicationHelper
  def flash_messages(opts = {})
    flash.each do |type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(type)}", role: "alert") do 
        concat content_tag(:button, "x", class: "close", data: { dismiss: "alert" })
        concat message 
      end)
    end
    nil
  end

  def bootstrap_class_for(type)
    case type.to_sym
    when :notice
      "alert-info"
    when :success
      "alert-success"
    when :error
      "alert-danger"
    when :alert
      "alert-warning"
    end
  end
end
