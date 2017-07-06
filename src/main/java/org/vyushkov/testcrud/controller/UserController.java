package org.vyushkov.testcrud.controller;

import com.google.gson.Gson;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.vyushkov.testcrud.model.User;
import org.vyushkov.testcrud.service.UserService;

@Controller
public class UserController {
  private UserService userService;

  @Autowired
  @Qualifier(value = "userService")
  public void setUserService(UserService userService) {
    this.userService = userService;
  }

  @RequestMapping(value = "/users", method = RequestMethod.GET)
  public ModelAndView listUsers() {
    return new ModelAndView("users");
  }

  @RequestMapping(value = "/getuser", method = RequestMethod.GET)
  public ModelAndView getUserByIdPage() {
    return new ModelAndView("getbyid");
  }

  @RequestMapping(value = "/update", method = RequestMethod.GET)
  public ModelAndView getUpdatePage() {
    return new ModelAndView("update");
  }

  @RequestMapping(value = "/create", method = RequestMethod.GET)
  public ModelAndView getCreatePage() {
    return new ModelAndView("create");
  }

  @RequestMapping(value = "/delete", method = RequestMethod.GET)
  public ModelAndView getRemovePage() {
    return new ModelAndView("remove");
  }

  @RequestMapping(value = "/getusers", method = RequestMethod.GET, produces = "application/json")
  @ResponseBody
  public String getUsers() {
    return new Gson().toJson(this.userService.listUsers());
  }

  @RequestMapping(value = "/getbyid", method = RequestMethod.POST, produces = "application/json")
  @ResponseBody
  public String getUserById(@RequestParam String id) {
    return new Gson().toJson(this.userService.getUserById(Integer.parseInt(id.replaceAll("\n","").replaceAll("\\s",""))));
  }

  @RequestMapping(value = "/adduser", method=RequestMethod.POST)
  @ResponseBody
  public void addUser(@RequestParam String name,
                      @RequestParam String lastName,
                      @RequestParam String age,
                      @RequestParam String sex) {
    User user = new User(name, lastName, Integer.parseInt(age.replaceAll("\\s","")
                                                              .replaceAll("\n","")), sex);
    this.userService.addUser(user);
  }

  @RequestMapping(value = "/removeuser", method=RequestMethod.POST)
  public void removeUser(@RequestParam String id) {
    this.userService.removeUser(Integer.parseInt(id.replaceAll("\n","").replaceAll("\\s","")));
  }

  @RequestMapping(value = "/updateuser", method=RequestMethod.POST)
  public void updateUser(@RequestParam String id,
                         @RequestParam String name,
                         @RequestParam String lastName,
                         @RequestParam String age,
                         @RequestParam String sex) {
    User user = new User(Integer.parseInt(id.replaceAll("\\s", "").replaceAll("\n", "")),
                         name, lastName,
                         Integer.parseInt(age.replaceAll("\\s", "").replaceAll("\n", "")),
                         sex);
    this.userService.updateUser(user);
  }
}
