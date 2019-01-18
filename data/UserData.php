<?php

require_once '../data/Connector.php';
include '../domain/User.php';

/**
 * Description of UserData
 *
 * @author luisd
 */
class UserData extends Connector {

    public function isUser($username, $pass) {
        $query = "SELECT * FROM tbuser WHERE nameuser = '" . $username . "' AND pass = '" . $pass . "'";
        return $this->isRegistred($query);
    }

    /**
     * Use to get a specif user
     * @param type $idPersonUser
     * @return \User
     */
    public function getUser($username, $pass) {

        $query = "SELECT * FROM tbuser WHERE nameuser = '" . $username . "' AND pass = '" . $pass . "'";
        $userResult = $this->exeQuery($query);

        $row = mysqli_fetch_array($userResult);
        $user = new User(
                $row['id'], $row['dni'], $row['name'], $row['firstname'], $row['secondname'], $row['username'], $row['pass']);

        return $user;
    }

}
