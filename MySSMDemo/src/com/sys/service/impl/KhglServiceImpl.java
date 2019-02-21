package com.sys.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sys.dao.KhglDao;
import com.sys.pojo.DataGridResult;
import com.sys.pojo.Khgl;
import com.sys.service.KhglService;
import com.sys.utils.PageUtil;
import com.sys.vo.GcmcVo;
import com.sys.vo.MessageInfo;

@Service
public class KhglServiceImpl implements KhglService{
	@Autowired
	private KhglDao khglDao;
	@Override
	public List<Khgl> getKhgls() throws Exception {
		System.out.println("KhglService");
		return khglDao.getKhgls();
	}
	@Override
	public DataGridResult getGCXX(int id) throws Exception {
		/*List<GcmcVo> list = khglDao.getGcmcXX(id);
		DataGridResult data = new DataGridResult();
		data.setTotal(list.size());
		data.setRows(list);
		// 1000  1 20   total 1000 rows 20
		// 0            total 0 rows null
		// 19           total 19 rows list
*/		return PageUtil.convertToResult(khglDao.getGcmcXX(id));
	}
	@Override
	public MessageInfo delGcxx(String[] ids) throws Exception {
		int num = khglDao.delGcxx(ids);
		MessageInfo msg = new MessageInfo();
		if(num == ids.length){
			msg.setFlag(true);
			msg.setMsg("删除成功："+num+"条数据！");
		}else{
			msg.setFlag(false);
			msg.setMsg("删除错误");
		}
		return msg;
	}

}
