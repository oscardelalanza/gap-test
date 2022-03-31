def format_duration(seconds)
  multiplier = [1, 60, 60 * 60, 60 * 60 * 24, 60 * 60 * 24 * 30, 60 * 60 * 24 * 30 * 12].reverse
  words = %w[seconds minutes hours days months years].reverse
  values = Array.new(multiplier.length, 0)

  multiplier.each_with_index do |m, i|
    next if seconds < m

    values[i] = seconds / m
    seconds -= values[i] * m
  end

  if values.all? 0
    puts 'now'
  else
    string = ''
    values.each_with_index do |v, i|
      next if v.zero?

      string += "#{v} #{words[i]} "
    end
    puts string
  end
end

format_duration(0) # now
format_duration(57) # 57 seconds
format_duration(62) # 1 minute 2 seconds
format_duration(3662) # 1 hour x minutes n seconds
format_duration(31_536_001)
format_duration(31_536_21)
format_duration(38_547_671)
