package com.jmguilla

class Coach extends User{

  static hasMany = [courses: Course]

  static constraints = {
    courses(nullable: true)
  }
}
