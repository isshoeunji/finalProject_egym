package kosta.mvc.controller;

import java.io.File;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kosta.mvc.domain.product.Product;
import kosta.mvc.domain.product.ProductImage;
import kosta.mvc.service.ProductService;

@Controller
@RequestMapping("/shop")
public class ProductController {

	@Autowired
	ProductService productService;


	private Pageable pageable;
	
	/**
	 * 등록폼
	 */
	@RequestMapping("/admin/write")
	public String write() {
		return "shop/product/write";
	}

	/**
	 * 수정폼
	 */
	@RequestMapping("/admin/updateForm")
	public String update(Long productNo, Model model) {

		Product product = productService.selectByNo(productNo, false);
		model.addAttribute("product", product);
		return "shop/product/update";
	}

	/**
	 * 등록
	 */
	@RequestMapping("/admin/insert")
	public String insert(Product product, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session)
			throws Exception {

		String path = session.getServletContext().getRealPath("/save");

		System.out.println(path);

		List<MultipartFile> uploadFileList = multipartHttpServletRequest.getFiles("file");
		List<ProductImage> imageList = new ArrayList<ProductImage>();

		for (MultipartFile file : uploadFileList) {

			File tempFile = new File(path + "/" + file.getOriginalFilename());
			String fileName = file.getOriginalFilename();
			if (tempFile.isFile()) {
				String saveFileName = "";
				String fileCutName = fileName.substring(0, fileName.lastIndexOf("."));
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);

				boolean _exist = true;
				int index = 0;
				// 동일한 파일명이 존재하지 않을때까지 반복한다.
				while (_exist) {
					index++;
					saveFileName = fileCutName + "(" + index + ")." + fileExt;

					_exist = new File(path + "/" + saveFileName).isFile();
					if (!_exist)
						fileName = saveFileName;
				}
			}

			try {
				file.transferTo(new File(path + "/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}

			ProductImage productImage = ProductImage.builder().productImageName(fileName)
					.productImageSize(file.getSize()).product(product).build();
			imageList.add(productImage);
		}

		product.setProductImageList(imageList);

		productService.insert(product);

		return "redirect:/shop";
	}

	/**
	 * 수정
	 */
	@RequestMapping("/admin/update")
	public String update(Product product, MultipartHttpServletRequest multipartHttpServletRequest, HttpSession session)
			throws Exception {

		String path = session.getServletContext().getRealPath("/save");

		List<MultipartFile> uploadFileList = multipartHttpServletRequest.getFiles("file");
		List<ProductImage> imageList = new ArrayList<ProductImage>();

		for (MultipartFile file : uploadFileList) {

			File tempFile = new File(path + "/" + file.getOriginalFilename());
			String fileName = file.getOriginalFilename();
			if (tempFile.isFile()) {
				String saveFileName = "";
				String fileCutName = fileName.substring(0, fileName.lastIndexOf("."));
				String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1);

				boolean _exist = true;
				int index = 0;
				// 동일한 파일명이 존재하지 않을때까지 반복한다.
				while (_exist) {
					index++;
					saveFileName = fileCutName + "(" + index + ")." + fileExt;

					_exist = new File(path + "/" + saveFileName).isFile();
					if (!_exist)
						fileName = saveFileName;
				}
			}

			try {
				file.transferTo(new File(path + "/" + fileName));
			} catch (Exception e) {
				e.printStackTrace();
			}

			ProductImage productImage = ProductImage.builder().productImageName(fileName)
					.productImageSize(file.getSize()).product(product).build();
			imageList.add(productImage);
		}

		product.setProductImageList(imageList);

		productService.update(product, path);

		return "redirect:/shop";
	}

	
	
	/**
	 * category select
	 */
	@RequestMapping("select/{cateCode}")
	public ModelAndView selectCate(@PathVariable int cateCode, @RequestParam(defaultValue = "1") int nowPage, Integer orderBy) {
		
		//orderBy: 0 -> 높은 가격순
		//orderBy: 1 -> 낮은 가격순
		//orderBy: 2 -> 인기순
		//orderBy: 3 -> 등록일순
		
		if(orderBy==null) orderBy=3;
		
		if(orderBy==3) pageable = PageRequest.of(nowPage - 1, 8, Direction.DESC, "productDate");
		else if(orderBy==0)  pageable = PageRequest.of(nowPage - 1, 16, Direction.DESC, "price");
		else if(orderBy==1) pageable = PageRequest.of(nowPage - 1, 16, Direction.ASC, "price");
		else if(orderBy==2) pageable = PageRequest.of(nowPage - 1, 16, Direction.DESC, "readNum");
		 
		//pageable = PageRequest.of(nowPage - 1, 16, Direction.DESC, "productDate");
		
		Page<Product> pageList = productService.selectByCateCode(cateCode, pageable);

		
		System.out.println("orderBy :" + orderBy);
		
		// 상수로 잡자
		int blockCount = 5;
		int temp = (nowPage - 1) % blockCount;
		int startPage = nowPage - temp;
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("cateCode", cateCode);
		mv.addObject("orderBy", orderBy);
		mv.addObject("blockCount", blockCount);
		mv.addObject("nowPage", nowPage);
		mv.addObject("startPage", startPage);
		mv.addObject("list", pageList);
		mv.setViewName("shop/product/itemView");

		return mv;
	}

	/**
	 * single product select(조회수 증가)
	 */
	@RequestMapping("select/single/{productNo}/{readnumCheck}")
	public ModelAndView selectSingle(@PathVariable Long productNo, @PathVariable int readnumCheck,Principal principal) {
		boolean stat = true;
		Product product = productService.selectByNo(productNo, stat);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/product/single");
		mv.addObject("product", product);
		if(principal!=null) {
			mv.addObject("memberId", principal.getName());
		}
		
		// 관리자가 선택했을경우엔 조회수 증가 안한다.
		if (readnumCheck == 0)
			stat = false;

		return mv;
	}

	/**
	 * single product select(조회수 증가x - 관리자가 본다.)
	 */
	@RequestMapping("select/singleAdmin/{productNo}")
	public ModelAndView selectSingleAdmin(@PathVariable Long productNo) {
		Product product = productService.selectByNo(productNo, false);

		return new ModelAndView("shop/product/single-admin", "product", product);
	}
	
}

