require "facetie/version"
require "facetie/presenters/facet_presenter"
require "facetie/presenters/facets/single_presenter"
require "facetie/presenters/facets/multiple_presenter"
require "facetie/helpers/facets_helper"

module Facetie
end

require 'facetie/railtie' if defined?(Rails)