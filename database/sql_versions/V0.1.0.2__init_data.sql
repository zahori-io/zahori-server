INSERT INTO public.clients ("name", logo, css, num_parallel, active) VALUES('Company name', 'company-logo.png', NULL, 1, true);

INSERT INTO public.accounts (client_id, username, "password", enabled, credentialsexpired, expired, "locked") VALUES(1, 'zahori', '$2a$10$wD4rGH7qCj/sCR1VyfG/8uagQF0YkHfPThiBTN7MdmLzLlTA2nr3.', true, false, false, false);

INSERT INTO public.roles (code, "label") VALUES('ADMIN', 'rol admin');

INSERT INTO public.accounts_roles (account_id, role_id) VALUES(1, 1);

INSERT INTO public.processes_types ("name", "order", active) VALUES('BROWSER', 1, true);
INSERT INTO public.processes_types ("name", "order", active) VALUES('SERVICE', 2, true);

INSERT INTO public.languages ("name", "order", active) VALUES('Español', 1, true);
INSERT INTO public.languages ("name", "order", active) VALUES('Inglés', 2, true);

INSERT INTO public.client_languages (client_id, lang_id) VALUES(1, 1);

INSERT INTO public.authentication_types ("name", "default", "order", active) VALUES('Estandar', 1, 1, true);
INSERT INTO public.authentication_types ("name", "default", "order", active) VALUES('Directorio Activo', 0, 2, true);

INSERT INTO public.users ("name", surnames, email, authentication, "password", "admin", active, lang_id, credentialsexpired, expired, "locked") VALUES('zahori', 'bot', 'info@zahori.io', 1, '$2a$10$wD4rGH7qCj/sCR1VyfG/8uagQF0YkHfPThiBTN7MdmLzLlTA2nr3.', true, 1, 1, false, false, false);

INSERT INTO public.client_teams (client_id, team_id, "name", "admin", favorite) VALUES(1, 1, 'Desarrollo', false, true);

INSERT INTO public.client_teams_users (client_id, team_id, user_id) VALUES(1, 1, 1);

INSERT INTO public.processes ("name", client_id, team_id, proc_type_id, jenkins_token, jenkins_job, jenkins_job_parameter_name) VALUES('Search Wikipedia', 1, 1, 1, '', '', '');

INSERT INTO public.browsers (browser_name, icon, default_version, "order", active) VALUES('chrome', 'chrome.webp', '86.0', 1, true);
INSERT INTO public.browsers (browser_name, icon, default_version, "order", active) VALUES('firefox', 'firefox.webp', '81.0', 2, true);
INSERT INTO public.browsers (browser_name, icon, default_version, "order", active) VALUES('edge', 'edge.webp', '88.0', 4, true);
INSERT INTO public.browsers (browser_name, icon, default_version, "order", active) VALUES('safari', 'safari.webp', '13.0', 3, true);
INSERT INTO public.browsers (browser_name, icon, default_version, "order", active) VALUES('opera', NULL, '71.0', 5, true);
INSERT INTO public.browsers (browser_name, icon, default_version, "order", active) VALUES('NULLBROWSER', NULL, NULL, 6, false);

INSERT INTO public.cases ("name", process_id, active, "data") VALUES('Search RPA', 1, true, '{"Search": "Robotic process automation","Language": "English"}');
INSERT INTO public.cases ("name", process_id, active, "data") VALUES('Search test automation', 1, true, '{"Search": "Test automation","Language": "English"}');
INSERT INTO public.cases ("name", process_id, active, "data") VALUES('Search viajes extraordinarios', 1, true, '{"Search": "Viajes extraordinarios","Language": "Español"}');
INSERT INTO public.cases ("name", process_id, active, "data") VALUES('Search gastronomía España', 1, true, '{"Search": "Gastronomía de España","Language": "Español"}');

INSERT INTO public.client_environments (client_id, process_id, "name", url, "order", active) VALUES(1, 1, 'preproducción', 'https://pre.url', 1, true);
INSERT INTO public.client_environments (client_id, process_id, "name", url, "order", active) VALUES(1, 1, 'producción', 'https://pro.url', 2, true);

INSERT INTO public.evidence_cases ("name", "order", active) VALUES('Nunca', 1, true);
INSERT INTO public.evidence_cases ("name", "order", active) VALUES('Sólo si el proceso falla o tiene alertas', 2, true);
INSERT INTO public.evidence_cases ("name", "order", active) VALUES('Sólo si el proceso falla', 3, true);
INSERT INTO public.evidence_cases ("name", "order", active) VALUES('Sólo si el proceso tiene alertas', 4, true);

INSERT INTO public.client_evidence_cases (client_id, evi_case_id) VALUES(1, 1);
INSERT INTO public.client_evidence_cases (client_id, evi_case_id) VALUES(1, 2);
INSERT INTO public.client_evidence_cases (client_id, evi_case_id) VALUES(1, 3);

INSERT INTO public.evidence_types ("name", "order", active) VALUES('Log', 1, true);
INSERT INTO public.evidence_types ("name", "order", active) VALUES('Screenshot', 2, true);
INSERT INTO public.evidence_types ("name", "order", active) VALUES('Video', 3, true);
INSERT INTO public.evidence_types ("name", "order", active) VALUES('Doc', 4, true);
INSERT INTO public.evidence_types ("name", "order", active) VALUES('Har', 5, true);

