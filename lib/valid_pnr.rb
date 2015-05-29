def valid_pnr?(pnr:)
  pnr = pnr.split('').map { |x| x.to_i }
  pnr.delete_at(6)

  checksum = pnr.pop
  total = 0

  pnr.each_with_index do |digit,index |
    if index % 2 == 0
      val = digit * 2
      if val > 9
        val = val - 9
      end
    else
      val = digit
    end
    total += val
  end

  checking = total + checksum

  if checking % 10 == 0
    return true
  elsif checking % 10 != 0
    return false
  else
    return 'Error'
  end

end