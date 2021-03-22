package kr.co.nimo.furniture;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.nimo.furniture.admin.AdminFurnService;
import kr.co.nimo.furniture.admin.AdminFurnVO;

@Controller
@RequestMapping(value = "fur/nimokwan/")
public class AdFurController {
	
		@Autowired
		private AdminFurnService adminFur;
		
		@RequestMapping(value = "furList")
		public String furList(Model model, @RequestParam(defaultValue = "1") int pagenum) {
			model.addAttribute("list", adminFur.getFurList(pagenum));
			model.addAttribute("page", adminFur.getPage(pagenum));
			model.addAttribute("pagenum", pagenum);
			return "/furkwan/furList";
		}
		
		@RequestMapping(value = "furDetail")
		public String furDetail(Model model,  @RequestParam int fur_code) {
			model.addAttribute("detail", adminFur.getFurDetail(fur_code));
			return "/furkwan/furDetail";
		}
		@RequestMapping(value = "furAddForm")
		public String furDetail(Model model) {
			model.addAttribute("fur_code", adminFur.getFurCode());
			return "/furkwan/furAddForm";
		}
		
		@RequestMapping(value = "furInsert")
		public String furIsert(Model model,  MultipartHttpServletRequest mtfRequest) {
			AdminFurnVO vo = new AdminFurnVO();
			List<MultipartFile> fileList = mtfRequest.getFiles("fur_image");
			String path = "C:\\swork\\nimo\\src\\main\\webapp\\resources\\furImages\\";
			String fur_image = "";
			for (MultipartFile mf_m : fileList) {
				String originFileName = mf_m.getOriginalFilename(); // 원본 파일 명
	            String safeFile = path + originFileName;
	            fur_image = fur_image + "," + originFileName;
	            try {
	                mf_m.transferTo(new File(safeFile));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
			}
			MultipartFile mf_d1 = mtfRequest.getFile("fur_subimage1");
			String fur_subimage1 = mf_d1.getOriginalFilename();
			if (fur_subimage1 != "") {
	            String safeFile1 = path + fur_subimage1;
	            vo.setFur_subimage1(fur_subimage1);
	            try {
	                mf_d1.transferTo(new File(safeFile1));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
			}
			MultipartFile mf_d2 = mtfRequest.getFile("fur_subimage2");
			String fur_subimage2 = mf_d2.getOriginalFilename();
			if (fur_subimage2 != "") {
	            String safeFile2 = path + fur_subimage2;
	            vo.setFur_subimage2(fur_subimage2);
	            try {
	                mf_d2.transferTo(new File(safeFile2));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
			}
			MultipartFile mf_d3 = mtfRequest.getFile("fur_subimage3");
			String fur_subimage3 = mf_d3.getOriginalFilename();
			if (fur_subimage3 != "") {
	            String safeFile3 = path + fur_subimage3;
	            vo.setFur_subimage3(fur_subimage3);
	            try {
	                mf_d3.transferTo(new File(safeFile3));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
			}
			vo.setFur_image(fur_image);
			vo.setFur_category(mtfRequest.getParameter("fur_category"));
			vo.setFur_name(mtfRequest.getParameter("fur_name"));
			vo.setFur_option(mtfRequest.getParameter("fur_option"));
			vo.setFur_quantity(Integer.parseInt(mtfRequest.getParameter("fur_quantity")));
			vo.setFur_price(Integer.parseInt(mtfRequest.getParameter("fur_price")));
			vo.setFur_option(mtfRequest.getParameter("fur_option"));
			vo.setFur_subdetail1_1(mtfRequest.getParameter("fur_subdetail1_1"));
			vo.setFur_subdetail1_2(mtfRequest.getParameter("fur_subdetail1_2"));
			vo.setFur_subdetail2_1( mtfRequest.getParameter("fur_subdetail2_1"));
			vo.setFur_subdetail2_2( mtfRequest.getParameter("fur_subdetail2_2"));
			vo.setFur_subdetail3_1(mtfRequest.getParameter("fur_subdetail3_1"));
			vo.setFur_subdetail3_2(mtfRequest.getParameter("fur_subdetail3_2"));
			
			
		
			
			int check = adminFur.getFurInsert(vo);
			System.out.println("추가 "+ check +"건 처리 완료");
			
			return "redirect:/fur/nimokwan/furList";
		}
		
		@RequestMapping(value = "furUpdate")
		public String furUpdate(Model model,  MultipartHttpServletRequest mtfRequest) {
			AdminFurnVO vo = new AdminFurnVO();
			List<MultipartFile> fileList = mtfRequest.getFiles("fur_image");
			String path = "C:\\swork\\nimo\\src\\main\\webapp\\resources\\furImages\\";
			String fur_image = "";
			for (MultipartFile mf_m : fileList) {
	            String originFileName = mf_m.getOriginalFilename(); // 원본 파일 명
	            if (originFileName != "") {
	            	String safeFile = path + originFileName;
	            	fur_image = fur_image + "," + originFileName;
	            	try {
	            		mf_m.transferTo(new File(safeFile));
	            	} catch (IllegalStateException e) {
	            		// TODO Auto-generated catch block
	            		e.printStackTrace();
	            	} catch (IOException e) {
	            		// TODO Auto-generated catch block
	            		e.printStackTrace();
	            	}
				} else {
					fur_image = mtfRequest.getParameter("furi");
				}
			}
			MultipartFile mf_d1 = mtfRequest.getFile("fur_subimage1");
			String fur_subimage1 = mf_d1.getOriginalFilename();
			if (fur_subimage1 != "") {
	            String safeFile1 = path + fur_subimage1;
	            vo.setFur_subimage1(fur_subimage1);
	            try {
	                mf_d1.transferTo(new File(safeFile1));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
			} else if (!mtfRequest.getParameter("furi1").equals("")) {
				vo.setFur_subimage1(mtfRequest.getParameter("furi1"));
			}
			MultipartFile mf_d2 = mtfRequest.getFile("fur_subimage2");
			String fur_subimage2 = mf_d2.getOriginalFilename();
			if (fur_subimage2 != "") {
	            String safeFile2 = path + fur_subimage2;
	            vo.setFur_subimage2(fur_subimage2);
	            try {
	                mf_d2.transferTo(new File(safeFile2));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
			} else if (!mtfRequest.getParameter("furi2").equals("")) {
				vo.setFur_subimage2(mtfRequest.getParameter("furi2"));
			}
			MultipartFile mf_d3 = mtfRequest.getFile("fur_subimage3");
			String fur_subimage3 = mf_d3.getOriginalFilename();
			if (fur_subimage3 != "") {
	            String safeFile3 = path + fur_subimage3;
	            vo.setFur_subimage3(fur_subimage3);
	            try {
	                mf_d3.transferTo(new File(safeFile3));
	            } catch (IllegalStateException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            } catch (IOException e) {
	                // TODO Auto-generated catch block
	                e.printStackTrace();
	            }
			} else if (!mtfRequest.getParameter("furi3").equals("")) {
				vo.setFur_subimage3(mtfRequest.getParameter("furi3"));
			}
			vo.setFur_image(fur_image);
			vo.setFur_code(Integer.parseInt(mtfRequest.getParameter("fur_code")));
			vo.setFur_name(mtfRequest.getParameter("fur_name"));
			vo.setFur_quantity(Integer.parseInt(mtfRequest.getParameter("fur_quantity")));
			vo.setFur_price(Integer.parseInt(mtfRequest.getParameter("fur_price")));
			vo.setFur_option(mtfRequest.getParameter("fur_option"));
			vo.setFur_subdetail1_1(mtfRequest.getParameter("fur_subdetail1_1"));
			vo.setFur_subdetail1_2(mtfRequest.getParameter("fur_subdetail1_2"));
			vo.setFur_subdetail2_1( mtfRequest.getParameter("fur_subdetail2_1"));
			vo.setFur_subdetail2_2( mtfRequest.getParameter("fur_subdetail2_2"));
			vo.setFur_subdetail3_1(mtfRequest.getParameter("fur_subdetail3_1"));
			vo.setFur_subdetail3_2(mtfRequest.getParameter("fur_subdetail3_2"));
			
			int check = adminFur.getFurUpdate(vo);
			System.out.println("수정 "+ check +"건 처리 완료");
			
			return "redirect:/fur/nimokwan/furList";
		}
		
		@RequestMapping(value = "furDelete")
		public String furDelete(Model model,  @RequestParam int fur_code) {
			
			int check = adminFur.getFurDelete(fur_code);
			System.out.println("삭제"+ check +"건 처리 완료");
			
			return "redirect:/fur/nimokwan/furList";
		}

}
