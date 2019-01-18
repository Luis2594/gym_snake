<?php

include '../data/UserData.php';

/**
 * Description of UserBusiness
 *
 * @author luisd
 */
class UserBusiness {

    private $userData;

    public function UserBusiness() {
        return $this->userData = new UserData();
    }

    public function isUser($username, $pass) {
        return $this->userData->isUser($username, $pass);
    }
    
      /**
     * Use to get a specif user
     * @param type $idPersonUser
     * @return \User
     */
    public function getUser($username, $pass){
        return $this->userData->getUser($username, $pass);
    }

}
