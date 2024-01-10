---------------- TEST REPOSITORIES - Add Xray Cloud ----------------
UPDATE public.test_repositories SET name = 'Xray Server' WHERE name = 'Jira Xray';
INSERT INTO public.test_repositories ("name", "order", active) VALUES('Xray Cloud', 1, true);
ALTER TABLE public.client_test_repos ALTER COLUMN url DROP NOT NULL;

---------------- EXECUTION - Add columns for creating new executions in Jira ----------------
ALTER TABLE public.executions ADD tms_test_execution_summary varchar NULL;
ALTER TABLE public.executions ADD tms_test_plan_id varchar NULL;

---------------- UPDATE BROWSER VERSIONS ----------------
UPDATE public.browsers SET default_version = '120.0' WHERE browser_name = 'chrome';
UPDATE public.browsers SET default_version = '120.0' WHERE browser_name = 'edge';
UPDATE public.browsers SET default_version = '120.0' WHERE browser_name = 'firefox';
UPDATE public.browsers SET default_version = '105.0' WHERE browser_name = 'opera';
UPDATE public.browsers SET default_version = '15.0' WHERE browser_name = 'safari';
