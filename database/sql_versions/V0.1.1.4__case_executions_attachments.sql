CREATE TABLE public.cases_executions_attachments (
    attachment_id serial NOT NULL,
	"path" varchar NULL,
	case_execution_id int8 NOT NULL,
	CONSTRAINT attachments_pk PRIMARY KEY (attachment_id),
	CONSTRAINT attachments_fk FOREIGN KEY (case_execution_id) REFERENCES public.cases_executions(case_execution_id)
);

-- Permissions
ALTER TABLE public.cases_executions_attachments OWNER TO zahori;
GRANT ALL ON TABLE public.cases_executions_attachments TO zahori;

