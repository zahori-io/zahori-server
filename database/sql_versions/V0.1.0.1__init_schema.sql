-- Roles

CREATE ROLE ${zahori_db_user} NOSUPERUSER NOCREATEDB NOCREATEROLE NOINHERIT LOGIN PASSWORD '${zahori_db_pass}';


-- Schemas

-- DROP SCHEMA public;
-- CREATE SCHEMA public AUTHORIZATION zahori;


-- Permissions

GRANT ALL ON SCHEMA public TO ${zahori_db_user};


-- public.authentication_types definition

-- Drop table

-- DROP TABLE public.authentication_types;

CREATE TABLE public.authentication_types (
    auth_id serial NOT NULL,
    "name" varchar NOT NULL,
    "default" int2 NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT authentication_types_pkey PRIMARY KEY (auth_id)
);

-- Permissions

ALTER TABLE public.authentication_types OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.authentication_types TO ${zahori_db_user};


-- public.browsers definition

-- Drop table

-- DROP TABLE public.browsers;

CREATE TABLE public.browsers (
    browser_name varchar NOT NULL,
    icon varchar NULL,
    default_version varchar NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT browsers_pkey PRIMARY KEY (browser_name)
);

-- Permissions

ALTER TABLE public.browsers OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.browsers TO ${zahori_db_user};


-- public.clients definition

-- Drop table

-- DROP TABLE public.clients;

CREATE TABLE public.clients (
    client_id serial NOT NULL,
    "name" varchar NULL,
    logo varchar NULL,
    css varchar NULL,
    num_parallel int4 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT clients_pkey PRIMARY KEY (client_id)
);

-- Permissions

ALTER TABLE public.clients OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.clients TO ${zahori_db_user};


-- public.customerconfig definition

-- Drop table

-- DROP TABLE public.customerconfig;

