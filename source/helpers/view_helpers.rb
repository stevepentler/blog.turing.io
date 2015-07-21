module ViewHelpers
  def format_date(date)
    date.strftime("%b %e, %Y")
  end

  def create_summary(text)
    strip_tags(text).gsub("\n", " ")[0..300] << "..."
  end

  def nav_active(page)
    current_page.path == "#{page}.html" ? 'active' : nil
  end
end
