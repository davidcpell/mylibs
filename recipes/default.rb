#
# Cookbook:: mylibs
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# from global.rb
say_hello
say_goodbye

ruby_block "use global methods" do 
  block do 
    # from global.rb
    say_hello
    say_goodbye
  end
end

# from utils.rb
Utils.say_hello!
Utils.say_goodbye!

ruby_block "explicitly call namespaced methods" do 
  block do 
    # from utils.rb
    Utils.say_hello!
    Utils.say_goodbye!
  end
end

# from IncludeMe.rb, can be used here
# because they were included in Chef::Recipe
# in that file
say_hello?
say_goodbye?

Chef::Resource::RubyBlock.send(:include, IncludeMe)

ruby_block "use included namespaced methods" do 
  block do
    # If you comment out line 37, this will raise
    # an exception
    say_hello?
    say_goodbye?
  end
end
