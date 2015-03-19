require 'spec_helper'

describe PriceCalculator do
  before(:each) do
    @glob = Dirt.new('glob', 'I')
    @prok = Dirt.new('prok', 'V')
    @pish = Dirt.new('pish', 'X')
    @tegj = Dirt.new('tegj', 'L')
  end

  context 'get_metal_object_with_price' do

    context 'should get metal object for valid metals' do
      it'should get silver metal value' do
        silver_calculator = PriceCalculator.new([@glob , @glob, 'Silver'], 34)
        @silver = silver_calculator.get_metal_object_with_price
        expect(@silver.class).to eq  Metal
        expect(@silver.name).to  eq  'Silver'
        expect(@silver.value).to eq  17
      end

      it'should get gold metal value' do
        gold_calculator = PriceCalculator.new([@glob , @prok, 'Gold'], 57800)
        @gold = gold_calculator.get_metal_object_with_price
        expect(@gold.class).to eq  Metal
        expect(@gold.name).to  eq  'Gold'
        expect(@gold.value).to eq  14450
      end

      it'should get iron metal value' do
        iron_calculator = PriceCalculator.new([@pish , @pish, 'Iron'], 3910)
        @iron = iron_calculator.get_metal_object_with_price
        expect(@iron.class).to eq  Metal
        expect(@iron.name).to  eq  'Iron'
        expect(@iron.value).to eq  195.5
      end
    end

    context 'should not get metal object for non valid metals' do
      it 'should not get bronse metal'do
        bronze_calculator = PriceCalculator.new([@glob , @glob, 'Bronze'], 34)
        @bronze = bronze_calculator.get_metal_object_with_price
        expect(@bronze).to eq nil
        end
      end

  end

  context 'should calculate price for the given input'do

    context 'should calculate price with valid dirt and metal' do
      it 'should calculate wih valid dirt'do
        calculator = PriceCalculator.new([@pish, @tegj, @glob, @glob])
        expect(calculator.calculate).to eq 42
      end

      it 'should calculate price with valid dirt and silver metal'do
        silver = Metal.new('Silver', 17)
        calculator = PriceCalculator.new([@glob, @prok, silver])
        expect(calculator.calculate).to eq 68
      end

      it 'should calculate price with valid dirt and gold metal'do
        gold = Metal.new('Gold', 14450)
        calculator = PriceCalculator.new([@glob, @prok, gold])
        expect(calculator.calculate).to eq 57800
      end

      it 'should calculate price with valid dirt and iron metal'do
        iron = Metal.new('Iron', 195.5)
        calculator = PriceCalculator.new([@glob, @prok, iron])
        expect(calculator.calculate).to eq 782
      end
    end

    context 'should not calculate price with invalid dirt or invalid metal' do
      it 'should give a error message for invalid dirt'do
        calculator = PriceCalculator.new(['wood could a woodchuck chuck if a woodchuck could chuck wood'])
        expect(calculator.calculate).to eq 'I have no idea what you are talking about'
      end
    end
  end


end