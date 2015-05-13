require 'spec_helper'

describe 'PDFConverter' do
  describe '.new' do
    context "with no filename" do
      it 'raises an error' do
        expect { PDFConverter.new()}.to raise_error
      end
    end
  end
end
