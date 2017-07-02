package org.vyushkov.testcrud.model;

public class User {

  private long id;
  private String name;
  private String lastName;
  private int age;
  private String sex;

  public User() {}

  public User(String name, String lastName, int age, String sex) {
    this.name = name;
    this.lastName = lastName;
    this.age = age;
    this.sex = sex;
  }

  public User(long id, String name, String lastName, int age, String sex) {
    this.id = id;
    this.name = name;
    this.lastName = lastName;
    this.age = age;
    this.sex = sex;
  }

  public long getId() {
    return id;
  }

  public String getName() {
    return name;
  }

  public String getLastName() {
    return lastName;
  }

  public int getAge() {
    return age;
  }

  public String getSex() {
    return sex;
  }
}
