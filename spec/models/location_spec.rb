require "./spec/spec_helper.rb"

describe Location do 
  context "given coordinates" do 
    let(:coordinates) { "30.406363,-97.733763" }
    subject { Location.find(coordinates) }
  
    its(:city) { should == "Austin" }    
    its(:neighborhood) { should == "Balcones Woods" } 
    its(:address) { should == "4203 Las Palmas Drive" } 
    its(:zipcode) { should == "78759" }   
  end 
end 