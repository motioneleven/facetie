module Facetie
  module Helpers
    module FacetsHelper

      def facet_item(facet, filter, options={})
        FacetPresenter.new(facet, filter, :search_orders_path, params, options).render
      end

    end
  end
end