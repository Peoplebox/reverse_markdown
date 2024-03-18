# frozen_string_literal: false

# Extension class for Numeric.
# If you want the Numeric class in ruby to have any new helper methods,
# then you can add them here.
class Numeric
  ALPHABET = ('a'..'z').to_a.freeze
  ROMAN_NUMBERS = {
    1000 => 'm',
    900 => 'cm', 500 => 'd', 400 => 'cd', 100 => 'c',
    90 => 'xc',  50 => 'l',  40 => 'xl',  10 => 'x',
    9 => 'ix',   5 => 'v',   4 => 'iv',   1 => 'i'
  }.freeze

  # Should return corresponding alphabet for the number
  # Started prepending alphabets when number goes over 26
  def alphabet
    str = ''
    quotient = self
    until quotient.zero?
      quotient, remender = (quotient - 1).divmod(26)
      str.prepend(ALPHABET[remender])
    end
    str
  end

  # Should return corresponding roman numeral for the number
  def roman
    n = self
    result = ''
    ROMAN_NUMBERS.each do |value, letter|
      result << letter * (n / value)
      n = n % value
    end
    result
  end
end
