PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX oio: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX xml: <https://www.w3.org/TR/xml#>

DELETE {?ta rdfs:subClassOf ?parent .}

INSERT {?ta rdfs:subClassOf <http://www.ebi.ac.uk/efo/EFO_0000408> .}

WHERE {
	?ta a owl:Class .
    ?ta rdfs:subClassOf ?parent .
	?ta oio:inSubset "therapeutic_area" .}