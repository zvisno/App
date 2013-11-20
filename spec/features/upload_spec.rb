require './spec/spec_helper'
require 'tempfile'

describe "Uploading file" do
  before do
    @title = "Mytitle"
    @default_title = "title.mp3"
    delete_upload_files
  end

  # Given: Before submitting a file to upload
  # When: User inserts a title of the file
  # And: Submits the upload
  # Then: Path of the file on a server and specified title of the file is returned to a submission form
  context "when its title is specified" do
    it "should display the path to the file and the title after finished" do
      visit "/"

      fill_in 'Title', :with => @title

      page.attach_file('file', "#{FILES}/Schumann.mp3")
      click_on 'Upload'

      page.should have_selector(:xpath, "//p[@class='small'][contains(text(),'#{TEMP_FILE}')]")
      page.should have_selector(:xpath, "//a[text()='#{@title}']")
      upload_files_from_tmp.size.should eq(1)
    end
  end

  # Given: A File is in a process of upload
  # When: User specifies a title of the file
  # Then: Path of the file on a server and specified title of the file is returned to a submission form
  context "when user types a title while uploading" do
    it "should display the path to the file and its title after finished" do
      visit "/"

      page.attach_file('file', "#{FILES}/Schumann.mp3")
      click_on 'Upload'

      fill_in 'Title', :with => @title

      page.should have_selector(:xpath, "//p[@class='small'][contains(text(),'#{TEMP_FILE}')]")
      page.should have_selector(:xpath, "//a[text()='#{@title}']")
      upload_files_from_tmp.size.should eq(1)
    end
  end

  # Given: A File
  # When: User uploads the file to the server 
  # And: Leaves the title empty
  # Then: Default title should be returned to the upload form
  context "when title is empty" do
   before do
    @title = ""
   end

    it "should display default title of the file" do
      visit "/"

      fill_in 'Title', :with => @title

      page.attach_file('file', "#{FILES}/Schumann.mp3")
      click_on 'Upload'
      
      page.should have_selector(:xpath, "//p[@class='small'][contains(text(),'#{TEMP_FILE}')]")
      page.should have_selector(:xpath, "//a[text()='#{@default_title}']")
      upload_files_from_tmp.size.should eq(1)
    end

    # Given: A File
    # When: User forgets to attach the file 
    # And: Leaves the title empty
    # Then: Nothing happens
    context "when file is not attached" do
      it "should do and show nothing" do
        visit "/"

        fill_in 'Title', :with => @title

        click_on 'Upload'
        
        page.should !have_selector(:xpath, "//a[text()='#{@default_title}']")
        page.should !have_selector(:xpath, "//p[@class='small'][contains(text(),'#{TEMP_FILE}')]")
        upload_files_from_tmp.size.should eq(0)
      end
    end
  end
end
