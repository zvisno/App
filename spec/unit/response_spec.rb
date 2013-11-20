require './spec/spec_helper'

describe Scratchweb::Http::Response do

  context "When status code 404" do
    it "should return message 404 Not Found" do
      response = Scratchweb::Http::Response.new(
                              :status_code => '404'.to_sym,
                              :location => "UA"
                            )
      
      response.to_s.should eq("HTTP/1.1 404 Not Found\r\n" +
                              "Server: Scratchweb 0.1\r\n" +
                              "Location: UA\r\n" +
                              "Cache-Control: no-cache\r\n" +
                              "Connection: close\r\n\r\n" )
    end
  end

  context "When status code 200" do
    it "should return message 200 OK" do
      response = Scratchweb::Http::Response.new( :status_code => '200'.to_sym,
                                                 :location => "UA" )

      response.to_s.should eq("HTTP/1.1 200 OK\r\n" +
                              "Server: Scratchweb 0.1\r\n" +
                              "Location: UA\r\n" +
                              "Cache-Control: no-cache\r\n" +
                              "Connection: close\r\n\r\n")
    end
  end

  context "When content length" do
    it "should return content length if specified" do
      content_length = 31

      response = Scratchweb::Http::Response.new(:content_length => content_length)

      response.to_s.should eq("HTTP/1.1 200 OK\r\n" +
                              "Server: Scratchweb 0.1\r\n" +
                              "Content-Length: #{content_length}\r\n" +
                              "Cache-Control: no-cache\r\n" +
                              "Connection: close\r\n\r\n")
    end

    it "should return content length if not specified" do
      content = "You uploaded the file successfuly"

      response = Scratchweb::Http::Response.new(:content => content)

      response.to_s.should eq("HTTP/1.1 200 OK\r\n" +
                              "Server: Scratchweb 0.1\r\n" +
                              "Content-Length: #{content.size}\r\n" +
                              "Cache-Control: no-cache\r\n" +
                              "Connection: close\r\n\r\n" + 
                              "#{content}")
    end
  end
end