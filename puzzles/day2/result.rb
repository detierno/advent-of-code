require_relative 'intcode'

input = File.read(File.join(File.dirname(__FILE__), '../inputs/day02.txt'))
#arr = input.split(',')
#arr[1] = '12'
#arr[2] = '2'

p Intcode.new(instructions: input, noun: 12, verb: 2).compute

(0..99).each do |noun|
  (0..99).each do |verb|
    output = Intcode.new(instructions: input, noun: noun, verb: verb).compute
    result = output.split(',').first.to_i

    if result == 19690720
      p "Noun is: #{noun}"
      p "Verb is: #{verb}"
      p "100 * noun + verb: #{100 * noun + verb}"
      exit
    end
  end
end
