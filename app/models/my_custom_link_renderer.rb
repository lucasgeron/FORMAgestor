class MyCustomLinkRenderer < WillPaginate::ActionView::LinkRenderer
  protected

  def html_container(html)
    tag(:div, html, container_attributes)
  end

  def page_number(page)
    unless page == current_page
      link(page, page, rel: rel_value(page), class:'pagination-btn')
    else
      tag(:span, page, class:'pagination-btn-active ')
    end
  end

  def gap
    text = @template.will_paginate_translate(:page_gap) { '…' }
    %(<span class="gap">#{text}</span>)
  end

  def previous_or_next_page(page, text, classname)
    if page
      link(text, page, class: classname + ' pagination-btn')
    else
      tag(:span, text, class: classname + ' pagination-btn-disabled')
    end
  end

  def previous_page
    num = @collection.current_page > 1 && @collection.current_page - 1
    previous_or_next_page(num, @options[:previous_label], 'previous_page')
  end

  def next_page
    num = @collection.current_page < total_pages && @collection.current_page + 1
    previous_or_next_page(num, @options[:next_label], 'next_page')
  end

  def url(page)
    
    @base_url_params ||= begin
      url_params = merge_get_params(default_url_params)
      url_params[:only_path] = true
      merge_optional_params(url_params)
    end

    url_params = @base_url_params.dup
    add_current_page_param(url_params, page)

    @template.url_for(url_params)
  end
end
