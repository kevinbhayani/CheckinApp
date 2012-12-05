# features/support/capybara_headers.rb:

module CapybaraHeadersHelper
  def add_headers(headers)
    headers.each do |name, value|
          page.driver.browser.header(name, value)
    end
  end
end
World(CapybaraHeadersHelper)
