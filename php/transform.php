<?php
generate('../jyxo.xsl', 'jyxo-out.xml');
generate('../zbozi.xsl', 'zbozi-out.xml');

function generate($inputTransformation, $outputFile)
{
    $xml = new DOMDocument;
    $xml->load('../universal.xml');

    $xsl = new DOMDocument;
    $xsl->load($inputTransformation);

    $proc = new XSLTProcessor();
    $proc->importStylesheet($xsl);
    $newXml = $proc->transformToXML($xml);
    file_put_contents($outputFile, $newXml);
}