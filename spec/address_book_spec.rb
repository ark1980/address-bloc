RSpec.describe AddressBook do
	
	context "attribute" do

		it "should respond to entries" do
			book = AddressBook.new
			expect(book).to respond_to(:entries)
		end
	end
end