class SecretHandshake

  attr_accessor  :large_binary
  attr_reader    :input

  LARGE_BINARY_THRESHOLD = 3

  def initialize(input)
    @input = input
  end

  def commands
    binary = convert_input_to_binary_string
    check_for_large binary
    generate_comands_from binary
  end

  # Abstraction methods

  def convert_input_to_binary_string
    if input.kind_of? Integer
      input.to_s(2)
    else
      input
    end
  end

  def check_for_large(binary)
    if binary.size > LARGE_BINARY_THRESHOLD
      @large_binary = true 
# I am not sure why method large_binary= is not accessible here
    else
      @large_binary = false
    end
  end

  def generate_comands_from(binary)

    results = []

    binary.reverse.chars.each_with_index do |number, indx| 

      result =  case
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
