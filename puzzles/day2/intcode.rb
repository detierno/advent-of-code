class Intcode
  attr_reader :instructions

  def initialize(instructions:, noun: nil, verb: nil)
    @instructions    = instructions.split(',').map(&:to_i)
    @instructions[1] = Integer(noun) if noun
    @instructions[2] = Integer(verb) if verb
  end

  def compute
    instructions.each_slice(4) do |int_array|
      processor = Processor.new(instructions, int_array)
      break if processor.halt?
      instructions[processor.destination] = processor.result
    end

    instructions.join(',')
  end

  class Processor
    attr_reader :destination

    def initialize(source, int_array)
      @source = source
      @operation, @value_a, @value_b, @destination = *int_array
    end

    def halt?
      @operation == 99
    end

    def result
      calculation.call(sender, receiver)
    end

    private

    def sender
      @source[@value_a]
    end

    def receiver
      @source[@value_b]
    end

    def calculation
      case @operation
      when 1 then ->(a, b) { a + b }
      when 2 then ->(a, b) { a * b }
      else
        raise StandardError
      end
    end
  end

end
