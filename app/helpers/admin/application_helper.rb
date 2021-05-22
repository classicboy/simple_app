module Admin::ApplicationHelper
  def pagination collection
    paginate collection, theme: 'bootstrap4'
  end
end
