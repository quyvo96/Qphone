package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.User;
import utils.AuthUtil;

public class UTF8Filter implements Filter {

    public UTF8Filter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest req = (HttpServletRequest) request;
		
		HttpServletResponse res = (HttpServletResponse) response;
		
		if(!AuthUtil.checkLogin(req, res)) {
			res.sendRedirect(req.getContextPath()+"/auth/login");
			return;
		}
		int id_role = AuthUtil.getIdRoleUser(req, res);
		if(id_role == 3) {			
			res.sendRedirect(req.getContextPath()+"/trang-chu.html");
			return;
		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

}
