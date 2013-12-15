package com.jmguilla.gymlib

import grails.transaction.Transactional

class UserService {
  
  @Transactional
  def boolean hasClubAdminRights(Club club, User user){
    return club.owner.email.equalsIgnoreCase(user.email) ||
    club.admins.inject(false){acc, val -> acc || val.email.equalsIgnoreCase(user.email)}
  }
}
