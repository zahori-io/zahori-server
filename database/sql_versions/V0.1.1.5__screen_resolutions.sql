CREATE TABLE public.resolutions (
    resolution_id serial NOT NULL,
    client_id int8 NOT NULL,
	process_id int8 NOT NULL,
    width int4 NOT NULL,
    height int4 NOT NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT resolutions_pk PRIMARY KEY (resolution_id),
    CONSTRAINT resolutions_fk FOREIGN KEY (client_id) REFERENCES clients(client_id),
	CONSTRAINT resolutions_processes_fk FOREIGN KEY (process_id) REFERENCES processes(process_id)
);

-- Permissions
ALTER TABLE public.resolutions OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.resolutions TO ${zahori_db_user};


ALTER TABLE public.cases_executions DROP CONSTRAINT cases_executions_unique;
ALTER TABLE public.cases_executions ADD CONSTRAINT cases_executions_unique UNIQUE (case_id, execution_id, browser_name, screen_resolution);

