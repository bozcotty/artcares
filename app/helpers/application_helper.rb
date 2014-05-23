module ApplicationHelper

  def markdown(text)
    renderer = Redcarpet::Render::HTML.new
    extensions = {no_links:true, hard_wrap: true}
    redcarpet = Redcarpet::Markdown.new(renderer, extensions)
    (redcarpet.render text).html_safe
  end

  
  
end
