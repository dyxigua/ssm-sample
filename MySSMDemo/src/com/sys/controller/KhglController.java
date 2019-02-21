package com.sys.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.sys.pojo.DataGridResult;
import com.sys.pojo.Gcmc;
import com.sys.pojo.Khgl;
import com.sys.service.KhglService;
import com.sys.vo.MessageInfo;

@Controller
public class KhglController {
	@Autowired
	private KhglService khglService;
	
	@RequestMapping("/getKhgl.do")
	@ResponseBody
	public List<Khgl> getAll() throws Exception{
		System.out.println("KhglController");
		return khglService.getKhgls();
	}
	
	@RequestMapping("/khgl")
	public String getKhglPage(){
		return "khgl";
	}
	@RequestMapping("/getGcmcById/{id}")
	@ResponseBody
	public DataGridResult getGcmc(@PathVariable("id") int id,int page,int rows) throws Exception{
		System.out.println(rows+"|"+page);
		//分页组件使用
		PageHelper.startPage(page, rows);
		DataGridResult data = khglService.getGCXX(id);
		return data;
	}
	@RequestMapping("/deleteGcxxByids")
	@ResponseBody
	public MessageInfo deleteGcxx(String ids) throws Exception{
		String[] array = ids.split(",");
		MessageInfo msg = khglService.delGcxx(array);
		return msg;
	}
	@RequestMapping("/getGcmcSerach/{id}/{key}/{value}")
	@ResponseBody
	public DataGridResult getGcmcSerach(@PathVariable("id") int id,@PathVariable("key") String key,@PathVariable("value") String value,int page,int rows) throws Exception{
		System.out.println(key+"|"+value);
		System.out.println(rows+"|"+page);
		//分页组件使用
		PageHelper.startPage(page, rows);
		DataGridResult data = khglService.getGCXX(id);
		return data;
	}
}
