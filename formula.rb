# coding: utf-8
class Formula
  #|  ビット or
  #&  ビット and
  #+  加算
  #*  乗算
  def self.execute(input)
    multiplied = multiply(input)
    output = multiplied.map do |m|
      plused = plus(m)
      plused.map do |pl|
        anded = do_and(pl)
        anded.map do |a|
          eval(a).to_i
        end.inject(:&)
      end.inject(:+)
    end.inject(&:*)
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
end
