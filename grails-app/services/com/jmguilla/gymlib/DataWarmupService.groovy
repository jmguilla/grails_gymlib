package com.jmguilla.gymlib

import grails.transaction.Transactional

@Transactional
class DataWarmupService {

  def dev() {
    if(Role.count == 0) {
      new Role(authority: "ROLE_USER").save(flush: true, failOnError: true)
      new Role(authority: "ROLE_ADMIN").save(flush: true, failOnError: true)
      new Role(authority: "ROLE_CLUB_ADMIN").save(flush: true, failOnError: true)
      new Role(authority: "ROLE_FACEBOOK").save(flush: true, failOnError: true)
    }
    assert Role.count() == 4

    def user = null
    if(!(user = new ClubOwner(username:'jmguilla', password:'jmguilla', email:'guillauj@gmail.com', firstName: 'Jean-Michel', lastName: 'Guillaume', phoneNumber: '+33000000000', sha1: Utils.shortId(), thumbnail: "http://lorempixel.com/g/75/75/people/")).save(flush: true, failOnError: true)){
      for(error in user.errors.getAllErrors()){
        //      authUser.errors.getFieldError("email")
        //      println "email already used"
        println error
      }
    }
    if(!(user = new ClubOwner(username:'manu', password:'manu', email:'ea.dietform@gmail.com', firstName: 'Manu', lastName: 'Ars', phoneNumber: '+33000000000', sha1: Utils.shortId(), thumbnail: "http://lorempixel.com/g/75/75/people/")).save(flush: true, failOnError: true)){
      for(error in user.errors.getAllErrors()){
        println error
      }
    }
    assert ClubOwner.count() == 2
    
    for(tmp in User.all){
      UserRole.create(tmp, Role.findByAuthority("ROLE_USER"), true)
      UserRole.create(tmp, Role.findByAuthority("ROLE_ADMIN"), true)
      UserRole.create(tmp, Role.findByAuthority("ROLE_CLUB_ADMIN"), true)
    }
    assert UserRole.count() == 3 * User.count()
    
    for(i in 1..16){
      Coach coach = new Coach(thumbnail: 'http://lorempixel.com/g/75/75/people/', username:"coach$i", password:"coach$i", email:"coach$i@gmail.com", firstName: "firstname coach$i", lastName: "lastname coach$i", phoneNumber: '+33000000000', sha1: Utils.shortId(), signin: new Date()).save(flush: true, failOnError: true);
      UserRole.create(coach, Role.findByAuthority("ROLE_USER"), true)
    }
    assert Coach.count() == 18

    for(j in 1..3){    
      Gallery gallery = new Gallery(title: "My Gallery $j", description: "My Gallery $j").save(flush: true, failOnError: true)
      for(i in 1..6){
        Media media = new Media(url: 'http://lorempixel.com/300/300/sports/', header: "A random header ${j}${i}", description: "A random description for a random picture ${j}${i}", rank: i, gallery: gallery).save(failOnError: true)
        gallery.addToMedias(media)
        if(i == 1){
          gallery.main = media
        }
      }
      gallery.save(flush: true, failOnError: true)
    }
    assert Gallery.count() == 3
    assert Media.count() == 3 * 6

    Club club = new Club(name: "Squash Antibes Fitness Club", owner: User.findByUsername('jmguilla'), gallery: Gallery.get(1))
    club.addToMembers(User.findByUsername('jmguilla'))
    club.addToAdmins(User.findByUsername('jmguilla'))
    for(i in 1..10){
      club.addToCoaches(Coach.get(i))
    }
    club.save(failOnError: true, flush: true)
    club = new Club(name: "Fitlane Sophia", owner: User.findByUsername('jmguilla'), gallery: Gallery.get(2))
    club.addToMembers(User.findByUsername('jmguilla'))
    club.addToAdmins(User.findByUsername('jmguilla'))
    for(i in 4..14){
      club.addToCoaches(Coach.get(i))
    }
    club.save(failOnError: true, flush: true)
    club = new Club(name: "Fitlane Cannes", owner: User.findByUsername('jmguilla'), gallery: Gallery.get(3))
    club.addToMembers(User.findByUsername('jmguilla'))
    club.addToAdmins(User.findByUsername('jmguilla'))
    for(i in 6..16){
      club.addToCoaches(Coach.get(i))
    }
    club.save(failOnError: true, flush: true)
    assert Club.count() == 3
    
    ActivityCategory category = new ActivityCategory(name: 'Fitness').save(failOnError: true, flush:true)
    category = new ActivityCategory(name: 'Zumba').save(failOnError: true, flush:true)
    category = new ActivityCategory(name: 'Mills').save(failOnError: true, flush:true)
    assert ActivityCategory.count() == 3

    Activity activity = new Activity(name: "Zumba Tonic", category: ActivityCategory.findByName('Zumba')).save(failOnError: true, flush: true)
    Course course = new Course(activity: activity, club: club).save(failOnError: true, flush: true)
    activity = new Activity(name: "Body Tonic", category: ActivityCategory.findByName('Fitness')).save(failOnError: true, flush: true)
    course = new Course(activity: activity, club: club).save(failOnError: true, flush: true)
    activity = new Activity(name: "Body Attack", category: ActivityCategory.findByName('Fitness')).save(failOnError: true, flush: true)
    course = new Course(activity: activity, club: club).save(failOnError: true, flush: true)
    activity = new Activity(name: "Body Combat", category: ActivityCategory.findByName('Mills')).save(failOnError: true, flush: true)
    course = new Course(activity: activity, club: club).save(failOnError: true, flush: true)
    course.addToParticipants(user)
    course.save(failOnError: true, flush: true)
    assert Activity.count() == 4
    assert Course.count() == 4
  }
}
