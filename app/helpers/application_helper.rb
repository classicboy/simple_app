module ApplicationHelper
  def pagination collection, theme
    paginate collection, theme: theme
  end
end
