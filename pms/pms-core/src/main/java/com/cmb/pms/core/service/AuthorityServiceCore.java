package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.Authority;

/**
 * @author WuPing
 */

public interface AuthorityServiceCore {

    public Authority searchAuthorityById(Integer authorityID);
    
    public String insertAuthority(Authority authority);
    
    public int getTotalNum(String authName);

    public List<Authority> getAuthorities(String authName, int startIndex, int pageSize);
    
    public String deleteAuthority(Integer authorityID);
    
    public String updateAuthority(Authority  authority);
    
    public List<Authority> getAllAuthorities();
    
    public List<Authority> getAuthoritiesByAuthIDList(List<Integer> authIDList);
}

