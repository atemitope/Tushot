class Detector
  def browser_detection(args)
    result = args
    browser_compatible = 'unknown'
    if result =~ /Safari/
      unless result =~ /Chrome/
        return 'Safari'
      else
        return 'Chrome'
      end
    elsif result =~ /Firefox/
      return 'Firefox'
    elsif result =~ /Opera/
      return 'Opera'
    elsif result =~ /MSIE/
      return 'Microsoft Internet Explorer'
    end
    browser_compatible
  end
end