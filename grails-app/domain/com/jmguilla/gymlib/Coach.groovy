package com.jmguilla.gymlib

import grails.validation.Validateable;

class Coach extends User{

  static hasMany = [coursesGiven: Course]
  
  static mappedBy = [coursesGiven: 'coach']

  static constraints = {
    importFrom User
    coursesGiven(nullable: true)
  }
}
