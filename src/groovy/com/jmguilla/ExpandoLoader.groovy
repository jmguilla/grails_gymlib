package com.jmguilla


class ExpandoLoader {

  def load = {
    ExpandoMetaClass.enableGlobally()
    // add overloading here
  }
}
