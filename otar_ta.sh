# NEED TO COPY EFO AND disease_to_phenotype

#Create template owl files for new terms and dictating subclass relationships
robot template --template ./templates/newterms.tsv --prefix "OTAR: http://www.ebi.ac.uk/efo/OTAR_" --prefix "EFO: http://www.ebi.ac.uk/efo/EFO_" --prefix "MONDO: http://purl.obolibrary.org/obo/MONDO_" --prefix "UBERON: http://purl.obolibrary.org/obo/UBERON_" --prefix "BFO: http://purl.obolibrary.org/obo/BFO_" -i efo.owl -o ./build/new.owl && echo "New terms template created..."
robot template --template ./templates/subclasses.tsv --prefix "OTAR: http://www.ebi.ac.uk/efo/OTAR_" --prefix "EFO: http://www.ebi.ac.uk/efo/EFO_" --prefix "UBERON: http://purl.obolibrary.org/obo/UBERON_" --prefix "BFO: http://purl.obolibrary.org/obo/BFO_" --prefix "MONDO: http://purl.obolibrary.org/obo/MONDO_" --prefix "Orphanet: http://www.orpha.net/ORDO/Orphanet_" -i efo.owl -o ./build/subclasses.owl && echo "New subclasses template created..."

#Create the slim
robot merge -i ./build/new.owl -i ./build/subclasses.owl -i efo.owl -i disease_to_phenotype.owl \
	filter --term-file ./templates/OTAR_terms.txt --select annotations \
	query --query ./sparql/OTAR_therapeutic_areas.sparql ./build/tagged.owl && echo "Tagged the therapeutic areas..."
robot merge -i ./build/new.owl -i ./build/subclasses.owl -i efo.owl -i ./build/tagged.owl -o ./build/done.owl && echo "Merged the templates..."
robot reason -i ./build/done.owl -s true -m true -r hermit -o ./build/efo_inferred.owl && echo "Reasoner done..."

#The below needs to be run once and the relevant terms removed from the file. - should be updated to automatically do this.
#robot query -i ./build/efo_inferred.owl -q ./sparql/tadisease.sparql ./templates/disease_p_ta.txt && echo "Parents extracted..."

robot remove -i ./build/efo_inferred.owl -T ./templates/disease_p_ta.txt -p true -o ./build/efo_ta.owl && echo "Removed parents..."

#robot remove -i ./build/efo_ta.owl -T ./templates/disease_ta.txt --select equivalents -o ./build/efo_ta_equivalents.owl && echo "Removed equivalents..."

### Fixing TAs and Other category basis ###
#1) removes parents of any TAs and makes them a direct child of disease
#2) renames specific terms
#3) removes the parent of "disease" from any term that is a direct child of disease but not a TA
#3 continued) makes them a child of "other" instead
#4) moves children of digestive system disease to be children of gastrointestinal TA
#5) removes digestive system disease from slim
#6) removes the parent of other if child is also a child of a therapeutic area
robot query -i ./build/efo_ta.owl -u ./sparql/classify.ru \
	query -u ./sparql/rename.ru \
	query -u ./sparql/removedisease.ru \
	query -u ./sparql/gastrodisease.ru \
	remove -t "http://www.ebi.ac.uk/efo/EFO_0000405" \
	query -u ./sparql/remove.ru -o ./build/ta_fixed.owl && echo "Fixed TAs and other category..."

### Fixing specific terms ###
#1) moves puerperal, pregnancy and prenatal disorder terms to directly under the TA
#2) removed nervous system disease parent from tongue disease
#3) moves metabolic disease to metabolic TA
#4) removes viral hepatitis terms from being children of skin disease caused by infection
#5) moved poisoning to directly under TA
robot query -i ./build/ta_fixed.owl -u ./sparql/pregnancy.ru \
	query -u ./sparql/tongue.ru \
	query -u ./sparql/metabolic.ru \
	query -u ./sparql/hepatitis.ru \
	query -u ./sparql/poisoning.ru \
	query -u ./sparql/heart.ru -o efo_otar_profile.owl && echo "Fixed specific terms... Build complete!"
	
robot extract -m MIREOT -i efo_otar_profile.owl --branch-from-terms ./templates/allTAs.txt -o efo_otar_slim.owl
	
	