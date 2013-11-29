import com.jmguilla.User


class BootStrap {

  def mailService
  def dataWarmupService

  def init = { servletContext ->

    new com.jmguilla.ExpandoLoader().load()
    //TODO change datawarmupservice for static utils
    dataWarmupService.dev()
  }
  def destroy = {
  }
}
