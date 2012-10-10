def on_create

  V('.droiuby-link-activity').each do |view|
    view.on(:click) { |v|
      render v.data('url'), new_activity: true
    }
  end

  V('#submit').on(:click) do |v|
    login_form = V('#login_form')
    url = "#{login_form.data('url')}?#{login_form.form_fields.to_query}"
    puts "rendering #{url} ..... "
    render url, method: :post
  end
end