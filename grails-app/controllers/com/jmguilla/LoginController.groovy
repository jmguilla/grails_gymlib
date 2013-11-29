package com.jmguilla
import grails.converters.JSON
import grails.transaction.Transactional

import javax.servlet.http.HttpServletResponse

import org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils
import org.codehaus.groovy.grails.plugins.web.taglib.ApplicationTagLib
import org.springframework.security.authentication.AccountExpiredException
import org.springframework.security.authentication.CredentialsExpiredException
import org.springframework.security.authentication.DisabledException
import org.springframework.security.authentication.LockedException
import org.springframework.security.web.WebAttributes
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter

import com.jmguilla.Role
import com.jmguilla.User
import com.jmguilla.UserRole
import com.jmguilla.Utils

class LoginController {

  /**
   * Dependency injection for the authenticationTrustResolver.
   */
  def authenticationTrustResolver

  /**
   * Dependency injection for the springSecurityService.
   */
  def springSecurityService

  def mailService
  
  def simpleCaptchaService
  
  def grailsApplication

  /**
   * Default action; redirects to 'defaultTargetUrl' if logged in, /login/auth otherwise.
   */
  def index = {
    if (springSecurityService.isLoggedIn()) {
      redirect uri: SpringSecurityUtils.securityConfig.successHandler.defaultTargetUrl
    }
    else {
      redirect action: 'auth', params: params
    }
  }

  /**
   * Show the login page.
   */
  def auth = {

    def config = SpringSecurityUtils.securityConfig

    if (springSecurityService.isLoggedIn()) {
      redirect uri: config.successHandler.defaultTargetUrl
      return
    }

    String view = 'auth'
    String postUrl = "${request.contextPath}${config.apf.filterProcessesUrl}"
    render view: view, model: [postUrl: postUrl,
      rememberMeParameter: config.rememberMe.parameter]
  }

  /**
   * The redirect action for Ajax requests.
   */
  def authAjax = {
    response.setHeader 'Location', SpringSecurityUtils.securityConfig.auth.ajaxLoginFormUrl
    response.sendError HttpServletResponse.SC_UNAUTHORIZED
  }

  /**
   * Show denied page.
   */
  def denied = {
    if (springSecurityService.isLoggedIn() &&
    authenticationTrustResolver.isRememberMe(SCH.context?.authentication)) {
      // have cookie but the page is guarded with IS_AUTHENTICATED_FULLY
      redirect action: 'full', params: params
    }
  }

  /**
   * Login page for users with a remember-me cookie but accessing a IS_AUTHENTICATED_FULLY page.
   */
  def full = {
    def config = SpringSecurityUtils.securityConfig
    render view: 'auth', params: params,
    model: [hasCookie: authenticationTrustResolver.isRememberMe(SCH.context?.authentication),
      postUrl: "${request.contextPath}${config.apf.filterProcessesUrl}"]
  }

  /**
   * Callback after a failed login. Redirects to the auth page with a warning message.
   */
  def authfail = {

    def username = session[UsernamePasswordAuthenticationFilter.SPRING_SECURITY_LAST_USERNAME_KEY]
    String msg = ''
    def exception = session[WebAttributes.AUTHENTICATION_EXCEPTION]
    if (exception) {
      if (exception instanceof AccountExpiredException) {
        msg = g.message(code: "springSecurity.errors.login.expired")
      }
      else if (exception instanceof CredentialsExpiredException) {
        msg = g.message(code: "springSecurity.errors.login.passwordExpired")
      }
      else if (exception instanceof DisabledException) {
        msg = g.message(code: "springSecurity.errors.login.disabled")
      }
      else if (exception instanceof LockedException) {
        msg = g.message(code: "springSecurity.errors.login.locked")
      }
      else {
        msg = g.message(code: "springSecurity.errors.login.fail")
      }
    }

    if (springSecurityService.isAjax(request)) {
      render([error: msg] as JSON)
    }
    else {
      flash.message = msg
      redirect action: 'auth', params: params
    }
  }

  def create = {
    //TODO dynamically determine the "login" part in the url
    def postUrl = "${request.contextPath}/login/createUser"
    render view: 'create', model: [postUrl: postUrl]
  }

  @Transactional
  def createUser(){
    if(!simpleCaptchaService.validateCaptcha(params.captcha)){
      flash.error = message(code: "user.create.captcha.notValid.message", args: [])
      render view: 'create', params: params
      return
    }
    User user = User.findWhere(email: params.email)
    if(user){
      flash.error = message(code: "user.create.emailInUse.message", args: [params.email])
      render view: 'create', params: params
      return
    }
    def password = params['password']
    //TODO externalize that number for shortId and user creation
    user = new User(params)
    user.signin = new Date()
    user.enabled = false
    user.sha1 = Utils.shortId(16)
    while(User.findAllWhere(sha1: user.sha1).size() > 0){
      user.sha1 = Utils.shortId(16)
    }
    user = user.save(failOnError: true)
    UserRole.create(user, Role.findByAuthority('ROLE_USER'), true)
    //TODO externalise login & confirm
    def confUrl = new ApplicationTagLib().createLink(absolute: true, controller: 'login', action: 'confirm', params: ['sha1': user.sha1])
    //TODO send html mail
    mailService.sendMail {
      to user.email
      subject message(code: 'user.email.verification.subject', args:[user.username], default: 'Email confirmation')
      //TODO dynamically determine the "login" part in the url
      body message(code: 'user.email.verification.body', args:[user.username, password, confUrl], default: 'Click or copy/paste that link $confUrl to verify your email.')
    }
    redirect(uri: '/')
  }

  def confirm = {
    User toConfirm = User.findWhere(sha1: params.sha1)
    if(!toConfirm){
      //TODO implement rediction for non existing user for confirmation
      render(status: 404)
    }
    //TODO externalise that int
    toConfirm.sha1 = Utils.shortId(6)
    while(User.findAllWhere(sha1: toConfirm.sha1).size() > 0){
      toConfirm.sha1 = Utils.shortId(6)
    }
    toConfirm.enabled = true
    toConfirm = toConfirm.save(flush: true, failOnError: true)
    //TODO confirmation is ok, but user should be automatically authenticated.
    flash.message = message(code: 'user.email.verified.mess', args: [], default: 'Your email has been verified!')
    redirect(uri: '/')
  }

  /**
   * The Ajax success redirect url.
   */
  def ajaxSuccess = {
    render([success: true, username: springSecurityService.authentication.name] as JSON)
  }

  /**
   * The Ajax denied redirect url.
   */
  def ajaxDenied = {
    render([error: 'access denied'] as JSON)
  }
}
