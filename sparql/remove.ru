PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX oio: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX xml: <https://www.w3.org/TR/xml#>

DELETE {?c rdfs:subClassOf <http://www.ebi.ac.uk/efo/OTAR_0000008> .
		?c rdfs:subclass <http://www.ebi.ac.uk/efo/EFO_0001379> . }
	
WHERE {
	?c a owl:Class .
	?p oio:inSubset "therapeutic_area" .
	?c rdfs:subClassOf* ?p
	FILTER NOT EXISTS{?c oio:inSubset "therapeutic_area" .}
}