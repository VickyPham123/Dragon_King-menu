

puts " "
food_menu = [
    {:name => "Black bean beef with egg noodle",
    :price => 18.00,
    :ingredient =>" Beef, black bean sause, peanut oil, egg noodle"
    },

    {:name => "Mix seafood with flat rice noodle",
        :price => 24.00,
        :ingredient =>" Prawn, squid, fish, sunflower oil, rice noodle"
    },
 
    {:name => "Lobster on crispy egg noodle",
     :price => 28.50,
     :ingredient =>" Lobster meat, deep fried egg noodle, spring onion, coriander, tarima sause"
    },

    {:name => "Sweet and sour pork on coconut rice",
     :price => 18.50,
     :ingredient =>"Flour, pork, sugar , sunflower oil, coconut rice and capsicum"
    },

    {:name => "Grill baramandi with hand-made clear potatoes stir-fried noodle",
     :price => 21.50,
     :ingredient =>"Baramandi fish, ginger, spring onion, butter, peper, hand-made potatoes noodle"
    },

    {:name => "Deep fried sweet potatoes chip and stir-fried mix vegtable",
     :price => 15.99,
     :ingredient =>"Sweet potatoes, porkchoy, driedn onion, capsicum, baby tomatoes"
    },

    {:name => "Hot and sour crab soup",
     :price => 10.99,
     :ingredient => "Crab with sugar, vinegar, in chicken stock with corn flour"
    },
]


drink_menu = [
    {:name => "Coke",
     :price => 4.50,
    },

    {:name => "Diet-Coke",
     :price => 4.50,
    },

    {:name => "Orange juice",
     :price => 6.50,
    },

    {:name => "Apple juice",
      :price => 6.50,
    },

    {:name => "Water",
     :price => 3.50,
    },


]
require 'tty-prompt'

order_in_progress = true

#####

food_price = []
drink_price = []

while order_in_progress == true

  prompt = TTY::Prompt.new
  menu_choice = prompt.select("What Menu would you like?", ["Food Menu","Drink Menu", "Checkout","Exit"])

  if menu_choice == "Food Menu"

    add_food = "yes"
    while  add_food == "yes"
      puts " "
      puts "Food Menu"
      puts " "
      food_menu.each_with_index do |item, i|
          puts i.to_s + " -  " + item[:name].to_s  
          puts "Ingredient: " + item[:ingredient] 
          puts "Price: " + "$" + item[:price].to_s +  " "  
          puts " "
          puts " "
      end
      puts " "
      
      customer_input = -1
      while customer_input < 0 || customer_input > food_menu.length-1
        print "What would you like to order?"
        customer_input = gets.chomp.to_i
      end
      puts " "
      puts food_menu[customer_input][:name] +"  " +"$#{food_menu[customer_input][:price]} " 
      food_price.push(food_menu[customer_input][:price])
      puts " "

      puts " Would you like anything else? "
      puts " "
      add_food = gets.chomp
      
    end 

  end

  if menu_choice == "Drink Menu"

    puts "Would you like to order a drink?"
    drink_choice = gets.chomp

    add_drink = "yes"
    if drink_choice == "yes"
      while add_drink == "yes" 
        puts " "
      puts "=============================================================================="
      puts "  "
      puts "Drink Menu"
      puts " "
      drink_menu.each_with_index do |item,i|
        puts i.to_s + " - " + " " + item[:name].to_s + " , $" + item [:price].to_s
        puts " "
        
      end
      drink_input = -1
      while drink_input < 0 || drink_input > drink_menu.length-1
      print " What would you like to order ? "
        drink_input = gets.chomp.to_i
      end
        puts " "  
        puts drink_menu[drink_input][:name] + " " + "$#{drink_menu[drink_input][:price]}"
        drink_price.push(drink_menu[drink_input][:price])
        puts " "
        puts " Would you like anything else? "
        puts " "
        add_drink = gets.chomp
      
      end
    end
  end


  if menu_choice == "Checkout"
    total_food_price = 0
    food_price.each {|x| total_food_price += x }

    total_drink_price = 0
    drink_price.each{|y| total_drink_price += y}

    total = total_food_price + total_drink_price
    puts " "
    puts " Your total price is : " + "$"+ total.round(2).to_s
    puts " " 
    order_in_progress = false 
  end
  
  if menu_choice == "Exit"
    order_in_progress = false
    exit!
  end   
end

  ######