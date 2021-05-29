<?php

namespace Controller;

use Core\Controller;
use Helper\FormBuilder;
use Helper\Url;
use Model\City;
use Model\MapField;
use Model\User as UserModel;
use Model\Faq as FaqModel;
use Core\Request;
use Helper\Validation\InputValidation as Validation;
use Service\Map\Field\AssignField;
use Service\Game\InitUserInGame;

class Faq extends Controller
{
    public function __construct()
    {
        parent::__construct();
        if(!$this->isLogedIn()){
            Url::redirect(Url::make('/user/login'));
        }
    }

    public function index()
    {
        $QA = FaqModel::getAllQA();
        $this->data['qa'] = $QA;
        $this->render('page/faq', $this->data);
    }
}