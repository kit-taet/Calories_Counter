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
    
    puts ("-----------------------------------------------------------------------").colorize(:yellow)

    food_list = Artii::Base.new :font => 'slant'
    puts (food_list.asciify("Food List")).colorize(:cyan)

    puts ("-----------------------------------------------------------------------").colorize(:red)
    puts ("")
    
    foodlist_file = File.open("./classes/foodlist.txt", "r")
    foods = read_foodlist(foodlist_file)
    foodlist_file.close()

    write_foodlist(foods);
    


    puts ("")
    puts ("-----------------------------------------------------------------------").colorize(:red)
    
    backtomenu
 

end



