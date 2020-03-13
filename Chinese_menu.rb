
require 'tty-prompt'
require 'emoji'
require "artii"
require "tty-box"

index = Emoji::Index.new

heart_moji = index.find_by_name('heart')

heart = heart_moji['moji']

order_in_progress = true

food_menu =[
  {:name => "Black bean beef with egg noodle", 
  :price => 18.00,
  :ingredient =>" Beef, black bean sause, peanut oil, egg noodle"
  },

  {:name => "Mix seafood with flat rice noodle #{heart}",
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

#####

food_price = []
drink_price = []


a = Artii::Base.new :font => 'slant'
puts "================================"
puts a.asciify('DRAGON KING TAKEAWAY')
puts "================================"

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
        print TTY::Box.frame "What would you like to order? "
        customer_input = gets.chomp.to_i
      end
      puts " "
      puts food_menu[customer_input][:name] +"  " +"$#{food_menu[customer_input][:price]} " 
      food_price.push(food_menu[customer_input][:price])
      puts " "

      print TTY::Box.frame " Would you like anything else? "
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


    # Show paymet options
    outstanding_amount = total
    while outstanding_amount > 0

      prompt = TTY::Prompt.new
      payment_choice = prompt.select("What is your preferred payment method?", ["Credit Card","Cash","Exit"])

      if payment_choice == "Credit Card"
        
        valid_credit_card_num = false;

        while valid_credit_card_num == false



          puts ""
          print "Please enter your 12 digit card number: "
          card_number = gets.chomp

          if card_number.to_s.length == 12
            valid_credit_card_num = true
          end

        end

        puts ""
        print "Please enter your card expiry date : "
        card_expiry = gets.chomp 

        puts ""
        print "Please enter your 3 digit card number at the back : "
        card_cvc = gets.chomp

        print "Your current balance is #{outstanding_amount}, How much would you like to pay from your card: "
        card_in = gets.chomp.to_f.round(2)
        outstanding_amount -= card_in
      
      end
      

      if payment_choice == "Cash"
        print "Your current balance is #{outstanding_amount}, How much would you like to pay in cash: "
        cash_in = gets.chomp.to_f.round(2)
        outstanding_amount -= cash_in
      end


      if payment_choice == "Exit"
        outstanding_amount = 0
      end

    end

    puts ""

    print TTY::Box.frame "Thank you for your order!", "outstanding amount #{outstanding_amount}", "See you next time"
    order_in_progress = false



  end
  
  if menu_choice == "Exit"
    order_in_progress = false
    exit!
  end   
end

  ######