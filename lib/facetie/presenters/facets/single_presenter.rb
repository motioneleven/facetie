module Facets
  class SinglePresenter < FacetPresenter

    def render
      facet = (active? ? selected_facet_item : facet_item_link)
      content_tag(:li, facet, class: 'facet-item')
    end

    private

    def active?
      params[filter] == value
    end

    def facet_link_tag
      link_to(text, view.url_for(params.merge(filter => value)), class: 'facet-link')
    end

    def facet_remove_tag
      content_tag(:span, class: 'facet-remove') do
        link_to(content_tag(:i, nil, class: 'icon-remove'), view.url_for(params.merge(filter => nil)), class: 'facet-link')
      end
    end

  end
end