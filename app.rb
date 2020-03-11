def welcome_message
    puts ""
    puts "======================================="
    puts "Wellcome to Dragon King - North Sydney"
    puts "======================================="
    puts ""
end

def main_menu

    menu = [
        {
            :name =>"Sweet and sour pork",
            :price =>18.00,
            :ingredients =>"Pork, capsicums, green onion, sugar"
        },
        {
            :name =>"Beef with black bean sause",
            :price =>20.00,
            :ingredients =>"Beef, carrot, capsicum, corriander, black been sause"
        }
    ]
    
    order = []
    
    finished_order = false;


    ###################
    while(!finished_order)

        puts ""
        puts "Please select an item to add to your order:"
        puts ""
        puts "-------------------------------------------"
        puts "Enter checkout to finish order"
        puts "-------------------------------------------"
        puts ""

        menu.each_with_index {|item,index|
            puts "Enter #{index.to_s} to add #{item[:name]} to order"
        }
        
        puts ""
        print "Option: "
        option = gets.chomp

        if(option == "checkout")
            finished_order = true
        else
            item = menu[option.to_i]

            order.push(item)
        end

    end

    ###################

    # ORder Finished, do other things

    total_price = 0
    order.each_with_index {|item,index|     
        total_price += item[:price]
    }

    puts ""
    puts "Thank you for your order, Total = " + total_price.to_s

    
end

welcome_message
main_menu