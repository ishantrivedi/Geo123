package com.geo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.bind.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
@RequestMapping("/rest/cart")
public class CartResources {

    @Autowired
    private CartDao cartService;

    @Autowired
    private CartItemDao cartItemService;

    @Autowired
    private CustomerDao customerService;

    @Autowired
    private ProductDao productService;

   /* @RequestMapping("/{cartId}")
    public @ResponseBody
    Cart getCartById (@PathVariable(value = "cartId") int cartId) {
    	System.out.println("getCartById called....");
        return cartService.getCartById(cartId);
    }*/

   
    
    @RequestMapping(value = "/remove/{productId}", method = RequestMethod.PUT)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void removeItem (@PathVariable(value = "productId") int productId) {
        CartItem cartItem = cartItemService.getCartItemByProductId(productId);
        cartItemService.removeCartItem(cartItem);

    }

    /*
    @RequestMapping(value = "/{cartId}", method = RequestMethod.DELETE)
    @ResponseStatus(value = HttpStatus.NO_CONTENT)
    public void clearCart(@PathVariable(value = "cartId") int cartId) {
    	System.out.println("clearCart called....");
        Cart cart = cartService.getCartById(cartId);
        cartItemService.removeAllCartItems(cart);
    }*/

    @ExceptionHandler(IllegalArgumentException.class)
    @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Illegal request, please verify your payload.")
    public void handleClientErrors (Exception e) {}

    @ExceptionHandler(Exception.class)
    @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server Error.")
    public void handleServerErrors (Exception e) {}
}
