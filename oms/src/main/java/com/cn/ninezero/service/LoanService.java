 package com.cn.ninezero.service;  
  
import java.util.List;

import com.cn.ninezero.pojo.Loan;
  
public interface LoanService {  
 

	public long getLoanCount(Loan loan) throws Exception;

	

	public List<Loan> getLoanList(Loan loan);



	public List<Loan> getLoanList_export(Loan loan);



	public void loanApply(Loan loan);
}