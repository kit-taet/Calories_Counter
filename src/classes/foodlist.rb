require 'colorize'
require 'artii'
require 'rainbow'
require 'colorized_string'


require_relative 'backtomenu.rb'

#initialize/ give varibles
class Food

	attr_accessor :id, :name, :servingsize, :servingtype, :calorie;

    #initialize the  data member value of the food object
    def initialize(id, name,servingsize, servingtype, calorie)
        @id = id #int
        @name= name #string
        @servingsize = servingsize #int
		@servingtype = servingtype #string
		@calorie = calorie #int
	
	end
end

#read the value from text file and store into varibles
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
    #number of food 8 .. // total number of foods are 8 we can change it anytime (when you add more foods)
    while i < 8 
        food = read_food(i,foodlist_file)
        #store all food objects in the foods array
        foods.push food 
        i+=1
    end 
	return foods 
end 

def write_foods(food)
    

    #print single food object in the terminal
    puts food.id.to_s+". "+ food.name + " - " + food.servingsize.to_s + " " + food.servingtype + " is " + food.calorie.to_s + " caloriees"
    #puts "1. Jasmine Rice - 1 Serve is 160 caloriees"  
end 


def write_foodlist(foods)
    i=0
    #using loop through foods array containing all food objects
    while i < foods.length  
        #call method with single food object
		write_foods(foods[i])
		i+=1
	end

end 

#open the food list from the foodlist.txt ("r - read only")
def list_of_food
    
    foodlist_file = File.open("./classes/foodlist.txt", "r")
    foods = read_foodlist(foodlist_file)

    return foods
end


#display a food list
def list
    
    puts ("-----------------------------------------------------------------------").colorize(:yellow)

    food_list = Artii::Base.new :font => 'slant'
    puts (food_list.asciify("Food List")).colorize(:cyan)

    puts ("-----------------------------------------------------------------------").colorize(:red)
    puts ("")
    
    #open foodlist.txt file
    foodlist_file = File.open("./classes/foodlist.txt", "r")

    #read the foods from the foodlist.txt file and store into the foods array of food objects
    foods = read_foodlist(foodlist_file)
    
    #close foodlist.txt file
    foodlist_file.close() 

    #write all foods records in the terminal
    write_foodlist(foods);
    


    puts ("")
    puts ("-----------------------------------------------------------------------").colorize(:red)
    

    #go back to main menu
    backtomenu
 

end



