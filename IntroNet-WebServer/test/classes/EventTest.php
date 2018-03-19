<?php

/**
 * Generated by PHPUnit_SkeletonGenerator on 2016-04-17 at 00:40:40.
 */
use PHPUnit\Framework\TestCase;
require "../../classes/Event.php";
require "../../classes/Validation.php";
require "../../classes/Database.php";
class EventTest extends TestCase {

    /**
     * @var Event
     */
    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function setUp() {
        $this->object = new Event;
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown() {
        
    }

    /**
     * @covers Event::create
     * @todo   Implement testCreate().
     */
    public function testCreate() {
        $name="Test Event";
        $startDate = "10/4/2016";
        $startTime = "08:00";
        $endDate = "10/8/2016";
        $endTime = "13:00";
        $type   = Event::ONETOONE;
        $event = Event::create($name, $startDate, $startTime, $endDate, $endTime,$type);
        $this->assertInstanceOf('Event',$event);
        return $event;
    }

    /**
     * @covers Event::getName
     * @depends testCreate
     * @todo   Implement testGetName().
     */
    public function testGetName(Event $event) {
        // Remove the following lines when you implement this test.
        //$this->markTestIncomplete(
        //        'This test has not been implemented yet.'
        //);
        $this->assertEquals("Test Event", $event->getName());

    }

    /**
     * @covers Event::setName
     * @depends testCreate
     * @todo   Implement testSetName().
     */
    public function testSetName(Event $event) {
        // Remove the following lines when you implement this test.
        //$this->markTestIncomplete(
        //        'This test has not been implemented yet.'
        //);
        $event->setName("Test NameSet");
        $this->assertEquals("Test NameSet", $event->getName());
    }

    /**
     * @covers Event::getStartDate
     * @depends testCreate
     */
    public function testGetStartDate(Event $event) {
        //var_dump($event);
        date_default_timezone_set('UTC');
        $this->assertEquals('10/04/2016', $event->getStartDate());
    }

    /**
     * @covers Event::getStartTime
     * @depends testCreate
     */
    public function testGetStartTime(Event $event) {
        date_default_timezone_set('UTC');
        $this->assertEquals('08:00', $event->getStartTime());
    }

    /**
     * @covers Event::getEndDate
     * @depends testCreate
     */
    public function testGetEndDate(Event $event) {
        date_default_timezone_set('UTC');
        $this->assertEquals('10/08/2016', $event->getEndDate());
    }

    /**
     * @covers Event::getEndTime
     * @depends testCreate
     */
    public function testGetEndTime(Event $event) {
        date_default_timezone_set('UTC');
        $this->assertEquals('13:00', $event->getEndTime());
    }

    /**
     * @covers Event::getCountDown
     * @depends testCreate
     * @todo   Implement testGetCountDown().
     */
    public function testGetCountDown(Event $event) {
        // Remove the following lines when you implement this test.
        /*$this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
        $this->assertEquals('01/05/1970 05:00', $event->getCountDown());
    }

    /**
     * @covers Event::getStartDay
     * @depends testCreate
     */
    public function testGetStartDay(Event $event) {
        date_default_timezone_set('UTC');
        $this->assertEquals('October, 4th', $event->getStartDay());
    }

    /**
     * @covers Event::getType
     * @depends testCreate
     */
    public function testGetType(Event $event) {
        $this->assertEquals('One to One', $event->getType());
    }

    /**
     * @covers Event::getNumberOfParticipant
     * @covers Database::count
     * @depends testCreate
     */
    public function testGetNumberOfConferenceParticipant(Event $event) {
        $this->assertEquals(0, $event->getNumberOfConferenceParticipant());

    }

    /**
     * @covers Event::getNumberOfParticipantion
     * @todo   Implement testGetNumberOfParticipantion().
     */
    public function testGetNumberOfParticipantion() {
        // Remove the following lines when you implement this test.
       /* $this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
    }

    /**
     * @covers Event::isRegister
     * @todo   Implement testIsRegister().
     */
    public function testIsRegister() {
        // Remove the following lines when you implement this test.
        /*$this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
    }

    /**
     * @covers Event::isAttended
     * @todo   Implement testIsAttended().
     */
    public function testIsAttended() {
        // Remove the following lines when you implement this test.
        /*$this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
    }

    /**
     * @covers Event::addPoster
     * @todo   Implement testAddPoster().
     */
    public function testAddPoster() {
        // Remove the following lines when you implement this test.
        /*$this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
    }

    /**
     * @covers Event::isLeft
     * @todo   Implement testIsLeft().
     */
    public function testIsLeft() {
        // Remove the following lines when you implement this test.
        /*$this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
    }

    /**
     * @covers Event::missingParticipants
     * @todo   Implement testMissingParticipants().
     */
    public function testMissingParticipants() {
        // Remove the following lines when you implement this test.
        /*$this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
    }

    /**
     * @covers Event::allParticipants
     * @todo   Implement testAllParticipants().
     */
    public function testAllParticipants() {
        // Remove the following lines when you implement this test.
        /*$this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
    }

    /**
     * @covers Event::getEvents
     * @todo   Implement testGetEvents().
     */
    public function testGetEvents() {
        // Remove the following lines when you implement this test.
        /*$this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
    }

    /**
     * @covers Event::getEvent
     * @todo   Implement testGetEvent().
     */
    public function testGetEvent() {
        // Remove the following lines when you implement this test.
        /*$this->markTestIncomplete(
                'This test has not been implemented yet.'
        );*/
    }

}
