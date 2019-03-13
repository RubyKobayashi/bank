# frozen_string_literal: true

#:nodoc:
class BankStatement
  def initialize(bank)
    @bank = bank
  end

  def prepare_to_print
    make_columns
    write_divider
    write_header
    format_record_of_transactions
    write_divider
  end

  private

  def format_record_of_transactions
    @bank.record.reverse_each { |h| write_line(h) }
  end

  def make_columns
    col_labels = { date: 'date', credit: 'credit', debit: 'debit', balance: 'balance' }
    @columns = col_labels.each_with_object({}) do |(col, label), h|
      h[col] = { label: label,
                 width: [@bank.record.map { |element| element[col].size }.max, label.size].max }
    end
  end

  def write_header
    puts " #{@columns.map { |_, g| g[:label].ljust(g[:width]) }.join(' || ')} "
  end

  def write_divider
    puts  @columns.map { |_, g| ' ' * g[:width] }.join('').to_s
  end

  def write_line(h)
    str = h.keys.map { |k| h[k].ljust(@columns[k][:width]) }.join(' || ')
    puts " #{str} "
  end
end
