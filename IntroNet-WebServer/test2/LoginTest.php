<?php
require __DIR__.'/../vendor/autoload.php';
require __DIR__.'/../autoload.php';

use PHPUnit\Framework\TestCase;
use Facebook\WebDriver\Remote\WebDriverCapabilityType;
use Facebook\WebDriver\Remote\RemoteWebDriver;
use Facebook\WebDriver\WebDriverBy;

/**
 * Description of newSeleneseTest
 *
 * @author hussam
 */
class LoginTest extends PHPUnit_Extensions_Selenium2TestCase{

    /**
     * @var \RemoteWebDriver
     */
    protected $webDriver;

    public function setUp()
    {
        $capabilities = array(WebDriverCapabilityType::BROWSER_NAME => 'chrome');
        $this->webDriver = RemoteWebDriver::create('http://localhost:5555/wd/hub', $capabilities);
    }
    public function tearDown() {
        $this->webDriver->close();
    }

    protected $url = 'http://localhost/';

    /**
     *  @/group BlackBox
     *  @covers PageDirectory
     */
    public function testLogin() {
        $this->webDriver->get($this->url);
        $this->webDriver->wait(10, 500)->until(function ($driver) {
            return $driver->getCurrentURL() === $this->url;
        });

        // 1- click on the Sign in button
        $element = $this->webDriver->findElement(WebDriverBy::linkText('Sign in'));
        $element->click();

        // should go to the login page
        $this->assertContains('IntroNet - Login', $this->webDriver->getTitle());

        // 2- Enter username
        $element = $this->webDriver->findElement(WebDriverBy::id('email'));
        $element->click();
        $this->webDriver->getKeyboard()->sendKeys('admin');

        // 3- Enter password
        $element = $this->webDriver->findElement(WebDriverBy::id('password'));
        $element->click();
        $this->webDriver->getKeyboard()->sendKeys('0000');

        // 4- submit
        $element = $this->webDriver->findElement(WebDriverBy::cssSelector('input[type="submit"]'));
        $element->click();

        // should go to the admin home page
        $this->assertContains('IntroNet', $this->webDriver->getTitle());

        return $this->webDriver;

    }

    /**
     *  @/group BlackBox
     *  @covers Page
     */
    public function testBadLogin() {
        $this->webDriver->get($this->url);
        $this->webDriver->wait(10, 500)->until(function ($driver) {
            return $driver->getCurrentURL() === $this->url;
        });

        // 1- click on the Sign in button
        $element = $this->webDriver->findElement(WebDriverBy::linkText('Sign in'));
        $element->click();

        // should go to the login page
        $this->assertContains('IntroNet - Login', $this->webDriver->getTitle());

        // 2- Enter username
        $element = $this->webDriver->findElement(WebDriverBy::id('email'));
        $element->click();
        $this->webDriver->getKeyboard()->sendKeys('hussam');

        // 3- Enter password
        $element = $this->webDriver->findElement(WebDriverBy::id('password'));
        $element->click();
        $this->webDriver->getKeyboard()->sendKeys('wrong password');

        // 4- submit
        $element = $this->webDriver->findElement(WebDriverBy::cssSelector('input[type="submit"]'));
        $element->click();

        // should go to the admin home page
        $this->assertContains('IntroNet - Login', $this->webDriver->getTitle());

    }

    public static function login(TestCase &$testCase,&$webDriver){
        //$url = 'http://localhost:8000/';
        $webDriver->get('http://localhost/');
        $webDriver->wait(10, 500)->until(function ($driver) {
            return $driver->getCurrentURL() === 'http://localhost/';
        });

        // 1- click on the Sign in button
        $element = $webDriver->findElement(WebDriverBy::linkText('Sign in'));
        $element->click();

        // should go to the login page
        $testCase->assertContains('IntroNet - Login', $webDriver->getTitle());

        // 2- Enter username
        $element = $webDriver->findElement(WebDriverBy::id('email'));
        $element->click();
        $webDriver->getKeyboard()->sendKeys('hussam');

        // 3- Enter password
        $element = $webDriver->findElement(WebDriverBy::id('password'));
        $element->click();
        $webDriver->getKeyboard()->sendKeys('0000');

        // 4- submit
        $element = $webDriver->findElement(WebDriverBy::cssSelector('input[type="submit"]'));
        $element->click();

        // should go to the admin home page
        $testCase->assertContains('IntroNet', $webDriver->getTitle());

        //return $this->webDriver;
    }

}
