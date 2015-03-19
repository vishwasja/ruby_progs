require './source/substance_separator'

class PriceCalculator

  def initialize intergalactic_dirts, price = nil
    @intergalactic_dirts, @price = intergalactic_dirts, price
  end

  def calculate
    @separated_substance ||= SubstanceSeparator.new(@intergalactic_dirts)
    if @separated_substance.get_all_dirts.nil?
      'I have no idea what you are talking about'
    else
      metal = @separated_substance.get_metal_obj
      metal.nil? ? dirt_count_in_integer : dirt_count_in_integer * metal.value
    end
  end

  def get_metal_object_with_price
    @separated_substance ||= SubstanceSeparator.new(@intergalactic_dirts)
    if @separated_substance.get_all_dirts.nil?
      'I have no idea what you are talking about'
    else
      metal = @separated_substance.get_metal
      unless metal.nil?
        metal_price = @price/dirt_count_in_integer.to_f
        @metal ||= Metal.new(metal,metal_price)
      end
    end
  end

  private

  def dirt_count_in_integer
    RomanToArabicConverter.new(dirt_count_in_roman).convert
  end

  def dirt_count_in_roman
    dirt_count_in_roman = ''
    @seperated_substance ||= SubstanceSeparator.new(@intergalactic_dirts)
    dirts = @seperated_substance.get_all_dirts
    dirts.each{ |dirt| dirt_count_in_roman << dirt.value if dirt.is_a?(Dirt)}
    dirt_count_in_roman
  end

end
