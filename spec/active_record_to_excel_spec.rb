require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "ActiveRecordToExcel" do
  it "add #to_excel to Array" do
    Array.new.should respond_to(:to_excel)
  end

  it "saves the file to public folder with report.xls as filename by default" do
    User.create(:name => 'foo', :email => 'foo@bar.com')
    User.all.to_excel({ :name => 'Name', :email => 'Email' })
    File.exists?(File.join(Rails.public_path, 'report.xls')).should eq(true)
  end

  it "allow to pass the filename as argument"

  it "generate the correct Excel file"

  it "generates Excel file only if options is present"
end