INSERT INTO public.client_evidence_types (client_id, evi_type_id) VALUES(1, 1);
INSERT INTO public.client_evidence_types (client_id, evi_type_id) VALUES(1, 2);
INSERT INTO public.client_evidence_types (client_id, evi_type_id) VALUES(1, 3);
INSERT INTO public.client_evidence_types (client_id, evi_type_id) VALUES(1, 4);
INSERT INTO public.client_evidence_types (client_id, evi_type_id) VALUES(1, 5);

INSERT INTO public.retries (retry_id, active) VALUES(0, true);
INSERT INTO public.retries (retry_id, active) VALUES(1, true);
INSERT INTO public.retries (retry_id, active) VALUES(2, true);
INSERT INTO public.retries (retry_id, active) VALUES(3, true);

INSERT INTO public.client_retries (client_id, retry_id) VALUES(1, 0);
INSERT INTO public.client_retries (client_id, retry_id) VALUES(1, 1);
INSERT INTO public.client_retries (client_id, retry_id) VALUES(1, 2);

INSERT INTO public.client_tags (client_id, process_id, "name", "color", "order", active) VALUES(1, 1, 'Tag 1', '#00ffff',1, true);
INSERT INTO public.client_tags (client_id, process_id, "name", "color", "order", active) VALUES(1, 1, 'Tag 2','#ffaa00', 2, true);

INSERT INTO public.cases_tags (case_id, tag_id) VALUES(3, 1);
INSERT INTO public.cases_tags (case_id, tag_id) VALUES(4, 1);
INSERT INTO public.cases_tags (case_id, tag_id) VALUES(4, 2);

INSERT INTO public.test_repositories ("name", "order", active) VALUES('Xray Server', 1, true);
INSERT INTO public.test_repositories ("name", "order", active) VALUES('Xray Cloud', 2, true);
INSERT INTO public.test_repositories ("name", "order", active) VALUES('Azure Test Plans', 3, true);
INSERT INTO public.test_repositories ("name", "order", active) VALUES('Hp Alm', 4, true);
INSERT INTO public.test_repositories ("name", "order", active) VALUES('Testlink', 5, true);

INSERT INTO public.client_test_repos (client_id, test_repo_id, url, "user", "password") VALUES(1, 2, 'https://your-company.atlassian.net/', 'my-user', 'my-pass');
INSERT INTO public.client_test_repos (client_id, test_repo_id, url, "user", "password") VALUES(1, 5, 'https://testlink.your-company.com', 'my-pass', 'my-pass');

INSERT INTO public.timeouts (timeout_id, active) VALUES(5, true);
INSERT INTO public.timeouts (timeout_id, active) VALUES(10, true);
INSERT INTO public.timeouts (timeout_id, active) VALUES(20, true);
INSERT INTO public.timeouts (timeout_id, active) VALUES(30, true);
INSERT INTO public.timeouts (timeout_id, active) VALUES(40, true);
INSERT INTO public.timeouts (timeout_id, active) VALUES(50, true);
INSERT INTO public.timeouts (timeout_id, active) VALUES(60, true);
INSERT INTO public.timeouts (timeout_id, active) VALUES(90, true);
INSERT INTO public.timeouts (timeout_id, active) VALUES(120, true);

INSERT INTO public.client_timeouts (client_id, timeout_id) VALUES(1, 120);

INSERT INTO public.configurations ("name", process_id, retry_id, timeout_id, environment_id, upload_results, evi_case_id, active) VALUES('Config example', 1, 0, 5, 2, false, 1, true);

INSERT INTO public.configurations_test_repositories (configuration_id, test_repo_id) VALUES(1, 5);

INSERT INTO public.configurations_evidence_types (configuration_id, evi_type_id) VALUES(1, 1);
INSERT INTO public.configurations_evidence_types (configuration_id, evi_type_id) VALUES(1, 2);
INSERT INTO public.configurations_evidence_types (configuration_id, evi_type_id) VALUES(1, 3);
INSERT INTO public.configurations_evidence_types (configuration_id, evi_type_id) VALUES(1, 4);

INSERT INTO public.customerconfig ("name") VALUES('config 1');

INSERT INTO public.customer ("name", customerconfig_id) VALUES('Cliente 1', 1);

INSERT INTO public.platforms (platform_name, "order", active) VALUES('desktop', 1, true);
INSERT INTO public.platforms (platform_name, "order", active) VALUES('mobile', 2, true);

INSERT INTO public.platform_browsers_versions (platform_name, browser_name, browser_version) VALUES('desktop', 'chrome', 'latest');
INSERT INTO public.platform_browsers_versions (platform_name, browser_name, browser_version) VALUES('desktop', 'firefox', '81.0');
INSERT INTO public.platform_browsers_versions (platform_name, browser_name, browser_version) VALUES('desktop', 'chrome', ' 86.0');
INSERT INTO public.platform_browsers_versions (platform_name, browser_name, browser_version) VALUES('desktop', 'edge', 'latest');
INSERT INTO public.platform_browsers_versions (platform_name, browser_name, browser_version) VALUES('mobile', 'chrome', 'latest');
INSERT INTO public.platform_browsers_versions (platform_name, browser_name, browser_version) VALUES('mobile', 'chrome', ' 86.0');


