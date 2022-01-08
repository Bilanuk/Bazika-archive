module ApplicationHelper
  def flash_class(level)
    bootstrap_alert_class = {
      "success" => "alert-success",
      "error" => "alert-danger",
      "notice" => "alert-info",
      "alert" => "alert-danger",
      "warning" => "alert-warning"
    }
    bootstrap_alert_class[level]
  end
end
