# frozen_string_literal: true

#:nodoc:
class BankStatement
  def initialize(bank)
    @bank = bank
  end

  def print
    make_columns
    write_divider
    write_header
    # write_divider
    @bank.record.each { |h| write_line(h) }
    write_divider
  end

  def make_columns
    # column titles
    col_labels = { date: 'date', credit: 'credit',
                   debit: 'debit', balance: 'balance' }
    @columns = col_labels.each_with_object({}) do |(col, label), h|
      h[col] = { label: label,
                 width: [@bank.record.map { |g| g[col].size }.max, label.size].max }
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
