PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX oio: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX xml: <https://www.w3.org/TR/xml#>

DELETE {
	?pancreas rdfs:subClassOf <http://www.ebi.ac.uk/efo/EFO_0001379>.}
	
	
WHERE {
?pancreas a owl:Class .
FILTER ((regex(str(?pancreas), "http://www.ebi.ac.uk/efo/EFO_0009605"))) .
}