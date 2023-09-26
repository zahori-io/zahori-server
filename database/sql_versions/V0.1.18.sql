---------------- LANGUAGES ----------------
-- Drop old tables
DROP TABLE IF EXISTS public.client_languages;
ALTER TABLE public.users DROP CONSTRAINT languages_fk;
DROP TABLE IF EXISTS public.languages;

CREATE TABLE public.languages (
	language_id serial4 NOT NULL,
	"name" varchar NOT NULL,
	language_code varchar NOT NULL,
	country_code varchar NOT NULL,
	default_language bool NOT NULL DEFAULT false,
	CONSTRAINT languages_pk PRIMARY KEY (language_id)
);

INSERT INTO public.languages ("name", language_code, country_code, default_language) VALUES('English', 'en', 'GB', true);
INSERT INTO public.languages ("name", language_code, country_code, default_language) VALUES('Español', 'es', 'ES', false);

ALTER TABLE public.languages OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.languages TO ${zahori_db_user};

---------------- ACCOUNTS ----------------
ALTER TABLE public.accounts ADD language_id int8 NULL;
ALTER TABLE public.accounts ADD CONSTRAINT accounts_languages_fk FOREIGN KEY (language_id) REFERENCES public.languages(language_id);
ALTER TABLE public.accounts ADD email varchar NULL;

---------------- EMAIL_VERIFICATION ----------------
CREATE TABLE public.email_verification (
	email_verification_id serial4 NOT NULL,
	account_id int4 NOT NULL,
	"token" uuid NOT NULL,
	new_email varchar NOT NULL,
	token_expiration int8 NOT NULL,
	CONSTRAINT email_verification_pk PRIMARY KEY (email_verification_id),
	CONSTRAINT email_verification_fk FOREIGN KEY (account_id) REFERENCES public.accounts(id)
);

ALTER TABLE public.email_verification OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.email_verification TO ${zahori_db_user};

---------------- FORGOT_PASSWORD ----------------
CREATE TABLE public.forgot_password (
	forgot_password_id serial4 NOT NULL,
	account_id int4 NOT NULL,
	"token" uuid NOT NULL,
	token_expiration int8 NOT NULL,
	CONSTRAINT forgot_password_pk PRIMARY KEY (forgot_password_id),
	CONSTRAINT forgot_password_fk FOREIGN KEY (account_id) REFERENCES public.accounts(id)
);

ALTER TABLE public.forgot_password OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.forgot_password TO ${zahori_db_user};

---------------- CASES_EXECUTIONS ----------------
ALTER TABLE public.cases_executions ADD "date_timestamp" int8 NULL;

---------------- UPDATE BROWSER VERSIONS ----------------
UPDATE public.browsers SET default_version = '117.0' WHERE browser_name = 'chrome';
UPDATE public.browsers SET default_version = '114.0' WHERE browser_name = 'edge';
UPDATE public.browsers SET default_version = '117.0' WHERE browser_name = 'firefox';
UPDATE public.browsers SET default_version = '102.0' WHERE browser_name = 'opera';
UPDATE public.browsers SET default_version = '15.0' WHERE browser_name = 'safari';

