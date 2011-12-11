module ApplicationHelper
  def coderay text, language = :bash
    CodeRay.scan(text, language).div.html_safe
  end
end
