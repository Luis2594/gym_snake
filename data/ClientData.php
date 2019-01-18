<?php

require_once '../data/Connector.php';
include '../domain/Client.php';

/**
 * Description of ClientData
 *
 * @author luisd
 */
class ClientData extends Connector {

    /**
     * Used to insert a new person
     * @param type $person
     * @return type
     */
    public function insertClient($client) {

        $query = "call insertclient('" . $client->getDni() . "',"
                . "'" . $client->getName() . "',"
                . "'" . $client->getFirstname() . "',"
                . "'" . $client->getSecondname() . "',"
                . "'" . $client->getPhone() . "',"
                . "'" . $client->getDateregistration() . "',"
                . "'" . $client->getDatepayment() . "',"
                . "'" . $client->getImage() . "')";

        return $this->exeQuery($query);
    }

    /**
     * Update person values
     * @param type $person
     * @return type
     */
    public function updateClient($client) {
        $query = "call updateclient('" . $client->getId() . "',"
                . "'" . $client->getDni() . "',"
                . "'" . $client->getName() . "',"
                . "'" . $client->getFirstname() . "',"
                . "'" . $client->getSecondname() . "',"
                . "'" . $client->getPhone() . "',"
                . "'" . $client->getDateregistration() . "',"
                . "'" . $client->getDatepayment() . "',"
                . "'" . $client->getImage() . "')";

        return $this->exeQuery($query);
    }

    /**
     * Delete a person by id
     * @param type $id pk of the element to delete
     * @return type
     */
    public function deleteClient($id) {
        $query = 'call deleteclient("' . $id . '");';

        if ($this->exeQuery($query)) {
            return TRUE;
        } else {
            return FALSE;
        }
    }

    /**
     * Use to get all people
     * @return array
     */
    public function getClientName($name) {

        $query = "SELECT * FROM `tbclient` WHERE name LIKE CONCAT('" . $name . "','%')";

        $allClients = $this->exeQuery($query);
        $array = [];
        if (mysqli_num_rows($allClients) > 0) {
            while ($row = mysqli_fetch_array($allClients)) {
                $currentClient = new Client($row['id'], $row['dni'], $row['name'], $row['firstname'], $row['secondname'], $row['phone'], $row['dateregistration'], $row['datepayment'], $row['image']);
                array_push($array, $currentClient);
            }
        }
        return $array;
    }

    /**
     * Use to get all people
     * @return array
     */
    public function getClientsDni($dni) {

        $query = "call showclientdni(" . $dni . ");";

        $allClients = $this->exeQuery($query);
        $array = [];
        if (mysqli_num_rows($allClients) > 0) {
            while ($row = mysqli_fetch_array($allClients)) {
                $currentClient = new Client(
                        $row['id'], $row['dni'], $row['name'], $row['firstname'], $row['secondname'], $row['phone'], $row['dateregistration'], $row['datepayment'], $row['image']);
                array_push($array, $currentClient);
            }
        }
        return $array;
    }

    /**
     * Use to get all people
     * @return array
     */
    public function getClientId($id) {

        $query = "call getclientid(" . $id . ");";

        $allClients = $this->exeQuery($query);
        $array = [];
        if (mysqli_num_rows($allClients) > 0) {
            while ($row = mysqli_fetch_array($allClients)) {
                $currentClient = new Client($row['id'], $row['dni'], $row['name'], $row['firstname'], $row['secondname'], $row['phone'], $row['dateregistration'], $row['datepayment'], $row['image']);
                array_push($array, $currentClient);
            }
        }
        return $array;
    }

    /**
     * Use to get all people
     * @return array
     */
    public function getPhoneClient($array) {

        $phones = [];
        foreach ($array as $id) {
            $query = "call getPhoneClient(" . $id . ");";
            $result = $this->exeQuery($query);
            $array = mysqli_fetch_array($result);
            $phone = trim($array[0]);
            $name =  ucwords(strtolower(trim($array[1]))) . " " . ucwords(strtolower(trim($array[2])));
            $phones[] = array("phone" => $phone, "name" => $name);
        }

        return $phones;
    }

    /**
     * Use to get all people
     * @return array
     */
    public function getClientsDefaulters() {

        $query = "call showclientdefaulters()";

        $allClients = $this->exeQuery($query);
        $array = [];
        if (mysqli_num_rows($allClients) > 0) {
            while ($row = mysqli_fetch_array($allClients)) {
                $currentClient = new Client($row['id'], $row['dni'], $row['name'], $row['firstname'], $row['secondname'], $row['phone'], $row['dateregistration'], $row['datepayment'], $row['image']);

                array_push($array, $currentClient);
            }
        }
        return $array;
    }

    public function verifyExistClient($dni) {
        $query = "call showclientdni(" . $dni . ");";
        return $this->isRegistred($query);
    }

    public function getQuantityClients() {
        $query = "SELECT count(*) FROM tbclient";
        $result = $this->exeQuery($query);
        $array = mysqli_fetch_array($result);
        $quantity = trim($array[0]);
        return $quantity;
    }

    public function getQuantityClientsDefaulters() {
        $query = "SELECT count(*) FROM tbclient WHERE (DATEDIFF(datepayment, NOW())) <= 0";
        $result = $this->exeQuery($query);
        $array = mysqli_fetch_array($result);
        $quantity = trim($array[0]);
        return $quantity;
    }

    public function getQuantityClientToDay() {
        $query = "SELECT count(*) FROM tbclient WHERE (DATEDIFF(datepayment, NOW())) > 0";
        $result = $this->exeQuery($query);
        $array = mysqli_fetch_array($result);
        $quantity = trim($array[0]);
        return $quantity;
    }

}
