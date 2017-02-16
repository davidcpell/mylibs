module IncludeMe
  def say_hello?
    puts "hello?"
  end

  def say_goodbye?
    puts "goodbye?"
  end
end

Chef::Recipe.send(:include, IncludeMe)
