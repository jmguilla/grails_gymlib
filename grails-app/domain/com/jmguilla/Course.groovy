package com.jmguilla

class Course {

  Activity activity
  Coach coach
  Club club
  
  static hasMany = [participants: User]
  static belongsTo = [Club, Coach, Activity, User, ClubOwner]

  static constraints = {
    activity(nullable: false)
    coach(nullable: true)
    club(nullable: true)
    participants(nullable: true)
  }
}
