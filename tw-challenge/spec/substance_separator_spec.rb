require 'spec_helper'

describe SubstanceSeparator do

  before(:all) do
    @substances = [ Dirt.new('glob', 'I'),
                    Dirt.new('prok', 'V'),
                    Dirt.new('pish', 'X'),
                    Dirt.new('tegj', 'L'),
                    'Silver']
  end

  context 'get metal from substances' do
    it 'should get silver metal' do
      metal = SubstanceSeparator.new(@substances).get_metal
      expect(metal).to eq 'Silver'
    end

    it 'should not get invalid metal'do
      @substances.pop << 'Bronze'
      metal = SubstanceSeparator.new(@substances).get_metal
      expect(metal).not_to eq 'Bronze'
      expect(metal).to eq nil
    end
  end

  context 'get all dirts' do
    it 'should get all the dirts from substances'do
      dirts = SubstanceSeparator.new(@substances).get_all_dirts
      expect(dirts.collect(&:name)).to eq ['glob', 'prok', 'pish', 'tegj']
    end

    it 'should not get invalid dirts from substances'do
      @substances + ['wood', 'woodchuck']
      dirts = SubstanceSeparator.new(@substances).get_all_dirts
      expect(dirts.collect(&:name)).to eq ['glob', 'prok', 'pish', 'tegj']
      expect(dirts.collect(&:name)).not_to include('wood')
    end

    it 'should not get invalid dirts from substances'do
      @substances = [ Dirt.new('wood', 'I'), Dirt.new('woodchuck','V')]
      dirts = SubstanceSeparator.new(@substances).get_all_dirts
      expect(dirts).to eq nil
    end
  end

end