require "excel_functions"
describe Excel do
  describe "Financial" do
    it "calculates npv correctly" do
      expect(Excel.npv(0.5, 50, 45,34)).to be_within(0.01).of(63.41)
      expect(Excel.npv(0.2,15,53,23,64,23)).to be_within(0.01).of(102.72)
    end

    it "calculates pmt correctly" do
      # examples from http://office.microsoft.com/en-sg/excel-help/pmt-HP005209215.aspx?CTT=1
      expect(Excel.pmt(0.08/12, 10,10000)).to be_within(0.01).of(-1037.03)
      expect(Excel.pmt(0.08/12, 10,10000,0,1)).to be_within(0.01).of(-1030.16)
      expect(Excel.pmt(0.06/12, 18*12,0,50000)).to be_within(0.01).of(-129.08)
    end
  end
  describe "Lookup" do
    #should this be 3 it blocks?
    let(:input_arr){[0,0.05,0.1,0.15]}
    let(:output_arr){["a","b","c","d"]}
    let(:tests){[
        [0, "a"],
        [0.1, "c"],
        [0.12, "c"],
        [1, "d"],
        [-1, nil]
      ]}
    it "performs lookup correctly with 2 arrays" do
      #2 arrays
      tests.each do |(value, result)|
        expect(Excel.lookup(value,input_arr, output_arr)).to be_eql(result)
      end
    end
    it "performs lookup correctly with 1 array" do
      #single array
      tests.each do |(value, result)|
        expect(Excel.lookup(value,input_arr.zip(output_arr))).to be_eql(result)
      end
    end

    context "Unsorted arrays" do
      it "raises error if unsorted and rough match" do
        expect{Excel.lookup(0.11,input_arr.reverse,output_arr)}.to raise_error
      end
      it "doesnt raise error if unsorted but has exact match" do
        expect{Excel.lookup(0.1,input_arr.reverse,output_arr)}.to_not raise_error
      end
    end
  end
end