require('sinatra')
require('sinatra/reloader')
require('pry')

class String
  define_method(:title_case) do
    black_list = ["a", "and", "to", "the", "for", "in"]
    words = self.split(' ')
    first_word = words.shift
    words.each do |word|
      if black_list.include?(word.downcase())
        word.downcase()
      else
        word.capitalize!
      end
    end
    first_word.capitalize!() + " " + words.join(' ')
  end
end

get('/') do
  erb(:form)
end

get('/Titlized') do
  @title = (params.fetch('title')).title_case()
  erb(:Titlized)
end
