<?php
/**
 * Created by PhpStorm.
 * User: konstantin
 * Date: 20.01.15
 * Time: 14:41
 */
trait Trait_Validation {
    function validateEmail($email) {
        if (!filter_var($email, FILTER_VALIDATE_EMAIL)) throw $this->exception('This is not valid email.','NotEmail');
        return $email;
    }
    function validatePassword($password) {
        if(!is_string($password)) throw $this->exception('This is not valid password.','IncorrectPassword');
        if(strlen($password) < 6) throw $this->exception('Password must be at least 6 characters long.','IncorrectPassword');
        return $password;
    }
}