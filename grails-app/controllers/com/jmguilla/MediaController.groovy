package com.jmguilla

import grails.plugins.springsecurity.Secured;
import grails.transaction.Transactional;

class MediaController {

  def index() {
  }

  @Secured(['ROLE_ADMIN', 'ROLE_CLUB_ADMIN'])
  @Transactional
  def fileUpload(){
    Gallery gallery = Gallery.get(params["gallery.id"])
    if(!gallery){
      response.status = 404
      render text: 'Cannot create target dir'
      return
    }
    def f = request.getFile('file')
    if (f.empty) {
        response.status = 404
        render text: 'file cannot be empty'
        return
    }
    //TODO use S3 instead
    String toWebApp = "D:\\workspace\\grails_gymlib\\web-app\\"
    File targetDir = new File("${toWebApp}images\\temp")
    if(!targetDir && !targetDir.mkdirs()){
        flash.message = 'Cannot create target dir'
        response.status = 404
        return
    }
    File target = new File(targetDir, f.getOriginalFilename())
    if(!target.exists() && !target.createNewFile()){
        response.status = 404
        render text: 'Cannot create target file'
        return
    }
    f.transferTo(target)
    println "file wrote to ${target.getAbsolutePath()}"
    Media media = new Media(
      gallery: gallery,
      url: target.getAbsolutePath().replace(toWebApp, '/gymlib/').replace("\\", "/"),
      rank: 1 + Media.findAllWhere(gallery: gallery).size()).save()
    gallery.addToMedias(media)
    gallery.save(failOnError: true, flush: true)
    response.sendError(200, 'Done')
  }
}
