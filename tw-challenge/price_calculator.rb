class Substance

  attr_accessor :name, :value

  def initialize name, value
    @name, @value = name, value
  end
end

class Dirt < Substance

  VALID_DIRT = ['glob', 'prok', 'pish', 'tegj']
end

class Metal < Substance

  VALID_METAL = ['Silver', 'Gold', 'Iron']
end

class SubstanceSeparator
  attr_accessor :substances

  def initialize substances
    @substances = substances
  end


end

class PriceCalculator

  attr_accessor :intergalactic_inputs, :price

  def initialise intergalactic_inputs, price = nil
    @intergalactic_inputs, @price = intergalactic_inputs, price
  end

  def calculate
    dirt_count = dirt_count_in_integer
    metal.present? ? dirt_count * metal.value : dirt_count
  end

  def dirt_count_in_integer
    RomanToArabic(dirt_count_in_roman)
  end

  def dirt_count_in_roman

  end

end


class RomanToArabicConverter

  attr_accessor :roman_val

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


a = RomanToArabicConverter.new('MMMMMDCLXXXXI')
puts a.convert



#
# @glob = Dirt.new('glob', 'I')
# @prok = Dirt.new('prok', 'V')
# @pish = Dirt.new('pish', 'X')
# @tegj = Dirt.new('tegj', 'L')
#
# PriceCalculator.new([@glob, @glob, 'Silver'], 34)
#
# calculator1 = PriceCalculator.new([@glob, @prok, 'Silver'])
#
# calculator1.calculate
#
#
# "glob glob silver"
#
#
#
