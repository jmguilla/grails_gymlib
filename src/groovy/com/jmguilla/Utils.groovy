package com.jmguilla

class Utils {
  def static String shortId(int nbChars = 6) {
    def chars = ('0'..'9') + ('a'..'h') + ('j'..'k') + ('m'..'z') + ('A'..'H') + ('J'..'K') + ('M'..'Z')
    def random = new Random()
    def id = ""
    for ( i in 1..nbChars ) {
      id += chars[random.nextInt(chars.size())]
    }
    return id
  }
}
