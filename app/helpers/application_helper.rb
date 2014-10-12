module ApplicationHelper
  def title(page_title)
    content_for(:title) { page_title }
  end

  def description(page_description)
    content_for(:description) { page_description }
  end

  def markdown_to_html(markdown_text)
    # Converts remaining Markdown syntax to html tags using Kramdown.
    require 'kramdown'
    html = Kramdown::Document.new(markdown_text, auto_ids: false).to_html

    # Sets up whitelist of allowed html elements, attributes, and protocols.
    allowed_elements = ['h2', 'h3', 'a', 'p', 'ul', 'ol', 'li', 'strong', 'em',
      'cite', 'blockquote', 'code', 'pre', 'dl', 'dt', 'dd', 'br', 'hr', 'sup']
    allowed_attributes = { 'a' => ['href', 'rel', 'rev', 'class'],
      'sup' => ['id'], 'li' => ['id'], 'h2' => ['id'], 'h3' => ['id'] }
    allowed_protocols = { 'a' => {'href' => ['#fn', '#fnref', 'http', 'https',
      'mailto', :relative]}}

    # Cleans the text of any unwanted html tags.
    require 'sanitize'
    Sanitize.clean(html, elements: allowed_elements,
      attributes: allowed_attributes, protocols: allowed_protocols)
  end

  def illustrated_markdown_to_html(illustratable_type, illustratable, markdown_text)
    require 'kramdown'
    require 'sanitize'
    require 'nokogiri'
    
    # Converts Markdown syntax to html tags using Kramdown.
    html = Kramdown::Document.new(markdown_text, auto_ids: true).to_html
 
    # Sets up whitelist of allowed html elements, attributes, and protocols.
    allowed_elements = ['h2', 'h3', 'a', 'img', 'p', 'ul', 'ol', 'li', 'strong', 'em', 'cite', 
      'blockquote', 'code', 'pre', 'dl', 'dt', 'dd', 'br', 'hr', 'sup', 'div']
    allowed_attributes = {'a' => ['href', 'rel', 'rev', 'class'], 'img' => ['src', 'alt'], 
      'sup' => ['id'], 'div' => ['class'], 'li' => ['id'], 'h2' => ['id'], 'h3' => ['id']}
    allowed_protocols = {'a' => {'href' => ['#fn', '#fnref', 'http', 'https', 'mailto', :relative]}}
    
    # Clean text of any unwanted html tags.
    html = Sanitize.clean(html, elements: allowed_elements,
      attributes: allowed_attributes, protocols: allowed_protocols)

    html = Nokogiri::HTML.parse(html)
    
    # Sets correct src, width, and height attributes for the illustration.
    html.css('img').each do |img|
      file_name = img.get_attribute('src')
      if illustration = Illustration.where(illustratable_id: illustratable.id, 
          illustratable_type: illustratable_type, illustration_file_name: file_name).first
        img.set_attribute('src', illustration.illustration.url(:embedded))
        image_file = Paperclip::Geometry.from_file(illustration.illustration.path(:embedded))
        img.set_attribute('width', image_file.width.to_i.to_s)
        img.set_attribute('height', image_file.height.to_i.to_s)
        img.set_attribute('class', 'illustration')
      else
        img.set_attribute('src', '')
      end
    end

    # Converts nokogiri variable to html.
    html = html.to_html    
    
    # Sanitize html of extra markup that Nokogiri adds.
    allowed_attributes['img'] += ['id', 'width', 'height', 'class']
    Sanitize.clean(html, elements: allowed_elements, attributes: allowed_attributes, 
      protocols: allowed_protocols)
  end
end
