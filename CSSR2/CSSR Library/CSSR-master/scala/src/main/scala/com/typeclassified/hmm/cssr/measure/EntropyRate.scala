package com.typeclassified.hmm.cssr.measure

import com.typeclassified.hmm.cssr.state.AllStates

object EntropyRate extends MathUtils {

  def entropyRate(allStates: AllStates):Double = {
    (-1) * allStates.states
      .view
      .zipWithIndex
      .map {
        case (state, i) =>
          val freq = allStates.distribution(i)

          state.distribution.foldLeft(0d) {
            // technically, we can remove branching, but I don't know what scala will do, given log(0)
            case (stateEntRate, prob) if prob > 0 => stateEntRate + (freq * (prob * log2(prob)))
            // Also note that scala logs are the natural log
            case (         ser, prob) if prob <=0 => ser
          } }
      .sum[Double]
  }

}
