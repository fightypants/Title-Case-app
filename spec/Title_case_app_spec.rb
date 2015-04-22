require('capybara/rspec')
require('./app')
require('sinatra')

Capybara.app = Sinatra::Application

describe('the title case path', {:type => :feature}) do
  it('processes the user input and returns it title cased') do
    visit('/')
    fill_in('title', {:with => 'green eggs and ham'})
    click_button('Submit')
    expect(page).to(have_content('Green Eggs and Ham'))
  end
end
