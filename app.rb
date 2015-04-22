require('sinatra')
require('sinatra/reloader')
require('pry')

class String
  define_method(:title_case) do
    words = self.split(' ')
    words.each do |word|
      word.capitalize!
    end
    words.join(' ')
  end
end

get('/') do
  erb(:form)
end

get('/Titlized') do
  @title = (params.fetch('title')).title_case()
  erb(:Titlized)
end
