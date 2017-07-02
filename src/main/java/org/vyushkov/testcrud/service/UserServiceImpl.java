package org.vyushkov.testcrud.service;

import org.apache.ibatis.session.SqlSession;
import org.vyushkov.testcrud.dao.Util;
import org.vyushkov.testcrud.dao.UserMapper;
import org.vyushkov.testcrud.model.User;

import java.util.List;

public class UserServiceImpl implements UserService {

  public void addUser(User user) {
    try (SqlSession sqlSession = Util.getFactory().openSession()) {
      UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
      userMapper.addUser(user);
      sqlSession.commit();
    }
  }

  @Override
  public void updateUser(User user) {
    try (SqlSession sqlSession = Util.getFactory().openSession()) {
      UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
      userMapper.updateUser(user);
      sqlSession.commit();
    }
  }

  @Override
  public void removeUser(int id) {
    try (SqlSession sqlSession = Util.getFactory().openSession()) {
      UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
      userMapper.removeUser(id);
      sqlSession.commit();
    }
  }

  @Override
  public List<User> listUsers() {
    try (SqlSession sqlSession = Util.getFactory().openSession()) {
      UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
      return userMapper.listUsers();
    }
  }

  @Override
  public User getUserById(Integer id) {
    try (SqlSession sqlSession = Util.getFactory().openSession()) {
      UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
      return userMapper.getUserById(id);
    }
  }
}
