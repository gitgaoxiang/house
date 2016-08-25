package com.cn.ninezero.dao;

import java.util.List;

import com.cn.ninezero.pojo.Loan;

public interface LoanMapper {
  long getLoanCount(Loan loan);

List<Loan> getLoanList(Loan loan);

List<Loan> getLoanList_export(Loan loan);

void loanApply(Loan loan);
}