# otar_profiler
Pipeline for creating Open Targets profile and slim files from EFO.

## How to generate profile and slim files
- Copy the lastest version of efo.owl and components/disease_to_phenotype.owl into the top level of the otar_profiler directory
     - If you are generating this file for the EFO release, you will need to manually copy from your local version after running the make all process
- run ./otar_ta.sh
