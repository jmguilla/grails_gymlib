package com.jmguilla.gymlib

class Gallery {
  
  String title
  String description
  Media main

  static hasMany = [medias: Media]

  static constraints = {
    title(nullable: true, blank: false)
    description(nullable: true, blank: false)
    main(nullable: true)
    medias(nullable: true)
  }
  
  static mapping = {
    medias(cascade: "all-delete-orphan")
  }
}
