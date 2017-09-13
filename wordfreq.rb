require 'pry'

class Wordfreq
  STOP_WORDS = ['a', 'an', 'and', 'are', 'as', 'at', 'be', 'by', 'for', 'from',
    'has', 'he', 'i', 'in', 'is', 'it', 'its', 'of', 'on', 'that', 'the', 'to',
    'were', 'will', 'with']

  def initialize(filename)
    @document = File.read(filename).downcase.gsub(/[^a-z0-9\s]/i, ' ')
  end

  def frequency(word)
    count = @document.scan " " + word + " "
    count.size
  end

  def frequencies
    all_frequencies = {}
    all_words = @document.split()
    all_words.each do |word|
      all_frequencies[word] = frequency(word)
    end
    return all_frequencies
  end

  def top_words(number)
    bad_words = @document.split(' ').delete_if {|word| STOP_WORDS.include?(word)}
    # p @document.methods.sort
  end

  def print_report
  end
end

if __FILE__ == $0
  filename = ARGV[0]
  if filename
    full_filename = File.absolute_path(filename)
    if File.exists?(full_filename)
      wf = Wordfreq.new(full_filename)
      wf.print_report
    else
      puts "#{filename} does not exist!"
    end
  else
    puts "Please give a filename as an argument."
  end
end
