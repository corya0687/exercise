module Blending
  extend ActiveSupport::Concern

  included do
    after_save :make_juice if self == Apple
  end

  def make_juice
    puts 'I only make Apple juice'
  end
end
