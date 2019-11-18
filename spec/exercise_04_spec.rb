describe "Component XY" do
    before(:all) { puts "A" }
    before(:each) { puts "\tB" }
    describe "Component X" do 
        before(:each) { puts "\t\tC" }
        it { puts "\t\t\tD" }
        it { puts "\t\t\tE" }
        after(:each) { puts "\t\tF" }
    end
    describe "Component Y" do 
        before(:each) { puts "\t\tG" }
        it { puts "\t\t\tH" }
        it { puts "\t\t\tI" }
        after(:each) { puts "\t\tJ" }
    end
    after(:each) { puts "\tK" }
    after(:all) { puts "L" }
end
