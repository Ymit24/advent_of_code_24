def aoc2_pt1
  File.open 'aoc2_input.txt' do |file|
    scores = file.readlines.map { |line| line.split(' ').map(&:to_i) }.map do |report|
      distance_checks = report.each_cons(2).map do |x, y|
        dist = (x - y).abs
        dist >= 1 && dist <= 3
      end

      all_asc = report.each_cons(2).map { |x, y| x > y }.all?
      all_dsc = report.each_cons(2).map { |x, y| x < y }.all?

      distance_checks.all? && (all_asc || all_dsc) ? 1 : 0
    end

    puts scores.sum
  end
end

def aoc2_pt2
  File.open 'aoc2_input.txt' do |file|
    scores = file.readlines.map { |line| line.split(' ').map(&:to_i) }.map do |report|
      puts "report: #{report}"

      possible_scores = (0..report.length).map do |i|
        possible_report = report.take(i).concat(report.drop(i + 1))
        puts possible_report.inspect
        evaluate_report_pt2 possible_report
      end

      puts 'possible scores: ', possible_scores.inspect
      possible_scores.sum.positive? ? 1 : 0
    end

    puts 'final scores: ', scores.sum
  end
end

def evaluate_report_pt2(report)
  distance_checks = report.each_cons(2).map do |x, y|
    dist = (x - y).abs
    dist >= 1 && dist <= 3
  end

  all_asc = report.each_cons(2).map { |x, y| x > y }.all?
  all_dsc = report.each_cons(2).map { |x, y| x < y }.all?

  distance_checks.all? && (all_asc || all_dsc) ? 1 : 0
end

aoc2_pt2
