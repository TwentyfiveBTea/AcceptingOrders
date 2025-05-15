package simulations

import io.gatling.core.scenario.Simulation
import io.gatling.core.Predef._
import io.gatling.http.Predef._

class PiSimulation extends Simulation {

  val httpProtocol = http
    .baseUrl("http://localhost:8080") // HAProxy 入口地址
    .acceptHeader("application/json")

  val scn = scenario("Calculate Pi")
    .repeat(100) {
      exec(
        http("Request Pi Calculation")
          .get("/pi?terms=10000")
      )
    }

  setUp(
    scn.inject(atOnceUsers(99)) // 99 个并发用户
  ).protocols(httpProtocol)
}