CREATE TABLE public.customerconfig (
    id serial NOT NULL,
    "name" varchar NULL,
    CONSTRAINT customerconfig_pk PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.customerconfig OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.customerconfig TO ${zahori_db_user};


-- public.evidence_cases definition

-- Drop table

-- DROP TABLE public.evidence_cases;

CREATE TABLE public.evidence_cases (
    evi_case_id serial NOT NULL,
    "name" varchar NOT NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT evidence_cases_pkey PRIMARY KEY (evi_case_id)
);

-- Permissions

ALTER TABLE public.evidence_cases OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.evidence_cases TO ${zahori_db_user};


-- public.evidence_types definition

-- Drop table

-- DROP TABLE public.evidence_types;

CREATE TABLE public.evidence_types (
    evi_type_id serial NOT NULL,
    "name" varchar NOT NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT evidence_type_pkey PRIMARY KEY (evi_type_id)
);

-- Permissions

ALTER TABLE public.evidence_types OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.evidence_types TO ${zahori_db_user};


-- public.languages definition

-- Drop table

-- DROP TABLE public.languages;

CREATE TABLE public.languages (
    lang_id serial NOT NULL,
    "name" varchar NOT NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT languages_pkey PRIMARY KEY (lang_id)
);

-- Permissions

ALTER TABLE public.languages OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.languages TO ${zahori_db_user};


-- public.periodic_executions definition

-- Drop table

-- DROP TABLE public.periodic_executions;

CREATE TABLE public.periodic_executions (
    periodic_execution_id serial NOT NULL,
    "time" time NOT NULL,
    days varchar NOT NULL,
    active bool NOT NULL,
    CONSTRAINT periodic_executions_pk PRIMARY KEY (periodic_execution_id)
);

-- Permissions

ALTER TABLE public.periodic_executions OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.periodic_executions TO ${zahori_db_user};


-- public.platforms definition

-- Drop table

-- DROP TABLE public.platforms;

CREATE TABLE public.platforms (
    platform_name varchar NOT NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT platforms_pkey PRIMARY KEY (platform_name)
);

-- Permissions

ALTER TABLE public.platforms OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.platforms TO ${zahori_db_user};


-- public.processes_types definition

-- Drop table

-- DROP TABLE public.processes_types;

CREATE TABLE public.processes_types (
    proc_type_id serial NOT NULL,
    "name" varchar NOT NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT processes_types_pkey PRIMARY KEY (proc_type_id)
);

-- Permissions

ALTER TABLE public.processes_types OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.processes_types TO ${zahori_db_user};


-- public.retries definition

-- Drop table

-- DROP TABLE public.retries;

CREATE TABLE public.retries (
    retry_id int4 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT configurations_retries_pkey PRIMARY KEY (retry_id)
);

-- Permissions

ALTER TABLE public.retries OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.retries TO ${zahori_db_user};


-- public.roles definition

-- Drop table

-- DROP TABLE public.roles;

CREATE TABLE public.roles (
    id serial NOT NULL,
    code varchar NOT NULL,
    "label" varchar NOT NULL,
    CONSTRAINT roles_pkey PRIMARY KEY (id)
);

-- Permissions

ALTER TABLE public.roles OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.roles TO ${zahori_db_user};


-- public.test_repositories definition

-- Drop table

-- DROP TABLE public.test_repositories;

CREATE TABLE public.test_repositories (
    test_repo_id serial NOT NULL,
    "name" varchar NOT NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT test_repositories_pkey PRIMARY KEY (test_repo_id)
);

-- Permissions

ALTER TABLE public.test_repositories OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.test_repositories TO ${zahori_db_user};


-- public.timeouts definition

-- Drop table

-- DROP TABLE public.timeouts;

CREATE TABLE public.timeouts (
    timeout_id int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT timeouts_pkey PRIMARY KEY (timeout_id)
);

-- Permissions

ALTER TABLE public.timeouts OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.timeouts TO ${zahori_db_user};


-- public.accounts definition

-- Drop table

-- DROP TABLE public.accounts;

CREATE TABLE public.accounts (
    id serial NOT NULL,
    client_id int8 NOT NULL,
    username varchar NOT NULL,
    "password" varchar NOT NULL,
    enabled bool NOT NULL DEFAULT true,
    credentialsexpired bool NOT NULL DEFAULT false,
    expired bool NOT NULL DEFAULT false,
    "locked" bool NOT NULL DEFAULT false,
    CONSTRAINT accounts_pkey PRIMARY KEY (id),
    CONSTRAINT accounts_fk FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Permissions

ALTER TABLE public.accounts OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.accounts TO ${zahori_db_user};


-- public.accounts_roles definition

-- Drop table

-- DROP TABLE public.accounts_roles;

CREATE TABLE public.accounts_roles (
    account_id int8 NOT NULL,
    role_id int8 NOT NULL,
    CONSTRAINT accounts_roles_pk PRIMARY KEY (account_id, role_id),
    CONSTRAINT accounts_fk FOREIGN KEY (account_id) REFERENCES accounts(id),
    CONSTRAINT roles_fk FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Permissions

ALTER TABLE public.accounts_roles OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.accounts_roles TO ${zahori_db_user};


-- public.client_evidence_cases definition

-- Drop table

-- DROP TABLE public.client_evidence_cases;

CREATE TABLE public.client_evidence_cases (
    client_id int8 NOT NULL,
    evi_case_id int8 NOT NULL,
    CONSTRAINT rel_cli_evidence_cases_pkey PRIMARY KEY (client_id, evi_case_id),
    CONSTRAINT rel_cli_fk FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT rel_evidence_cases_fk FOREIGN KEY (evi_case_id) REFERENCES evidence_cases(evi_case_id)
);

-- Permissions

ALTER TABLE public.client_evidence_cases OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_evidence_cases TO ${zahori_db_user};


-- public.client_evidence_types definition

-- Drop table

-- DROP TABLE public.client_evidence_types;

CREATE TABLE public.client_evidence_types (
    client_id int8 NOT NULL,
    evi_type_id int8 NOT NULL,
    CONSTRAINT rel_cli_evidence_type_pkey PRIMARY KEY (client_id, evi_type_id),
    CONSTRAINT rel_cli_fk FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT rel_evidence_type_fk FOREIGN KEY (evi_type_id) REFERENCES evidence_types(evi_type_id)
);

-- Permissions

ALTER TABLE public.client_evidence_types OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_evidence_types TO ${zahori_db_user};


-- public.client_languages definition

-- Drop table

-- DROP TABLE public.client_languages;

CREATE TABLE public.client_languages (
    client_id int8 NOT NULL,
    lang_id int8 NOT NULL,
    CONSTRAINT client_languages_pkey PRIMARY KEY (client_id, lang_id),
    CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT client_languages_fk FOREIGN KEY (lang_id) REFERENCES languages(lang_id)
);

-- Permissions

ALTER TABLE public.client_languages OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_languages TO ${zahori_db_user};


-- public.client_retries definition

-- Drop table

-- DROP TABLE public.client_retries;

CREATE TABLE public.client_retries (
    client_id int8 NOT NULL,
    retry_id int8 NOT NULL,
    CONSTRAINT client_retries_pkey PRIMARY KEY (client_id, retry_id),
    CONSTRAINT client_retries_client_id_fkey FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT client_retries_fk FOREIGN KEY (retry_id) REFERENCES retries(retry_id)
);

-- Permissions

ALTER TABLE public.client_retries OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_retries TO ${zahori_db_user};


-- public.client_teams definition

-- Drop table

-- DROP TABLE public.client_teams;

CREATE TABLE public.client_teams (
    client_id int8 NOT NULL,
    team_id int8 NOT NULL,
    "name" varchar NOT NULL,
    "admin" bool NOT NULL DEFAULT false,
    favorite bool NOT NULL DEFAULT false,
    CONSTRAINT teams_pkey PRIMARY KEY (client_id, team_id),
    CONSTRAINT teams_fk FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Permissions

ALTER TABLE public.client_teams OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_teams TO ${zahori_db_user};


-- public.client_test_repos definition

-- Drop table

-- DROP TABLE public.client_test_repos;

CREATE TABLE public.client_test_repos (
    client_id int8 NOT NULL,
    test_repo_id int8 NOT NULL,
    url varchar NOT NULL,
    "user" varchar NOT NULL,
    "password" varchar NOT NULL,
    CONSTRAINT client_test_repos_pkey PRIMARY KEY (client_id, test_repo_id),
    CONSTRAINT client_test_repos_fk FOREIGN KEY (test_repo_id) REFERENCES test_repositories(test_repo_id),
    CONSTRAINT rel_cli_test_repos_fk FOREIGN KEY (client_id) REFERENCES clients(client_id)
);

-- Permissions

ALTER TABLE public.client_test_repos OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_test_repos TO ${zahori_db_user};


-- public.client_timeouts definition

-- Drop table

-- DROP TABLE public.client_timeouts;

CREATE TABLE public.client_timeouts (
    client_id int8 NOT NULL,
    timeout_id int8 NOT NULL,
    CONSTRAINT client_timeout_pkey PRIMARY KEY (client_id, timeout_id),
    CONSTRAINT client_fk FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT client_timeouts_fk FOREIGN KEY (timeout_id) REFERENCES timeouts(timeout_id)
);

-- Permissions

ALTER TABLE public.client_timeouts OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_timeouts TO ${zahori_db_user};


-- public.customer definition

-- Drop table

-- DROP TABLE public.customer;

CREATE TABLE public.customer (
    id serial NOT NULL,
    "name" varchar NOT NULL,
    customerconfig_id int4 NOT NULL,
    CONSTRAINT customer_pk PRIMARY KEY (id),
    CONSTRAINT customer_fk FOREIGN KEY (customerconfig_id) REFERENCES customerconfig(id)
);

-- Permissions

ALTER TABLE public.customer OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.customer TO ${zahori_db_user};


-- public.platform_browsers_versions definition

-- Drop table

-- DROP TABLE public.platform_browsers_versions;

CREATE TABLE public.platform_browsers_versions (
    platform_name varchar NOT NULL,
    browser_name varchar NOT NULL,
    browser_version varchar NOT NULL,
    CONSTRAINT rel_platform_browsers_versions_pkey PRIMARY KEY (platform_name, browser_name, browser_version),
    CONSTRAINT rel_platform_browsers_version_fk FOREIGN KEY (browser_name) REFERENCES browsers(browser_name),
    CONSTRAINT rel_platform_browsers_versions_fk FOREIGN KEY (platform_name) REFERENCES platforms(platform_name)
);

-- Permissions

ALTER TABLE public.platform_browsers_versions OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.platform_browsers_versions TO ${zahori_db_user};


-- public.processes definition

-- Drop table

-- DROP TABLE public.processes;

CREATE TABLE public.processes (
    process_id serial NOT NULL,
    "name" varchar NOT NULL,
    client_id int8 NOT NULL,
    team_id int8 NOT NULL,
    proc_type_id int8 NOT NULL,
    jenkins_token varchar NULL,
    jenkins_job varchar NULL,
    jenkins_job_parameter_name varchar NULL,
    CONSTRAINT processes_pk PRIMARY KEY (process_id),
    CONSTRAINT processes_fk FOREIGN KEY (proc_type_id) REFERENCES processes_types(proc_type_id),
    CONSTRAINT rel_client_processes_fk FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT rel_teams_processes_fk FOREIGN KEY (client_id, team_id) REFERENCES client_teams(client_id, team_id),
    CONSTRAINT processes_unique UNIQUE (client_id,"name",team_id)
);

-- Permissions

ALTER TABLE public.processes OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.processes TO ${zahori_db_user};



-- public.client_environments definition

-- Drop table

-- DROP TABLE public.client_environments;

CREATE TABLE public.client_environments (
    environment_id serial NOT NULL,
    client_id int8 NOT NULL,
	process_id int8 NOT NULL,
    "name" varchar NOT NULL,
    url varchar NOT NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT client_environments_pk PRIMARY KEY (environment_id),
    CONSTRAINT client_environments_fk FOREIGN KEY (client_id) REFERENCES clients(client_id),
	CONSTRAINT client_environments_processes_fk FOREIGN KEY (process_id) REFERENCES processes(process_id)
);

-- Permissions

ALTER TABLE public.client_environments OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_environments TO ${zahori_db_user};


-- public.client_tags definition

-- Drop table

-- DROP TABLE public.client_tags;

CREATE TABLE public.client_tags (
    tag_id serial NOT NULL,
    client_id int8 NOT NULL,
	process_id int8 NOT NULL,
    "name" varchar NOT NULL,
	"color" varchar NOT NULL,
    "order" int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT client_tags_pk PRIMARY KEY (tag_id),
    CONSTRAINT client_tags_fk FOREIGN KEY (client_id) REFERENCES clients(client_id),
	CONSTRAINT client_tags_processes_fk FOREIGN KEY (process_id) REFERENCES processes(process_id)
);

-- Permissions

ALTER TABLE public.client_tags OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_tags TO ${zahori_db_user};


-- public.users definition

-- Drop table

-- DROP TABLE public.users;

CREATE TABLE public.users (
    user_id serial NOT NULL,
    "name" varchar NOT NULL,
    surnames varchar NOT NULL,
    email varchar NOT NULL,
    authentication int2 NOT NULL,
    "password" varchar NOT NULL,
    "admin" bool NOT NULL,
    active int4 NOT NULL DEFAULT 1,
    lang_id int8 NOT NULL DEFAULT 1,
    credentialsexpired bool NOT NULL DEFAULT false,
    expired bool NOT NULL DEFAULT false,
    "locked" bool NOT NULL DEFAULT false,
    CONSTRAINT users_pkey PRIMARY KEY (user_id),
    CONSTRAINT fk_user_auth_type FOREIGN KEY (authentication) REFERENCES authentication_types(auth_id) NOT VALID,
    CONSTRAINT languages_fk FOREIGN KEY (lang_id) REFERENCES languages(lang_id)
);

-- Permissions

ALTER TABLE public.users OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.users TO ${zahori_db_user};


-- public.address definition

-- Drop table

-- DROP TABLE public.address;

CREATE TABLE public.address (
    id serial NOT NULL,
    street varchar NULL,
    customer_id int8 NULL,
    CONSTRAINT address_pk PRIMARY KEY (id),
    CONSTRAINT customer_fk FOREIGN KEY (customer_id) REFERENCES customer(id)
);

-- Permissions

ALTER TABLE public.address OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.address TO ${zahori_db_user};


-- public.cases definition

-- Drop table

-- DROP TABLE public.cases;

CREATE TABLE public.cases (
    case_id serial NOT NULL,
    "name" varchar NOT NULL,
    process_id int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    "data" varchar NULL,
    CONSTRAINT cases_pk PRIMARY KEY (case_id),
    CONSTRAINT cases_fk FOREIGN KEY (process_id) REFERENCES processes(process_id)
);

-- Permissions

ALTER TABLE public.cases OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.cases TO ${zahori_db_user};


-- public.cases_tags definition

-- Drop table

-- DROP TABLE public.cases_tags;

CREATE TABLE public.cases_tags (
    case_id int8 NOT NULL,
    tag_id int8 NOT NULL,
    CONSTRAINT cases_tags_pk PRIMARY KEY (case_id, tag_id),
    CONSTRAINT rel_cases_tags_fk FOREIGN KEY (case_id) REFERENCES cases(case_id),
    CONSTRAINT rel_cases_tags_tags_fk FOREIGN KEY (tag_id) REFERENCES client_tags(tag_id)
);

-- Permissions

ALTER TABLE public.cases_tags OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.cases_tags TO ${zahori_db_user};


-- public.client_plat_brow_versions definition

-- Drop table

-- DROP TABLE public.client_plat_brow_versions;

CREATE TABLE public.client_plat_brow_versions (
    client_id int8 NOT NULL,
    platform_name varchar NOT NULL,
    browser_name varchar NOT NULL,
    browser_version varchar NOT NULL,
    CONSTRAINT rel_cli_plat_brow_versions_pkey PRIMARY KEY (client_id, browser_version, browser_name),
    CONSTRAINT rel_cli_fk FOREIGN KEY (client_id) REFERENCES clients(client_id),
    CONSTRAINT rel_plat_brow_versions_fk FOREIGN KEY (platform_name, browser_name, browser_version) REFERENCES platform_browsers_versions(platform_name, browser_name, browser_version)
);

-- Permissions

ALTER TABLE public.client_plat_brow_versions OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_plat_brow_versions TO ${zahori_db_user};


-- public.client_teams_users definition

-- Drop table

-- DROP TABLE public.client_teams_users;

CREATE TABLE public.client_teams_users (
    client_id int8 NOT NULL,
    team_id int8 NOT NULL,
    user_id int8 NOT NULL,
    CONSTRAINT rel_teams_users_pkey PRIMARY KEY (client_id, team_id),
    CONSTRAINT rel_teams_users_fk FOREIGN KEY (client_id, team_id) REFERENCES client_teams(client_id, team_id),
    CONSTRAINT rel_users_fk FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Permissions

ALTER TABLE public.client_teams_users OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.client_teams_users TO ${zahori_db_user};


-- public.configurations definition

-- Drop table

-- DROP TABLE public.configurations;

CREATE TABLE public.configurations (
    configuration_id serial NOT NULL,
    "name" varchar NOT NULL,
    process_id int8 NOT NULL,
    retry_id int8 NOT NULL,
    timeout_id int8 NOT NULL,
    environment_id int8 NOT NULL,
    upload_results bool NOT NULL DEFAULT false,
    evi_case_id int8 NOT NULL,
    active bool NOT NULL DEFAULT true,
    CONSTRAINT configurations_pk PRIMARY KEY (configuration_id),
    CONSTRAINT configurations_fk FOREIGN KEY (process_id) REFERENCES processes(process_id),
    CONSTRAINT environments_fk FOREIGN KEY (environment_id) REFERENCES client_environments(environment_id),
    CONSTRAINT evidence_cases_fk FOREIGN KEY (evi_case_id) REFERENCES evidence_cases(evi_case_id),
    CONSTRAINT retries_fk FOREIGN KEY (retry_id) REFERENCES retries(retry_id),
    CONSTRAINT configurations_timeouts_fk FOREIGN KEY (timeout_id) REFERENCES timeouts(timeout_id)
);

-- Permissions

ALTER TABLE public.configurations OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.configurations TO ${zahori_db_user};


-- public.configurations_evidence_types definition

-- Drop table

-- DROP TABLE public.configurations_evidence_types;

CREATE TABLE public.configurations_evidence_types (
    configuration_id int8 NOT NULL,
    evi_type_id int8 NOT NULL,
    CONSTRAINT configurations_evidence_types_pk PRIMARY KEY (configuration_id, evi_type_id),
    CONSTRAINT configurations_fk FOREIGN KEY (configuration_id) REFERENCES configurations(configuration_id),
    CONSTRAINT evidence_types_fk FOREIGN KEY (evi_type_id) REFERENCES evidence_types(evi_type_id)
);

-- Permissions

ALTER TABLE public.configurations_evidence_types OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.configurations_evidence_types TO ${zahori_db_user};


-- public.configurations_test_repositories definition

-- Drop table

-- DROP TABLE public.configurations_test_repositories;

CREATE TABLE public.configurations_test_repositories (
    configuration_id int8 NOT NULL,
    test_repo_id int8 NOT NULL,
    CONSTRAINT configurations_test_repositories_pk PRIMARY KEY (configuration_id, test_repo_id),
    CONSTRAINT configurations_fk FOREIGN KEY (configuration_id) REFERENCES configurations(configuration_id),
    CONSTRAINT test_repositories_fk FOREIGN KEY (test_repo_id) REFERENCES test_repositories(test_repo_id)
);

-- Permissions

ALTER TABLE public.configurations_test_repositories OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.configurations_test_repositories TO ${zahori_db_user};


-- public.executions definition

-- Drop table

-- DROP TABLE public.executions;

CREATE TABLE public.executions (
    execution_id serial NOT NULL,
    process_id int8 NOT NULL,
    "name" varchar NOT NULL,
    status varchar NULL,
    total_passed int4 NOT NULL DEFAULT 0,
    total_failed int4 NOT NULL DEFAULT 0,
    duration_seconds int4 NULL DEFAULT 0,
    "date" varchar NULL,
    configuration_id int8 NOT NULL,
    periodic_execution_id int8 NULL,
    user_id int8 NULL,
    jenkins_build varchar NULL,
    CONSTRAINT executions_pk PRIMARY KEY (execution_id),
    CONSTRAINT rel_configurations_executions_fk FOREIGN KEY (configuration_id) REFERENCES configurations(configuration_id),
    CONSTRAINT rel_executions_fk FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT rel_periodic_executions_executions_fk FOREIGN KEY (periodic_execution_id) REFERENCES periodic_executions(periodic_execution_id),
    CONSTRAINT rel_processes_executions_fk FOREIGN KEY (process_id) REFERENCES processes(process_id)
);

-- Permissions

ALTER TABLE public.executions OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.executions TO ${zahori_db_user};


-- public.cases_executions definition

-- Drop table

-- DROP TABLE public.cases_executions;

CREATE TABLE public.cases_executions (
    case_execution_id serial NOT NULL,
    case_id int8 NOT NULL,
    execution_id int8 NOT NULL,
    browser_name varchar NOT NULL,
    status varchar NULL,
    "date" varchar NULL,
    notes varchar NULL,
    steps varchar NULL,
    log varchar NULL,
    video varchar NULL,
    doc varchar NULL,
    har varchar NULL,
    duration_seconds int4 NULL,
    selenoid_id varchar NULL,
    screen_resolution varchar NULL,
    browser_version varchar NULL,
    CONSTRAINT cases_executions_pk PRIMARY KEY (case_execution_id),
    CONSTRAINT cases_executions_unique UNIQUE (case_id, execution_id, browser_name),
    CONSTRAINT rel_browsers_fk FOREIGN KEY (browser_name) REFERENCES browsers(browser_name),
    CONSTRAINT rel_cases_fk FOREIGN KEY (case_id) REFERENCES cases(case_id),
    CONSTRAINT rel_executions_fk FOREIGN KEY (execution_id) REFERENCES executions(execution_id)
);

-- Permissions

ALTER TABLE public.cases_executions OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.cases_executions TO ${zahori_db_user};





