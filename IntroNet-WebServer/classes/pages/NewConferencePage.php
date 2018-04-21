<?php

require_once 'Page.php';
require_once './classes/components/CustomHTML.php';
require_once './classes/components/Message.php';
require_once './classes/components/Form.php';

class NewConferencePage extends Page {
    const UserType = "Planner";

    public function callBack($data, $action, \PageBody &$body) {
        //$body->addToTop(new Message("Please fill all the information", Message::DANGER));
        // get number of rounds

        $body->addToTop(new Message("'{$data["conferenceName"]}'", Message::SUCCESS));
        $body->addToTop(new Message("'".date('Y-m-d', strtotime(str_replace('-', '/',  $data["eventStart"])))."'", Message::SUCCESS));
        $body->addToTop(new Message("'{$data["eventStartTime"]}'", Message::SUCCESS));
        $body->addToTop(new Message("'".date('Y-m-d', strtotime(str_replace('-', '/',  $data["eventDeadline"])))."'", Message::SUCCESS));
        $body->addToTop(new Message("'{$data["eventDeadlineTime"]}'", Message::SUCCESS));

        $conference_id = Database::insert("Conference", array(
            "Conference_name"             => "'{$data["conferenceName"]}'",
            "registration_start_date"     => "'".date('Y-m-d', strtotime(str_replace('-', '/',  $data["eventStart"])))."'",
            "registration_start_time"     => "'{$data["eventStartTime"]}'",
            "registration_deadline_date"  => "'".date('Y-m-d', strtotime(str_replace('-', '/',  $data["eventDeadline"])))."'",
            "registration_deadline_time"  => "'{$data["eventDeadlineTime"]}'",
        ));

        $organisation_id = Database::insert("Organisation", array(
            "name" => "'{$data["Organisations"]}'",
            "org_conference" => $conference_id
        ));

        $body->addToTop(new Message("<h3>Conference was created</h3>"
        . "<a href='?page=Conference&conference=$conference_id'>Click Here to View Conference's Details</a>", Message::SUCCESS));
    }

    protected function build(PageBody &$body, SubMenu &$submenu) {
        $this->pageName = "Conference";
        
        
        $form = new Form("NewConference");
        
        
        $form->addInput(Input::textInput("conferenceName", "Conference Name",'', True));
        
        $form->addInput(Input::createGroupInput(array(
            Input::dateInput("eventStart","Registration Start Date",'', True),
            Input::timeInput("eventStartTime","Registration Start Time",'', True)
            ))); 
        $form->addInput(Input::createGroupInput(array(
            Input::dateInput("eventDeadline","Registration Deadline Date",'', True),
            Input::timeInput("eventDeadlineTime","Registration Deadline Time",'', True)
            ))); 
        
        $form->addInput(Input::tokenInput("organisations","Organisations", True));
        $body->addToCenter($form);

    }
}
        



