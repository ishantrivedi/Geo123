package com.geo.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.geo.dao.CartDao;
import com.geo.dao.CartItemDao;
import com.geo.dao.CustomerDao;
import com.geo.dao.ProductDao;
import com.geo.model.Cart;
import com.geo.model.CartItem;
import com.geo.model.Customer;
import com.geo.model.Product;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	private Path path;

	@Autowired
	private CustomerDao customerDao;
	
	@Autowired
    private CartDao cartService;

    @Autowired
    private CartItemDao cartItemService;

    @Autowired
    private ProductDao productService;
	
	String message;
	
	@RequestMapping(value = "/addcart/{productId}", method = RequestMethod.POST)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void addItem (@PathVariable(value ="productId") int productId, @AuthenticationPrincipal User activeUser) {
    	System.out.println("add cart called....");
        Customer customer = customerDao.getCustomerByCustomername(activeUser.getUsername());
        Cart cart = customer.getCart();
        Product product = productService.getProductById(productId);
        List<CartItem> cartItems = cart.getCartItems();
       
        for (int i=0; i<cartItems.size(); i++) {
            if(product.getProductId()==cartItems.get(i).getProduct().getProductId())
            {
                CartItem cartItem = cartItems.get(i);
                cartItem.setQuantity(cartItem.getQuantity()+1);
                cartItem.setTotalPrice(product.getProductPrice()*cartItem.getQuantity());
                cartItemService.addCartItem(cartItem);

                return;
            }
        }

        CartItem cartItem = new CartItem();
        cartItem.setProduct(product);
        cartItem.setQuantity(1);
        cartItem.setTotalPrice(product.getProductPrice()*cartItem.getQuantity());
        cartItem.setCart(cart);
        cartItemService.addCartItem(cartItem);
    }

	
	@RequestMapping("/customerList/all")
	public String getCustomers(Model model) {
		List<Customer> customers = customerDao.getCustomerList();
		model.addAttribute("customers", customers);

		return "customerList";
	}

	@RequestMapping("/viewCustomer/{customerId}")
	public String viewCustomer(@PathVariable int customerId, Model model) throws IOException {
		Customer customer = customerDao.getCustomerById(customerId);
		model.addAttribute("customer", customer);

		return "viewCustomer";
	}

	@RequestMapping("/customerList")
	public String getCustomerByCategory(@RequestParam("searchCondition") String searchCondition, Model model) {
		List<Customer> customers = customerDao.getCustomerList();
		model.addAttribute("customers", customers);
		model.addAttribute("searchCondition", searchCondition);

		return "customerList";
	}

	// Adding customername and password confirmation from a sample project
	@RequestMapping(value = "/authenticate", method = RequestMethod.POST, headers = "Accept=application/json")
	public String authenticateCustomer(@RequestParam("customername") String customername, @RequestParam("password") String password,
			HttpSession session) {
		System.out.println("customername:" + customername);
		System.out.println("password:" + password);

		Customer customer1 = customerDao.getCustomerByCustomername(customername);
		String result = "login";
		if (customer1 == null)
			result = "login";

		if (customer1.getPassword().equals(password))
			result = "index";

		return result;

		/*
		 * int result=0;
		 * result=customerDao.validateCustomer(customer1.getcustomername(),customer.getpassword());
		 * System.out.println("result we have got is:"+result);
		 * 
		 * if(result!=0){ session.setAttribute("loggedInCustomer", customer);
		 * session.setAttribute("loggedInCustomerId", customer.getCustomerId()); } return
		 * result;
		 */

	}
}
