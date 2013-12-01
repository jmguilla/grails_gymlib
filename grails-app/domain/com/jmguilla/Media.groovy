package com.jmguilla

class Media {

  String url
  String header
  String description
  Boolean enabled = true

  static constraints = {
    url(nullable: false)
    header(nullable: true, blank: false)
    description(nullable: true, blank: false)
    enabled(nullable: true)
  }
}
