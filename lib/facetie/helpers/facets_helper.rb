module Facetie
  module Helpers
    module FacetsHelper

      def facet_item(view, facet, filter, options={})
        FacetPresenter.new(view, facet, filter, options).render
      end

    end
  end
end