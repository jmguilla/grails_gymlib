package com.jmguilla.gymlib

class Activity {

  String name

  static belongsTo = [category: ActivityCategory]

  static constraints = {
    name(nullabe: false, blank: false)
    category(nullable: false)
  }
}
