<?php
chdir('../');

validate('heureka.xml', 'heureka.xsd');
validate('heureka-gen.xml', 'heureka.xsd');
validate('jyxo.xml', 'jyxo.xsd');
validate('jyxo-gen.xml', 'jyxo.xsd');
validate('zbozi.xml', 'zbozi.xsd');
validate('zbozi-gen.xml', 'zbozi.xsd');

function validate ($xml, $schema)
{
    $doc = new DomDocument();
    $doc->Load($xml);
    if (@$doc->schemaValidate($schema)) {
        printf('%s is valid against %s' . "\n", $xml, $schema);
    } else {
        printf('!!! %s is not valid against %s' . "\n", $xml, $schema);
    }
}