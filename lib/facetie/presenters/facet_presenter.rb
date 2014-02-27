class FacetPresenter

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper
  include ActionView::Context

  attr_accessor :view, :facet, :filter, :params, :options

  def initialize view, facet, filter, options={}
    @view = view
    @facet = facet
    @filter = filter
    @params = view.params.symbolize_keys.reject{|k,v| [:controller, :action].include?(k)}
    @options = options
  end

  def render
    raise NotImplementedError
  end

  protected

  def path *args
    @path ||= options.fetch(:path) { :url_for }
  end

  def url args
    view.send(path, args)
  end

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