package com.jmguilla.gymlib

import facebook4j.Facebook
import facebook4j.FacebookFactory
import facebook4j.auth.AccessToken

class FacebookUserService {

    def getUser(User user) {
      Facebook facebook = new FacebookFactory().getInstance();
      facebook.setOAuthAccessToken(new AccessToken(user.fbUser.accessToken, null));
      def fbOAuth = facebook.getMe()
    }
}
