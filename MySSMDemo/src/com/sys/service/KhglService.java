package com.sys.service;

import java.util.List;

import com.sys.pojo.DataGridResult;
import com.sys.pojo.Khgl;
import com.sys.vo.MessageInfo;

public interface KhglService {
	public List<Khgl> getKhgls() throws Exception;
	
	public DataGridResult getGCXX(int id) throws Exception;
	
	public MessageInfo delGcxx(String[] ids) throws Exception;
}
