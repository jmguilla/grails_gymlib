package com.jmguilla.gymlib

class ActivityCategory {
  
  String name

  static hasMany = [activities: Activity]

  static constraints = {
  }
}
