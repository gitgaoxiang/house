package com.cn.ninezero.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.cn.ninezero.dao.LoanMapper;
import com.cn.ninezero.pojo.Loan;
import com.cn.ninezero.service.LoanService;

@Service
public class LoanServiceImpl implements LoanService {
	@Resource
	private LoanMapper loanDao;

	@Override
	public long getLoanCount(Loan loan) throws Exception {
		// TODO Auto-generated method stub
		return loanDao.getLoanCount(loan);
	}

	@Override
	public List<Loan> getLoanList(Loan loan) {
		// TODO Auto-generated method stub
		return loanDao.getLoanList(loan);
	}

	@Override
	public List<Loan> getLoanList_export(Loan loan) {
		// TODO Auto-generated method stub
		return loanDao.getLoanList_export(loan);
	}

	@Override
	public void loanApply(Loan loan) {
		loanDao.loanApply(loan);
		
	}

	

}