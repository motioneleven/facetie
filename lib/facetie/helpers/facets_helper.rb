module Facetie
  module Helpers
    module FacetsHelper

      def facet_item(view, facet, filter, options={})
        if options[:multiple]
          Facets::MultiplePresenter.new(view, facet, filter, options).render
        else
          Facets::SinglePresenter.new(view, facet, filter, options).render
        end
      end

    end
  end
end