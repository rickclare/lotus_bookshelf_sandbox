require 'features_helper'

RSpec.describe 'Visit home' do
  it 'is successful' do
    visit '/'
    expect(page.body).to have_css('header h1', text: 'Bookshelf')
  end
end
