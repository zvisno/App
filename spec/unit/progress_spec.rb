require './spec/spec_helper'

describe Scratchweb::Progress do
  before do
    @process = Scratchweb::Progress.new(:content_length => 12345)
  end

  context "When all bytes were uploaded" do
    it "should finish" do
      @total_read_bytes = @process.add 12345
      @process.is_finished.should eq(true)
    end

    it "should finish when even more bytes were uploaded" do
      @total_read_bytes = @process.add 45678

      @process.current.should eq(370)
      @process.is_finished.should eq(true)
    end
  end

  context "When a half of all bytes was uploaded" do
    it "should return how much was processed" do
      @total_read_bytes = @process.add 1345
      @process.current.should eq(11)
    end

    it "should return not finished" do
      @total_read_bytes = @process.add 12344
      @process.is_finished.should eq(false)
    end
  end
end