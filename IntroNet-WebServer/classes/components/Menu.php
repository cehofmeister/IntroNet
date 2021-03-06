<?php
require_once 'Component.php';

class Menu extends Component {

    private $links = array();

    public function addLink($name, $page) {
        $this->links[] = array("name" => $name, "page" => $page);
    }

    public function addsubMenu($name, Menu $submenu) {
        $this->links[] = array("name" => $name, "submenu" => $submenu);
    }

    public function build($submenu=FALSE) {

        if (!$submenu)
            echo '<ul class="nav navbar-nav navbar-left">';
        if ($this->links != null)
            foreach ($this->links as $link) {
                if (array_key_exists("page", $link))
                    echo '<li><a href="?page=' . $link["page"] . '">' . $link["name"] . '</a></li>';
                else if (array_key_exists("submenu", $link)) {
                    echo '
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">'.$link['name'].' <span class="caret"></span></a>
                        <ul class="dropdown-menu">';
                            $link['submenu']->build(TRUE);
                    echo '
                        </ul>
                    </li>';
                    
                }
            }
        if (!$submenu)
            echo '</ul>';
    }

}
