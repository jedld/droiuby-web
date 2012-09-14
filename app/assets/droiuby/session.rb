def on_create
  
  V('#submit').on(:click) do |v|
    login_form = V('#form_fields')

    login_form.form_fields

    async.perform {
      http_get "asset:hello_world/_hello_world.xml"
    }.done { |result|
      V('#hello_world_section').inner = result
    }.start
  end
end