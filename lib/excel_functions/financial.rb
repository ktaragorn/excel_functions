#file containing the financial functions
module ExcelFunctions  
  # attempt to implement http://office.microsoft.com/en-sg/excel-help/npv-HP005209199.aspx
  def npv(rate,*values)
    #If n is the number of cash flows in the list of values, the formula for NPV is: 
    # sum upto n (values[i]/(1+rate)^i)
    values.each_with_index.inject(0){|sum,(val, index)| sum + val/((1.0+rate)**(index+1))}
  end

  #http://office.microsoft.com/en-sg/excel-help/pmt-HP005209215.aspx
  #Calculates the payment for a loan based on constant payments and a constant interest rate.
  # Rate     is the interest rate for the loan.
  # Nper     is the total number of payments for the loan.
  # Pv     is the present value, or the total amount that a series of future payments is worth now; also known as the principal.
  # Fv     is the future value, or a cash balance you want to attain after the last payment is made. If fv is omitted, it is assumed to be 0 (zero), that is, the future value of a loan is 0.
  # Type     is the number 0 (zero) or 1 and indicates when payments are due.
  # Set type equal to   If payments are due
  # 0 or omitted  At the end of the period
  # 1   At the beginning of the period
  # full formula at http://www.getobjects.com/Components/Finance/TVM/formulas.html
  #first 3 params at http://answers.yahoo.com/question/index?qid=20080822070859AAY94ZT
  def pmt(rate,nper,pv,fv =0,type = 0)
    #- pv/((1 - (1 / (1 + rate)**nper )) / rate)
    pv = -pv

    k = [1,1+rate][type]

    -(pv + (pv - fv)/((1+rate) ** nper - 1))* -rate/k #added some extra neg signs to get it to work
  end
end