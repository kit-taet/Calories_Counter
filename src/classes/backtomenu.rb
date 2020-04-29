require 'colorize'
require 'tty-prompt'
require 'artii'
require 'rainbow'
require 'colorized_string'


#user get to press enter button  to go back to the menu
def backtomenu
    puts ("")
    puts "Press enter button to go back to the menu".colorize(:green)
    STDIN.gets
    return greet, menu, useroptions   

        
end