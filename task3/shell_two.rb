# Previously entered in shell two
class Apple

  attr_reader :variety, :origin, :history
  def initialize(**args)
    @variety = args[:variety]
    @origin = args[:origin]
    @history = args[:history]
  end
end

# load serialized object from shell one
apple_copy = Marshal.load(File.read(ENV['HOME'] +'/apple_obj.txt')
