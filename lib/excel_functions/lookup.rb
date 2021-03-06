#file containing the lookup based functions
module ExcelFunctions
  #The LOOKUP function searches for the value in the lookup_range and returns the value from the same position in the result_range. 
  #If this parameter is omitted, the LOOKUP function will return the first column of data.
  #In Syntax #2, the LOOKUP function searches for the value in the first row or column of the array and returns the corresponding value in the last row or column of the array.
  #@param value the value to be searched for 
  #@param [Array] lookup_array the array in which the value is looked for, and possibly the result is fetched from
  #@param [Array] output_array If given, the result is fetched from this array
  # @return Returns the value in the output_array or the last column of the lookup_array from the same position in the result_range
  # @return   If the LOOKUP function can not find an exact match, it chooses the largest value in the lookup_range that is less than or equal to the value.
  # @return   If the value is smaller than all of the values in the lookup_range, then the LOOKUP function will return #N/A(nil in our case).
  # @return If the values in the LOOKUP_range are not sorted in ascending order, the LOOKUP function will return the incorrect value (raise error in our case).
  # @see http://www.techonthenet.com/excel/formulas/lookup.php Specification
  def lookup(value, lookup_array, output_array = nil)
    #combining both syntaxes here by taking 1st col of lookup_array to lookup
    # and the output_array or the last column of the lookup_array to output
    output_array = output_array || lookup_array.map{|arr| Array(arr)[-1]}

    lookup_array = lookup_array.map{|arr| Array(arr)[0]}

    index = lookup_array.find_index(value)
    return output_array[index] if index

    #raise only after exact check fails, we only need sorted for approx lookup
    raise "lookup_array must be sorted" unless lookup_array.sort == lookup_array #better way to check sorted?
    
    first_greater_index = lookup_array.find_index{|look| look > value} || lookup_array.count 
    less_than_index = first_greater_index - 1
    less_than_index >=0 ? output_array[less_than_index] : nil
  end
end