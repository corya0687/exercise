# Previously entered in shell one

class Apple

  attr_reader :variety, :origin, :history
  def initialize(**args)
    @variety = args[:variety]
    @origin = args[:origin]
    @history = args[:history]
  end
end

apple = Apple.new(variety: 'Honeycrisp', origin: 'Minnesota', history: 'Introduction to Market: 1991')

# Serialize instance attributes and store in home directory, pc/mac.
File.open(File.join(ENV['HOME'] +'/apple_obj.txt') , 'w') {|f| f.write(Marshal.dump(apple)) }
