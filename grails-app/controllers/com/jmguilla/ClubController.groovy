package com.jmguilla

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class ClubController {

  transient springSecurityService

  def index() {
  }

  def show() {
    render model:[clubInstance: Club.get(params.id)], view: 'show'
  }

  @Secured(['ROLE_CLUB_ADMIN','ROLE_ADMIN'])
  def edit() {
    render(
        model: [clubInstance: Club.find("from Club as c where c.id = :id and (:currentUser in elements(c.admins) or c.owner = :currentUser)", [id: new Long(params.id), currentUser: springSecurityService.getCurrentUser()])],
        view: 'edit'
        )
  }

  @Secured(['ROLE_CLUB_ADMIN','ROLE_ADMIN'])
  def switchEnabled(){
    ApiResult result = null
    if(!request.post()){
      response.status = 405
      result = new ApiResult(type: 'danger', message: message(code: "app.api.wrongmethod", default: "Wrong method"))
    }else{
      Club club = Club.get(params.id)
      if(!club){
        response.status = 404
        result = new ApiResult(type: 'danger', message: message(code: "app.api.notfound", args: ["Club with id: ${params.id}"], default: "Cannot perform operation because target was not found"))
      }else{
        if(!club.owner.equals(springSecurityService.getCurrentUser()) || !club.admins.contains(springSecurityService.getCurrentUser())){
          response.status = 403
          result = new ApiResult(type: 'danger', message: message(code: "app.api.notallowed", default: "You are not allowed to perform that operation"))
        }else{
          club.enabled = !club.enabled
          if(!club.save(flush: true)){
            result = new ApiResult(type: 'danger', message: message(code: "app.api.danger", args: [club.errors.getAllErrors()], default: "Cannot perform operation"))
          }else{
            result = new ApiResult(type: 'success', message: message(code: "app.api.success", default: "Operation performed successfully"))
          }
        }
      }
    }
    withFormat{
      json{
        render(result as JSON)
      }
    }
  }
}
