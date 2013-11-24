require 'bundler'
require 'set'

Bundler::GemHelper.install_tasks

desc "Build dictionary"
task :build_dictionary do
  require 'pn-hipster-ipsum'
  dictionary = {}
  File.readlines( './dictionaries/hipster.txt' ).each do |word|
    letters = word.split('')
    sequence = ''
    letter_index = 0
    until letters.empty?
      dictionary[ sequence ] ||= {}
      dictionary[ sequence ][ letter_index ] ||= {}
      dictionary[ sequence ][ letter_index ][ letters.first ] ||= 0
      dictionary[ sequence ][ letter_index ][ letters.first ] += 1
      sequence += letters.shift
      sequence = sequence[1..-1] while sequence.size > Ipsum::SEQUENCE_SIZE
      letter_index += 1
    end
  end
  dictionary[ '' ][0].delete( "\n" )
  p dictionary
end

task :extract_words do
  require 'pn-hipster-ipsum'
  f = File.open('./dictionaries/hipster-raw.txt')
  dictionary = Set.new []
  f.each_line do |line|
    words = line.gsub('.', '').gsub(',','').split(' ')
    dictionary = dictionary.merge words
  end

  dictionary.sort.each { |word| puts word }
end
