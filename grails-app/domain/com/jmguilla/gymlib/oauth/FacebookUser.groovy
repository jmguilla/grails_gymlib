package com.jmguilla.gymlib.oauth

import com.jmguilla.gymlib.User

class FacebookUser implements OAuthUser{

  long uid
  String accessToken
  Date accessTokenExpires

  static belongsTo = [user: User]

  static constraints = { uid unique: true, nullable: false, blank: false }
}
