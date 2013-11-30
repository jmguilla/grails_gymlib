package com.jmguilla

class ActivityCategory {
  
  String name

  static hasMany = [activities: Activity]

  static constraints = {
  }
}
