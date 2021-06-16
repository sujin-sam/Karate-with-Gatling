package performance.simulations

import com.intuit.karate.gatling.PreDef._
import io.gatling.core.Predef._

class sampleSimulation extends Simulation{

    val protocol = karateProtocol()

    protocol.nameResolver = (req, ctx) => req.getHeader("karate-name")

    val scn = scenario("karate-scenario")
    .group("ReqRes"){
        exec(karateFeature("classpath:performance/feature/reqResApi.feature"))
        .exec(karateFeature("classpath:performance/feature/anotherApi.feature"))
    }
    

    setUp(
        scn.inject(atOnceUsers(1)).protocols(protocol)
    )

}