class FacetPresenter

  include ActionView::Helpers::TagHelper
  include ActionView::Helpers::UrlHelper

  attr_accessor :facet, :filter, :url, :params, :options

  def initialize facet, filter, url, params, options
    @facet = facet
    @filter = filter
    @url = url
    @params = params
    @options = options
  end

  def render
    facet = (active? ? selected_facet_item : facet_item_link)
    content_tag(:li, facet, class: 'facet-item')
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

  private

  def active?
    params[filter] == value
  end

  def selected_facet_item
    facet_remove_tag + text
  end

  def facet_item_link
    facet_count_tag + facet_link_tag
  end

  def facet_remove_tag
    content_tag(:span, class: 'facet-remove') do
      link_to(icon_tag('remove'), Rails.application.routes.url_helpers.send(url, params.merge(filter => nil)), class: 'facet-link')
    end
  end

  def facet_count_tag
    content_tag(:span, count, class: 'badge')
  end

  def facet_link_tag
    link_to(text, Rails.application.routes.url_helpers.send(url, params.merge(filter => value)), class: 'facet-link')
  end

end