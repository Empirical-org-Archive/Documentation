module BreadcrumbsHelper
  def breadcrumbs
    parents = if !@item[:parents] || @item[:parents].length == 0 
      if @item[:github] then ['Docs'] else [] end
    else
      @item[:parents]
    end

    items = parents.map do |parent|
      attrs = { id: '/' + parent, name: parent }
      attrs[:id] = '/' if parent == 'Docs'
      attrs
    end

    items << { current: true, name: @item[:filename] }
    items
  end
end
