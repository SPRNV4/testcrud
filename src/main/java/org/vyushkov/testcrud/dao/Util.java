package org.vyushkov.testcrud.dao;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.IOException;
import java.io.Reader;

public class Util {

  @Autowired
  private static SqlSessionFactory factory;

  private static final Logger logger = LoggerFactory.getLogger(Util.class);

  private Util(){
  }

  static {
    Reader reader = null;
    try {
      reader = Resources.getResourceAsReader("mybatis-config.xml");
    } catch (IOException e) {
      logger.error(e.getMessage());
    }
    factory = new SqlSessionFactoryBuilder().build(reader);
  }

  public static SqlSessionFactory getFactory() {
    return factory;
  }
}
