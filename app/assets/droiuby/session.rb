def on_create
  V('#submit').on(:click) do |v|
    login_form = V('#login_form')
    url = "#{login_form.data('url')}?#{login_form.form_fields.to_query}"
    puts "rendering #{url} ..... "
    render url, method: :post
  end
end