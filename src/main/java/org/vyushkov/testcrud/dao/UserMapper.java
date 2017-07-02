package org.vyushkov.testcrud.dao;

import org.vyushkov.testcrud.model.User;

import java.util.List;

public interface UserMapper {

  User getUserById(Integer id);

  List<User> listUsers();

  boolean addUser(User user);

  void updateUser(User user);

  void removeUser(int id);

}
