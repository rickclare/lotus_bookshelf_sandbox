# spec/web/features/list_books_spec.rb
require 'features_helper'

RSpec.feature 'List books' do
  scenario 'display each book on the page' do
    visit '/books'

    within '#books' do
      expect(page).to have_css('.book', count: 2), 'Expected to find 2 books'
    end
  end
end
