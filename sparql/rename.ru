PREFIX obo: <http://purl.obolibrary.org/obo/>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX oio: <http://www.geneontology.org/formats/oboInOwl#>
PREFIX skos: <http://www.w3.org/2004/02/skos/core#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX xml: <https://www.w3.org/TR/xml#>

DELETE {?blood rdfs:label "hematologic disease".
				?cpd rdfs:label "cell proliferation disorder".
				?ear rdfs:label "disease of ear".
				?visual rdfs:label "disease of visual system" .
				?metabolic rdfs:label "nutritional or metabolic disease" .
				?parasitic rdfs:label "parasitic infection" .}

INSERT {?blood rdfs:label "hematologic or lymphatic system disease" .
				?cpd rdfs:label "neoplastic, precancerous and hyperplastic disease".
				?integ oio:hasExactSynonym "skin or subcutaneous tissue disease".
				?ear rdfs:label "ear disease".
				?visual rdfs:label "visual system disease" .
				?metabolic rdfs:label "metabolic or nutritional disease" .
				?parasitic rdfs:label "parasitic infestation" .}

WHERE {
	?blood a owl:Class .
	?blood rdfs:label "hematologic disease".
	?cpd a owl:Class .
	?cpd rdfs:label "cell proliferation disorder".
	?integ a owl:Class .
	?integ rdfs:label "integumentary system disease".
	?ear a owl:Class .
	?ear rdfs:label "disease of ear" .
	?visual a owl:Class .
	?visual rdfs:label "disease of visual system" .
	?metabolic a owl:Class .
	?metabolic rdfs:label "nutritional or metabolic disease" .
	?parasitic a owl:Class .
	?parasitic rdfs:label "parasitic infection" .
	}