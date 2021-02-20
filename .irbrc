# Disable 'mutliline' support due to poor pasting performance
# see https://github.com/ruby/irb/issues/43
IRB.conf[:USE_MULTILINE] = false

# awesome print
begin
  require 'awesome_print'
  AwesomePrint.irb!
rescue LoadError => err
end

# credit to https://github.com/himynameisjonas/dotfiles/blob/master/link/.irbrc
# List only the methods that are not present on basic object
# If the methods implemented on basic object overrided, those will not be listed as well
class Object
  def interesting_methods
    case self.class
    when Class then self.public_methods.sort - Object.public_methods
    when Module then self.public_methods.sort - Module.public_methods
    else self.public_methods.sort - Object.new.public_methods
    end
  end
end
