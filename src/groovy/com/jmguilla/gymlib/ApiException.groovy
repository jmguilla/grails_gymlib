package com.jmguilla.gymlib

class ApiException extends RuntimeException {

  public ApiException() {
    super()
  }

  public ApiException(String message) {
    super(message)
  }

  public ApiException(Throwable cause) {
    super(cause)
  }

  public ApiException(String message, Throwable cause) {
    super(message, cause)
  }
}
