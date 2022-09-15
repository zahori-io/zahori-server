
---------------- ADD XRAY SUPPORT ----------------

-- Add field tmsExecutionId to executions
ALTER TABLE public.executions ADD tms_test_execution_id varchar NULL;

-- Remove duplicated XRAY test repository
DELETE FROM public.test_repositories WHERE test_repo_id = 1;
UPDATE public.test_repositories SET name = 'Jira Xray' WHERE test_repo_id = 2;
UPDATE public.test_repositories SET name = 'TestLink' WHERE name = 'Testlink';


---------------- UPDATE BROWSER VERSIONS ----------------
UPDATE public.browsers SET default_version = '105.0' WHERE browser_name = 'chrome';
UPDATE public.browsers SET default_version = '105.0' WHERE browser_name = 'edge';
UPDATE public.browsers SET default_version = '104.0' WHERE browser_name = 'firefox';
UPDATE public.browsers SET default_version = '90.0' WHERE browser_name = 'opera';
UPDATE public.browsers SET default_version = '15.0' WHERE browser_name = 'safari';


---------------- ADD SCREEN RESOLUTION NAMES ----------------
ALTER TABLE public.resolutions ADD name varchar NULL;

-- Add default data to resolutions table
INSERT INTO public.resolutions(client_id, process_id, width, height, "order", active, "name")
VALUES(1, 1, 1920, 1080, 0, true, 'Full HD');

INSERT INTO public.resolutions(client_id, process_id, width, height, "order", active, "name")
VALUES(1, 1, 1280, 720, 0, true, 'HD');

INSERT INTO public.resolutions(client_id, process_id, width, height, "order", active, "name")
VALUES(1, 1, 810, 1080, 0, true, 'iPad');


