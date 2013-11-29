modules = {
  main_css{ 
    dependsOn 'bootstrap' 
    resource url: 'css/main.css' 
  }
  auth_css{
    dependsOn 'main_css'
    resource url: 'css/auth.css'
  }
  application { resource url:'js/application.js' }
  angular{
    dependsOn 'jquery'
    resource url: 'js/lib/angular-1.2.1/angular.js'
    resource url: 'js/lib/angular-1.2.1/angular-resource.js'
    resource url: 'js/lib/angular-1.2.1/angular-route.js'
  }
  angular_app {
    dependsOn 'angular'
    resource url:'js/app/services.js'
    resource url:'js/app/app.js'
    resource url:'js/app/controllers.js'
    resource url:'js/app/config.js'
  }
}