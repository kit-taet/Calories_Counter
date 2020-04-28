require 'colorize'
require 'tty-prompt'
require 'artii'
require 'rainbow'
require 'colorized_string'
require 'faker'


require_relative "./classes/calculate.rb"
require_relative "./classes/foodlist.rb"



#greet user
def greet
  hm = Artii::Base.new :font => 'slant'
  puts (hm.asciify("Calories Counter")).colorize(:magenta)
end


def menu

  puts ("")
  puts "Let's count some calories!!".colorize(:brown)
  puts ("-----------------------------------------------------------------------").colorize(:yellow)
  puts ("Please select these options 1, 2 or 3")
  puts ("-----------------------------------------------------------------------").colorize(:red)
  puts ("")

  puts ("1.") + " Calculate"
  puts ("2.") + " Food List"
  puts ("3.") + " Quit"

end


#get user options
def useroptions

userop = gets.to_i

  case userop

    when 1
     
      calculate_cal

    when 2
      
      list

    when 3
      sleep 0.5
      system 'clear'
      doneplaying = Artii::Base.new :font => 'slant'
      puts (doneplaying.asciify("Thankyou For Using")).colorize(:cyan)
   
              
    else  
      puts "Please choose your options again 1,2 or 3".colorize(:red)
      puts ("-----------------------------------------------------------------------")

  end

end 


def main()
  greet
  menu
  useroptions

end 

main()


