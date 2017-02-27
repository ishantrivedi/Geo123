package com.geo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.geo.dao.ProductDao;
import com.geo.model.Product;


@Controller
@RequestMapping("/customer")
public class ProductController {

    @Autowired
    private ProductDao productDao;

/*    @RequestMapping("/productList/all")
    public String getProducts(Model model) {
        List<Product> products = productDao.getProductList();
        model.addAttribute("products", products);

        return "productList";
    }*/
    
    @Transactional
    @RequestMapping("/ListofProducts")
    public String getProducts(Model model) {
        List<Product> products = productDao.getProductList();
        model.addAttribute("products", products);

        return "ListofProducts";
    }
    
    @RequestMapping("/viewProduct/{productId}")
    public String viewProduct(@PathVariable int productId, Model model) throws IOException {
        Product product=productDao.getProductById(productId);
        model.addAttribute("product", product);

        return "viewProduct";
    }

    @RequestMapping("/productList")
    public String getProductByCategory(@RequestParam("searchCondition") String searchCondition, Model model) {
        List<Product> products = productDao.getProductList();
        model.addAttribute("products", products);
        model.addAttribute("searchCondition", searchCondition);

        return "productList";
    }
}
