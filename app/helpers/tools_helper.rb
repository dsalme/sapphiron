module ToolsHelper
  def sort_link(column:, label:)
    if column == params[:column]
      link_to(label, list_tools_path(column:, direction: next_direction))
    else
      link_to(label, list_tools_path(column:, direction: 'asc'))
    end
  end

  def next_direction
    params[:direction] == 'asc' ? 'desc' : 'asc'
  end
end
