require('capybara/rspec')
require('./app/app')
require('sinatra')

Capybara.app = Sinatra::Application

describe('the title case path', {:type => :feature}) do
  it('processes the user input and returns it title cased') do
    visit('/')
    fill_in('string', {:with => 'green eggs and ham'})
    click_button('Submit')
    expect(page).to(have_content('Green Eggs and Ham'))
  end
end
