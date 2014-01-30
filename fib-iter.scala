// vim: set ft=scala:

object Main extends App {
  def fib(n: Long): BigInt = {
    var a = 1
    var b = 1
    1L to n foreach { _ => val temp = b; b = a + b; a = temp; }
    a
  }

  val n = if (args.length > 0) {
    args(0).toLong
  } else {
    40
  }

  println(fib(n))
}
