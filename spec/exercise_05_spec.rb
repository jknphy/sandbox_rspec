describe "Rspec" do 
    describe "which implements built-in matchers" do
        it "is able to test Equivalence" do
            # .to eq
            # .to eql
            # .eql?
            pending("to be implemented")
        end
        it "is able to test Identity" do
            # .to be
            # .to equal
            pending("to be implemented")
        end
        it "is able to test Comparisons" do
            # .to be >
            # .to be >=
            # .not_to be <= 
            # .not_to be <
            # .to be_within(delta).of(expected)
            pending("to be implemented")
        end
        it "is able to test Regular expressions" do
            # .to match(/regex/)
            # .to_not match(/regex/)
            pending("to be implemented")
        end
        it "is able to test Types/classes" do
            # .to be_an_instance_of
            # .to be_a
            # .to be_an
            # .to be_a_kind_of
            pending("to be implemented")
        end
        it "is able to test Truthiness" do
            # ..to be_truthy 
            # ..to be true 
            # ..to be_falsy
            # ..to be_nil
            # ..to be false          
            # ..to_not be_nil
            pending("to be implemented")
        end
        it "is able to test Expecting errors" do            
            # .to raise_error
            # .to raise_error(ErrorClass)
            # .to raise_error("message")
            # .to raise_error(ErrorClass, "message")
            pending("to be implemented")
        end
        it "is able to test Expecting throws" do
            # .to throw_symbol
            # .to throw_symbol(:symbol)
            # .to throw_symbol(:symbol, 'value')
            pending("to be implemented")
        end
        it "is able to test Yielding" do
            # .to yield_with_args
            # .to yield_successive_args
            pending("to be implemented")
        end
        it "is able to test Predicate matchers" do
            # .to be_xxx         # passes if actual.xxx?
            pending("to be implemented")
        end
        it "is able to test Ranges" do
            # .to cover
            pending("to be implemented")
        end
        it "is able to test Collection membership" do
            # .to eq
            # .to include
            # .to start_with
            # .to end_with
            # .to contain_exactly
            # .to match_array
            pending("to be implemented")
        end
    end
end
