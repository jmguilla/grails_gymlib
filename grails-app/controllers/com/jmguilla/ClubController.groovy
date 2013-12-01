package com.jmguilla

import grails.converters.JSON
import grails.plugins.springsecurity.Secured

class ClubController {

  transient springSecurityService
  transient userService

  def index() {
    def result = Club.get(params.id)
    try{
      if(!result){
        response.status = 404
        result = new ApiResult(type: 'danger', content: message(code: 'app.api.nosuchobject', args:["Club", params.id], default: "No club with id ${params.id}"))
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
      result = new ApiResult(type: 'danger', content: "Cannot retrieve club with id: ${params.id} because of ${t}")
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
    postCallWrapper(request, response, params){ club, result ->
      club.enabled = !club.enabled
      if(!club.save(flush: true)){
        result.type = 'danger'
        result.message = message(code: "app.api.danger", args: [club.errors.getAllErrors()], default: "Cannot perform operation")
      }else{
        result.type = 'success'
        result.message = message(code: "app.api.success", default: "Operation performed successfully")
      }
    }
  }
  
  @Secured(['ROLE_CLUB_ADMIN', 'ROLE_ADMIN'])
  def updateGallery(){
    postCallWrapper(request, response, params){ Club club, ApiResult result ->
      def updatedGallery = request.JSON
      bindData(club.gallery, updatedGallery)
      for(media in updatedGallery.medias){
        if(media.deleted){
          def toDelete = Media.get(media.id)
          club.gallery.removeFromMedias(toDelete)
          toDelete.delete()
        }
      }
      club.gallery.save()
      result.type = 'success'
      result.content = "ok"
    }
  }
  
  def protected postCallWrapper(request, response, params, impl){
    ApiResult result = null
    if(!request.post){
      response.status = 405
      result = new ApiResult(type: 'danger', content: message(code: "app.api.wrongmethod", default: "Wrong method"))
    }else{
      def club = Club.get(params.id)
      if(!club){
        response.status = 404
        result = new ApiResult(type: 'danger', content: message(code: "app.api.notfound", args: ["Club with id: ${params.id}"], default: "Cannot perform operation because target was not found"))
      }else{
        if(!userService.hasClubAdminRights(club, springSecurityService.getCurrentUser())){
          response.status = 403
          result = new ApiResult(type: 'danger', content: message(code: "app.api.notallowed", default: "You are not allowed to perform that operation"))
        }else{
          result = new ApiResult()
          impl(club, result)
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
