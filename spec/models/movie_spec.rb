require 'spec_helper'

describe Movie do
  describe 'searching similar directors' do
    it 'should call Movie with director' do
      Movie.should_receive(:with_same_director).with('Star Wars')
      Movie.with_same_director('Star Wars')
    end
  end
end
