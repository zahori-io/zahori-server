---------------- TEST REPOSITORIES - Changes to allow adding multiple rapositories of the same type to one client ----------------

-- Step 1: Create new temporary table "client_test_repos_v2"
CREATE TABLE public.client_test_repos_v2 (
	repo_instance_id serial4 NOT NULL, -- new column for the primary key
	client_id int8 NOT NULL,
	test_repo_id int8 NOT NULL,
    name varchar NOT NULL,
	url varchar NULL,
	"user" varchar NOT NULL,
	"password" varchar NOT NULL,
	active bool DEFAULT true NOT NULL,
	CONSTRAINT client_test_repos_v2_pkey PRIMARY KEY (repo_instance_id),
	CONSTRAINT client_test_repos_v2_fk FOREIGN KEY (test_repo_id) REFERENCES public.test_repositories(test_repo_id),
	CONSTRAINT client_test_repos_v2_client_fk FOREIGN KEY (client_id) REFERENCES public.clients(client_id)
);

-- Permissions

ALTER TABLE public.client_test_repos_v2 OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_test_repos_v2 TO ${zahori_db_user};

-- Step 2: Migrate data from original table "client_test_repos" to the new one "client_test_repos_v2"
INSERT INTO public.client_test_repos_v2 (client_id, test_repo_id, name, url, "user", "password", active)
SELECT 
	ctr.client_id, 
	ctr.test_repo_id,
    tr.name,
	ctr.url, 
	ctr."user", 
	ctr."password",
    ctr.active
FROM public.client_test_repos ctr, public.test_repositories tr
WHERE ctr.test_repo_id = tr.test_repo_id;

-- Step 3: Remove original table "client_test_repos"
DROP TABLE public.client_test_repos;

-- Step 4: Rename new table and its constraints
ALTER TABLE public.client_test_repos_v2 RENAME TO client_test_repos;
ALTER TABLE public.client_test_repos RENAME CONSTRAINT client_test_repos_v2_pkey TO client_test_repos_pkey;
ALTER TABLE public.client_test_repos RENAME CONSTRAINT client_test_repos_v2_fk TO client_test_repos_fk;
ALTER TABLE public.client_test_repos RENAME CONSTRAINT client_test_repos_v2_client_fk TO client_test_repos_client_fk;
ALTER SEQUENCE client_test_repos_v2_repo_instance_id_seq RENAME TO client_test_repos_repo_instance_id_seq;	

-- Step 5: Add column "repo_instance_id" to table "configurations"
ALTER TABLE public.configurations ADD COLUMN repo_instance_id int8;

-- Step 6: Set value to column "repo_instance_id" in table "configurations"
UPDATE public.configurations c
SET repo_instance_id = ctr.repo_instance_id
FROM public.client_test_repos ctr, public.processes p
where
p.process_id = c.process_id AND
p.client_id = ctr.client_id and
c.test_repo_id = ctr.test_repo_id;

-- Step 7: Remove column "test_repo_id" from "configurations" table
ALTER TABLE public.configurations DROP COLUMN test_repo_id;

-- Step 8: Create foreign key on column "repo_instance_id"
ALTER TABLE public.configurations
ADD CONSTRAINT configurations_repo_instance_id_fk
FOREIGN KEY (repo_instance_id) REFERENCES public.client_test_repos(repo_instance_id);

-- Step 9: Rename column "name" to "type" in test_repositories table
ALTER TABLE test_repositories RENAME COLUMN name TO type;



