package com.jmguilla.gymlib


class ClubOwner extends Coach{

  static hasMany = [clubs: Club]

  public static constraints = {
    importFrom Coach
    clubs(nullable: true)
  }
}
