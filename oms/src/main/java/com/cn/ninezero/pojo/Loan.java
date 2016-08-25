package com.cn.ninezero.pojo;

import java.util.Date;

import com.cn.bluemobi.product.common.DwzPagerMySQL;

public class Loan {
    private String qq;

    private String address;

    private String name;

    private String tel;

    private String creditscore;

    private String creditcondition;

    private String dredgetime;

    private String loanreason;

    private String loanlimit;

    private Date applytime;

    private String totallimit;

    private Integer checkresult;

    private String checkreason;

	private DwzPagerMySQL pager;

	
	
    public DwzPagerMySQL getPager() {
		return pager;
	}

	public void setPager(DwzPagerMySQL pager) {
		this.pager = pager;
	}

	public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getCreditscore() {
        return creditscore;
    }

    public void setCreditscore(String creditscore) {
        this.creditscore = creditscore == null ? null : creditscore.trim();
    }

    public String getCreditcondition() {
        return creditcondition;
    }

    public void setCreditcondition(String creditcondition) {
        this.creditcondition = creditcondition == null ? null : creditcondition.trim();
    }

    public String getDredgetime() {
        return dredgetime;
    }

    public void setDredgetime(String dredgetime) {
        this.dredgetime = dredgetime == null ? null : dredgetime.trim();
    }

    public String getLoanreason() {
        return loanreason;
    }

    public void setLoanreason(String loanreason) {
        this.loanreason = loanreason == null ? null : loanreason.trim();
    }

    public String getLoanlimit() {
        return loanlimit;
    }

    public void setLoanlimit(String loanlimit) {
        this.loanlimit = loanlimit == null ? null : loanlimit.trim();
    }

    public Date getApplytime() {
        return applytime;
    }

    public void setApplytime(Date applytime) {
        this.applytime = applytime;
    }

    public String getTotallimit() {
        return totallimit;
    }

    public void setTotallimit(String totallimit) {
        this.totallimit = totallimit == null ? null : totallimit.trim();
    }

    public Integer getCheckresult() {
        return checkresult;
    }

    public void setCheckresult(Integer checkresult) {
        this.checkresult = checkresult;
    }

    public String getCheckreason() {
        return checkreason;
    }

    public void setCheckreason(String checkreason) {
        this.checkreason = checkreason == null ? null : checkreason.trim();
    }
}