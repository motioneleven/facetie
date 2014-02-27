module Facets
  class Facets::MultiplePresenter < FacetPresenter

    def render
      facet = (active? ? selected_facet_item : facet_item_link)
      content_tag(:li, facet, class: 'facet-item')
    end

    private

    def active?
      params[filter] and params[filter].include?(value)
    end

    def facet_link_tag
      link_to(text, url(params.merge(filter => ((params[filter] || []) + [value]))), class: 'facet-link')
    end

    def facet_remove_tag
      content_tag(:span, class: 'facet-remove') do
        link_to(content_tag(:i, nil, class: 'icon-remove'), url(params.merge(filter => (params[filter] - [value]))), class: 'facet-link')
      end
    end

  end
end