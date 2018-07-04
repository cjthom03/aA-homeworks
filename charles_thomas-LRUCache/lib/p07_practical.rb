require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  letter_counts = HashMap.new
  string.each_char do |char|
    if letter_counts[char]
      letter_counts[char] += 1
    else
      letter_counts[char] = 1
    end
  end

  odd_counts = 0

  letter_counts.each do |_, count|
    odd_counts += 1 unless count % 2 == 0
  end

  odd_counts < 2 ? true : false
end
