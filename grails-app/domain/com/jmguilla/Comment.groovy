package com.jmguilla

class Comment extends Content{
  
  User writer
  Club club
  Activity activity

  static constraints = {
    writer(nullable: false)
    club(nullable: true)
    activity(nullable: true)
  }
}
