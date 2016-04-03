module ApplicationHelper

  def active_class(link_path)
    current_page?(link_path) ? "active" : ""
  end

  def user_has_companies(user)
    if user.companies.count > 0
      true
    end
  end

end
