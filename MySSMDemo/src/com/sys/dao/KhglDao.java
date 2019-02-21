package com.sys.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.sys.pojo.Khgl;
import com.sys.vo.GcmcVo;
import com.sys.vo.MessageInfo;

public interface KhglDao {
	/*查询所有用户*/
	public List<Khgl> getKhgls() throws Exception;
	/*查询指定id的工程信息*/
	public List<GcmcVo> getGcmcXX(int id) throws Exception;
	/*删除工程信息*/
	public int delGcxx(@Param("ids") String[] ids) throws Exception;
}
