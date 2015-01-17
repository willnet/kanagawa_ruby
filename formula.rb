# coding: utf-8
class Formula
  #|  ビット or
  #&  ビット and
  #+  加算
  #*  乗算
  def self.execute(input)
    culc(input, :*) do |m|
      culc(m, :+) do |pl|
        culc(pl, :&) do |a|
          culc(a, :|)
        end
      end
    end.to_s
  end

  def self.culc(input, operator)
    input.split(operator.to_s).map do |m|
      if block_given?
        yield m
      else
        eval(m)
      end
    end.inject(&operator)
  end
end
