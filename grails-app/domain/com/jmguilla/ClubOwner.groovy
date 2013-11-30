package com.jmguilla

class ClubOwner extends Coach{

  static hasMany = [clubs: Club]

  static constraints = { clubs(nullable: true) }
}
