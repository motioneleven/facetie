class FacetPresenter

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Context

  attr_accessor :view, :facet, :filter, :params, :options

  def initialize view, facet, filter, options={}
    @view = view
    @facet = facet
    @filter = filter
    @params = view.params.symbolize_keys
    @options = options
  end

  def render
    raise NotImplementedError
  end

  protected

  def text
    @text ||= options.fetch(:text, facet.value)
  end

  def count
    @count ||= options.fetch(:count, facet.count)
  end

  def value
    @value ||= options.fetch(:value, facet.value)
  end

  def selected_facet_item
    facet_remove_tag + text
  end

  def facet_item_link
    facet_count_tag + facet_link_tag
  end

  def facet_count_tag
    content_tag(:span, count, class: 'badge')
  end

end