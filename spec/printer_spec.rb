# frozen_string_literal: true

require 'printer'


RSpec.describe Printer do
  let(:printer) { described_class.new(bank_statement) }
  let(:bank_statement) { double :bank_statement }
  let(:bank) { double :bank }

  before(:each) do
    @date_now = 2019 - 0o3 - 12
    allow(bank).to receive(:date_today).and_return(@date_now)
  end

  describe '#print' do
    it 'prints bank statements' do
      allow(bank_statement).to receive(:prepare_to_print).and_return("                            \n date       || credit || debit || balance \n 12/03/2019 || 1000   ||       || 1000    \n                            \n")
      expect { print(printer.print) }.to output("                            \n date       || credit || debit || balance \n 12/03/2019 || 1000   ||       || 1000    \n                            \n").to_stdout
    end
  end
end
