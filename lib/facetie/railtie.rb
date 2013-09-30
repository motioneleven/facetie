module Facetie
  class Railtie < Rails::Railtie
    initializer "facetie.view_helpers" do
      ActionView::Base.send :include, Helpers::FacetsHelper
    end
  end
end