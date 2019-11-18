describe "an empty array" do 
    it "should be empty" do
        empty_array = EmptyArray.new
        expect(empty_array.get_items).to be_empty
    end
end

class EmptyArray
    def get_items
        [1,2]
    end
end


