# coding: utf-8
class Formula
  #|  ビット or
  #&  ビット and
  #+  加算
  #*  乗算
  def self.execute(input)
    multiplied = multiply(input)
    output = multiplied.map do |m| # ['4', '5+6&7|8']
      plused = plus(m)
      plused.map do |pl| # ['5', '6&7|8']
        anded = do_and(pl)
        anded.map do |a|
          eval(a)
        end.map(&:to_i).inject(:&)
      end.map(&:to_i).inject(:+)
    end.map(&:to_i).inject(&:*)
    output.to_s
  end

  def self.multiply(input)
    input.split('*')
  end

  def self.plus(input)
    input.split('+')
  end

  def self.do_and(input)
    input.split('&')
  end

  def self.do_or(input)
    input.split('|')
  end
end
