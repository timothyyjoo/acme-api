class ErrorCheck

  def self.check_amount(hash)
    if hash["amount"] != "4900" || 4900 || "1999" || 1999 || "9900" || 9900
       false
     else
       hash
    end
  end




end
