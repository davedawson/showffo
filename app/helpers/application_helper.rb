module ApplicationHelper
  def full_title(page_title)
    base_title = "Showffo"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end

  def page_class(page_class)
    base_class = "interior"
    if page_class.empty?
      base_class
    else
      "#{page_class}"
    end
  end
end
