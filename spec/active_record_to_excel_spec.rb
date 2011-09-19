require File.expand_path(File.dirname(__FILE__) + '/spec_helper')
require "spreadsheet"
require "ruby-debug"

describe "ActiveRecordToExcel" do
  def generate_excel(options = {})
    User.create(:name => 'foo', :email => 'foo@bar.com')
    User.all.to_excel({ :name => 'Name', :email => 'Email' }.merge(options))
  end

  before(:each) do
    Dir["#{Rails.public_path}/*.xls"].each do |file|
      File.delete(file)
    end
  end

  it "add #to_excel to Array" do
    Array.new.should respond_to(:to_excel)
  end

  it "saves the file to public folder with report.xls as filename by default" do
    generate_excel

    File.exists?(File.join(Rails.public_path, 'report.xls')).should eq(true)
  end

  it "allow to pass the filename as argument" do
    generate_excel(:filename => 'foo.xls')

    File.exists?(File.join(Rails.public_path, 'foo.xls')).should eq(true)
  end

  it "allow to pass path as argument" do
    generate_excel(:path => '/tmp')

    File.exists?(File.expand_path('/tmp/report.xls')).should eq(true)
  end

  it "generate the correct Excel file" do
    generate_excel

    book  = Spreadsheet.open(File.join(Rails.public_path, 'report.xls'))
    sheet = book.worksheet 0
    row1  = sheet.row(0)
    row2  = sheet.row(1)

    row1[0].should eq('Name')
    row1[1].should eq('Email')

    row2[0].should eq('foo')
    row2[1].should eq('foo@bar.com')
  end
end
