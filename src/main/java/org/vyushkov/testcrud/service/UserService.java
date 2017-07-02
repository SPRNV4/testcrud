package org.vyushkov.testcrud.service;

import org.vyushkov.testcrud.model.User;

import java.util.List;

public interface UserService {

  User getUserById(Integer id);

  List<User> listUsers();

  void addUser(User user);

  void updateUser(User user);

  void removeUser(int id);
}
