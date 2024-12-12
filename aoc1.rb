def read_input file
  file.readlines.map do |line|
    line.split(" ").map { |val| val.to_i }
  end
end

def aoc1
  File.open("aoc1_input.txt") do |file|
    pairs = read_input file
    columns = [
     pairs.map { |pair| pair.first }.sort,
     pairs.map { |pair| pair.last }.sort
    ]
    distances = (0..columns.first.length-1).map do |index|
      (columns[0].at(index) - columns[1].at(index)).abs
    end
    puts "dists: #{distances.sum}"
  end
end

def aoc1_pt2
  File.open "aoc1_input.txt" do |file|
    pairs = read_input file
    first_column  = pairs.map { |pair| pair.first }.sort
    second_column = pairs.map { |pair| pair.last }.sort

    scores = first_column.map do |value|
      second_column.select { |val| val == value }.length * value
    end

    puts "Scores: #{scores}"
    puts "Total score: #{scores.sum}"
  end
end

aoc1_pt2
