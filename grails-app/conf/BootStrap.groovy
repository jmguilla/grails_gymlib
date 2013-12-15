import com.jmguilla.gymlib.User


class BootStrap {

  def mailService
  def dataWarmupService

  def init = { servletContext ->

    new com.jmguilla.gymlib.ExpandoLoader().load()
    //TODO change datawarmupservice for static utils
    dataWarmupService.dev()
  }
  def destroy = {
  }
}
