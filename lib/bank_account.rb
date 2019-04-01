# frozen_string_literal: true

#:nodoc:
class BankAccount
  attr_reader :record

  def initialize
    @balance = 0
    @record = []
  end

  def deposit(amount)
    @balance += amount
    record_deposit_transaction(amount)
  end

  def withdraw(amount)
    raise 'You do not have enough credit' if not_enough_credit?(amount)
    @balance -= amount
    record_withdrawal_transaction(amount)
  end

  def balance
    @balance
  end

  private

  def date_today
    Time.now.strftime('%d/%m/%Y')
  end

  def record_deposit_transaction(amount)
    @record.push(date: date_today.to_s,
                 credit: amount.to_s, debit: ' ', balance: @balance.to_s)
  end

  def record_withdrawal_transaction(amount)
    @record.push(date: date_today.to_s,
                 credit: ' ', debit: amount.to_s, balance: @balance.to_s)
  end

  def not_enough_credit?(amount)
    (@balance - amount).negative?
  end
end
