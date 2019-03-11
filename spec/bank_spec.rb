# frozen_string_literal: true

require 'bank'

RSpec.describe Bank do
  let(:bank) { described_class.new }

  describe '#deposit' do
    it 'can add to balance' do
      bank.deposit(1000)
      expect(bank.balance).to eq(1000)
    end
  end
end
