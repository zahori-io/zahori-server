---------------- NOTIFICATION MEDIA ----------------
CREATE TABLE public.notification_media (
	notification_media_id serial4 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT notification_media_pk PRIMARY KEY (notification_media_id)
);
ALTER TABLE public.notification_media OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.notification_media TO ${zahori_db_user};

INSERT INTO public.notification_media ("name") VALUES('email');

---------------- NOTIFICATION EVENTS ----------------
CREATE TABLE public.notification_events (
	notification_event_id serial4 NOT NULL,
	"name" varchar NOT NULL,
	CONSTRAINT notification_events_pk PRIMARY KEY (notification_event_id),
	CONSTRAINT notification_events_un UNIQUE (name)
);
ALTER TABLE public.notification_events OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.notification_events TO ${zahori_db_user};

INSERT INTO public.notification_events ("name") VALUES('execution.manual.success');
INSERT INTO public.notification_events ("name") VALUES('execution.manual.failure');
INSERT INTO public.notification_events ("name") VALUES('execution.scheduled.success');
INSERT INTO public.notification_events ("name") VALUES('execution.scheduled.failure');

---------------- NOTIFICATIONS ----------------
CREATE TABLE public.notifications (
	notification_id serial4 NOT NULL,
	account_id int8 NOT NULL,
	notification_event_id int8 NOT NULL,
	notification_media_id int8 NOT NULL,
	active bool NOT NULL,
	CONSTRAINT notifications_pk PRIMARY KEY (notification_id),
	CONSTRAINT notifications_account_fk FOREIGN KEY (account_id) REFERENCES public.accounts(id),
	CONSTRAINT notifications_events_fk FOREIGN KEY (notification_event_id) REFERENCES public.notification_events(notification_event_id),
	CONSTRAINT notifications_fk FOREIGN KEY (notification_media_id) REFERENCES public.notification_media(notification_media_id)
);
ALTER TABLE public.notifications OWNER TO ${zahori_db_user};
GRANT ALL ON TABLE public.notifications TO ${zahori_db_user};

---------------- UPDATE BROWSER VERSIONS ----------------
UPDATE public.browsers SET default_version = '118.0' WHERE browser_name = 'chrome';
UPDATE public.browsers SET default_version = '114.0' WHERE browser_name = 'edge';
UPDATE public.browsers SET default_version = '118.0' WHERE browser_name = 'firefox';
UPDATE public.browsers SET default_version = '104.0' WHERE browser_name = 'opera';
UPDATE public.browsers SET default_version = '15.0' WHERE browser_name = 'safari';

