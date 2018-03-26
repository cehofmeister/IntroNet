<?php

require_once 'Page.php';
require_once './classes/components/CustomHTML.php';
require_once './classes/components/Message.php';
require_once './classes/components/Form.php';

class OrganizeTable extends Page {
    const UserType = "Planner";
    protected function build(PageBody &$body, SubMenu &$submenu) {
        $this->pageName = "OrganizeTable";
        
        
        $form = new Form("OrganizeTable");
        
        
        $form->addInput(Input::selectInput("event_name", "Event Name", array("Event1", "Event2")));
        
        $form->addInput(Input::tokenInput("table_name","Table Name"));
        $body->addToCenter($form);

    }
}
  

