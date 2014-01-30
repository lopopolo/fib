// vim: set ft=scala:

import java.util.concurrent.Executors
import scala.concurrent._

object Main extends App {
  implicit val ectx = ExecutionContext.fromExecutorService(Executors.newCachedThreadPool())

  val fib: Long => Future[BigInt] = {
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
