UPDATE public.client_environments SET url = 'https://wikipedia.org' WHERE environment_id = 1;
UPDATE public.client_environments SET url = 'https://wikipedia.org' WHERE environment_id = 2;

UPDATE public.evidence_types SET name = 'HAR' WHERE evi_type_id = 5;

UPDATE public.configurations SET timeout_id = 20 WHERE process_id = 1;

DELETE FROM public.configurations_evidence_types WHERE configuration_id = 1 AND evi_type_id = 3;
DELETE FROM public.configurations_evidence_types WHERE configuration_id = 1 AND evi_type_id = 4;

UPDATE public.evidence_cases SET name = 'Sí' WHERE evi_case_id = 1;
UPDATE public.evidence_cases SET name = 'No' WHERE evi_case_id = 2;
UPDATE public.evidence_cases SET name = 'Sólo si el caso falla' WHERE evi_case_id = 3;
DELETE FROM public.evidence_cases WHERE evi_case_id = 4;
