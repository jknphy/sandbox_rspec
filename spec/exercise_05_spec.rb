describe "Rspec" do 
    describe "which implements built-in matchers" do
        it "is able to test Equivalence" do
            actual = "a"
            expected = "a"
            not_expected = "c"
            expect(actual).to eq(expected)  # passes if actual == expected
            expect(actual).to eql(expected) # passes if actual.eql?(expected)
            expect(actual).not_to eql(not_expected) # passes if not(actual.eql?(expected))
        end
        it "is able to test Identity" do
            actual = expected = "a"
            expect(actual).to be(expected)    # passes if actual.equal?(expected)
            expect(actual).to equal(expected) # passes if actual.equal?(expected)
        end
        it "is able to test Comparisons" do
            actual = 5
            expected = 2
            delta = 3
            expect(actual).to be >  expected
            expect(actual).to be >= expected
            expect(actual).not_to be <= expected
            expect(actual).not_to be < expected
            expect(actual).to be_within(delta).of(expected)
        end
        it "is able to test Regular expressions" do
            actual ="a cat is not a dog"
            expect(actual).to match(/cat.*dog/)
            expect(actual).to_not match(/tiger/)
        end
        it "is able to test Types/classes" do
            tortilla = Food.new
            apple = Fruit.new
            expect(tortilla).to be_an_instance_of(Food) # passes if actual.class == expected
            expect(apple).to be_a(Food)                 # passes if actual.kind_of?(expected)
            expect(apple).to be_an(Fruit)              # an alias for be_a
            expect(apple).to be_a_kind_of(Fruit)       # another alias
        end
        it "is able to test Truthiness" do
            actual = "a"
            expect(actual).to be_truthy   # passes if actual is truthy (not nil or false)
            actual = true
            expect(actual).to be true     # passes if actual == true
            actual = nil
            expect(actual).to be_falsy    # passes if actual is falsy (nil or false)
            expect(actual).to be_nil      # passes if actual is nil
            actual = false
            expect(actual).to be false    # passes if actual == false           
            actual = 3
            expect(actual).to_not be_nil  # passes if actual is not nil
        end
        it "is able to test Expecting errors" do
            error_raiser = ErrorRaiser.new
            expect { error_raiser.access_dangerous_field }.to raise_error(MyError)
            expect { error_raiser.access_dangerous_field }.to raise_error("oh!, you should not do that.")
            expect { error_raiser.access_dangerous_field }.to raise_error(MyError, "oh!, you should not do that.")
        end
        it "is able to test Expecting throws" do
            task = Task.new
            expect { task.run }.to throw_symbol
            expect { task.run }.to throw_symbol(:done)
            expect { task.run_parallel }.to throw_symbol(:done, "yeah!")
        end
        it "is able to test Yielding" do
            expect { |b| 5.tap(&b) }.to yield_with_args(5)
            expect { |b| 5.tap(&b) }.to yield_with_args(Integer)
            expect { |b| "a string".tap(&b) }.to yield_with_args(/str/)
            expect { |b| [1, 2, 3].each(&b) }.to yield_successive_args(1, 2, 3)
            expect { |b| { :a => 1, :b => 2 }.each(&b) }.to yield_successive_args([:a, 1], [:b, 2])
        end
        it "is able to test Predicate matchers" do
            actual = Car.new
            expect(actual).to be_diesel         # passes if actual.xxx?
        end
        it "is able to test Ranges" do
            expect(1..10).to cover(3)
        end
        it "is able to test Collection membership" do
            expect([1, 2, 3]).to eq([1, 2, 3])            # Order dependent equality check
            expect([1, 2, 3]).to include(1)               # Exact ordering, partial collection matches
            expect([1, 2, 3]).to include(2, 3)            #
            expect([1, 2, 3]).to start_with(1)            # As above, but from the start of the collection
            expect([1, 2, 3]).to start_with(1, 2)         #
            expect([1, 2, 3]).to end_with(3)              # As above but from the end of the collection
            expect([1, 2, 3]).to end_with(2, 3)           #
            expect({:a => 'b'}).to include(:a => 'b')     # Matching within hashes
            expect("this string").to include("is str")    # Matching within strings
            expect("this string").to start_with("this")   #
            expect("this string").to end_with("ring")     #
            expect([1, 2, 3]).to contain_exactly(2, 3, 1) # Order independent matches
            expect([1, 2, 3]).to match_array([3, 2, 1])   #

            # Order dependent compound matchers
            expect(
            [{:a => 'hash'},{:a => 'another'}]
            ).to match([a_hash_including(:a => 'hash'), a_hash_including(:a => 'another')])
        end
    end
end

class Food
end

class Fruit < Food
end

class Orange < Fruit
end

class ErrorRaiser
    def access_dangerous_field
        raise MyError.new("oh!, you should not do that.")
    end
end

class MyError < StandardError
end

class Task
    def run
        throw :done
    end
    def run_parallel
        throw(:done, "yeah!")
    end
end

class Car
    def diesel?
        true
    end
end
