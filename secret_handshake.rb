class SecretHandshake

  attr_accessor  :large_binary
  attr_reader    :input

  def initialize(input)
    @input = input
  end

  def commands

    binary = if input.kind_of? Integer
               input.to_s(2)
             else
               input
             end

    large_binary = true if binary.size > 3

    results = []

    binary.reverse.chars.each_with_index do |number, indx| 

      result = case
                when (number == '1') && (indx == 0)
                  'wink'
                when (number == '1') && (indx == 1)
                  'double blink'
                when (number == '1') && (indx == 2)
                  'close your eyes'
                when (number == '1') && (indx == 3)
                  'jump'
                end

      results << result
    end

    results = results.compact

    if large_binary
      results.reverse
    else
      results
    end

  end

end


# Results:
# 1     = wink
# 10    = double blink
# 100   = close your eyes
# 1000  = jump
# 10000 = Reverse the order of the operations in the secret handshake.
