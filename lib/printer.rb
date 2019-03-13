# frozen_string_literal: true

#:nodoc:
class Printer
  def initialize(bank_statement)
    @bank_statement = bank_statement
  end

  def print
    @bank_statement.prepare_to_print
  end
end
