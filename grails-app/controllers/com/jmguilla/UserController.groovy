package com.jmguilla

import grails.converters.JSON
import grails.converters.XML
import grails.plugins.springsecurity.Secured
import grails.transaction.Transactional

@Transactional
class UserController {

  def springSecurityService

  def userService

  static scaffold = true

  @Secured(['ROLE_USER'])
  def me(){
    def me = springSecurityService.getCurrentUser()
    withFormat{
      json{ render(me as JSON) }
      xml{ render(me as XML) }
      html{ render '' }
    }
  }

  @Secured(['ROLE_USER'])
  def update(){
    if(!request.post){
      response.sendError(405)
      return
    }
    withFormat{
      json{
        try{
          User me = springSecurityService.getCurrentUser()
          bindData(me, request.JSON)
          me.save(failOnError: true, flush: true)
          render ( new ApiResult(type: 'success', message: message(code: 'app.api.user.update.success', default: 'Update performed successfully')) as JSON)
        }catch(Throwable t){
          //TODO log here!
          render ( status: 400, text: new ApiResult(type: 'danger', message: message(code: 'app.api.user.update.failure', args: [t.message], default: 'Cannot performe the update')) as JSON)
        }
      }
      '*'{ response.sendError(404) }
    }
  }
  
  @Secured(['ROLE_USER'])
  def dashboard(){
    [userInstance: User.get(params.id)]
  }
  
  @Secured(['ROLE_USER'])
  def account(User userInstance){
    [userInstance: User.get(params.id)]
  }
  
  @Secured(['ROLE_USER'])
  def show(User userInstance){
    [userInstance: User.get(params.id)]
  }
  
  @Secured(['ROLE_USER'])
  def edit(User userInstance){
    if(!params.tab){
      params.tab = 'profile'
    }
    [userInstance: User.get(params.id)]
  }

  @Secured(['ROLE_USER'])
  def list(){
    def result = User.list(params)
    withFormat{
      json{ render(result as JSON) }
      xml{ render(result as XML) }
    }
  }
}
