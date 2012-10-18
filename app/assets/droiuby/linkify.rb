class linkify < Droiuby::Plugins
  def on_page_load
    V('.droiuby-link-activity').each do |view|
      view.on(:click) { |v|
        render v.data('url'), activity: true
      }
    end
    V('.droiuby-link').each do |view|
      view.on(:click) { |v|
        render v.data('url')
      }
    end
    V('.droiuby-link-app').each do |view|
      view.on(:click) { |v|
        launch v.data('url')
      }
    end
  end
end