module ArticleHelper
  def markdown(text)
    markdown = Redcarpet::Markdown.new(RougeRender, fenced_code_blocks: true)
    markdown.render(text).html_safe
  end
end