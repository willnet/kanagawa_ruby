class Formula
  #|  ビット or
  #&  ビット and
  #+  加算
  #*  乗算
  def self.execute(input)
    array1 = input.split('*')
    array2 = array1[1].split('+')
    array3 = array2[1].split('&')
    output = eval(array3[1])
    output = eval(output.to_s + '&' + array3[0])
    output = eval(output.to_s + '+' + array2[0])
    output = eval(output.to_s + '*' + array1[0])
    output.to_s
  end
end
