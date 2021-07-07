DROP TABLE public.configurations_test_repositories;

ALTER TABLE public.configurations ADD test_repo_id int8 NULL;
ALTER TABLE public.configurations ADD CONSTRAINT test_repositories_fk FOREIGN KEY (test_repo_id) REFERENCES public.test_repositories(test_repo_id);

ALTER TABLE public.client_test_repos ADD active bool NOT NULL DEFAULT true;

