package com.jmguilla

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class ClubController {

  transient springSecurityService

  def index() {
    def result = Club.get(params.id)
    try{
      if(!result){
        response.status = 404
        result = new ApiResult(type: 'danger', message: message(code: 'app.api.nosuchobject', args:["Club", params.id], default: "No club with id ${params.id}"))
      }else{
        if(params.fields){
          def club = result
          result = [:]
          for(field in params.fields.split(",")){
            result[field] = club."$field"
          }
        }
      }
    }catch(Throwable t){
      response.status = 500
      result = new ApiResult(type: 'danger', message: "Cannot retrieve club with id: ${params.id} because of ${t}")
    }
    withFormat{
      json{
        JSON.use("deep"){render(result as JSON)}
      }
      html{
        render(model:[clubInstance: result, view: 'index'])
      }
    }
  }

  def show() {
    render model:[clubInstance: Club.get(params.id)], view: 'show'
  }

  @Secured(['ROLE_CLUB_ADMIN','ROLE_ADMIN'])
  def edit() {
    if(!params.tab){
      params.tab = 'description'
    }
    render(
        model: [clubInstance: Club.find("from Club as c where c.id = :id and (:currentUser in elements(c.admins) or c.owner = :currentUser)", [id: new Long(params.id), currentUser: springSecurityService.getCurrentUser()])],
        view: 'edit',
        params: params
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
