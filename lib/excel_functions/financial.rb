#file containing the financial functions
module ExcelFunctions  
  #Calculates the net present value of an investment by using a discount rate and a series of future payments (negative values) and income (positive values).
  # @param rate     is the rate of discount over the length of one period.
  # @param *values      are 1 to 29 arguments representing the payments and income.
  # @return net present value of an investment
  # @see http://office.microsoft.com/en-sg/excel-help/npv-HP005209199.aspx Specification
  def npv(rate,*values)
    #If n is the number of cash flows in the list of values, the formula for NPV is: 
    # sum upto n (values[i]/(1+rate)^i)
    values.each_with_index.inject(0){|sum,(val, index)| sum + val/((1.0+rate)**(index+1))}
  end

  #Calculates the payment for a loan based on constant payments and a constant interest rate.
  # @param  rate     is the interest rate for the loan.
  # @param nper     is the total number of payments for the loan.
  # @param pv     is the present value, or the total amount that a series of future payments is worth now; also known as the principal.
  # @param fv     is the future value, or a cash balance you want to attain after the last payment is made. If fv is omitted, it is assumed to be 0 (zero), that is, the future value of a loan is 0.
  # @param type     is the number 0 (zero) or 1 and indicates when payments are due.
  # 
  #   Set type equal to   
  #   0 or omitted  If payments are due At the end of the period or 
  #   1  If payments are due At the beginning of the period
  # @return [Float] payment for a loan based on the inputs
  # @see http://office.microsoft.com/en-sg/excel-help/pmt-HP005209215.aspx Specification
  # @see http://answers.yahoo.com/question/index?qid=20080822070859AAY94ZT  formula using first 3 params
  # @see http://www.getobjects.com/Components/Finance/TVM/formulas.html   Full Formula
  def pmt(rate,nper,pv,fv =0,type = 0)
    #- pv/((1 - (1 / (1 + rate)**nper )) / rate)
    pv = -pv

    k = [1,1+rate][type]

    -(pv + (pv - fv)/((1+rate) ** nper - 1))* -rate/k #added some extra neg signs to get it to work
  end
end