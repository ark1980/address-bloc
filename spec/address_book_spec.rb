RSpec.describe AddressBook do

	let(:book) { AddressBook.new }

	def check_entry(entry, expected_name, expected_number, expected_email)
	    expect(entry.name).to eql expected_name
	    expect(entry.phone_number).to eql expected_number
	    expect(entry.email).to eql expected_email
  	end
	
	context "attribute" do

		it "should respond to entries" do
			expect(book).to respond_to(:entries)
		end

		it "should initialize entries as an array" do
			expect(book.entries).to be_a(Array)
		end

		it "should initialize as an empty array" do
			expect(book.entries).to be_empty
		end
	end

	context ".add_entry" do
		it "adds only one entry to the address book" do      
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			       
			expect(book.entries.size).to eq 1
		end
 
		it "adds the correct information to entries" do     
			book.add_entry('Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com')
			new_entry = book.entries[0]
			expect(new_entry.name).to eq 'Ada Lovelace'
			expect(new_entry.phone_number).to eq '010.012.1815'
			expect(new_entry.email).to eq 'augusta.king@lovelace.com'
		end
	end

	context ".remove_entry" do

		it "deletes only one entry from the address book" do
	#book.remove_entry(['Ada Lovelace', '010.012.1815', 'augusta.king@lovelace.com'])
		    book.remove_entry(Array)
		    expect(book.entries.size).to eq(0)   
  		end
 	end

 	# Test that AddressBook's .import_from_csv() method is working as expected
 	context ".import_from_csv" do

	 	it "import the correct number of information" do
	 		book.import_from_csv("entries.csv")
	 		book_size = book.entries.size
	# Check the size of the entries in AddressBook
	 		expect(book_size).to eql 5
	 	end

	 	it "imports the 1st entry" do
	       	book.import_from_csv("entries.csv")
	# Check the first entry
	       	entry_one = book.entries[0]
	       	check_entry(entry_one, "Bill", "555-555-5555", "bill@blocmail.com")
     	end

	    it "imports the 2nd entry" do
	       book.import_from_csv("entries.csv")
	# Check the second entry
	       entry_two = book.entries[1]
	       check_entry(entry_two, "Bob", "555-555-5555", "bob@blocmail.com")
	    end
	 
	    it "imports the 3rd entry" do
	       book.import_from_csv("entries.csv")
	# Check the third entry
	       entry_three = book.entries[2]
	       check_entry(entry_three, "Joe", "555-555-5555", "joe@blocmail.com")
	    end
	 
	    it "imports the 4th entry" do
	       book.import_from_csv("entries.csv")
	# Check the fourth entry
	       entry_four = book.entries[3]
	       check_entry(entry_four, "Sally", "555-555-5555", "sally@blocmail.com")
	    end
	 
	    it "imports the 5th entry" do
	       book.import_from_csv("entries.csv")
	# Check the fifth entry
	       entry_five = book.entries[4]
	       check_entry(entry_five, "Sussie", "555-555-5555", "sussie@blocmail.com")
	    end

	# import from entries_2.csv

	    it "import the correct number of information" do
	 		book.import_from_csv("entries_2.csv")
	 		book_size = book.entries.size
	 		expect(book_size).to eql 3
	 	end

	# Check the first entry from entries_2

		it "it checks details of the first entry" do
      book.import_from_csv("entries_2.csv")
      entry_one = book.entries[0]
      check_entry(entry_one, "Ava", "777-777-7777", "ava@example.com")
      
     end

     it "checks the details of second entry" do
      book.import_from_csv("entries_2.csv")
      entry_two = book.entries[1]
      check_entry(entry_two, "Ben", "888-888-8888", "ben@example.com")
    end
    
    it "it checks details of the third entry" do
      book.import_from_csv("entries_2.csv")
      entry_three = book.entries[2]
      check_entry(entry_three, "Clair", "999-999-9999", "clair@example.com")
      
     end  
 	end

# Test the binary_search method
 	context ".binary_search" do
 		it "searches AddressBook for non-extistent entry" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Dan")
 			expect(entry).to be_nil
 		end

 		it "seraches for Bill" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Bill")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Bill", "555-555-5555", "bill@blocmail.com")
 		end

 		it "searches for Bob" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Bob")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Bob", "555-555-5555", "bob@blocmail.com")
 		end

 		it "searches for Joe" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Joe")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Joe", "555-555-5555", "joe@blocmail.com")
 		end

 		it "searches for Sally" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Sally")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Sally", "555-555-5555", "sally@blocmail.com")
 		end

 		it "searches for Sussie" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Sussie")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Sussie", "555-555-5555", "sussie@blocmail.com")
 		end

 		it "searches AddressBook for Billy" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Billy")
 			expect(entry).to be_nil
 		end

 	end

 	# Test the iterative_search method
 	
 	context ".iterative_search" do
 		it "searches AddressBook for non-extistent entry" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Ali")
 			expect(entry).to be_nil
 		end

 		it "seraches for Bill" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Bill")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Bill", "555-555-5555", "bill@blocmail.com")
 		end

 		it "searches for Bob" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Bob")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Bob", "555-555-5555", "bob@blocmail.com")
 		end

 		it "searches for Joe" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Joe")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Joe", "555-555-5555", "joe@blocmail.com")
 		end

 		it "searches for Sally" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Sally")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Sally", "555-555-5555", "sally@blocmail.com")
 		end

 		it "searches for Sussie" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Sussie")
 			expect entry.instance_of?(Entry)
 			check_entry(entry, "Sussie", "555-555-5555", "sussie@blocmail.com")
 		end

 		it "searches AddressBook for Billy" do
 			book.import_from_csv("entries.csv")
 			entry = book.binary_search("Billy")
 			expect(entry).to be_nil
 		end
 	end
 	
end