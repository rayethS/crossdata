package com.stratio.meta2.server.actors

import akka.actor.{Actor, ActorLogging, ActorRef, Props}
import com.stratio.meta.common.result.QueryStatus
import com.stratio.meta.communication._
import com.stratio.meta2.core.coordinator.Coordinator
import com.stratio.meta2.core.query.{InProgressQuery, MetadataPlannedQuery, PlannedQuery, SelectPlannedQuery, StoragePlannedQuery}
import com.stratio.meta.common.executionplan.{ExecutionWorkflow, StorageWorkflow, MetadataWorkflow}
import com.stratio.meta.communication.ConnectToConnector
import com.stratio.meta.communication.DisconnectFromConnector
import com.stratio.meta.communication.ACK

object CoordinatorActor {
  def props(connectorMgr: ActorRef, coordinator: Coordinator): Props = Props(new CoordinatorActor(connectorMgr, coordinator))
}

class CoordinatorActor(connectorMgr: ActorRef, coordinator: Coordinator) extends Actor with ActorLogging {

  log.info("Lifting coordinator actor")

  //TODO Move this to infinispan
  val inProgress: scala.collection.mutable.Map[String, ExecutionWorkflow] = scala.collection.mutable.Map()

  val coordinators: scala.collection.mutable.Map[String, ActorRef] = scala.collection.mutable.Map()
  val queriesToPersist: scala.collection.mutable.Map[String, PlannedQuery] = scala.collection.mutable.Map()

  def receive = {

    case workflow: MetadataWorkflow => {
      inProgress.put(workflow.getQueryId, workflow)
      workflow.getActorRef.asInstanceOf[ActorRef] ! workflow.getMetadataOperation
    }

    case workflow: StorageWorkflow => {
      inProgress.put(workflow.getQueryId, workflow)
      workflow.getActorRef.asInstanceOf[ActorRef] ! workflow.getStorageOperation
    }

    case query: SelectPlannedQuery => {
      log.info("CoordinatorActor Received SelectPlannedQuery")
      //connector forward query
      connectorMgr ! coordinator.coordinate(query)
    }
    /*
     * Puts the query into a map if it's required to persist metadata 
     */
    case query: MetadataPlannedQuery => {
      log.info("CoordinatorActor Received MetadataPlannedQuery")
      //connector forward query
      val inProgress: InProgressQuery = coordinator.coordinate(query)
      if (inProgress != null) {
        queriesToPersist.put(inProgress.getQueryId(), inProgress)
        connectorMgr ! coordinator.coordinate(query)
      }
    }
    case query: StoragePlannedQuery => {
      log.info("CoordinatorActor Received StoragePlannedQuery")
      //connector forward query
      connectorMgr ! coordinator.coordinate(query)
    }
    /*
     * When Connector answers Coordinator with ACK message with EXECUTED status, coordinator persists the metadata through MDManager
     * and removes the query from the map
     */
    case connectorAck: ACK => {
      if (connectorAck.status == QueryStatus.EXECUTED) {
        log.info(connectorAck.queryId + " executed")
        coordinator.persist(queriesToPersist(connectorAck.queryId))
        queriesToPersist.remove(connectorAck.queryId)
      }
    }

    case error: ExecutionError => {
      //TODO Check how this elements are removed in case of failure
    }

    case _: ConnectToConnector =>
      println("connecting to connector ")

    case _: DisconnectFromConnector =>
      println("disconnecting from connector")



    case _ => {
      sender ! "KO"
      log.info("coordinator actor receives something it doesn't understand ")
      //memberActorRef.tell(objetoConWorkflow, context.sender)
    }

  }

}
