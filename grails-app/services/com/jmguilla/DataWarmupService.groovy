package com.jmguilla

import grails.transaction.Transactional

@Transactional
class DataWarmupService {

  def dev() {
    if(Role.count == 0) {
      new Role(authority: "ROLE_USER").save(flush: true, failOnError: true)
      new Role(authority: "ROLE_ADMIN").save(flush: true, failOnError: true)
      new Role(authority: "ROLE_FACEBOOK").save(flush: true, failOnError: true)
    }
    def user = null
    if(!(user = new User(username:'jmguilla', password:'jmguilla', email:'guillauj@gmail.com', firstName: 'Jean-Michel', lastName: 'Guillaume', phoneNumber: '+33000000000', sha1: Utils.shortId(), signin: new Date())).save(flush: true, failOnErro: true)){
      for(error in user.errors.getAllErrors()){
        println error
      }
    }
    UserRole.create(user, Role.findByAuthority("ROLE_USER"), true)
    assert User.count() == 1
    //    if(!(user = new User(username:'jmguilla', login:'jmguilla', password:'jmguilla'.encodeAsSHA1(), email:'jmichel.guillaume@gmail.com', status:AuthenticationService.STATUS_VALID, firstName: 'Jean-Michel', lastName: 'Guillaume', phoneNumber: '+33000000000', sha1: Utils.shortId())).save(flush: true, failOnErro: true)){
    //      for(error in user.errors.getAllErrors()){
    //        println error
    //      }
    //    }
    //    here is an example about how to check properties validation
    //    if(!(authUser = new AuthenticationUser(login:'jmguilla', password:'jmguilla'.encodeAsMD5(), email:'guillauj@gmail.com', status:AuthenticationService.STATUS_VALID)).save()) {
    //      authUser.errors.getFieldError("email")
    //      println "email already used"
    //    }
  }
}
