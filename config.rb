# Activate and configure extensions
# https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :autoprefixer do |prefix|
  prefix.browsers = "last 2 versions"
end

activate :livereload
activate :i18n
set :markdown_engine, :redcarpet

# Layouts
# https://middlemanapp.com/basics/layouts/
# Allow pretty urls without file extensions
activate :directory_indexes

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# Proxy pages
# https://middlemanapp.com/advanced/dynamic-pages/

# proxy(
#   '/this-page-has-no-template.html',
#   '/template-file.html',
#   locals: {
#     which_fake_page: 'Rendering a fake page with a local variable'
#   },
# )
helpers do
  def svg_tag(name)
    root = Middleman::Application.root
    file_path = "#{root}/source/images/#{name}.svg"
    return File.read(file_path) if File.exists?(file_path)
    '(not found)'
  end  
  # Returns the current default locale. Defaults to :'en'
  def default_locale
    @default_locale ||= :en
  end
  # Sets the current default locale. Used to set a custom default locale.
  def default_locale=(locale)
    I18n.enforce_available_locales!(locale)
    @default_locale = locale && locale.to_sym
  end
end

configure :build do
  activate :minify_css
  activate :minify_javascript
end
