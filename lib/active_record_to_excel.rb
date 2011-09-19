require "rubygems"
require "spreadsheet"

class Array
  def to_excel(options)
    filename  = options.delete(:filename)
    path      = options.delete(:path)

    generate_excel(filename, path, options)
  end

  private

    def generate_excel(filename, path, options)
      labels = options.values

      Spreadsheet.client_encoding = 'LATIN1//TRANSLIT//IGNORE'
      book = Spreadsheet::Workbook.new
      sheet = book.create_worksheet
      sheet.row(0).concat(labels)
      
      self.each_with_index do |record, i|
        labels.each_with_index do |label, j|
          sheet[i+1,j] = record.send(options.find{ |k, v| v == label }.first)
        end
      end

      book.write File.join(File.expand_path(path || Rails.public_path), filename || 'report.xls')
    end
end
