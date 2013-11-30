package com.jmguilla

class Club {

  String name
  ClubOwner owner
  Object gallery
  boolean enabled = false

  static hasMany = [members: User, courses: Course, comments: Comment, activities: Activity, admins: User]
  static belongsTo = [ClubOwner]

  static constraints = {
    owner(nullable: false)
    members(nullable: true)
    activities(nullable: true)
    comments(nullable: true)
    courses(nullable: true)
    admins(nullable: true)
    gallery(nullable: true)
    enabled(nullable: false)
  }
}
