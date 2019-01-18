<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of User
 *
 * @author luisd
 */
class User {

    private $id;
    private $dni;
    private $name;
    private $firstname;
    private $secondname;
    private $username;
    private $pass;
    
    function User($id, $dni, $name, $firstname, $secondname, $username, $pass) {
        $this->id = $id;
        $this->dni = $dni;
        $this->name = $name;
        $this->firstname = $firstname;
        $this->secondname = $secondname;
        $this->username = $username;
        $this->pass = $pass;
    }
    function getId() {
        return $this->id;
    }

    function getDni() {
        return $this->dni;
    }

    function getName() {
        return $this->name;
    }

    function getFirstname() {
        return $this->firstname;
    }

    function getSecondname() {
        return $this->secondname;
    }

    function getUsername() {
        return $this->username;
    }

    function getPass() {
        return $this->pass;
    }

    function setId($id) {
        $this->id = $id;
    }

    function setDni($dni) {
        $this->dni = $dni;
    }

    function setName($name) {
        $this->name = $name;
    }

    function setFirstname($firstname) {
        $this->firstname = $firstname;
    }

    function setSecondname($secondname) {
        $this->secondname = $secondname;
    }

    function setUsername($username) {
        $this->username = $username;
    }

    function setPass($pass) {
        $this->pass = $pass;
    }

}
