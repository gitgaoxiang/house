package com.cn.ninezero.pojo;

import com.cn.bluemobi.product.common.DwzPagerMySQL;

public class User {
    private Integer userId;

    private String userName;

    private String userPwd;

    private String userRole;

    private String teamId;

    private String userAvatar;

    private String backgroundTheme;
	private DwzPagerMySQL pager;
	
	private String roleName;
	
	

    public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public DwzPagerMySQL getPager() {
		return pager;
	}

	public void setPager(DwzPagerMySQL pager) {
		this.pager = pager;
	}

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getUserPwd() {
        return userPwd;
    }

    public void setUserPwd(String userPwd) {
        this.userPwd = userPwd == null ? null : userPwd.trim();
    }

    

    public String getUserRole() {
		return userRole;
	}

	public void setUserRole(String userRole) {
		this.userRole = userRole;
	}

	public String getTeamId() {
        return teamId;
    }

    public void setTeamId(String teamId) {
        this.teamId = teamId == null ? null : teamId.trim();
    }

    public String getUserAvatar() {
        return userAvatar;
    }

    public void setUserAvatar(String userAvatar) {
        this.userAvatar = userAvatar == null ? null : userAvatar.trim();
    }

    public String getBackgroundTheme() {
        return backgroundTheme;
    }

    public void setBackgroundTheme(String backgroundTheme) {
        this.backgroundTheme = backgroundTheme == null ? null : backgroundTheme.trim();
    }
}