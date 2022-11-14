# frozen_string_literal: true

# Password generator
class Password
  MAX_AMOUNT_TIME_2022 = 3_400_000_000
  BRENERMAN_LIMIT = 10**75
  VALID_TYPES = %i[numbers lowercase uppercase symbols].freeze
  TYPES_SYMBOLS = { numbers: 10, lowercase: 26, uppercase: 26, number_characters: 33 }.freeze
  SPECIAL_CHARACTERS = <<~HERE
    "! #$%&'()*+,-./\:;<=>?@[]^_`{|}~
  HERE

  attr_reader :value, :length

  def initialize(pass = '')
    raise ArgumentError unless pass.is_a?(String)

    if pass.empty?
      generate
    else
      set_attributes do
        @value = pass
        @length = pass.length
        @types = type_definition(@value)
        @number_characters = number_characters_count(@types)
      end
    end
  end

  def generate(length = 12, types = %i[numbers lowercase])
    raise ArgumentError, 'characters should be positive integer' unless length.is_a?(Integer) && length.positive?
    raise ArgumentError, 'types should be valid types array' unless (types - VALID_TYPES).empty?

    set_attributes do
      @length = length
      @types = types
      @number_characters = number_characters_count(types)
      @value = generate_password(length, types)
    end
  end

  def input
    loop do
      puts 'Введите пароль:'
      pass = gets.chomp
      break if pass == '/q'

      set_attributes do
        @value = pass
        @length = pass.length
        @types = type_definition(@value)
        @number_characters = number_characters_count(@types)
      end

      print_info
    end
  end

  def count_attempts
    @number_characters**@length
  end

  def amount_time
    time = count_attempts / MAX_AMOUNT_TIME_2022
    sec2time(time)
  end

  def print_info
    puts "Длина пароля: #{@length} символов"
    puts "Колличество попыток: #{count_attempts}"
    puts "Займет времени: #{amount_time}"
    puts "Типы символов: #{types}\n\n"
  end

  def max_amount_time
    time = count_attempts / BRENERMAN_LIMIT
    sec2time(time)
  end

  def types
    @types.join(', ')
  end

  alias size length

  private

  def set_attributes
    yield if block_given?
  end

  def generate_password(length, types)
    array = []
    generated = ''.dup

    array += ('0'..'9').to_a if types.include? :numbers
    array += ('a'..'z').to_a if types.include? :lowercase
    array += ('A'..'Z').to_a if types.include? :uppercase
    array += SPECIAL_CHARACTERS.chomp.split('') if types.include? :number_characters
    length.times { generated += array.sample }
    generated
  end

  def type_definition(value)
    types = []
    types << :numbers if (value =~ /[[:digit:]]/).is_a?(Integer)
    types << :lowercase if (value =~ /[[:lower:]]/).is_a?(Integer)
    types << :uppercase if (value =~ /[[:upper:]]/).is_a?(Integer)
    types << :number_characters if (value =~ /[[:punct:]]/).is_a?(Integer)
    types
  end

  def number_characters_count(types)
    symbols = 0
    types.each { |key| symbols += TYPES_SYMBOLS[key] }
    symbols
  end

  def sec2time(secs)
    time = secs.round
    sec = time % 60
    time /= 60
    min = time % 60
    time /= 60
    hrs = time % 24
    time /= 24
    days = time % 365
    time /= 365
    years = time
    format('%<years>s years %<days>s days %<hrs>s hours %<min>s minutes %<sec>s seconds',
           { years: years, days: days, hrs: hrs, min: min, sec: sec })
  end
end
