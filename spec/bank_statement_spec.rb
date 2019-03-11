# frozen_string_literal: true

require 'bank'
require 'bank_statement'

RSpec.describe BankStatement do
  before(:each) do
    bank = double('Bank', balance: 1000)
    let(:bank_statement) { described_class.new(bank) }

    describe '#print' do
      it 'prints the balance' do
        expect(bank_statement.print).to include(1000)
      end
    end
  end
end
