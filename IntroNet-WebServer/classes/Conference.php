<?php

/**
 * Description of Conference
 *@property int $conference_id This is the conference id in which it has set of events
 * @property string $conference_name This is the name of the conference
 * @property date $registration_start_date This is the start date of the registrations
 * @property date $registration_deadline_date This is the deadlines for the registrations
 * @property time $registration_start_time This is the start time of the registrations
 * @propertuy time $registration_deadline_time ths is the end_time of the registrations
 * 
 */
class Conference {

    public $conference_id;
    public $conference_name;
    public $registration_start_date;
    public $registration_deadline_date;
    public $registration_start_time;
    public $registration_deadline_time;

    public static function getConferences($options=""){
        $conferences = Database::getObjects("Conference",$options);
        return $conferences;
    }
    
    /**
     * This function gets the conference
     * @param int $id Conference id
     * @return Conference
     */
    public static function getConference($id){
        $conference = Database::getObject("Conference"," conference_id = $id ");
        return $conference;
    }
/**
 * This function gets the participants which belong to the event
 * @param int $id
 * @return Participant
 */
    public static function getParticipants($id){
        $sql="SELECT participant_id,fname,lname,phone,email, organisation.name as organisation ,  IF(invitation IS NULL,'','✓') AS invitation, IF(disability = 0,'','✓') AS disability  ,

(CASE WHEN EXISTS (

SELECT *
FROM event, registration
WHERE 
registration.reg_participant = participant.participant_id
AND registration.reg_event = event.Event_id
AND event.event_conference_id =$id

)
THEN  '✓'
ELSE  ''
END
) AS registered
,
(CASE WHEN EXISTS (

SELECT *
FROM event, schedule
WHERE 
schedule.participant_id = participant.participant_id
AND schedule.Event_id = event.Event_id
AND event.event_conference_id =$id

)
THEN  '✓'
ELSE  ''
END
) AS hasSchedule

FROM participant, organisation
WHERE participant.part_conference = $id AND organisation.organisation_id = participant.organisation";
        //$participant = Database::getObjects("Participant","","Select participant_id,fname,lname,phone,email, organisation.name as organisation From Participant,Organisation where organisation.organisation_id = Participant.organisation AND conference_id = $id");
        $participant = Database::getObjects("participant","",$sql);

        return $participant;
    }
    /**
     * This function gets the number of participants
     * @param getNumberOfParticipants
     * @return participants
     */
    public function getNumberOfParticipants(){
        return Database::count("participant","part_conference =".$this->conference_id);
    }
    /**
     * @param getNumberOfNewParticipants This function gets the list of new participants
     * @return participants
     */
    public function getNumberOfNewParticipants(){
        return Database::count("participant","invitation IS NULL AND part_conference =".$this->conference_id);
    }
   /**
    * @param getNumberOfScheduleParticipants this function gets the schedule of the participants
    * @return participants
    */
    public function getNumberOfScheduleParticipants(){
        return Database::count("participant",",schedule,event Where schedule.participant_id = participant.participant_id AND schedule.Event_id = event.Event_id AND  event.conference_id =".$this->conference_id);
    }
    
    /**
     * This function gets the list of all events
     * @param getEvents
     * @return Event[]
     */
    public function getEvents() {
        $events = Event::getEvents("Where event_conference_id=".$this->conference_id);
        return $events;
    }
    /**
     * This function gets the list of all organisations
     * @param getOrganisations
     * @return organisations
     */
    public function getOrganisations() {
        $organisations = Database::getObjects("organisation","Where org_conference=".$this->conference_id);
        return $organisations;
    }
    /**
     * this function gets the name of the conference
     * @param _get $name
     * @return $name
     */
    public function __get($name) {
        switch ($name) {
            case "name":
                return $this->conference_name;
            case "id":
                return $this->conference_id;
            default:
                throw new Exception($name." does not exist!");
        }
    }
}
