<?php

class Schedule {
    public static function get($Event_id){
        
    }
    /**
     * This function builds the schedule for the specific event-id
     * @param int $Event_id
     */
    public static function build($Event_id){
        //$event = new Event($Event_id);
        $event = Event::getEvent($Event_id);
        //var_dump($event);
        $participants= $event->getParticipants();
        //var_dump($participants);
        $posters= $event->getPosters();
        var_dump($posters);
    }
}
