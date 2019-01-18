<?php

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of Client
 *
 * @author luisd
 */
class Client {

    private $id;
    private $dni;
    private $name;
    private $firstname;
    private $secondname;
    private $phone;
    private $dateregistration;
    private $datepayment;
    private $image;
    
    function Client($id, $dni, $name, $firstname, $secondname, $phone, $dateregistration, $datepayment, $image) {
        $this->id = $id;
        $this->dni = $dni;
        $this->name = $name;
        $this->firstname = $firstname;
        $this->secondname = $secondname;
        $this->phone = $phone;
        $this->dateregistration = $dateregistration;
        $this->datepayment = $datepayment;
        $this->image = $image;
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

    function getPhone() {
        return $this->phone;
    }

    function getDateregistration() {
        return $this->dateregistration;
    }

    function getDatepayment() {
        return $this->datepayment;
    }

    function getImage() {
        return $this->image;
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

    function setPhone($phone) {
        $this->phone = $phone;
    }

    function setDateregistration($dateregistration) {
        $this->dateregistration = $dateregistration;
    }

    function setDatepayment($datepayment) {
        $this->datepayment = $datepayment;
    }

    function setImage($image) {
        $this->image = $image;
    }

    
}
