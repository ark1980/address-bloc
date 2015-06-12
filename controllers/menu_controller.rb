require_relative "../models/address_book.rb"

class MenuController

    attr_accessor :address_book

    def initialize
        @address_book = AddressBook.new
    end


    def main_menu
        puts "Main Menu, #{@address_book.entries.count} entries"
        puts "1 - View all entries"
        puts "2 - Create an entry"
        puts "3 - View Entry Number"
        puts "4 - Search for an entry"
        puts "5 - Import entries from a CSV"
        puts "6 - Exit"
        print "Enter your selection: "

        selection = gets.chomp.to_i
        puts "You picked #{selection}"
    
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                system "clear"
                create_entry
                main_menu

            when 3
                system "clear"
                view_entry_number
                main_menu
            when 4
                system "clear"
                search_entry
                main_menu
            when 5
                system "clear"
                read_csv
                main_menu
            when 6
                system "clear"
                puts "Goodbye, Please back again."
                exit(0)
            else
                puts "Sorry, Your input number it's not valid, please try again."
                main_menu
        end
    end


    def view_all_entries
        @address_book.entries.each do |entry|
            system "clear"
            puts entry.to_s

            entry_submenu(entry)
        end
        system "clear"
        puts "End of entries"
    end


    def entry_submenu(entry)
        puts "n - Next Entry"
        puts "e - Edit Entry"
        puts "d - Delete Entry"
        puts "m - Main Menu"

        selection = gets.chomp

        case selection

            when "n"

            when "e"

            when "d"

            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
        end

    end   


    def create_entry
        
        system "clear"

        puts "New AdressBook entry"
        print "Name: "
        name = gets.chomp.capitalize

        print "Phone Number: "
        phone = gets.chomp

        print "Email: "
        email = gets.chomp.downcase

        @address_book.add_entry(name, phone, email)
        
        system "clear"
        
        puts "New entry created"

    end  

    def view_entry_number
        system "clear"
        puts "Please enter your number: "
        num = gets.chomp.to_i
        num = num - 1
        
        if num.between?(0 ,@address_book.entries.count)
            puts @address_book.entries[num]
            puts "==================================================================="
            else
            puts "Please enter correct number"
            puts "==================================================================="
        end

    end

    
    def search_entry
    end

    def read_csv
    end

end
