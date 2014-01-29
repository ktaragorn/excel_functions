require "excel_functions/version"
require "excel_functions/financial"
require "excel_functions/lookup"

#module to be included in a client class
module ExcelFunctions

end

#class which provides all the methods as class methods
class Excel
  extend ExcelFunctions
end