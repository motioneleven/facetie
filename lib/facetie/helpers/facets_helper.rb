module Facetie
  module Helpers
    module FacetsHelper

      # Possible options are:
      # text -> defaults to facet.value
      # count -> defaults to facet.count
      # value -> defaults to facet.value
      # path: a reference to your named route, e.g. :search_users_path. default :url_for
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