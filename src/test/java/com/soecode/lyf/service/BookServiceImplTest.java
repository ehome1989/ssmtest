package com.soecode.lyf.service;

import static org.junit.Assert.fail;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.soecode.lyf.BaseTest;
import com.soecode.lyf.dto.AppointExecution;
import com.soecode.lyf.entity.Book;
import com.soecode.lyf.service.BookService;

public class BookServiceImplTest extends BaseTest {

	@Autowired
	private BookService bookService;

	/*@Test
	public void testAppoint() throws Exception {
		long bookId = 1002;
		long studentId = 12345678911L;
		AppointExecution execution = bookService.appoint(bookId, studentId);
		System.out.println("====>>>"+execution);
	}*/
	
	@Test
	public void testQueryByname() throws Exception {
		String name = "数据";
		List<Book> books = bookService.getByName(name);
		System.out.println("====>>>"+books.get(0));
	}

}