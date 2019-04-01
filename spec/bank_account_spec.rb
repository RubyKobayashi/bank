# frozen_string_literal: true

require 'bank_account'

RSpec.describe BankAccount do
  let(:bank_account) { described_class.new }

  before(:each) do
    @date_now = 2019 - 0o3 - 12
    allow(bank_account).to receive(:date_today).and_return(@date_now)
  end

  describe '#deposit' do
    it 'can add to balance' do
      bank_account.deposit(1000)
      expect(bank_account.balance).to eq(1000)
    end
  end

  describe '#withdraw' do
    it 'detracts from the balance' do
      bank_account.deposit(1000)
      bank_account.withdraw(500)
      expect(bank_account.balance).to eq(500)
    end

    context 'when not enough credit' do
      it 'throws an error' do
        expect { bank_account.withdraw(500) }.to raise_error('You do not have enough credit')
      end
    end
  end

  describe '#balance' do
    it 'starts off at 0' do
      expect(bank_account.balance).to eq(0)
    end
  end

  describe '#record' do
    it 'records the date of transaction' do
      bank_account.deposit(500)
      expect(bank_account.record[0][:date].to_i).to eq(@date_now)
    end

    it 'records the type of transaction' do
      bank_account.deposit(500)
      expect(bank_account.record[0][:credit].to_i).to eq(500)
      expect(bank_account.record[0][:dedit].to_i).to eq(0)
    end

    it 'records the resulting balance from transaction' do
      bank_account.deposit(100)
      expect(bank_account.record[0][:balance].to_i).to eq(100)
    end

    it 'records a history of transactions' do
      bank_account.deposit(200)
      expect(bank_account.record[0][:balance].to_i).to eq(200)
      expect(bank_account.record[0][:credit].to_i).to eq(200)
      expect(bank_account.record[0][:debit].to_i).to eq(0)
      bank_account.withdraw(100)
      expect(bank_account.record[1][:balance].to_i).to eq(100)
      expect(bank_account.record[1][:credit].to_i).to eq(0)
      expect(bank_account.record[1][:debit].to_i).to eq(100)
    end
  end
end
