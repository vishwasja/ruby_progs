require './source/roman_to_arabic_convertor'
require './source/substance_separator'
require './source/substance'
require './source/metal'
require './source/dirt'
require 'pry'

class PriceCalculator

  def initialize intergalactic_inputs, price = nil
    @intergalactic_inputs, @price = intergalactic_inputs, price
  end

  def calculate
    separated_substance ||= SubstanceSeparator.new(@intergalactic_inputs)
    dirt_count = dirt_count_in_integer
    metal = separated_substance.get_metal_obj
    metal.nil? ? dirt_count : dirt_count * metal.value
  end

  def get_metal_object_with_price
    separated_substance ||= SubstanceSeparator.new(@intergalactic_inputs)
    metal = separated_substance.get_metal
    unless metal.nil?
      metal_price = @price/dirt_count_in_integer.to_f
      @metal ||= Metal.new(metal,metal_price)
    end
  end

  private

  def dirt_count_in_integer
    RomanToArabicConverter.new(dirt_count_in_roman).convert
  end

  def dirt_count_in_roman
    dirt_count_in_roman = ''
    seperated_substance ||= SubstanceSeparator.new(@intergalactic_inputs)
    dirts = seperated_substance.get_all_dirts
    dirts.each{ |dirt| dirt_count_in_roman << dirt.value if dirt.is_a?(Dirt)}
    dirt_count_in_roman
  end

end
