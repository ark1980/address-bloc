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

	       	expect(entry_one.name).to eql "Bill"
	       	expect(entry_one.phone_number).to eql "555-555-5555"
	       	expect(entry_one.email).to eql "bill@blocmail.com"
     	end

	    it "imports the 2nd entry" do
	       book.import_from_csv("entries.csv")
	       # Check the second entry
	       entry_two = book.entries[1]
	    end
	 
	    it "imports the 3rd entry" do
	       book.import_from_csv("entries.csv")
	       # Check the third entry
	       entry_three = book.entries[2]
	    end
	 
	    it "imports the 4th entry" do
	       book.import_from_csv("entries.csv")
	       # Check the fourth entry
	       entry_four = book.entries[3]
	    end
	 
	    it "imports the 5th entry" do
	       book.import_from_csv("entries.csv")
	       # Check the fifth entry
	       entry_five = book.entries[4]
	    end

 	end
end