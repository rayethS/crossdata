package com.stratio.meta.server.actors

import akka.actor.{Props, ActorLogging, Actor, ActorRef}
import com.stratio.meta.core.planner.Planner
import com.stratio.meta.core.utils.MetaQuery

object PlannerActor{
  def props(executor:ActorRef, planner:Planner): Props =Props(new PlannerActor(executor,planner))
}

class PlannerActor(executor:ActorRef, planner:Planner) extends Actor with TimeTracker with ActorLogging{
  override val timerName= this.getClass.getName
  def receive = {
    case query:MetaQuery if !query.hasError=> {
      log.info("Init Planner Task")
      val timer=initTimer()

      executor forward planner.planQuery(query)
      finishTimer(timer)
      log.info("Finish Planner Task")
    }
    case query:MetaQuery if query.hasError=>{
      sender ! query.getResult
    }
  }

}