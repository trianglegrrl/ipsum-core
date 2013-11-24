require 'set'
f = File.open('hipster.txt')

dictionary = Set.new []
f.each_line do |line|
  words = line.gsub('.', '').gsub(',','').split(' ')
  dictionary = dictionary.merge words
end

dictionary.sort.each { |word| puts word }
