package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Admin;

@Repository
public interface AdminRepository extends JpaRepository<Admin, Integer>
{
    @Query("select a from Admin a where username=?1 and password=?2")
	public Admin checkadminlogin(String auname,String apwd);

}
