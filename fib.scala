// vim: set ft=scala:

object Main extends App {
  def fib(n: Long): BigInt = {
    if (n < 2) {
      1
    } else {
      fib(n - 1) + fib(n -2)
    }
  }

  val n = if (args.length > 0) {
    args(0).toLong
  } else {
    40
  }

  println(fib(n))
}
