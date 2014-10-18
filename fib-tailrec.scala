import scala.annotation.tailrec

object Main extends App {
  def fib(n: Long): BigInt = {
    @tailrec
    def go(nn: Long, n1: BigInt, n2: BigInt): BigInt = {
      nn match {
        case iteration if iteration == n => n1 + n2
        case iteration => go(iteration + 1, n1 + n2, n1)
      }
    }

    n match {
      case 0 | 1 => 1
      case _ => go(2, 1, 1)
    }
  }

  val n = if (args.length > 0) {
    args(0).toLong
  } else {
    40
  }

  println(fib(n))
}
