module ActiveRecordToExcel
  def to_excel(options )
    File.open(File.join(Rails.public_path, 'report.xls'), "w")
  end
end

Array.send(:include, ActiveRecordToExcel)
