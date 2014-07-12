module BreadcrumbsHelper
  def breadcrumbs
    parents = if @item[:parents].length == 0 || !@item[:parents]
      ['Docs']
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
