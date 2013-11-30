package com.jmguilla

import com.jmguilla.oauth.FacebookUser

class User {

  transient springSecurityService

  String sha1
  String email
  String firstName
  String lastName
  String phoneNumber
  Date signin
  Date birthday
  Address address
  //below required by authentication plugin
  //below, in addition to password, required by spring security plugin
  String password
  String username
  boolean enabled = true
  boolean accountExpired = false
  boolean accountLocked = false
  boolean passwordExpired = false
  //below oauth entities
  static hasOne = [fbUser:FacebookUser]
  
  //below app specific properties
  static hasMany = [contents: Content, courses: Course]

  static constraints = {
    firstName(nullable: true, size: 1..64)
    lastName(nullable: true, size: 1..64)
    phoneNumber(nullable: true, blank: false)
    sha1(nullable: true, blank: false, unique: true)
    address(nullable: true)
    username(nullable: true)
    password(nullable: false)
    signin(nullable: false)
    birthday(nullable: true)
    fbUser(nullable: true, unique: true)
    contents(nullable: true)
    courses(nullable: true)
  }

  static mapping = {
    password column: 'password'
    version false
  }

  Set<Role> getAuthorities() {
    UserRole.findAllByUser(this).collect { it.role } as Set
  }

  def beforeInsert() {
    encodePassword()
  }

  def beforeUpdate() {
    if (isDirty('password')) {
      encodePassword()
    }
  }

  protected void encodePassword() {
    password = springSecurityService.encodePassword(password)
  }
}
