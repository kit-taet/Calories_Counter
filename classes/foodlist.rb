require 'colorize'
require 'tty-prompt'
require 'artii'
require 'rainbow'
require 'colorized_string'
require 'faker'

require_relative 'backtomenu.rb'


class Food

	attr_accessor :id, :name, :servingsize, :servingtype, :calorie;

    def initialize(id, name,servingsize, servingtype, calorie)
        @id = id #int
        @name= name #string
        @servingsize = servingsize #int
		@servingtype = servingtype #string
		@calorie = calorie #int
	
	end
end

def read_food(count,foodlist_file)
    id= count + 1
    name= foodlist_file.gets.to_s.chomp()
    servingsize= foodlist_file.gets.to_i
    servingtype = foodlist_file.gets.to_s.chomp()
    calorie = foodlist_file.gets.to_i
    food = Food.new(id,name, servingsize, servingtype, calorie)
    return food
  end

def read_foodlist(foodlist_file)
    foods = Array.new  
    i=0 
    #number of food 8 ..
    while i < 8 
	    food = read_food(i,foodlist_file)
        foods.push food 
        i+=1
    end 
	return foods 
end 

def write_foods(food)
    
    puts food.id.to_s+". "+ food.name + " - " + food.servingsize.to_s + " " + food.servingtype + " is " + food.calorie.to_s + " caloriees"
    #puts "1. Jasmine Rice - 1 Serve is 160 caloriees"  
end 


def write_foodlist(foods)
	i=0
	while i < foods.length  
		write_foods(foods[i])
		i+=1
	end

end 


def list_of_food
    
    foodlist_file = File.open("./classes/foodlist.txt", "r")
    foods = read_foodlist(foodlist_file)

    return foods
end


def list

    food_list = Artii::Base.new :font => 'slant'
    puts (food_list.asciify("Food List")).colorize(:cyan)

    puts ("-----------------------------------------------------------------------").colorize(:yellow)
    puts ("")
    
    foodlist_file = File.open("./classes/foodlist.txt", "r")
    foods = read_foodlist(foodlist_file)
    foodlist_file.close()

    write_foodlist(foods);
    
    # puts "1. Jasmine Rice - 1 Serve is 160 caloriees"
    # puts "2. Banana 1 - Serve is 105 caloriees"
    # puts "3. KFC Crunchy Twister Wrap - 1 Serve is 610 caloriees"
    # puts "4. KFC Fries (Regular) - 1 Serve is 308 caloriees"
    # puts "5. Apple pie (McDonald) 1 Serve is 250 caloriees"
    # puts "6. Broccoli - 1 cup is 31 caloriees"
    # puts "7. Spinach - 100g is 23 caloriees"
    # puts "8. Caesar Salad - 100g is 44 caloriees"


    puts ("")
    puts ("-----------------------------------------------------------------------").colorize(:red)
    
    backtomenu
    # puts "Press enter button to go back to the menu".colorize(:red)
    # userback = gets.chomp()

    # if userback == "Back"
    #     return greet, menu, useroptions
    # else 
    #     puts "Press type 'Back' if you want to go back to the main menu".colorize(:red)
    # end

end



