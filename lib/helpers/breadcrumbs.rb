module BreadcrumbsHelper
  def breadcrumbs
    items = (@item[:parents] || ['Docs']).map do |parent|
      attrs = { id: '/' + parent, name: parent }
      attrs[:id] = '/' if parent == 'Docs'
      attrs
    end

    items.last[:last] = true
    items
  end
end
