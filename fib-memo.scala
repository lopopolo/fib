// vim: set ft=scala:

import scala.collection.mutable

object Main extends App {
  case class Memo[A, B](f: A => B) {
    private val cache = mutable.Map.empty[A,B]
    def apply(a: A): B = cache.getOrElseUpdate(a, f(a))
  }

  val fib: Memo[Long, BigInt] = Memo {
    case n if n < 2 => 1L
    case n => fib(n - 1) + fib(n -2)
  }

  val n = if (args.length > 0) {
    args(0).toLong
  } else {
    40
  }

  println(fib(n))
}
