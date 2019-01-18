<?php

include_once __DIR__. '/../data/ClientData.php';

/**
 * Description of ClientBusiness
 *
 * @author luisd
 */
class ClientBusiness {

    private $clientData;

    public function ClientBusiness() {
        return $this->clientData = new ClientData();
    }

    /**
     * Used to insert a new person
     * @param type $client
     * @return type
     */
    public function insertClient($client) {
        return $this->clientData->insertClient($client);
    }

    /**
     * Update person values
     * @param type $client
     * @return type
     */
    public function updateClient($client) {
        return $this->clientData->updateClient($client);
    }

    /**
     * Delete a person by id
     * @param type $id pk of the element to delete
     * @return type
     */
    public function deleteClient($id) {
        return $this->clientData->deleteClient($id);
    }

       /**
     * Use to get all people
     * @return array
     */
    public function getClientAll() {
        return $this->clientData->getClientAll();
    }


    /**
     * Use to get all people
     * @return array
     */
    public function getClientName($name) {
        return $this->clientData->getClientName($name);
    }

    /**
     * Use to get all people
     * @return array
     */
    public function getClientsDni($dni) {
        return $this->clientData->getClientsDni($dni);
    }

    /**
     * Use to get all people
     * @return array
     */
    public function getClientId($id) {
        return $this->clientData->getClientId($id);
    }
    /**
     * Use to get all people
     * @return array
     */
    public function getPhoneClient($array) {
        return $this->clientData->getPhoneClient($array);
    }

    /**
     * Use to get all people
     * @return array
     */
    public function getClientsDefaulters() {
        return $this->clientData->getClientsDefaulters();
    }

    public function verifyExistClient($dni) {
        return $this->clientData->verifyExistClient($dni);
    }

    public function getQuantityClients() {
        return $this->clientData->getQuantityClients();
    }

    public function getQuantityClientsDefaulters() {
        return $this->clientData->getQuantityClientsDefaulters();
    }

    public function getQuantityClientToDay() {
        return $this->clientData->getQuantityClientToDay();
    }

}
