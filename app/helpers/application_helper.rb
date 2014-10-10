module ApplicationHelper
  
  def page_title (t)
    base = "Tasker"
    if t.empty?
      base
    else
      "#{base} | #{t}"
    end
  end
  
end
