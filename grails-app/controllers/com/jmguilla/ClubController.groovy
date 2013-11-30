package com.jmguilla

import facebook4j.Activity
import grails.plugins.springsecurity.Secured;

class ClubController {
  
  transient springSecurityService

  def index() {
  }
  
  def show() {
    render model:[clubInstance: Club.get(params.id)], view: 'show'
  }
  
  @Secured(['ROLE_CLUB_ADMIN', 'ROLE_ADMIN'])
  def edit() {
    render(
      model: [clubInstance: Club.find("from Club as c where c.id = :id and (:currentUser in elements(c.admins) or c.owner = :currentUser)", [id: new Long(params.id), currentUser: springSecurityService.getCurrentUser()])],
      view: 'edit'
    )
  }
}
