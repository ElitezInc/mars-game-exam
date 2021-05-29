<?php

namespace Helper;

class FormBuilder
{

    private $form;

    public function __construct($method, $action)
    {
        $this->form = '<form method="' . $method . '" ';
        $this->form .= 'action="' . $action . '" style="width:250px;">';
    }

    public function get()
    {
        $this->form .= '</form>';
        return $this->form;
    }

    public function input($name, $type, $value = '', $placeholder = '', $id = '', $class = '', $label = '')
    {
        if ($id != '' && $label != '') {
            $this->form .= "<label for='$id' style=\"margin-right: 25px;\">$label</label>";
        }
        $this->form .= "<input id='$id' class='$class' name='$name' type='$type' ";
        $this->form .= "value='$value' placeholder='$placeholder' ><br><br>";
        return $this;
    }

    public function select($name, $values, $id, $label)
    {
        if ($id != '' && $label != '') {
            $this->form .= "<label for='$id' style=\"margin-right: 25px;\">$label</label>";
        }

        $this->form .= "<select name='$name' id='$id'>";

        foreach ($values as $value)
            $this->form .= "<option value='$value'>$value</option>";

        $this->form .= "</select><br><br>";
        return $this;
    }

    public function texarea($name, $id, $label)
    {
        if ($id != '' && $label != '') {
            $this->form .= "<label for='$id' style=\"margin-right: 25px;\">$label</label>";
        }

        $this->form .= "<textarea name='$name' id='$id'></textarea><br><br>";
        return $this;
    }
}