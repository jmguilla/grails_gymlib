package com.jmguilla.gymlib

class Club {

  String name = 'My Gallery'
  ClubOwner owner
  Gallery gallery = new Gallery()
  boolean enabled = false

  static hasMany = [members: User, coaches: Coach, courses: Course, comments: Comment, activities: Activity, admins: User]
  static belongsTo = [ClubOwner]

  static constraints = {
    name(nullable: false)
    owner(nullable: false)
    members(nullable: true)
    activities(nullable: true)
    comments(nullable: true)
    courses(nullable: true)
    admins(nullable: true)
    coaches(nullable: true)
    gallery(nullable: false)
    enabled(nullable: false)
  }
}
