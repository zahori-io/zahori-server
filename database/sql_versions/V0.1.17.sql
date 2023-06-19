---------------- PERIODIC EXECUTIONS ----------------
ALTER TABLE public.periodic_executions ALTER COLUMN "time" TYPE varchar USING "time"::varchar;
ALTER TABLE public.periodic_executions ALTER COLUMN days TYPE text[] USING days::text[];
ALTER TABLE public.periodic_executions ADD uuid uuid NOT NULL;
ALTER TABLE public.periodic_executions ADD execution_id int4 NULL;
ALTER TABLE public.periodic_executions ADD CONSTRAINT rel_periodic_executions_executions_fk FOREIGN KEY (execution_id) REFERENCES public.executions(execution_id);

---------------- EXECUTIONS ----------------
ALTER TABLE public.executions ADD "trigger" varchar NULL;
UPDATE public.executions SET trigger = 'Manual';
ALTER TABLE public.executions DROP CONSTRAINT rel_periodic_executions_executions_fk;
ALTER TABLE public.executions DROP COLUMN periodic_execution_id;

---------------- UPDATE BROWSER VERSIONS ----------------
UPDATE public.browsers SET default_version = '114.0' WHERE browser_name = 'chrome';
UPDATE public.browsers SET default_version = '114.0' WHERE browser_name = 'edge';
UPDATE public.browsers SET default_version = '114.0' WHERE browser_name = 'firefox';
UPDATE public.browsers SET default_version = '98.0' WHERE browser_name = 'opera';
UPDATE public.browsers SET default_version = '15.0' WHERE browser_name = 'safari';
