module SetCopyright
  extend ActiveSupport::Concern
  
  included do
    before_action :set_copyright
  end

  def set_copyright
    @copyright = Renderer.copyright 'Marketplace', 'All rights reserved'
  end

  
  class Renderer
    def self.copyright name, msg
      "&copy; #{Time.now.year} | <b>#{name}</b> #{msg}".html_safe
    end
  end
end