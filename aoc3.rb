def pt1
  File.open 'aoc3_input.txt' do |file|
    remaining = file.readline.chars

    acc = 0
    until remaining.empty?
      prod, remaining = take_mul remaining
      acc += prod
    end

    puts "final: #{acc}"
  end
end

def take_until(tokens, target)
  tokens = tokens.chars if tokens.is_a? String
  target = target.chars if target.is_a? String

  tokens.each_with_index do |_, index|
    return [tokens.take(index), tokens.drop(index)] if tokens.drop(index).take(target.length) == target
  end

  [tokens, []]
end

def take_toks(tokens, target)
  _, toks = take_until tokens, target

  toks.drop(target.length)
end

def take_tok(tokens, target)
  return tokens.drop(1) if tokens.first == target

  raise StandardError.new "expected #{target}"
end

def take_mul(tokens)
  toks = take_toks(tokens, 'mul(')

  raw_a = toks.take_while { |tok| tok.match(/[0-9]/) }
  raise StandardError.new 'expected to find number' if raw_a.empty?

  toks = toks.drop(raw_a.length)

  toks = take_tok(toks, ',')

  raw_b = toks.take_while { |tok| tok.match(/[0-9]/) }
  raise StandardError.new 'expected to find number' if raw_b.empty?

  toks = toks.drop(raw_b.length)

  toks = take_tok(toks, ')')

  a = raw_a.join.to_i
  b = raw_b.join.to_i
  [a * b, toks]
rescue StandardError => e
  # puts "Got an error: #{e}"
  [0, toks]
end

pt1
