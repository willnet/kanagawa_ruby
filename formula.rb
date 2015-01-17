# coding: utf-8
class Formula
  #|  ビット or
  #&  ビット and
  #+  加算
  #*  乗算
  def self.execute(input)
    multiply(input) do |m|
      plus(m) do |pl|
        do_and(pl) do |a|
          eval(a).to_i
        end
      end
    end.to_s
  end

  def self.multiply(input)
    input.split('*').map do |m|
      yield m
    end.inject(&:*)
  end

  def self.plus(input)
    input.split('+').map do |p|
      yield p
    end.inject(&:+)
  end

  def self.do_and(input)
    input.split('&').map do |a|
      yield a
    end.inject(&:&)
  end
end
