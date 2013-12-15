modules = {
  //js
  dropzone{
    dependsOn 'jquery'
    resource url: 'js/lib/dropzone/dropzone.js'
    resource url: 'js/lib/dropzone/css/dropzone.css'
  }
  angular{
    dependsOn 'jquery'
    resource url: 'js/lib/angular-1.2.1/angular-csp.css'
    resource url: 'js/lib/angular-1.2.1/angular.js'
    resource url: 'js/lib/angular-1.2.1/angular-resource.js'
    resource url: 'js/lib/angular-1.2.1/angular-route.js'
    resource url: 'js/lib/angular-1.2.1/angular-sanitize.js'
    resource url: 'js/lib/angular-1.2.1/angular-animate.js'
  }
  angular_app {
    dependsOn 'angular'
    dependsOn 'bootstrap_ui'
    resource url:'js/app/services.js'
    resource url:'js/app/app.js'
    resource url:'js/app/controllers.js'
    resource url:'js/app/config.js'
  }
  
  //bootstrap and css
  bootstrap_switch {
    dependsOn 'bootstrap'
    resource url: 'js/lib/bootstrap-switch/bootstrap-switch.css'
    resource url: 'js/lib/bootstrap-switch/bootstrap-switch.js'
  }
  bootstrap_ui {
    dependsOn 'bootstrap'
    dependsOn 'angular'
    resource url: 'js/lib/bootstrap-ui-0.7/ui-bootstrap-tpls-0.7.0.js'
  }
  main_css{
    dependsOn 'bootstrap'
    resource url: 'css/main.css'
  }
  club_show_css{
    dependsOn 'main_css'
    resource url: 'css/club.show.css'
  }
  user_clubs_css{
    dependsOn 'main_css'
    resource url: 'css/user.clubs.css'
  }
  club_edit_css{
    dependsOn 'main_css'
    resource url: 'css/club.edit.css'
  }
  auth_css{
    dependsOn 'main_css'
    resource url: 'css/auth.css'
  }
  application {
    resource url:'js/application.js'
  }
}