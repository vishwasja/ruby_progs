require 'spec_helper'

describe RomanToArabicConverter do

  context 'convert' do
    context 'should convert only valid roman numbers to integer' do

      it 'should return integer equivalent of roman number' do
        expect(RomanToArabicConverter.new('IV').convert).to eq 4
        expect(RomanToArabicConverter.new('DXCVI').convert).to eq 596
        expect(RomanToArabicConverter.new('MDCLX').convert).to eq 1660
        expect(RomanToArabicConverter.new('CCLXXVII').convert).to eq 277
      end
    end

    context 'should not convert invalid roman number' do

      it 'should raise exception for invalid roman number'do
        expect{RomanToArabicConverter.new('1234').convert}.to raise_error(RomanNumeralError)
        expect{RomanToArabicConverter.new('DDC').convert}.to raise_error(RomanNumeralError)
        expect{RomanToArabicConverter.new('ASdF').convert}.to raise_error(RomanNumeralError)
      end
    end

  end

end