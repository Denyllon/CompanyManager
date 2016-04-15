module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def link_to_back(*params)
    session[:return_to] = request.original_fullpath
    link_to(*params)
  end

end
