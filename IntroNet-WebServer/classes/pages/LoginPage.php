<?php

class LoginPage extends Page {   
    
    public function __construct($user,$menu) {
        parent::__construct($user,$menu,"Login");
        
    }


    public function callBack($data, $action,PageBody &$body) {
        // this code only for testing
        if($data["email"]=== $GLOBALS['config']['administer']['username'] &&
            $data["password"] === $GLOBALS['config']['administer']['password'])
        {
            // get user data for user
            $user = new Planner();
            $user->name = $data["email"];
            $user->type = 'admin';

            // save user data
            $_SESSION['user']=serialize($user);

            // redirect the user to the home page
            $host  = $_SERVER['HTTP_HOST'];
            $uri   = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
            $extra = 'index.php?page=ControlPanel';
            header("Location: http:///$host$uri/$extra");
            exit;
        }
        else if($data["email"]){
                $participant = Participant::login($data["email"],$data["password"]);
                if ($participant) {
                    $_SESSION['user'] = serialize($participant);
                    $_SESSION['p'] = $participant->participant_id;

                    // redirect the user to the home page
                    $host = $_SERVER['HTTP_HOST'];
                    $uri = rtrim(dirname($_SERVER['PHP_SELF']), '/\\');
                    $extra = 'index.php?page=schedule';
                    header("Location: http:///$host$uri/$extra");
                    exit;
                }
        }else{
            $body->addToTop(new Message("Wrong password or email", Message::DANGER));
        }
    }

    protected function build(PageBody &$body,SubMenu &$submenu) {
        $submenu->addLink("Sign in", "#",TRUE);
        //$submenu->addLink("Sign up", "#");
        //$submenu->addLink("Forget Password", "#");
        
        $loginForm = new Form("login");
        $loginForm->addInput(Input::textInput("email", "Enter your Email:"));
        $loginForm->addInput(Input::passwordInput("password", "Enter your Password:"));
        
        $body->addToCenter($loginForm);
    }

}
