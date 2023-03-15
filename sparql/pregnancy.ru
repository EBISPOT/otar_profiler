PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX oio: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX xml: <https://www.w3.org/TR/xml#>

DELETE {
	?c rdfs:subClassOf ?p .}

INSERT {
	?c rdfs:subClassOf <http://www.ebi.ac.uk/efo/OTAR_0000014> .}
	
WHERE {
	?c a owl:Class .
	?c rdfs:subClassOf ?p .
	?c rdfs:label ?label .
	FILTER ((regex(str(?c), "http://www.ebi.ac.uk/efo/EFO_0009683"))||(regex(str(?c), "http://www.ebi.ac.uk/efo/EFO_0009682"))||(regex(str(?c), "http://www.ebi.ac.uk/efo/EFO_0010238"))||(regex(str(?c), "http://www.ebi.ac.uk/efo/OTAR_0000015")))
}