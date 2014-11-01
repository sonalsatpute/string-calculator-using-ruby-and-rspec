class StringCalculator

  def add string 
    return 0 if string.empty?
    @string = string

    extract_delimiter
    extract_numbers
    handel_negative_numbers
    sum_numbers
  end

  private

  def extract_delimiter
    @delimiter, @string = $1, $2 if @string =~ /^\/\/(.)\n(.*)/  
    @delimiter ||= ','
  end

  def extract_numbers
    @numbers = @string.split(Regexp.new("[\n#{@delimiter}]")).collect(&:to_i)
  end

  def handel_negative_numbers 
    negatives = @numbers.select { |n| n < 0 }
    raise StandardError, "negative not allowed: " + negatives.join(",") if !negatives.empty?
  end

  def sum_numbers
    @numbers.inject(&:+) 
  end
end
