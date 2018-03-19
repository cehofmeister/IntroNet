<?php

/**
 * Generated by PHPUnit_SkeletonGenerator on 2016-05-02 at 04:17:17.
 */
class OneToOneAlgorithmTest extends PHPUnit_Framework_TestCase {

    /**
     * @var OneToOneAlgorithm
     */
    protected $object;

    /**
     * Sets up the fixture, for example, opens a network connection.
     * This method is called before a test is executed.
     */
    protected function setUp() {
        date_default_timezone_set('UTC');
        $this->object = new OneToOneAlgorithm;
    }

    /**
     * Tears down the fixture, for example, closes a network connection.
     * This method is called after a test is executed.
     */
    protected function tearDown() {
        
    }

    /**
     * @covers OneToOneAlgorithm::build
     * @todo   Implement testBuild().
     */
    public function testBuild() {
        $participants = $this->createParticipants(7);
        $event = new Event();
        $event->rounds=2;
        var_dump(OneToOneAlgorithm::build($participants, $event));
        
    }

    public function createParticipants($n) {
        $participants = array();
        for($i=0;$i<$n;$i++){
            $participant = new Participant($id=-$i);
            $participant->name = "P".$i;
            $participants[]=$participant;
        }
        return $participants;
    }
}
