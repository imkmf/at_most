require 'at_most'

class User < ActiveRecord::Base
  at_most(3)
end
