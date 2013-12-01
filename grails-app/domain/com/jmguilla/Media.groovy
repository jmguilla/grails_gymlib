package com.jmguilla

class Media {

  String url
  String header
  String description
  Integer rank = 0
  Boolean enabled = true

  static belongsTo = [gallery: Gallery]
  
  static mappedBy = [gallery: 'medias']

  static constraints = {
    url(nullable: false)
    header(nullable: true, blank: false)
    description(nullable: true, blank: false)
    enabled(nullable: true)
    rank(nullable: false)
    gallery(nullable: true)
  }
}
