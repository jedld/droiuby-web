def on_create
  V('.config-url').each do |view|
    view.on(:click) { |v|
      launch v.data('url')
    }
  end
end