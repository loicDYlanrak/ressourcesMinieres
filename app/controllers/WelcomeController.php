<?php

namespace app\controllers;

use Flight;

class WelcomeController {

	public function __construct() {

	}


	public function home() {
        $data = ['message' => 'Jean', 'zavatra1' => 234];
        Flight::render('welcome', $data);
    }
}