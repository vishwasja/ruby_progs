require './source/substance'
require './source/metal'
require './source/dirt'

class SubstanceSeparator

  def initialize substances
    @substances = substances
  end

  def get_metal
    metal = @substances.last unless @substances.last.is_a?(Dirt)
    metal if (metal and !validate_metal(metal).empty?)
  end

  def get_metal_obj
    metal = @substances.last unless @substances.last.is_a?(Dirt)
    metal if (metal and !validate_metal_obj(metal).empty?)
  end

  def get_all_dirts
    dirt = @substances - [(@substances.last.is_a?(Metal)? get_metal_obj : get_metal)]
    dirt unless get_valid_dirt(dirt).empty?
  end

  def validate_metal(metal)
    Metal::VALID_METALS & [metal.downcase]
  end

  def validate_metal_obj(metal)
    Metal::VALID_METALS & [metal.name.downcase]
  end

  def get_valid_dirt(dirt)
    Dirt::VALID_DIRTS & dirt.collect{|d| d.name if d.is_a?(Dirt)}
  end
end