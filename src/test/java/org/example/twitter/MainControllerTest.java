package org.example.twitter;

import org.example.twitter.controller.MainController;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartHttpServletRequest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers;
import org.springframework.test.context.TestPropertySource;
import org.springframework.test.context.jdbc.Sql;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMultipartHttpServletRequestBuilder;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.xpath;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
@WithUserDetails("admin")
@TestPropertySource("/application-test.properties")
@Sql(value = {"/create-user-before.sql", "/messages-list-before.sql"}, executionPhase = Sql.ExecutionPhase.BEFORE_TEST_METHOD)
@Sql(value = {"/messages-list-after.sql", "/create-user-after.sql"}, executionPhase = Sql.ExecutionPhase.AFTER_TEST_METHOD)
public class MainControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private MainController mainController;

    @Test
    public void mainPageTest() throws Exception {
        mockMvc.perform(get("/main"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@id=\"navbarSupportedContent\"]/div").string("admin"));
    }

    @Test
    public void messageListTest() throws  Exception {
        mockMvc.perform(get("/main"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@id=\"message-list\"]/div").nodeCount(4));

    }

    @Test
    public void filterMessageTest() throws  Exception {
        mockMvc.perform(get("/main").param("filter", "tag"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@id=\"message-list\"]/div").nodeCount(2))
                .andExpect(xpath("//div[@id=\"message-list\"]/div[@data-id=\"1\"]").exists())
                .andExpect(xpath("//div[@id=\"message-list\"]/div[@data-id=\"4\"]").exists());
    }

    @Test
    public void addMessageToListTest() throws  Exception {
        MockHttpServletRequestBuilder multipart = multipart("/main")
                .file("file", "testContent".getBytes())
                .param("text", "Message text")
                .param("tag", "test-tag")
                .with(csrf());

        mockMvc.perform(multipart)
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(xpath("//div[@id=\"message-list\"]/div").nodeCount(5))
                .andExpect(xpath("//div[@id=\"message-list\"]/div[@data-id=\"10\"]").exists())
                .andExpect(xpath("//div[@id=\"message-list\"]/div[@data-id=\"10\"]/div/span").string("Message text"))
                .andExpect(xpath("//div[@id=\"message-list\"]/div[@data-id=\"10\"]/div/i").string("#test-tag"));

    }

}
