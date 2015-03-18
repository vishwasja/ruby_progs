class RomanToArabicConverter

  ROMAN_INTEGER_MAP = { I: 1, V: 5, X: 10, L: 50,
                        C: 100, D: 500, M: 1000 }

  def initialize roman_val
    @roman_val = roman_val
  end

  def convert
    roman_numerals.inject(0) do |total, numeral|
      @current_numeral = numeral
      if can_subtract_numeral_from_total?
        total - numeral_to_integer
      else
        total + numeral_to_integer
      end
    end
  end

  private

  def roman_numerals
    @roman_numerals ||= @roman_val.split('')
  end

  def can_subtract_numeral_from_total?
    has_next_numeral? &&
        is_next_numeral_greater?
  end

  def has_next_numeral?
    !@current_numeral.equal?(roman_numerals.last)
  end

  def is_next_numeral_greater?
    numeral_to_integer < numeral_to_integer(next_numeral)
  end

  def next_numeral
    roman_numerals[(roman_numerals.index { |n| n.equal? @current_numeral } + 1)]
  end

  def numeral_to_integer(numeral = @current_numeral)
    ROMAN_INTEGER_MAP[numeral.to_sym]
  end

end