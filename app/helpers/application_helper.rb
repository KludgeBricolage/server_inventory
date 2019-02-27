module ApplicationHelper
  def active_current_path(path)
    "active" if current_page? path
  end
end
