// vim: set ft=scala:

import java.util.concurrent.Executors
import scala.collection.mutable
import scala.concurrent._

object Main extends App {
  case class Memo[A, B](f: A => B) {
    private val cache = mutable.Map.empty[A,B]
    def apply(a: A): B = cache.getOrElseUpdate(a, f(a))
  }

  implicit val ectx = ExecutionContext.fromExecutorService(Executors.newCachedThreadPool())

  val fib: Memo[Long, Future[BigInt]] = Memo {
    case n if n < 2 => Future.successful(1L)
    case n => for {
      n1 <- fib(n - 1)
      n2 <- fib(n -2)
    } yield n1 + n2
  }

  val n = if (args.length > 0) {
    args(0).toLong
  } else {
    40
  }

  fib(n).foreach { r => println(r); sys.exit(0) }
}
