# frozen_string_literal: true

require 'bank'
require 'bank_statement'

RSpec.describe BankStatement do
  subject(:bank_statement) { BankStatement.new(bank) }

  let(:bank) { instance_double('Bank') }

  let(:deposit) do
    1000
  end

  let(:date_today) do
    '2019-03-12'
  end

  before(:each) do
    @date = date_today
    allow(bank).to receive(:record).and_return([{ date: @date,
                                                  credit: '1000', debit: ' ', balance: '1000' }])
  end

  describe '#print' do
    it 'prints the balance' do
      expect { bank_statement.prepare_to_print }.to output("                            \n date       || credit || debit || balance \n 2019-03-12 || 1000   ||       || 1000    \n                            \n").to_stdout
    end
  end
end
