--
-- PostgreSQL database dump
--

\restrict egjXPR1DC8vefDOWEdA5a1ZuWpTwadxJvz0GsnTxofOJ1YEizaG2kQ0nb2hgUli

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 16.11 (Debian 16.11-1.pgdg13+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.rewards_issued DROP CONSTRAINT IF EXISTS rewards_issued_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS "FK_fa26bb110a3cb2ea576a10bb766";
ALTER TABLE IF EXISTS ONLY public.app_goals DROP CONSTRAINT IF EXISTS "FK_f5217329c699f0327b2d9cb9c2a";
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS "FK_e82afcf2bc3e13cfdd1a313112f";
ALTER TABLE IF EXISTS ONLY public.user_apps DROP CONSTRAINT IF EXISTS "FK_cacf8c78ceb44d2dcb0f8f67247";
ALTER TABLE IF EXISTS ONLY public.user_goals DROP CONSTRAINT IF EXISTS "FK_c14a9a2e19a021a11de6775564e";
ALTER TABLE IF EXISTS ONLY public.goal_priorities DROP CONSTRAINT IF EXISTS "FK_be5edb7aad1a24725d54573a56f";
ALTER TABLE IF EXISTS ONLY public.user_goal_categories DROP CONSTRAINT IF EXISTS "FK_bd6ac8878c150cb1b9469fc96d4";
ALTER TABLE IF EXISTS ONLY public.user_goal_priorities DROP CONSTRAINT IF EXISTS "FK_bba7a20d94bd8e16204a2bb6b99";
ALTER TABLE IF EXISTS ONLY public.message_queue DROP CONSTRAINT IF EXISTS "FK_b75e4e870050e3e7a0f948defd6";
ALTER TABLE IF EXISTS ONLY public.country_languages DROP CONSTRAINT IF EXISTS "FK_b321147e5c326be40fc9c68c517";
ALTER TABLE IF EXISTS ONLY public.goals DROP CONSTRAINT IF EXISTS "FK_a486d9bb93d1d26ac5b8dd78600";
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS "FK_a0ed47f0ee7de871cdbcf9d1f93";
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS "FK_9f9c3548c0fa4efecb1e0f292dc";
ALTER TABLE IF EXISTS ONLY public.user_messages DROP CONSTRAINT IF EXISTS "FK_8f211af20e47fff29862054ac56";
ALTER TABLE IF EXISTS ONLY public.country_languages DROP CONSTRAINT IF EXISTS "FK_89dc703d8ca945151a4fb0945cd";
ALTER TABLE IF EXISTS ONLY public.user_apps DROP CONSTRAINT IF EXISTS "FK_884ba4e0d8cd4b80fe912c93db0";
ALTER TABLE IF EXISTS ONLY public.apps DROP CONSTRAINT IF EXISTS "FK_860fb2ed99a000c335715c0d7b0";
ALTER TABLE IF EXISTS ONLY public.user_goal_categories DROP CONSTRAINT IF EXISTS "FK_8001bb6194cd9ad717606002b20";
ALTER TABLE IF EXISTS ONLY public.app_audios DROP CONSTRAINT IF EXISTS "FK_7ae4353751bb071391a40fcb195";
ALTER TABLE IF EXISTS ONLY public.goal_sub_categories DROP CONSTRAINT IF EXISTS "FK_72d89d705970ac523386529c698";
ALTER TABLE IF EXISTS ONLY public.user_messages DROP CONSTRAINT IF EXISTS "FK_68d799aeb820f0e823c1120fe73";
ALTER TABLE IF EXISTS ONLY public.user_goal_priorities DROP CONSTRAINT IF EXISTS "FK_5bbf8c7905218e8daf83734ecc9";
ALTER TABLE IF EXISTS ONLY public.app_goals DROP CONSTRAINT IF EXISTS "FK_58b864fe2d90186e32372df25a6";
ALTER TABLE IF EXISTS ONLY public.app_countries DROP CONSTRAINT IF EXISTS "FK_4de4ec7ad2dcdf4f5cc4f3df56c";
ALTER TABLE IF EXISTS ONLY public.countries DROP CONSTRAINT IF EXISTS "FK_4caf5b53eb19ec9806f596a72b2";
ALTER TABLE IF EXISTS ONLY public.user_goals DROP CONSTRAINT IF EXISTS "FK_4bbd0401b703af6edaa27ea4cf6";
ALTER TABLE IF EXISTS ONLY public.app_goal_sub_categories DROP CONSTRAINT IF EXISTS "FK_285c3533ad0e71168f015c71dd5";
ALTER TABLE IF EXISTS ONLY public.countries DROP CONSTRAINT IF EXISTS "FK_134a8d7f104440d12d4aa7cb198";
ALTER TABLE IF EXISTS ONLY public.app_goal_sub_categories DROP CONSTRAINT IF EXISTS "FK_0c4cce5a5fac446cf045fc0a0a4";
ALTER TABLE IF EXISTS ONLY public.goals DROP CONSTRAINT IF EXISTS "FK_08e63ee409a979262dc1d1868b6";
ALTER TABLE IF EXISTS ONLY public.app_countries DROP CONSTRAINT IF EXISTS "FK_00a239a9e4ae728702d89d237f2";
DROP INDEX IF EXISTS public.idx_signal_logs_user_id;
DROP INDEX IF EXISTS public.idx_signal_logs_signal_id;
DROP INDEX IF EXISTS public.idx_signal_logs_created_at;
DROP INDEX IF EXISTS public.idx_signal_logs_app_id;
DROP INDEX IF EXISTS public.idx_rules_type_active;
DROP INDEX IF EXISTS public.idx_milestone_logs_user_id;
DROP INDEX IF EXISTS public.idx_milestone_logs_milestone_id;
DROP INDEX IF EXISTS public.idx_milestone_logs_is_checked;
DROP INDEX IF EXISTS public.idx_milestone_logs_created_at;
DROP INDEX IF EXISTS public.idx_milestone_logs_app_id;
DROP INDEX IF EXISTS public.idx_intervention_logs_user_ids;
DROP INDEX IF EXISTS public.idx_intervention_logs_intervention_ids;
DROP INDEX IF EXISTS public.idx_intervention_logs_created_at;
DROP INDEX IF EXISTS public."IDX_f5217329c699f0327b2d9cb9c2";
DROP INDEX IF EXISTS public."IDX_bba7a20d94bd8e16204a2bb6b9";
DROP INDEX IF EXISTS public."IDX_b321147e5c326be40fc9c68c51";
DROP INDEX IF EXISTS public."IDX_89dc703d8ca945151a4fb0945c";
DROP INDEX IF EXISTS public."IDX_5bbf8c7905218e8daf83734ecc";
DROP INDEX IF EXISTS public."IDX_58b864fe2d90186e32372df25a";
DROP INDEX IF EXISTS public."IDX_285c3533ad0e71168f015c71dd";
DROP INDEX IF EXISTS public."IDX_0c4cce5a5fac446cf045fc0a0a";
ALTER TABLE IF EXISTS ONLY public.signal_logs DROP CONSTRAINT IF EXISTS signal_logs_pkey;
ALTER TABLE IF EXISTS ONLY public.rewards_issued DROP CONSTRAINT IF EXISTS rewards_issued_pkey;
ALTER TABLE IF EXISTS ONLY public.milestone_logs DROP CONSTRAINT IF EXISTS milestone_logs_pkey;
ALTER TABLE IF EXISTS ONLY public.intervention_logs DROP CONSTRAINT IF EXISTS intervention_logs_pkey;
ALTER TABLE IF EXISTS ONLY public.high_watermarks DROP CONSTRAINT IF EXISTS high_watermarks_pkey;
ALTER TABLE IF EXISTS ONLY public.evaluation_conditions DROP CONSTRAINT IF EXISTS evaluation_conditions_rule_name_key;
ALTER TABLE IF EXISTS ONLY public.evaluation_conditions DROP CONSTRAINT IF EXISTS evaluation_conditions_pkey;
ALTER TABLE IF EXISTS ONLY public.cron_jobs DROP CONSTRAINT IF EXISTS cron_jobs_pkey;
ALTER TABLE IF EXISTS ONLY public.cron_jobs DROP CONSTRAINT IF EXISTS cron_jobs_job_key_key;
ALTER TABLE IF EXISTS ONLY public.cron_job_status DROP CONSTRAINT IF EXISTS cron_job_status_pkey;
ALTER TABLE IF EXISTS ONLY public.admin_users DROP CONSTRAINT IF EXISTS "UQ_dcd0c8a4b10af9c986e510b9ecc";
ALTER TABLE IF EXISTS ONLY public.goal_sub_categories DROP CONSTRAINT IF EXISTS "UQ_c4bd943fc2c32c451e00db6325d";
ALTER TABLE IF EXISTS ONLY public.goal_categories DROP CONSTRAINT IF EXISTS "UQ_c2d9668747087ca1017e1846ce7";
ALTER TABLE IF EXISTS ONLY public.countries DROP CONSTRAINT IF EXISTS "UQ_b47cbb5311bad9c9ae17b8c1eda";
ALTER TABLE IF EXISTS ONLY public.goals DROP CONSTRAINT IF EXISTS "UQ_960318654fa170aae9a3f9e7a40";
ALTER TABLE IF EXISTS ONLY public.apps DROP CONSTRAINT IF EXISTS "UQ_88d9328b5403a89eb94af4d5653";
ALTER TABLE IF EXISTS ONLY public.languages DROP CONSTRAINT IF EXISTS "UQ_7397752718d1c9eb873722ec9b2";
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS "UQ_1e3d0240b49c40521aaeb953293";
ALTER TABLE IF EXISTS ONLY public.languages DROP CONSTRAINT IF EXISTS "UQ_06df62e773ec68318919dafacf7";
ALTER TABLE IF EXISTS ONLY public.user_apps DROP CONSTRAINT IF EXISTS "PK_fc0f4f1c464efb7357f6869c15c";
ALTER TABLE IF EXISTS ONLY public.goal_sub_categories DROP CONSTRAINT IF EXISTS "PK_e9a62f07690b0ffff7b9c478c44";
ALTER TABLE IF EXISTS ONLY public.app_audios DROP CONSTRAINT IF EXISTS "PK_e07326acdd3c4997631419bb2e3";
ALTER TABLE IF EXISTS ONLY public.apps DROP CONSTRAINT IF EXISTS "PK_c5121fda0f8268f1f7f84134e19";
ALTER TABLE IF EXISTS ONLY public.services DROP CONSTRAINT IF EXISTS "PK_ba2d347a3168a296416c6c5ccb2";
ALTER TABLE IF EXISTS ONLY public.app_countries DROP CONSTRAINT IF EXISTS "PK_b9c6c422ffb9e3f9913fb68d110";
ALTER TABLE IF EXISTS ONLY public.languages DROP CONSTRAINT IF EXISTS "PK_b517f827ca496b29f4d549c631d";
ALTER TABLE IF EXISTS ONLY public.countries DROP CONSTRAINT IF EXISTS "PK_b2d7006793e8697ab3ae2deff18";
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS "PK_a3ffb1c0c8416b9fc6f907b7433";
ALTER TABLE IF EXISTS ONLY public.app_goals DROP CONSTRAINT IF EXISTS "PK_9cc7a93ee691384dc0b4feefc62";
ALTER TABLE IF EXISTS ONLY public.message_templates DROP CONSTRAINT IF EXISTS "PK_9ac2bd9635be662d183f314947d";
ALTER TABLE IF EXISTS ONLY public.message_queue DROP CONSTRAINT IF EXISTS "PK_948a560dc247eabb847829e9549";
ALTER TABLE IF EXISTS ONLY public.migrations DROP CONSTRAINT IF EXISTS "PK_8c82d7f526340ab734260ea46be";
ALTER TABLE IF EXISTS ONLY public.user_messages DROP CONSTRAINT IF EXISTS "PK_5a90e206d5e3dfde48f640ea7c6";
ALTER TABLE IF EXISTS ONLY public.user_goal_categories DROP CONSTRAINT IF EXISTS "PK_5731001bd11205105ee1b12911c";
ALTER TABLE IF EXISTS ONLY public.app_screen_audios DROP CONSTRAINT IF EXISTS "PK_3957709131229cca533a8737464";
ALTER TABLE IF EXISTS ONLY public.country_languages DROP CONSTRAINT IF EXISTS "PK_38ac9ad6f634d8d25a121a37a01";
ALTER TABLE IF EXISTS ONLY public.user_goal_priorities DROP CONSTRAINT IF EXISTS "PK_30467a2d9c540f576a573fc857e";
ALTER TABLE IF EXISTS ONLY public.goal_priorities DROP CONSTRAINT IF EXISTS "PK_2744fcba44fa4aa87dc905bb0cb";
ALTER TABLE IF EXISTS ONLY public.goals DROP CONSTRAINT IF EXISTS "PK_26e17b251afab35580dff769223";
ALTER TABLE IF EXISTS ONLY public.verifications DROP CONSTRAINT IF EXISTS "PK_2127ad1b143cf012280390b01d1";
ALTER TABLE IF EXISTS ONLY public.user_goals DROP CONSTRAINT IF EXISTS "PK_1cf8a9384f9f60fef678fd8f363";
ALTER TABLE IF EXISTS ONLY public.goal_categories DROP CONSTRAINT IF EXISTS "PK_1c80eac47901d682e6d5fcea6e2";
ALTER TABLE IF EXISTS ONLY public.messages DROP CONSTRAINT IF EXISTS "PK_18325f38ae6de43878487eff986";
ALTER TABLE IF EXISTS ONLY public.admin_users DROP CONSTRAINT IF EXISTS "PK_06744d221bb6145dc61e5dc441d";
ALTER TABLE IF EXISTS ONLY public.app_goal_sub_categories DROP CONSTRAINT IF EXISTS "PK_04c0eeefd08feba8dca1c4a64ff";
ALTER TABLE IF EXISTS public.migrations ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.intervention_logs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.cron_jobs ALTER COLUMN id DROP DEFAULT;
ALTER TABLE IF EXISTS public.cron_job_status ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.verifications;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.user_messages;
DROP TABLE IF EXISTS public.user_goals;
DROP TABLE IF EXISTS public.user_goal_priorities;
DROP TABLE IF EXISTS public.user_goal_categories;
DROP TABLE IF EXISTS public.user_apps;
DROP TABLE IF EXISTS public.signal_logs;
DROP TABLE IF EXISTS public.services;
DROP TABLE IF EXISTS public.rewards_issued;
DROP TABLE IF EXISTS public.milestone_logs;
DROP SEQUENCE IF EXISTS public.migrations_id_seq;
DROP TABLE IF EXISTS public.migrations;
DROP TABLE IF EXISTS public.messages;
DROP TABLE IF EXISTS public.message_templates;
DROP TABLE IF EXISTS public.message_queue;
DROP TABLE IF EXISTS public.languages;
DROP SEQUENCE IF EXISTS public.intervention_logs_id_seq;
DROP TABLE IF EXISTS public.intervention_logs;
DROP TABLE IF EXISTS public.high_watermarks;
DROP TABLE IF EXISTS public.goals;
DROP TABLE IF EXISTS public.goal_sub_categories;
DROP TABLE IF EXISTS public.goal_priorities;
DROP TABLE IF EXISTS public.goal_categories;
DROP TABLE IF EXISTS public.evaluation_conditions;
DROP SEQUENCE IF EXISTS public.cron_jobs_id_seq;
DROP TABLE IF EXISTS public.cron_jobs;
DROP SEQUENCE IF EXISTS public.cron_job_status_id_seq;
DROP TABLE IF EXISTS public.cron_job_status;
DROP TABLE IF EXISTS public.country_languages;
DROP TABLE IF EXISTS public.countries;
DROP TABLE IF EXISTS public.apps;
DROP TABLE IF EXISTS public.app_screen_audios;
DROP TABLE IF EXISTS public.app_goals;
DROP TABLE IF EXISTS public.app_goal_sub_categories;
DROP TABLE IF EXISTS public.app_countries;
DROP TABLE IF EXISTS public.app_audios;
DROP TABLE IF EXISTS public.admin_users;
DROP TYPE IF EXISTS public.user_goals_relationshiptype_enum;
DROP TYPE IF EXISTS public.user_goal_categories_relationshiptype_enum;
DROP TYPE IF EXISTS public.messages_type_enum;
DROP TYPE IF EXISTS public.messages_status_enum;
DROP TYPE IF EXISTS public.app_screen_audios_screenname_enum;
DROP EXTENSION IF EXISTS "uuid-ossp";
DROP EXTENSION IF EXISTS pgcrypto;
--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- Name: app_screen_audios_screenname_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.app_screen_audios_screenname_enum AS ENUM (
    'WelcomeLanguageScreen',
    'WelcomeSigninScreen',
    'RegistrationPhoneNumberScreen',
    'RegistrationVerificationCodeScreen',
    'RegistrationUploadIdScreen',
    'RegistrationIdPreambleScreen',
    'RegistrationSelfieScreen',
    'RegistrationSelfiePreambleScreen',
    'RegistrationGoalsScreen',
    'RegistrationRecommendedAppsScreen',
    'RegistrationPinSetupScreen',
    'HomeGoalsScreen',
    'HomeMessagesScreen',
    'HomeProfileScreen',
    'HomeSupportScreen',
    'HomeRecommendationsScreen',
    'PermissionsModal'
);


--
-- Name: messages_status_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.messages_status_enum AS ENUM (
    'draft',
    'published'
);


--
-- Name: messages_type_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.messages_type_enum AS ENUM (
    'system',
    'coach'
);


--
-- Name: user_goal_categories_relationshiptype_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_goal_categories_relationshiptype_enum AS ENUM (
    'primary',
    'secondary',
    'tertiary'
);


--
-- Name: user_goals_relationshiptype_enum; Type: TYPE; Schema: public; Owner: -
--

CREATE TYPE public.user_goals_relationshiptype_enum AS ENUM (
    'primary',
    'secondary',
    'tertiary'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.admin_users (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    email character varying NOT NULL,
    name character varying NOT NULL,
    password character varying NOT NULL,
    "isActive" boolean DEFAULT true NOT NULL,
    role character varying DEFAULT 'admin'::character varying NOT NULL
);


--
-- Name: app_audios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_audios (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "appId" uuid NOT NULL,
    "languageCode" character varying NOT NULL,
    "fileUrl" character varying NOT NULL
);


--
-- Name: app_countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_countries (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    app_id uuid NOT NULL,
    country_id uuid NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: app_goal_sub_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_goal_sub_categories (
    "appsId" uuid NOT NULL,
    "goalSubCategoriesId" uuid NOT NULL
);


--
-- Name: app_goals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_goals (
    "appsId" uuid NOT NULL,
    "goalsId" uuid NOT NULL
);


--
-- Name: app_screen_audios; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.app_screen_audios (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "screenName" public.app_screen_audios_screenname_enum NOT NULL,
    "languageCode" character varying(10) NOT NULL,
    "audioUrl" text NOT NULL,
    duration integer,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL
);


--
-- Name: apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.apps (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    title character varying NOT NULL,
    description character varying,
    "imageUrl" character varying,
    "appId" character varying NOT NULL,
    "countryCode" character varying,
    "goalCategoryId" uuid
);


--
-- Name: countries; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.countries (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    code character varying(2) NOT NULL,
    name character varying NOT NULL,
    "flagUrl" character varying,
    preferred_display_language_id uuid,
    preferred_voice_language_id uuid
);


--
-- Name: country_languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.country_languages (
    "countriesId" uuid NOT NULL,
    "languagesId" uuid NOT NULL
);


--
-- Name: cron_job_status; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cron_job_status (
    id integer NOT NULL,
    is_running boolean DEFAULT false NOT NULL,
    current_trigger character varying(32),
    last_run_at timestamp with time zone,
    last_run_display character varying(64),
    last_success boolean,
    last_message text,
    run_count integer DEFAULT 0 NOT NULL,
    last_details text,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at_display character varying(64)
);


--
-- Name: cron_job_status_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cron_job_status_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cron_job_status_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cron_job_status_id_seq OWNED BY public.cron_job_status.id;


--
-- Name: cron_jobs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.cron_jobs (
    id integer NOT NULL,
    job_key character varying(50) NOT NULL,
    schedule_type character varying(20) NOT NULL,
    minute character varying(16) DEFAULT '0'::character varying NOT NULL,
    hour character varying(16) DEFAULT '*'::character varying NOT NULL,
    day_of_month character varying(16) DEFAULT '*'::character varying NOT NULL,
    month character varying(16) DEFAULT '*'::character varying NOT NULL,
    day_of_week character varying(16) DEFAULT '*'::character varying NOT NULL,
    daily_time character varying(16),
    enabled boolean DEFAULT false NOT NULL,
    next_run timestamp with time zone,
    next_run_display character varying(64),
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at_display character varying(64)
);


--
-- Name: cron_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.cron_jobs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cron_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.cron_jobs_id_seq OWNED BY public.cron_jobs.id;


--
-- Name: evaluation_conditions; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.evaluation_conditions (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    rule_type character varying NOT NULL,
    rule_name character varying NOT NULL,
    target_field character varying NOT NULL,
    condition jsonb NOT NULL,
    is_active boolean DEFAULT true,
    priority integer DEFAULT 0,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


--
-- Name: goal_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goal_categories (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    description character varying,
    "iconUrl" character varying,
    "order" integer DEFAULT 0 NOT NULL
);


--
-- Name: goal_priorities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goal_priorities (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    title character varying NOT NULL,
    "goalCategoryId" uuid NOT NULL
);


--
-- Name: goal_sub_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goal_sub_categories (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    name character varying NOT NULL,
    description character varying,
    "goalCategoryId" uuid NOT NULL
);


--
-- Name: goals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.goals (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    title character varying NOT NULL,
    "displayText" character varying,
    "goalCategoryId" uuid NOT NULL,
    "goalSubCategoryId" uuid
);


--
-- Name: high_watermarks; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.high_watermarks (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    source character varying(100) NOT NULL,
    last_processed_key character varying(500),
    last_processed_timestamp timestamp without time zone,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: intervention_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.intervention_logs (
    id integer NOT NULL,
    queue_ids text[] NOT NULL,
    message_text text NOT NULL,
    user_ids text[] NOT NULL,
    template_ids text[] NOT NULL,
    intervention_ids text[] NOT NULL,
    received_at timestamp with time zone NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    error_message text
);


--
-- Name: intervention_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.intervention_logs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: intervention_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.intervention_logs_id_seq OWNED BY public.intervention_logs.id;


--
-- Name: languages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.languages (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    title character varying NOT NULL,
    code character varying NOT NULL
);


--
-- Name: message_queue; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.message_queue (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "userIds" text[] NOT NULL,
    placeholders jsonb,
    status character varying DEFAULT 'pending'::character varying NOT NULL,
    error character varying,
    "retryCount" integer DEFAULT 0 NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "processedUserIds" text[] DEFAULT '{}'::text[] NOT NULL,
    "templateId" uuid NOT NULL,
    "batchId" character varying
);


--
-- Name: message_templates; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.message_templates (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    title character varying NOT NULL,
    subject character varying NOT NULL,
    content text NOT NULL,
    category character varying,
    translations jsonb,
    "subjectTranslations" jsonb,
    "isActive" boolean DEFAULT true NOT NULL,
    "videoUrls" jsonb,
    "audioUrls" jsonb
);


--
-- Name: messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.messages (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    subject character varying NOT NULL,
    text character varying NOT NULL,
    "from" character varying NOT NULL,
    type public.messages_type_enum DEFAULT 'system'::public.messages_type_enum NOT NULL,
    "videoUrl" character varying,
    "audioUrl" character varying,
    "coachId" uuid,
    "userIds" text,
    status public.messages_status_enum DEFAULT 'draft'::public.messages_status_enum NOT NULL
);


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    "timestamp" bigint NOT NULL,
    name character varying NOT NULL
);


--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: milestone_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.milestone_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id character varying(255) NOT NULL,
    milestone_id character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    app_id character varying(255),
    service_category character varying(255),
    is_checked boolean DEFAULT false NOT NULL
);


--
-- Name: rewards_issued; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.rewards_issued (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id uuid NOT NULL,
    reward_id character varying(100) NOT NULL,
    amount numeric(10,2),
    unit character varying(20),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


--
-- Name: services; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.services (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    title character varying NOT NULL,
    description character varying,
    "goalSubCategoryId" character varying NOT NULL
);


--
-- Name: signal_logs; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.signal_logs (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    user_id character varying(255) NOT NULL,
    signal_id character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    app_id character varying(255),
    service_category character varying(255)
);


--
-- Name: user_apps; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_apps (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "appId" uuid NOT NULL,
    "isFavorite" boolean DEFAULT false NOT NULL,
    "usageCount" integer DEFAULT 0 NOT NULL,
    "userId" uuid NOT NULL
);


--
-- Name: user_goal_categories; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_goal_categories (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "relationshipType" public.user_goal_categories_relationshiptype_enum DEFAULT 'primary'::public.user_goal_categories_relationshiptype_enum NOT NULL,
    "goalCategoryId" uuid NOT NULL,
    "userId" uuid NOT NULL,
    rank integer DEFAULT 0 NOT NULL
);


--
-- Name: user_goal_priorities; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_goal_priorities (
    "userGoalCategoryId" uuid NOT NULL,
    "goalPriorityId" uuid NOT NULL
);


--
-- Name: user_goals; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_goals (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "relationshipType" public.user_goals_relationshiptype_enum DEFAULT 'primary'::public.user_goals_relationshiptype_enum NOT NULL,
    "goalId" uuid,
    "userId" uuid NOT NULL
);


--
-- Name: user_messages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.user_messages (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "messageId" uuid NOT NULL,
    "isRead" boolean DEFAULT false NOT NULL,
    "viewedAt" timestamp without time zone,
    "userId" uuid NOT NULL
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.users (
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "phoneNumber" character varying NOT NULL,
    email character varying,
    name character varying,
    password character varying,
    "isVerified" boolean DEFAULT false NOT NULL,
    "profilePicture" character varying,
    "countryCode" character varying,
    "idNumber" character varying,
    gender character varying,
    birthdate date,
    address character varying,
    "expiryDate" date,
    "imageFront" character varying,
    "imageBack" character varying,
    "selfieImage" character varying,
    "mailId" character varying,
    pin character varying,
    "primaryLanguageId" uuid,
    "secondaryLanguageId" uuid,
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL
);


--
-- Name: verifications; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.verifications (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    "createdAt" timestamp without time zone DEFAULT now() NOT NULL,
    "updatedAt" timestamp without time zone DEFAULT now() NOT NULL,
    "phoneNumber" character varying NOT NULL,
    code character varying NOT NULL,
    verified boolean DEFAULT false NOT NULL,
    "expiresAt" timestamp without time zone NOT NULL
);


--
-- Name: cron_job_status id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cron_job_status ALTER COLUMN id SET DEFAULT nextval('public.cron_job_status_id_seq'::regclass);


--
-- Name: cron_jobs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cron_jobs ALTER COLUMN id SET DEFAULT nextval('public.cron_jobs_id_seq'::regclass);


--
-- Name: intervention_logs id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.intervention_logs ALTER COLUMN id SET DEFAULT nextval('public.intervention_logs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Data for Name: admin_users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.admin_users (id, "createdAt", "updatedAt", email, name, password, "isActive", role) FROM stdin;
0773b97b-482e-4298-a0e3-bbd9d642bbd9	2025-06-23 08:29:52.323944	2025-06-23 08:29:52.323944	admin@unitinetwork.com	Admin	$2a$10$S0pMkS9SGBHDFeVouKufkuysbg6scpLn5BZ3rECeBdGzk3VS2.xIC	t	super-admin
b3cae5b2-e00f-4fed-8354-ec2fa249d4f1	2025-07-02 09:28:58.251567	2025-07-02 09:28:58.251567	kami@unitinetworks.com	Kami Dar	$2a$10$VwbNTPbiEeAUOMN1LQDkgu.XT4K6W6aAFWvw2o2ULWcYJT8NQHtzi	t	admin
a570a7e0-ded4-49dc-b455-39642a8dc31a	2025-08-13 09:54:17.065388	2025-08-13 09:54:35.740265	rita@unitinetworks.com	Rita	$2a$10$rLJ.Jn8wwR0xKZCJ7gplI.H983xOAuszMdB5qR1qBgNrEKdQCY0iG	t	admin
856f1e69-022b-4c15-b282-4bede53d0e44	2025-08-13 09:53:45.38418	2025-10-14 10:58:27.616889	karan@unitinetworks.com	Karan	$2a$10$vDYq9T.heT8G/OObMh4QH.Q0B4S7E2xo5ugQmKShm99on0k9aF.7W	t	admin
b55df6db-eaaa-47f8-b656-274c5893ecfe	2025-10-27 11:05:02.216049	2025-10-27 11:05:02.216049	anna@unitinetworks.com	Anna Montanes	$2a$10$HSxA3gT106VMaYpJ0IVAQOHgDE9MHiy/9ybVOfyDnB4Q72XTmEaHS	t	super-admin
89bdaec0-0dfd-464a-b7f0-a9e074dd9269	2025-09-10 09:26:13.907954	2025-11-13 11:59:16.381822	olowujabdul@gmail.com	Tobi	$2a$10$Es/CzYSiLGzNzhnbY0t7j.BpXnUW1UlNSOCfLOm.YDYuf1Q7KCyby	t	admin
44d1718a-946b-4fa2-815c-098b9f96a8e2	2025-09-10 09:25:41.487301	2025-11-13 11:59:51.339352	benedictgabriel73@gmail.com	Benedict	$2a$10$S1vNIcZ4NQ.wO4KZm.vBaePTyQ1xjCagH2xybUrl1JBl8Ta8aKcZ2	t	admin
52fd51a8-1e6d-40f0-a7ac-0b412baba224	2025-09-10 09:26:32.620725	2025-11-14 14:50:18.027549	dosho72@gmail.com	Tayo	$2a$10$QqlM5nftx5STgwBFUjO5MOX/EQvUPAQ8IV9iq8HuQ4da.24.Y7fuy	t	admin
\.


--
-- Data for Name: app_audios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_audios (id, "createdAt", "updatedAt", "appId", "languageCode", "fileUrl") FROM stdin;
332903f9-345e-4e08-9a36-93be64dfec24	2025-09-16 12:20:32.899577	2025-09-16 12:20:32.899577	82f5aca5-a0c7-4e66-bf07-a3054386d5d4	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/036d8499-fbe2-42dd-ad1b-93a5a65861a1-sign%20or%20register.mp3
dbfbd687-cc53-4e44-a12c-82d7ba0a7837	2025-10-01 09:20:23.054849	2025-10-01 09:20:23.054849	c7478109-63e3-4169-bf46-70b6bb94fb30	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/286c42cf-7748-4ff4-bff0-5bcd2d9d9e19-PPT%20description.mp3
def7557f-345c-47d4-8138-578a8bf46415	2025-10-01 09:28:24.478044	2025-10-01 09:28:24.478044	4e0f3c34-20bf-431d-9d78-22e6fe5cd917	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/ae3a4387-94af-443e-89a1-96a7930e779f-Oze%20description.mp3
b0c1ca70-aa74-443a-ae41-9dd0e0bed692	2025-10-01 12:07:02.775306	2025-10-01 12:07:02.775306	82f5aca5-a0c7-4e66-bf07-a3054386d5d4	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/08c54f49-b469-4289-8692-782c7a6985c3-Booksmart%20description.mp3
\.


--
-- Data for Name: app_countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_countries (id, app_id, country_id, created_at) FROM stdin;
0a8fbfeb-d672-4730-b50c-498a0831fd72	82f5aca5-a0c7-4e66-bf07-a3054386d5d4	dbb53e28-25f8-4feb-bca9-b61c73e9763b	2025-11-18 10:10:08.154008
c79d84b2-6e9d-4212-b67a-2590d59a28b2	82f5aca5-a0c7-4e66-bf07-a3054386d5d4	f7464068-73e2-4173-ae16-0aefa96be700	2025-11-18 10:10:08.154008
\.


--
-- Data for Name: app_goal_sub_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_goal_sub_categories ("appsId", "goalSubCategoriesId") FROM stdin;
1b05d8f6-c48c-433b-9502-d7211019b699	1d241665-a302-4a66-8f38-8e118357a5aa
0870e902-21eb-4809-a9f6-c8bc6c56fc01	ea194fb6-9d98-40e2-ab87-7d1387c5c506
4e0f3c34-20bf-431d-9d78-22e6fe5cd917	b551d88c-3ee3-48d2-bfab-609812c39073
4e0f3c34-20bf-431d-9d78-22e6fe5cd917	3d87430b-e6e2-4a64-bfbf-d005c71aaadb
c7478109-63e3-4169-bf46-70b6bb94fb30	812e29c0-8d0a-4e95-9b6a-339a00fbce04
adf39537-cb40-4687-9066-e8e763ab1ae3	56a368d2-6189-487a-a2d5-219b552ac7a4
0d6fd129-d32c-46a6-9fa0-4a5f229708fd	7631499d-a115-40a4-961b-8f65bcc15ed3
c6f2d46b-6eab-4518-bda3-cf61b9e4722c	b04f22db-ca81-451f-8f38-e3a3c22c70ef
01a1a94a-deba-4bde-aa9a-c40a0b6177ac	dbd2fc22-fabf-407b-b56c-c13e21dcb7ce
e92c8266-ae7c-4c4b-be66-58271d1145af	9f68ae6d-5de5-4771-80bc-a61d7c579a55
413b5096-0c80-4a4d-bd9b-ac09b190fda5	e511e8ea-9986-4f31-bb4f-03e1d0f32852
413b5096-0c80-4a4d-bd9b-ac09b190fda5	00d59305-6acc-4d88-9087-4e310c49bc3f
205bbd16-3061-4e07-a344-39d3041b5a10	c7ae63c0-d689-4232-ba43-63d964402d4a
205bbd16-3061-4e07-a344-39d3041b5a10	e511e8ea-9986-4f31-bb4f-03e1d0f32852
29efd7ec-7610-43f5-a902-7f8333f3d0fb	e4063538-6238-4bfa-9753-4653e4ed7ba8
5db6d1d4-2fdc-4b49-8142-6e0e33146678	70cbce37-b0c7-4fce-94f2-3a6a8e797e2a
7f11774f-68c1-46cd-940f-2252bf6ace06	3bb49539-219f-4e30-ae8f-3ed55ef0168c
5f79304c-638a-4d82-82f5-8e5436e66469	22f77686-5388-4eb9-b36f-db5cacf8efc7
\.


--
-- Data for Name: app_goals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_goals ("appsId", "goalsId") FROM stdin;
1b05d8f6-c48c-433b-9502-d7211019b699	3372910c-349f-42e7-8543-94e7eddf8ab1
0870e902-21eb-4809-a9f6-c8bc6c56fc01	7b610c2d-82ac-4ffc-bd61-36a424b8bd57
4e0f3c34-20bf-431d-9d78-22e6fe5cd917	a74e23b0-2d96-420d-a954-ee0aadc4e891
c7478109-63e3-4169-bf46-70b6bb94fb30	536e2437-49f2-40e6-81a4-82c8fa19f907
adf39537-cb40-4687-9066-e8e763ab1ae3	5160b41b-d5e8-47ec-897a-5b69f59e9780
c6f2d46b-6eab-4518-bda3-cf61b9e4722c	4b7af087-dbc5-4294-ad3d-57feaca6f119
01a1a94a-deba-4bde-aa9a-c40a0b6177ac	d23e16b5-b2db-4cf0-9af4-a0c56e7a7db7
e92c8266-ae7c-4c4b-be66-58271d1145af	ef0cfd01-56d6-4f73-abaf-da0ef78c1f22
0d6fd129-d32c-46a6-9fa0-4a5f229708fd	6e024481-3127-4002-a6b0-a70f718097b5
413b5096-0c80-4a4d-bd9b-ac09b190fda5	f8c415f7-0942-48ae-a91a-7e1bcc91bcc8
413b5096-0c80-4a4d-bd9b-ac09b190fda5	a01acb4b-4acc-4428-9bee-dba9b3038ff8
205bbd16-3061-4e07-a344-39d3041b5a10	a08a9fe9-2632-4e33-9d2f-13cd194061d4
205bbd16-3061-4e07-a344-39d3041b5a10	5b8c870c-a288-4246-a804-0ce87b81cfc0
205bbd16-3061-4e07-a344-39d3041b5a10	f8c415f7-0942-48ae-a91a-7e1bcc91bcc8
29efd7ec-7610-43f5-a902-7f8333f3d0fb	c8c35b8b-1c64-4544-b94f-488bc6d8823d
5db6d1d4-2fdc-4b49-8142-6e0e33146678	5ab413e1-3900-49f8-b327-804defdf135a
7f11774f-68c1-46cd-940f-2252bf6ace06	1bee8fe8-9344-4053-a7b2-e6a6a7a8e7b4
5f79304c-638a-4d82-82f5-8e5436e66469	df77618d-14e7-4d21-a66e-53f0d5757072
\.


--
-- Data for Name: app_screen_audios; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.app_screen_audios (id, "screenName", "languageCode", "audioUrl", duration, "createdAt", "updatedAt") FROM stdin;
c20c1b47-7cbb-45e6-8e93-4f5c2c5342db	HomeMessagesScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/e895d2c7-269e-4462-9970-39cf61d8dca0-messages.mp3	\N	2025-09-05 08:46:39.544391	2025-09-05 08:46:39.544391
5b7bb5c8-9576-495f-9c36-5d42cf738549	HomeGoalsScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/55ea36df-4902-4846-9217-02197afd171b-goals.mp3	\N	2025-09-05 00:17:06.868604	2025-09-05 08:46:56.366516
2dd333f9-97b4-46e0-b690-7b2e85c22c44	HomeProfileScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/c8afb481-a94e-4c62-9bd8-1d47dfd12b2f-profile.mp3	\N	2025-09-05 08:47:09.80621	2025-09-05 08:47:09.80621
3b662e92-3e10-4e36-a6e0-8ddecabd12cf	HomeRecommendationsScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/a6bf1fa1-5a1b-42f4-8d20-c0cea7a63316-recommended_apps.mp3	\N	2025-09-05 08:47:17.606336	2025-09-05 08:47:17.606336
c71a16a4-0b31-460c-893e-95e007d6a800	WelcomeLanguageScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/19ed2867-b1c9-468b-99d1-daf49947748b-Choose%20language.mp3	\N	2025-09-12 13:51:14.03412	2025-09-12 13:51:14.03412
81495962-2931-4eec-8efb-77bb880f40e6	WelcomeSigninScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/5f31544a-75c2-4fab-b000-6856e4f04b62-Sign%20in%20to%20Uniti.mp3	\N	2025-09-12 13:54:44.101797	2025-09-12 13:54:44.101797
19c3ba4f-be25-414f-b975-3fa7a3de2954	RegistrationPhoneNumberScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/8f0b37fa-a204-4148-b37c-5208df5b217a-Phone%20registration%20page.mp3	\N	2025-09-12 13:55:04.299474	2025-09-12 13:55:04.299474
33cdffd2-c18f-46b8-ab79-2951f9f10264	RegistrationVerificationCodeScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/3dcfe768-3c21-4be2-947f-254a8d82ab49-OTP%20code%20screen.mp3	\N	2025-09-12 13:55:18.239818	2025-09-12 13:55:18.239818
afe4c1c0-a61c-4e72-842c-f632104b98a5	RegistrationUploadIdScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/579c46bf-8190-45a3-a92b-f694105923f8-ID%20card%20instructions.mp3	\N	2025-09-12 13:57:03.744816	2025-09-12 13:57:03.744816
fa344ee8-00f2-4394-bfba-027ef4e37f3e	RegistrationSelfieScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/ee4f43bb-0949-4760-acbf-f18aaf01bb35-Selfie%20instructions.mp3	\N	2025-09-12 13:59:06.811196	2025-09-12 13:59:06.811196
fd73593f-ae0e-4d31-bbb8-c481542e16c8	RegistrationGoalsScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/6d272375-ad71-46a8-88dc-37d84e23a0cb-Goals%20selection.mp3	\N	2025-09-12 14:01:26.043719	2025-09-12 14:01:26.043719
0024a9a7-0046-4f1c-ba6d-d56b5e88bb2c	RegistrationRecommendedAppsScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/bf5ecabf-9d0d-4490-a4c4-9688b7cf7e4b-App%20selection.mp3	\N	2025-09-12 14:03:07.65241	2025-09-12 14:03:07.65241
6fc0ca73-73e6-4f07-b9bd-db2669539f74	RegistrationPinSetupScreen	en	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/0102f004-5e69-4eb7-89b8-35769b3bc39e-pin%20registration.mp3	\N	2025-09-12 14:06:54.340981	2025-09-12 14:06:54.340981
1008a675-5fcc-416c-a6e5-8f432d716c0b	WelcomeLanguageScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/22215a08-deaf-41c5-83d3-142fdcb651d3-Select%20language.mp3	\N	2025-10-07 12:32:29.442598	2025-10-07 12:32:29.442598
23acec12-7b8f-4f40-8137-f7cddbfc9e49	RegistrationVerificationCodeScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/b675757d-e21b-4fe0-b752-71f8399335a4-Verification.mp3	\N	2025-10-07 12:50:13.464675	2025-10-07 12:50:13.464675
61fee601-029b-40c9-a0ea-fd3ee9739022	RegistrationSelfiePreambleScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/1d1c99dc-ddb8-4565-b0a6-38fb08d8379f-Selfie.mp3	\N	2025-10-08 07:48:08.082047	2025-10-08 07:48:08.082047
2e5cd39d-c4dd-4bbc-97d5-03fc997e961b	RegistrationIdPreambleScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/5d9d3640-ea96-4252-82b6-f1e52db0e20a-ID%20preamble.mp3	\N	2025-10-08 07:57:18.020837	2025-10-08 07:57:18.020837
1cc9fe02-b595-4b15-9cb5-be814cddd5d3	RegistrationPhoneNumberScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/ff85c326-ef87-4aba-9b80-7b3c7e4d44e7-Registration%20phone%20audio.mp3	\N	2025-10-08 08:04:38.29392	2025-10-08 08:04:38.29392
4b7878cd-6d95-4417-9737-a1387592193a	RegistrationSelfieScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/fba2b775-e751-4ea2-83b5-6d147ef5868a-Registration%20selfie%20audio.mp3	\N	2025-10-08 08:21:30.014286	2025-10-08 08:21:30.014286
f30cb490-ddc0-4e03-898c-04f91592f4d9	RegistrationGoalsScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/7621fd5e-a98b-40e4-b8ba-ae55b29463a1-Registration%20goals%20audio.mp3	\N	2025-10-08 08:37:17.103716	2025-10-08 08:37:17.103716
758741d4-afe9-498f-a0f1-6be5684734d6	RegistrationRecommendedAppsScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/b6627376-9061-455e-a295-3a502a852ed6-Registration%20apps%20audio.mp3	\N	2025-10-08 08:45:06.352982	2025-10-08 08:45:06.352982
4a6db387-8743-444a-9652-77f06b161ee3	HomeProfileScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/23977784-f69b-415d-8840-51f435be247f-Home%20profile.mp3	\N	2025-10-13 11:53:07.581735	2025-10-13 11:53:07.581735
98277d54-aeff-4d45-a326-c29eaeb0601d	HomeSupportScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/4ccaec1b-c9c9-4365-bc7c-8abd2f9a8d81-Home%20support.mp3	\N	2025-10-13 11:53:25.293883	2025-10-13 11:53:25.293883
547432c7-2aa3-48d0-a293-a4875f5fb849	WelcomeSigninScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/8585b832-27b0-4f1e-b695-9af105f7875c-Sign%20in.mp3	\N	2025-10-14 17:21:27.876746	2025-10-14 17:21:27.876746
b9cf3672-7558-40bb-b38d-3a56bc0b7381	RegistrationUploadIdScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/f849a90f-c8e5-4fde-a72d-f62a6ae6f931-ID%20preamble.mp3	\N	2025-10-15 09:26:31.238961	2025-10-15 09:26:31.238961
81d5f48a-810a-4d9e-ba1e-fa99368260f6	HomeMessagesScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/39ff73b0-c17b-4645-9aad-8464c7bba680-Home%20messages.mp3	\N	2025-10-15 11:07:21.08294	2025-10-15 11:07:41.596511
2861c943-e5ee-437c-a63a-d3de4b14e670	RegistrationPinSetupScreen	tw	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/043f2c9f-77d6-4789-a7f2-4f939def5468-Registration%20pin%20set%20up.mp3	\N	2025-10-15 14:32:42.75665	2025-10-15 14:32:42.75665
\.


--
-- Data for Name: apps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.apps (id, "createdAt", "updatedAt", title, description, "imageUrl", "appId", "countryCode", "goalCategoryId") FROM stdin;
82f5aca5-a0c7-4e66-bf07-a3054386d5d4	2025-06-23 09:03:46.028053	2025-06-23 09:03:46.028053	Education	Free books for children and adults	https://play-lh.googleusercontent.com/9bHR4MmNaWDdQtU-75OGdnS2nwGHTlWh5jkQI-cShBDGkWT9W9wtnjAxS1ffPVRc0m4T=w480-h960-rw	org.worldreader.readtokids	GH	8605c351-06d6-4696-bbe0-34fcfb1b47d8
0d6fd129-d32c-46a6-9fa0-4a5f229708fd	2025-08-13 10:49:14.448898	2025-08-13 10:49:14.448898	Home Workout- No Equipment	Home Workouts provides daily workout routines for all your main muscle groups. In just a few minutes a day, you can build muscles and keep fitness at home without having to go to the gym. No equipment or coach needed, all exercises can be performed with just your body weight.\n\nThe app has workouts for your abs, chest, legs, arms and butt as well as full body workouts. All the workouts are designed by experts. None of them need equipment, so there's no need to go to the gym	https://play-lh.googleusercontent.com/yYnlRgvLIfMhAy_AoDKHpTPw7qxyMxmblNqbkeoRhj5D41g4dnujZSHkHslmNkbNQtA=w480-h960-rw	homeworkout.homeworkouts.noequipment	GH	87287bfa-b290-4eba-bd7c-a4ddeca406d8
1b05d8f6-c48c-433b-9502-d7211019b699	2025-08-13 09:44:33.042014	2025-08-13 09:44:33.042014	Bebbo parenting app	Developed by UNICEF in collaboration with leading global authorities on early childhood development and parenting, Bebbo is the all-in-one app that grows with you and your child in the early years. Get expert-backed guidance, personalized activities, and practical tools – all designed to support your parenting journey from pregnancy to age of six.	https://play-lh.googleusercontent.com/LoLBY-NkQLVCmhtGmCI5UWPl-dOCB0SWwFndAm0J1S9tKhBIiTxjSA_tHXYwzjITm1-h=s96-rw	org.unicef.ecar.bebbo	GH	87287bfa-b290-4eba-bd7c-a4ddeca406d8
adf39537-cb40-4687-9066-e8e763ab1ae3	2025-08-13 10:45:38.228791	2025-08-13 10:45:38.228791	Flo	Welcome to Flo! The world’s leading period, pregnancy, and cycle tracker. Join over 420 million members who use Flo as their go-to pregnancy & ovulation tracker & cycle calendar. With seven million five-star ratings, we're paving the way to better female healthcare by empowering people with periods to harness their body's signals.	https://play-lh.googleusercontent.com/PAfUiu86ZQhFzYLRXcaqno8DXc-1hQtFd9MLkEjuursh40S_x8VOlgpmWKFLgiaNz-4=w480-h960-rw	org.iggymedia.periodtracker	GH	87287bfa-b290-4eba-bd7c-a4ddeca406d8
4e0f3c34-20bf-431d-9d78-22e6fe5cd917	2025-08-13 10:09:40.86389	2025-08-13 10:11:34.780782	Oze	Oze: Your All-in-One Business Management App\nRunning your business just got simpler. With Oze, track your sales and expenses, send digital invoices and receipts, and remind customers to pay—all from your smartphone. Get real-time insights from your business dashboard, and if you have questions, connect with a business coach instantly.	https://play-lh.googleusercontent.com/xW3XtNsHxzraZQsozyXUa5euZFrTcJTZGIDWjU51YzlqhS9FWv_ZOqesnn_H6--dpfk=w480-h960-rw	com.daretoinnovate.oze	GH	041295f5-f311-45e1-9133-7e3e4af712b0
01a1a94a-deba-4bde-aa9a-c40a0b6177ac	2025-08-13 11:13:08.11393	2025-08-13 11:13:08.11393	Syllabus GH	Your Ultimate Study & Teaching Partner for the New Curriculum\n\nAce your exams and master every topic with SyllabusGH, the all-in-one educational app meticulously designed for students and teachers.\n	https://play-lh.googleusercontent.com/Kf2UuPMaKreh3pNAQUUdYX4sE3L4CouAvYjE6lUnDewM3cgDq0_gQE7B5U-IlFM7lA=w480-h960-rw	promzy.com.teachingsyllabus	GH	8605c351-06d6-4696-bbe0-34fcfb1b47d8
0870e902-21eb-4809-a9f6-c8bc6c56fc01	2025-08-13 09:47:36.514253	2025-08-13 09:47:36.514253	Fido	Fido is a fast, secure mobile lending app licensed by the Bank of Ghana. Whether you run a small business or need quick cash, Fido gives you instant access to mobile credit or business loans—no paperwork, no hassle.\n\n✓ Get a business loan up to GHS 8,500\n✓ Instant mobile credit from GHS 50 to GHS 6,800\n✓ No paperwork. No collateral. No bank needed.	https://play-lh.googleusercontent.com/qP7a9LVgHOCrRPhco3eEeZ0YAr89NMY_X8kk7iYXw0DV_6blY4PMpPco_ewZKxsuFYU=s96-rw	com.fidocredit	GH	1791532c-64ef-4074-a00e-161d1c981330
c7478109-63e3-4169-bf46-70b6bb94fb30	2025-08-13 10:41:20.779996	2025-08-13 10:41:20.779996	People's Pension Trust	With this app, you can sign up for a PPT Personal Pension Scheme, Make contribution in to your PPT Personal Pension Scheme Account.\nYou will also have the chance to view your beneficiary details, View Statements, Update your details for all the schemes you have with People's Pension Trust (PPT Personal Pension Scheme, PPT Occupational Pension Scheme, PPT Provident Fund Scheme).\nYou can also initiate a withdrawal from your PPT Personal Pension Scheme	https://play-lh.googleusercontent.com/hF7yXyjv6BhgvXt5hKRx-sD6OwIo69QgTuuxiU0MnRHE2QIGCq_9V97asWoG-J2lhXI8=w480-h960-rw	inc.loop.ppt	GH	1791532c-64ef-4074-a00e-161d1c981330
c6f2d46b-6eab-4518-bda3-cf61b9e4722c	2025-08-13 10:57:16.039928	2025-08-13 10:57:16.039928	Duolingo	Learn a new language with the world’s most-downloaded education app! Duolingo is the fun, free app for learning 40+ languages through quick, bite-sized lessons. Practice speaking, reading, listening, and writing to build your vocabulary and grammar skills.\n\nDesigned by learning experts and loved by hundreds of millions of learners worldwide, Duolingo helps you prepare for real conversations in Spanish, French, Chinese, Italian, German, English, and more	https://play-lh.googleusercontent.com/Rz4JVKiQM7ZnLYTEzwzpvWROphw5Wo6kh3vnx8HhgHTaOzsknlTLmXUsknurSqTqUj0=w480-h960-rw	com.duolingo	GH	8605c351-06d6-4696-bbe0-34fcfb1b47d8
669d3124-42d8-4cea-96e8-6f5c02b0977b	2025-07-03 13:34:44.46429	2025-07-03 13:34:44.46429	Uniti	Uniti	\N	com.uniti	GH	35d28bb6-5f72-4235-aed1-018bafe8becd
4a76e653-36af-4934-910e-c64e0aea03f9	2025-09-24 11:06:06	2025-09-24 11:06:06	Access Agriculture	Learn about agro-ecology principles, organic agriculture and rural entrepreneurship through quality farmer-to-farmer training videos in local languages.	https://play-lh.googleusercontent.com/pVoh6In8h9cXB6j4cMip5ZZ3GAxbO0quXpOESgbr5spyRou2Eq9wxozUxU9itLKBkrQH=w480-h960-rw	com.accessagriculture	GH	041295f5-f311-45e1-9133-7e3e4af712b0
e92c8266-ae7c-4c4b-be66-58271d1145af	2025-09-24 11:14:37	2025-09-24 11:14:37	myMTN Ghana	Track your usage of airtime, data and SMS with Account History.\nSend money to other networks with interoperability	https://play-lh.googleusercontent.com/P2G2FBI_usfCfFjl0PLb4nxne1eBeVcXFi-4wM00rs12Miprwuu1xoaOkfB6_qWFUbo=w480-h960-rw	com.mtngh.mymtn	GH	1791532c-64ef-4074-a00e-161d1c981330
413b5096-0c80-4a4d-bd9b-ac09b190fda5	2025-09-30 10:27:25	2025-09-30 10:27:25	Just Farm	Welcome to the future of farming with JustFarm – the all-in-one app that puts powerful agricultural intelligence right at your fingertips. Whether you’re managing a small family plot or a commercial-scale	https://play-lh.googleusercontent.com/b_7zedc1dWWQP-YYKPmJ36xwx5-yzCHfoEYq1MGvlrnZVQbZL5iVAIPTSLiLCUr7MzwumKCshxPEsc-E-MtJoA=w480-h960-rw	co.farmerline.farmmanagement	GH	041295f5-f311-45e1-9133-7e3e4af712b0
205bbd16-3061-4e07-a344-39d3041b5a10	2025-10-07 17:12:00	2025-10-07 17:12:00	GROW	Aggregators can buy crops, place orders, and access a comprehensive customer database, while input dealers can efficiently manage sales and customer information. 	https://play-lh.googleusercontent.com/GsnpSq1n3x9StzXSbvpyhoJ7ick1xGVIHhRos0Sa2v7UDy_6Qm4--Y5iTf7hTVnNRA=w480-h960-rw	co.farmerline.sales	GH	041295f5-f311-45e1-9133-7e3e4af712b0
29efd7ec-7610-43f5-a902-7f8333f3d0fb	2025-10-16 09:52:53	2025-10-16 09:52:53	MyNHIS	MyNHIS app provides an easy-to-use and modern digital platform to allow NHIS members across Ghana to conveniently access membership services in the comfort of their homes and other places. MyNHIS app will allow users without a NHIS membership to register for membership using their Ghana Card.	https://play-lh.googleusercontent.com/-XrI9UGY0VHpfjli_j2eldkHiWoUoqYeq78iCJE6ua9hqnAKvVR-Od92uDZBnPACf1mu=w480-h960-rw	gh.gov.nhis.android.nma	GH	87287bfa-b290-4eba-bd7c-a4ddeca406d8
5db6d1d4-2fdc-4b49-8142-6e0e33146678	2025-10-16 09:55:26	2025-10-16 09:55:26	Healthker	First ever pharmacy-to-consumer app approved by the Ghana National e-Pharmacy platform offering secure and reliable electronic pharmacy services.	https://play-lh.googleusercontent.com/1shdeT-__xP7LsMwrrYVCCLhagDnJUd_-wBf4yQb8Nx35klK2K8UwbGzeXxWB7EEpw=w480-h960-rw	com.rxhealth.healthker	GH	87287bfa-b290-4eba-bd7c-a4ddeca406d8
7f11774f-68c1-46cd-940f-2252bf6ace06	2025-11-12 15:14:31	2025-11-12 15:14:31	Affinity	We are a fully digital financial institution committed to providing inclusive banking solutions for the majority.	https://play-lh.googleusercontent.com/UacjiHmYFV1xCj3v0LG4oIeAUY8VFXFDtK9afKMvwJjC7TGTvM4dRikj196UnwW32uU=w480-h960-rw	com.affinityafrica.app	GH	1791532c-64ef-4074-a00e-161d1c981330
5f79304c-638a-4d82-82f5-8e5436e66469	2025-11-12 15:17:17	2025-11-12 15:17:17	WebMD	From WebMD, the one healthcare app you need to check symptoms; learn about conditions and drugs; research treatments and diagnoses;.	https://play-lh.googleusercontent.com/Wg9aaBdA6X4IagSnb4b8en4XxYgiR0X5ZGCokNwRbhky8sd_ZQdjorvQBk9Sb63pDUQ=w480-h960-rw	com.webmd.android	GH	87287bfa-b290-4eba-bd7c-a4ddeca406d8
\.


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.countries (id, "createdAt", "updatedAt", code, name, "flagUrl", preferred_display_language_id, preferred_voice_language_id) FROM stdin;
9be7c3d1-0fbc-48d2-9ca8-9c80a9967c3f	2025-11-13 12:38:51.136766	2025-11-13 14:27:24.099025	NG	Nigeria	https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Flag_of_Nigeria.svg/1024px-Flag_of_Nigeria.svg.png	\N	\N
f7464068-73e2-4173-ae16-0aefa96be700	2025-11-13 14:29:45.742363	2025-11-13 14:29:45.742363	MA	Morocco	https://upload.wikimedia.org/wikipedia/commons/2/2c/Flag_of_Morocco.svg	\N	\N
dbb53e28-25f8-4feb-bca9-b61c73e9763b	2025-06-23 09:00:04.711364	2025-11-14 14:49:18.526895	GH	Ghana	https://www.ghanamissionun.org/wp-content/uploads/2019/03/Flag_Ghana.jpg	075f3a18-6587-4775-be4a-b165e27d3ab7	841db0fe-456b-4f28-a668-1f225141d2cb
a04139eb-75d0-4492-be24-91d97a28454b	2025-11-20 07:48:29.317372	2025-11-20 07:48:29.317372	ES	Spain	https://upload.wikimedia.org/wikipedia/commons/9/9a/Flag_of_Spain.svg	075f3a18-6587-4775-be4a-b165e27d3ab7	075f3a18-6587-4775-be4a-b165e27d3ab7
\.


--
-- Data for Name: country_languages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.country_languages ("countriesId", "languagesId") FROM stdin;
dbb53e28-25f8-4feb-bca9-b61c73e9763b	075f3a18-6587-4775-be4a-b165e27d3ab7
dbb53e28-25f8-4feb-bca9-b61c73e9763b	841db0fe-456b-4f28-a668-1f225141d2cb
9be7c3d1-0fbc-48d2-9ca8-9c80a9967c3f	075f3a18-6587-4775-be4a-b165e27d3ab7
f7464068-73e2-4173-ae16-0aefa96be700	075f3a18-6587-4775-be4a-b165e27d3ab7
a04139eb-75d0-4492-be24-91d97a28454b	075f3a18-6587-4775-be4a-b165e27d3ab7
\.


--
-- Data for Name: cron_job_status; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cron_job_status (id, is_running, current_trigger, last_run_at, last_run_display, last_success, last_message, run_count, last_details, updated_at, updated_at_display) FROM stdin;
1	f	\N	2025-11-04 00:37:41.031505+00	04 Nov, 2025 12:37am UTC	t	Invocation succeeded for uniti-kinesis-processor.	4	{"function_name": "uniti-kinesis-processor", "stdout": "{\\n    \\"StatusCode\\": 200,\\n    \\"LogResult\\": \\"U1RBUlQgUmVxdWVzdElkOiA1YTljNjEyMi01NGFhLTQ5YmQtYTIzMi1hOWIxY2YzODQ2MTYgVmVyc2lvbjogJExBVEVTVAoyMDI1LTExLTA0VDAwOjM3OjE4LjA0MFoJNWE5YzYxMjItNTRhYS00OWJkLWEyMzItYTliMWNmMzg0NjE2CUlORk8JU2F2ZWQgMTAgc2lnbmFscyB0byBzaWduYWxfbG9ncwoyMDI1LTExLTA0VDAwOjM3OjIwLjgwNloJNWE5YzYxMjItNTRhYS00OWJkLWEyMzItYTliMWNmMzg0NjE2CUlORk8JcGF5bG9hZCB7CiAgdXNlcklkOiAnMDNkYzEzOGEtMDRkYS00YTBjLWJkMTktZTllZmJmMjM4NDA3JywKICBwYXN0U2lnbmFsczogWwogICAgewogICAgICBzaWduYWxJZDogJ2dvYWxfc2V0dGluZ19zdGFydGVkJywKICAgICAgYXBwSWQ6ICdpbmMubG9vcC5wcHQnLAogICAgICBzZXJ2aWNlQ2F0ZWdvcnk6ICcnLAogICAgICBjcmVhdGVkQXQ6ICcyMDI1LTExLTA0VDAwOjM3OjE3LjI3MFonCiAgICB9LAogICAgewogICAgICBzaWduYWxJZDogJ2N1c3RvbWVyX2FwcF9vcGVuZWQnLAogICAgICBhcHBJZDogJ2luYy5sb29wLnBwdCcsCiAgICAgIHNlcnZpY2VDYXRlZ29yeTogJycsCiAgICAgIGNyZWF0ZWRBdDogJzIwMjUtMTEtMDRUMDA6Mzc6MTcuMjcwWicKICAgIH0sCiAgICB7CiAgICAgIHNpZ25hbElkOiAncGhvbmVfbnVtYmVyX2NvbmZpcm1hdGlvbicsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdjdXN0b21lcl9hcHBfcmVnaXN0cmF0aW9uX2NvbXBsZXRlZCcsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdreWNfY2FyZF9jYXB0dXJlZCcsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdjdXN0b21lcl9hcHBfb3BlbmVkX2ZpcnN0X3RpbWUnLAogICAgICBhcHBJZDogJ2luYy5sb29wLnBwdCcsCiAgICAgIHNlcnZpY2VDYXRlZ29yeTogJycsCiAgICAgIGNyZWF0ZWRBdDogJzIwMjUtMTEtMDRUMDA6Mzc6MTcuMjcwWicKICAgIH0sCiAgICB7CiAgICAgIHNpZ25hbElkOiAna3ljX3NlbGZpZV9jb21wbGV0ZWQnLAogICAgICBhcHBJZDogJ2luYy5sb29wLnBwdCcsCiAgICAgIHNlcnZpY2VDYXRlZ29yeTogJycsCiAgICAgIGNyZWF0ZWRBdDogJzIwMjUtMTEtMDRUMDA6Mzc6MTcuMjcwWicKICAgIH0sCiAgICB7CiAgICAgIHNpZ25hbElkOiAna3ljX2luaXRpYXRlZCcsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdjdXN0b21lcl9hcHBfZG93bmxvYWRlZCcsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdjdXN0b21lcl9hcHBfbG9naW5fY29tcGxldGVkJywKICAgICAgYXBwSWQ6ICdpbmMubG9vcC5wcHQnLAogICAgICBzZXJ2aWNlQ2F0ZWdvcnk6ICcnLAogICAgICBjcmVhdGVkQXQ6ICcyMDI1LTExLTA0VDAwOjM3OjE3LjI3MFonCiAgICB9CiAgXSwKICBjdXJyZW50OiBbCiAgICB7CiAgICAgIG1pbGVzdG9uZUlkOiAncGhvbmVfdmVyaWZpY2F0aW9uX2NvbXBsZXRlJywKICAgICAgYXBwSWQ6ICdpbmMubG9vcC5wcHQnLAogICAgICBzZXJ2aWNlQ2F0ZWdvcnk6ICdyZXRpcmVtZW50X3NhdmluZ3MnLAogICAgICBjcmVhdGVkQXQ6ICcyMDI1LTExLTA0VDAwOjM3OjE5Ljk2N1onCiAgICB9LAogICAgewogICAgICBtaWxlc3RvbmVJZDogJ2t5Y19jb21wbGV0ZWQnLAogICAgICBhcHBJZDogJ2luYy5sb29wLnBwdCcsCiAgICAgIHNlcnZpY2VDYXRlZ29yeTogJ3JldGlyZW1lbnRfc2F2aW5ncycsCiAgICAgIGNyZWF0ZWRBdDogJzIwMjUtMTEtMDRUMDA6Mzc6MTkuOTY3WicKICAgIH0KICBdLAogIHBhc3RNaWxlc3RvbmVzOiBbXSwKICBwYXN0SW50ZXJ2ZW50aW9uczogW10KfQoyMDI1LTExLTA0VDAwOjM3OjM5Ljc4NloJNWE5YzYxMjItNTRhYS00OWJkLWEyMzItYTliMWNmMzg0NjE2CUlORk8J4pyFIFNhdmVkIDEgaW50ZXJ2ZW50aW9uKHMpIHRvIGRhdGFiYXNlCkVORCBSZXF1ZXN0SWQ6IDVhOWM2MTIyLTU0YWEtNDliZC1hMjMyLWE5YjFjZjM4NDYxNgpSRVBPUlQgUmVxdWVzdElkOiA1YTljNjEyMi01NGFhLTQ5YmQtYTIzMi1hOWIxY2YzODQ2MTYJRHVyYXRpb246IDM4NjI3LjQyIG1zCUJpbGxlZCBEdXJhdGlvbjogMzkwNTAgbXMJTWVtb3J5IFNpemU6IDEyOCBNQglNYXggTWVtb3J5IFVzZWQ6IDExMCBNQglJbml0IER1cmF0aW9uOiA0MjIuMzIgbXMJCg==\\",\\n    \\"ExecutedVersion\\": \\"$LATEST\\"\\n}", "stderr": "", "returncode": 0, "function_response": "null", "log_result": "START RequestId: 5a9c6122-54aa-49bd-a232-a9b1cf384616 Version: $LATEST\\n2025-11-04T00:37:18.040Z\\t5a9c6122-54aa-49bd-a232-a9b1cf384616\\tINFO\\tSaved 10 signals to signal_logs\\n2025-11-04T00:37:20.806Z\\t5a9c6122-54aa-49bd-a232-a9b1cf384616\\tINFO\\tpayload {\\n  userId: '03dc138a-04da-4a0c-bd19-e9efbf238407',\\n  pastSignals: [\\n    {\\n      signalId: 'goal_setting_started',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    },\\n    {\\n      signalId: 'customer_app_opened',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    },\\n    {\\n      signalId: 'phone_number_confirmation',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    },\\n    {\\n      signalId: 'customer_app_registration_completed',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    },\\n    {\\n      signalId: 'kyc_card_captured',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    },\\n    {\\n      signalId: 'customer_app_opened_first_time',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    },\\n    {\\n      signalId: 'kyc_selfie_completed',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    },\\n    {\\n      signalId: 'kyc_initiated',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    },\\n    {\\n      signalId: 'customer_app_downloaded',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    },\\n    {\\n      signalId: 'customer_app_login_completed',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: '',\\n      createdAt: '2025-11-04T00:37:17.270Z'\\n    }\\n  ],\\n  current: [\\n    {\\n      milestoneId: 'phone_verification_complete',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: 'retirement_savings',\\n      createdAt: '2025-11-04T00:37:19.967Z'\\n    },\\n    {\\n      milestoneId: 'kyc_completed',\\n      appId: 'inc.loop.ppt',\\n      serviceCategory: 'retirement_savings',\\n      createdAt: '2025-11-04T00:37:19.967Z'\\n    }\\n  ],\\n  pastMilestones: [],\\n  pastInterventions: []\\n}\\n2025-11-04T00:37:39.786Z\\t5a9c6122-54aa-49bd-a232-a9b1cf384616\\tINFO\\t\\u2705 Saved 1 intervention(s) to database\\nEND RequestId: 5a9c6122-54aa-49bd-a232-a9b1cf384616\\nREPORT RequestId: 5a9c6122-54aa-49bd-a232-a9b1cf384616\\tDuration: 38627.42 ms\\tBilled Duration: 39050 ms\\tMemory Size: 128 MB\\tMax Memory Used: 110 MB\\tInit Duration: 422.32 ms\\t\\n", "metadata": {"StatusCode": 200, "LogResult": "U1RBUlQgUmVxdWVzdElkOiA1YTljNjEyMi01NGFhLTQ5YmQtYTIzMi1hOWIxY2YzODQ2MTYgVmVyc2lvbjogJExBVEVTVAoyMDI1LTExLTA0VDAwOjM3OjE4LjA0MFoJNWE5YzYxMjItNTRhYS00OWJkLWEyMzItYTliMWNmMzg0NjE2CUlORk8JU2F2ZWQgMTAgc2lnbmFscyB0byBzaWduYWxfbG9ncwoyMDI1LTExLTA0VDAwOjM3OjIwLjgwNloJNWE5YzYxMjItNTRhYS00OWJkLWEyMzItYTliMWNmMzg0NjE2CUlORk8JcGF5bG9hZCB7CiAgdXNlcklkOiAnMDNkYzEzOGEtMDRkYS00YTBjLWJkMTktZTllZmJmMjM4NDA3JywKICBwYXN0U2lnbmFsczogWwogICAgewogICAgICBzaWduYWxJZDogJ2dvYWxfc2V0dGluZ19zdGFydGVkJywKICAgICAgYXBwSWQ6ICdpbmMubG9vcC5wcHQnLAogICAgICBzZXJ2aWNlQ2F0ZWdvcnk6ICcnLAogICAgICBjcmVhdGVkQXQ6ICcyMDI1LTExLTA0VDAwOjM3OjE3LjI3MFonCiAgICB9LAogICAgewogICAgICBzaWduYWxJZDogJ2N1c3RvbWVyX2FwcF9vcGVuZWQnLAogICAgICBhcHBJZDogJ2luYy5sb29wLnBwdCcsCiAgICAgIHNlcnZpY2VDYXRlZ29yeTogJycsCiAgICAgIGNyZWF0ZWRBdDogJzIwMjUtMTEtMDRUMDA6Mzc6MTcuMjcwWicKICAgIH0sCiAgICB7CiAgICAgIHNpZ25hbElkOiAncGhvbmVfbnVtYmVyX2NvbmZpcm1hdGlvbicsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdjdXN0b21lcl9hcHBfcmVnaXN0cmF0aW9uX2NvbXBsZXRlZCcsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdreWNfY2FyZF9jYXB0dXJlZCcsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdjdXN0b21lcl9hcHBfb3BlbmVkX2ZpcnN0X3RpbWUnLAogICAgICBhcHBJZDogJ2luYy5sb29wLnBwdCcsCiAgICAgIHNlcnZpY2VDYXRlZ29yeTogJycsCiAgICAgIGNyZWF0ZWRBdDogJzIwMjUtMTEtMDRUMDA6Mzc6MTcuMjcwWicKICAgIH0sCiAgICB7CiAgICAgIHNpZ25hbElkOiAna3ljX3NlbGZpZV9jb21wbGV0ZWQnLAogICAgICBhcHBJZDogJ2luYy5sb29wLnBwdCcsCiAgICAgIHNlcnZpY2VDYXRlZ29yeTogJycsCiAgICAgIGNyZWF0ZWRBdDogJzIwMjUtMTEtMDRUMDA6Mzc6MTcuMjcwWicKICAgIH0sCiAgICB7CiAgICAgIHNpZ25hbElkOiAna3ljX2luaXRpYXRlZCcsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdjdXN0b21lcl9hcHBfZG93bmxvYWRlZCcsCiAgICAgIGFwcElkOiAnaW5jLmxvb3AucHB0JywKICAgICAgc2VydmljZUNhdGVnb3J5OiAnJywKICAgICAgY3JlYXRlZEF0OiAnMjAyNS0xMS0wNFQwMDozNzoxNy4yNzBaJwogICAgfSwKICAgIHsKICAgICAgc2lnbmFsSWQ6ICdjdXN0b21lcl9hcHBfbG9naW5fY29tcGxldGVkJywKICAgICAgYXBwSWQ6ICdpbmMubG9vcC5wcHQnLAogICAgICBzZXJ2aWNlQ2F0ZWdvcnk6ICcnLAogICAgICBjcmVhdGVkQXQ6ICcyMDI1LTExLTA0VDAwOjM3OjE3LjI3MFonCiAgICB9CiAgXSwKICBjdXJyZW50OiBbCiAgICB7CiAgICAgIG1pbGVzdG9uZUlkOiAncGhvbmVfdmVyaWZpY2F0aW9uX2NvbXBsZXRlJywKICAgICAgYXBwSWQ6ICdpbmMubG9vcC5wcHQnLAogICAgICBzZXJ2aWNlQ2F0ZWdvcnk6ICdyZXRpcmVtZW50X3NhdmluZ3MnLAogICAgICBjcmVhdGVkQXQ6ICcyMDI1LTExLTA0VDAwOjM3OjE5Ljk2N1onCiAgICB9LAogICAgewogICAgICBtaWxlc3RvbmVJZDogJ2t5Y19jb21wbGV0ZWQnLAogICAgICBhcHBJZDogJ2luYy5sb29wLnBwdCcsCiAgICAgIHNlcnZpY2VDYXRlZ29yeTogJ3JldGlyZW1lbnRfc2F2aW5ncycsCiAgICAgIGNyZWF0ZWRBdDogJzIwMjUtMTEtMDRUMDA6Mzc6MTkuOTY3WicKICAgIH0KICBdLAogIHBhc3RNaWxlc3RvbmVzOiBbXSwKICBwYXN0SW50ZXJ2ZW50aW9uczogW10KfQoyMDI1LTExLTA0VDAwOjM3OjM5Ljc4NloJNWE5YzYxMjItNTRhYS00OWJkLWEyMzItYTliMWNmMzg0NjE2CUlORk8J4pyFIFNhdmVkIDEgaW50ZXJ2ZW50aW9uKHMpIHRvIGRhdGFiYXNlCkVORCBSZXF1ZXN0SWQ6IDVhOWM2MTIyLTU0YWEtNDliZC1hMjMyLWE5YjFjZjM4NDYxNgpSRVBPUlQgUmVxdWVzdElkOiA1YTljNjEyMi01NGFhLTQ5YmQtYTIzMi1hOWIxY2YzODQ2MTYJRHVyYXRpb246IDM4NjI3LjQyIG1zCUJpbGxlZCBEdXJhdGlvbjogMzkwNTAgbXMJTWVtb3J5IFNpemU6IDEyOCBNQglNYXggTWVtb3J5IFVzZWQ6IDExMCBNQglJbml0IER1cmF0aW9uOiA0MjIuMzIgbXMJCg==", "ExecutedVersion": "$LATEST"}}	2025-11-19 21:02:00.331551+00	19 Nov, 2025 09:02pm UTC
\.


--
-- Data for Name: cron_jobs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.cron_jobs (id, job_key, schedule_type, minute, hour, day_of_month, month, day_of_week, daily_time, enabled, next_run, next_run_display, updated_at, updated_at_display) FROM stdin;
2	daily	daily	34	14	*	*	*	14:34	f	\N	\N	2025-10-15 14:44:11.039939+00	15 Oct, 2025 02:44pm UTC
1	cron	cron	*/2	*	*	*	*	\N	f	\N	\N	2025-10-15 14:44:16.030339+00	15 Oct, 2025 02:44pm UTC
\.


--
-- Data for Name: evaluation_conditions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.evaluation_conditions (id, rule_type, rule_name, target_field, condition, is_active, priority, created_at, updated_at) FROM stdin;
1b493f3f-f2c8-45d0-99bd-bbc6cb0bdc63	event_to_signal	phone_number_confirmation	phone_number_confirmation	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "function", "params": {"phoneNumber": "userData.phoneNumber"}, "function": "fetchVerificationByPhoneNumber"}]}	t	100	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
2bef83f5-c6ad-4a15-a538-29d6c62734d9	event_to_signal	goal_setting_started	goal_setting_started	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "function", "value": 0, "params": {"userId": "event.userId"}, "function": "fetchUserGoalsLength", "operator": ">="}]}	t	110	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
c2c33296-8a48-412c-be78-de88ee8b5583	event_to_signal	customer_app_download_complete	customer_app_download_complete	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "!="}, {"type": "literal", "value": true}]}	t	125	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
169736d5-5137-4a4e-84ee-29908338d8ca	event_to_signal	kyc_card_captured	kyc_card_captured	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "and", "conditions": [{"type": "field", "field": "userData.imageFront", "value": true, "operator": "exists"}, {"type": "field", "field": "userData.imageBack", "value": true, "operator": "exists"}]}]}	t	130	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
cb5677de-451a-4f0b-8fee-6e06c593aafe	event_to_signal	kyc_selfie_completed	kyc_selfie_completed	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "field", "field": "userData.selfieImage", "value": true, "operator": "exists"}]}	t	140	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
debdb96d-43b6-4b44-8555-a8efc947c209	event_to_signal	kyc_initiated	kyc_initiated	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "or", "conditions": [{"type": "field", "field": "userData.imageFront", "value": true, "operator": "exists"}, {"type": "field", "field": "userData.imageBack", "value": true, "operator": "exists"}, {"type": "field", "field": "userData.selfieImage", "value": true, "operator": "exists"}]}]}	t	150	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
9ade0f9d-ec66-4974-95d5-82fe01ed7ce3	event_to_signal	customer_app_opened_first_time	customer_app_opened_first_time	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "!="}, {"type": "literal", "value": true}]}	t	160	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
c55a56a8-87ad-4927-bcb9-61cbf1be61cf	event_to_signal	customer_app_opened	customer_app_opened	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "!="}, {"type": "literal", "value": true}]}	t	170	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
341d8c80-d877-46cb-bad7-453da7b0c64d	event_to_signal	goal_selection_completed	goal_selection_completed	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "function", "value": 3, "params": {"userId": "event.userId"}, "function": "fetchUserGoalsLength", "operator": ">="}]}	t	180	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
11ce7ac5-a4fd-4412-b2cd-6bbf2c0ae529	event_to_signal	customer_app_registration_completed	customer_app_registration_completed	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "!="}, {"type": "or", "conditions": [{"type": "field", "field": "event.totalTimeInForegroundMs", "value": 240000, "operator": ">"}, {"type": "function", "params": {"userId": "event.userId"}, "function": "eventsWithin7Days"}]}]}	t	190	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
5729795a-564a-4de0-a00e-261aa123ba4a	event_to_signal	customer_app_login_completed	customer_app_login_completed	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "!="}, {"type": "field", "field": "event.totalTimeInForegroundMs", "value": 60000, "operator": ">"}]}	t	200	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
c1e33acc-a6a0-417a-8e42-b17505702a59	event_to_signal	customer_app_engaged	customer_app_engaged	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "!="}, {"type": "function", "params": {"userId": "event.userId"}, "function": "customerAppEngaged"}]}	t	210	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
ff44a13f-ee82-41c0-89cc-2f6a93f08a42	event_to_signal	customer_app_engagement_dropoff	customer_app_engagement_dropoff	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "!="}, {"type": "function", "params": {"userId": "event.userId"}, "function": "customerAppEngagementDropoff"}]}	t	220	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
250696f1-0616-4c50-a7d6-1ad5f0b6dbde	event_to_signal	customer_app_retained	customer_app_retained	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "!="}, {"type": "function", "params": {"userId": "event.userId"}, "function": "customerAppRetained"}]}	t	230	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
67c11b06-2ad2-437a-b2e6-ccdbf372d9c9	event_to_signal	customer_app_retained_dropoff	customer_app_retained_dropoff	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "!="}, {"type": "function", "params": {"userId": "event.userId"}, "function": "customerAppRetainedDropoff"}]}	t	240	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
9b95c593-4e8c-4dff-9d05-a2c491e77959	signal_to_milestone	phone_verification_complete	phone_verification_complete	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "signal", "value": true, "signal": "phone_number_confirmation", "operator": "=="}]}	t	100	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
ebb28379-605f-4bfe-ba2d-b212daa751d2	signal_to_milestone	goals_setting_started_abandoned	goals_setting_started_abandoned	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "signal", "value": true, "signal": "goal_setting_started", "operator": "=="}, {"type": "signal", "value": false, "signal": "goal_selection_completed", "operator": "=="}, {"type": "function", "params": {"appId": "event.packageName", "userId": "event.userId"}, "function": "goalSettingStartedOverTwoDaysAgo"}]}	t	110	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
1fed01cb-99a0-407a-a049-9dbc420ea50a	signal_to_milestone	goal_setting_complete	goal_setting_complete	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}]}	t	120	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
87d1868b-fc41-4410-b2a6-39ff6c5871eb	signal_to_milestone	tier1_tier2_apps_downloaded	tier1_tier2_apps_downloaded	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "function", "params": {"userId": "event.userId"}, "function": "allGoalAppsDownloaded"}]}	t	130	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
53a61994-d56b-4348-a7f5-e68b12df5c49	signal_to_milestone	kyc_completed	kyc_completed	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "signal", "value": true, "signal": "kyc_selfie_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "kyc_card_captured", "operator": "=="}]}	t	140	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
65f99f3d-c726-479f-85f7-d778083617e7	signal_to_milestone	kyc_started_abandoned	kyc_started_abandoned	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "signal", "value": true, "signal": "kyc_initiated", "operator": "=="}, {"type": "or", "conditions": [{"type": "signal", "value": false, "signal": "kyc_selfie_completed", "operator": "=="}, {"type": "signal", "value": false, "signal": "kyc_card_captured", "operator": "=="}]}]}	t	150	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
f5980eb0-bdad-482a-85bf-6c28d1a37107	signal_to_milestone	uniti_registration_complete	uniti_registration_complete	{"type": "and", "conditions": [{"type": "field", "field": "event.eventType", "value": "Custom_Event", "operator": "=="}, {"type": "signal", "value": true, "signal": "phone_number_confirmation", "operator": "=="}, {"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "kyc_selfie_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "kyc_card_captured", "operator": "=="}]}	t	160	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
4f37a269-78f8-4b5f-84bf-ce0c1fd31586	signal_to_milestone	tier1_app_opened_first_time	tier1_app_opened_first_time	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_opened_first_time", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	170	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
4a30006e-7192-496e-a871-fbe2ac222d0f	signal_to_milestone	tier2_app_opened_first_time	tier2_app_opened_first_time	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_opened_first_time", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	180	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
7c79422b-a2c3-4d29-bfc9-f39a7d99a39c	signal_to_milestone	tier1_app_low_activity	tier1_app_low_activity	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_registration_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "function", "params": {"appId": "event.packageName", "weeks": 6, "userId": "event.userId"}, "function": "registeredAtLeastWeeksAgo"}, {"type": "not", "condition": {"type": "function", "params": {"appId": "event.packageName", "userId": "event.userId"}, "function": "hasAppEngagement"}}]}	t	190	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
6fff1c77-230e-4686-8aca-d7636fe2eb9f	signal_to_milestone	tier2_app_low_activity	tier2_app_low_activity	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_registration_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "function", "params": {"appId": "event.packageName", "weeks": 6, "userId": "event.userId"}, "function": "registeredAtLeastWeeksAgo"}, {"type": "not", "condition": {"type": "function", "params": {"appId": "event.packageName", "userId": "event.userId"}, "function": "hasAppEngagement"}}]}	t	200	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
b29522ae-b920-4061-918d-34aa8bc35566	signal_to_milestone	tier1_app_adopted	tier1_app_adopted	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_opened_first_time", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_opened", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "function", "params": {"appId": "event.packageName", "count": 2, "userId": "event.userId"}, "function": "openedCountAtLeast"}]}	t	210	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
99f7fd28-18d2-4c1c-a8e7-6578175a0ff0	signal_to_milestone	tier2_app_adopted	tier2_app_adopted	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_opened_first_time", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_opened", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "function", "params": {"appId": "event.packageName", "count": 2, "userId": "event.userId"}, "function": "openedCountAtLeast"}]}	t	220	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
7809ea24-4627-4a8e-8f64-477d658fecad	signal_to_milestone	tier1_app_registered	tier1_app_registered	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_registration_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	230	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
bb4e9007-e621-4134-ba75-f666f76ebac1	signal_to_milestone	tier2_app_registered	tier2_app_registered	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_registration_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	240	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
36f3d0b4-71bb-47f0-b8ed-1ccfc0dd8c44	signal_to_milestone	tier1_app_engaged	tier1_app_engaged	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_engaged", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	250	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
59cee6fa-c1d4-45c5-be5b-68521b1e2047	signal_to_milestone	tier2_app_engaged	tier2_app_engaged	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_engaged", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	260	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
9ffb964e-d4dc-43f1-abe6-d9fcbaaee655	signal_to_milestone	tier1_app_engagement_sustained	tier1_app_engagement_sustained	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_engaged", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"max": 8, "min": 6, "type": "function", "params": {"appId": "event.packageName", "userId": "event.userId"}, "function": "consecutiveEngagementWeeks", "operator": "range"}]}	t	270	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
8b9447f4-9e53-48b9-b409-9cc39e5ad016	signal_to_milestone	tier2_app_engagement_sustained	tier2_app_engagement_sustained	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_engaged", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"max": 8, "min": 6, "type": "function", "params": {"appId": "event.packageName", "userId": "event.userId"}, "function": "consecutiveEngagementWeeks", "operator": "range"}]}	t	280	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
609ed655-d103-4106-a99b-580e1a204eb6	signal_to_milestone	first_tier1_app_engaged	first_tier1_app_engaged	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_engaged", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "not", "condition": {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "excludeAppId": "event.packageName"}, "function": "hasAnyTierAppEngagement"}}]}	t	290	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
2c34779a-e4c7-4d02-b07b-62e412446846	signal_to_milestone	first_tier2_app_engaged	first_tier2_app_engaged	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_engaged", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "not", "condition": {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "excludeAppId": "event.packageName"}, "function": "hasAnyTierAppEngagement"}}]}	t	300	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
15ae1f2e-9f85-410e-b530-df716c4e2938	signal_to_milestone	all_tier1_app_engaged	all_tier1_app_engaged	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId"}, "function": "allTierAppsEngaged"}]}	t	310	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
251f1bc6-a167-417d-ab61-220788212d07	signal_to_milestone	all_tier2_app_engaged	all_tier2_app_engaged	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId"}, "function": "allTierAppsEngaged"}]}	t	320	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
c041ad02-18bc-4f6e-aad9-445b289bc514	signal_to_milestone	all_tier1_tier2_app_engaged	all_tier1_tier2_app_engaged	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId"}, "function": "allTierAppsEngaged"}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId"}, "function": "allTierAppsEngaged"}]}	t	330	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
4036504e-4392-4cf8-bceb-02bd47d98686	signal_to_milestone	tier1_app_engagement_dropoff	tier1_app_engagement_dropoff	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_engagement_dropoff", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	340	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
42e4e0df-ac9c-43e9-8152-b0c0d1fd18a5	signal_to_milestone	tier2_app_engagement_dropoff	tier2_app_engagement_dropoff	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_engagement_dropoff", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	350	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
1f2ba617-221d-4770-ba5f-d4e51645ad3b	signal_to_milestone	tier1_app_retained	tier1_app_retained	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_retained", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	360	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
0c58b3c1-1220-4d23-9fc7-80298d638458	signal_to_milestone	tier2_app_retained	tier2_app_retained	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_retained", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	370	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
a0380387-f7e8-4c74-b547-0ae24d0ed403	signal_to_milestone	first_tier1_app_retained	first_tier1_app_retained	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_retained", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "not", "condition": {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "excludeAppId": "event.packageName"}, "function": "hasAnyTierAppRetention"}}]}	t	380	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
dde030a3-ddbf-4c53-b0e0-39b301c7ade0	signal_to_milestone	first_tier2_app_retained	first_tier2_app_retained	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_retained", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "not", "condition": {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "excludeAppId": "event.packageName"}, "function": "hasAnyTierAppRetention"}}]}	t	390	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
375c17f8-c54e-4ce8-9b7d-c283241a8d34	signal_to_milestone	tier1_app_retention_dropoff	tier1_app_retention_dropoff	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_retained_dropoff", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	400	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
632b36ff-5e93-45c7-a66a-3c2de6a1c495	signal_to_milestone	tier2_app_retention_dropoff	tier2_app_retention_dropoff	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "signal", "value": true, "signal": "customer_app_retained_dropoff", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}]}	t	410	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
f70c86cb-efd9-4c29-b285-44b619b30a8a	signal_to_milestone	all_tier1_tier2_app_retained	all_tier1_tier2_app_retained	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId"}, "function": "allTierAppsRetained"}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId"}, "function": "allTierAppsRetained"}]}	t	420	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
429a75ff-1cb0-4e1d-89dd-374b7e5b351b	signal_to_milestone	p2g_survey_completed	p2g_survey_completed	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "function", "params": {"userId": "event.userId"}, "function": "dataReceivedOnP2G"}]}	t	430	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
bbc76b33-0532-4172-8fd9-00a57ac0b13a	signal_to_milestone	tier1_app_opened_not_registered	tier1_app_opened_not_registered	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier1", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "function", "params": {"tier": "tier1", "appId": "event.packageName", "userId": "event.userId"}, "function": "tierAppOpenedFirstTimeAtLeastWeekAgo"}, {"type": "function", "params": {"tier": "tier1", "appId": "event.packageName", "userId": "event.userId"}, "function": "tierAppNotRegistered"}]}	t	440	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
06690de7-5f2f-4820-b8f9-ed3ebacfb2c2	signal_to_milestone	tier2_app_opened_not_registered	tier2_app_opened_not_registered	{"type": "and", "conditions": [{"type": "signal", "value": true, "signal": "goal_selection_completed", "operator": "=="}, {"type": "function", "params": {"tier": "tier2", "userId": "event.userId", "packageName": "event.packageName"}, "function": "isTierApp"}, {"type": "function", "params": {"tier": "tier2", "appId": "event.packageName", "userId": "event.userId"}, "function": "tierAppOpenedFirstTimeAtLeastWeekAgo"}, {"type": "function", "params": {"tier": "tier2", "appId": "event.packageName", "userId": "event.userId"}, "function": "tierAppNotRegistered"}]}	t	450	2025-11-26 21:07:58.163307	2025-11-26 21:07:58.163307
\.


--
-- Data for Name: goal_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.goal_categories (id, "createdAt", "updatedAt", name, description, "iconUrl", "order") FROM stdin;
1791532c-64ef-4074-a00e-161d1c981330	2025-06-23 09:02:29.519813	2025-06-23 09:02:29.519813	Financial	Improve your finances. Save and make money	\N	2
87287bfa-b290-4eba-bd7c-a4ddeca406d8	2025-06-23 09:02:11.925144	2025-06-23 09:02:35.543272	Health	Stay Healthy for today and tomorrow	\N	1
041295f5-f311-45e1-9133-7e3e4af712b0	2025-06-23 09:02:50.892398	2025-06-23 09:02:50.892398	Work	Get your career on course.	\N	3
8605c351-06d6-4696-bbe0-34fcfb1b47d8	2025-06-23 09:03:05.648267	2025-06-23 09:03:05.648267	Education	Get better with education. Read to improve yourself.	\N	4
35d28bb6-5f72-4235-aed1-018bafe8becd	2025-06-23 09:02:50.892398	2025-06-23 09:02:50.892398	Uniti	This is Uniti	\N	5
\.


--
-- Data for Name: goal_priorities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.goal_priorities (id, "createdAt", "updatedAt", title, "goalCategoryId") FROM stdin;
\.


--
-- Data for Name: goal_sub_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.goal_sub_categories (id, "createdAt", "updatedAt", name, description, "goalCategoryId") FROM stdin;
9bdfb8d7-6954-4e1b-a86e-b9c464af7c16	2025-07-03 13:29:30.154041	2025-07-03 13:29:30.154041	Health access	Access to health	87287bfa-b290-4eba-bd7c-a4ddeca406d8
70cbce37-b0c7-4fce-94f2-3a6a8e797e2a	2025-07-03 13:29:39.726283	2025-07-03 13:29:39.726283	Medicine access	Medicine access	87287bfa-b290-4eba-bd7c-a4ddeca406d8
7631499d-a115-40a4-961b-8f65bcc15ed3	2025-07-03 13:29:50.779071	2025-07-03 13:29:50.779071	Wellness	Wellness	87287bfa-b290-4eba-bd7c-a4ddeca406d8
1d241665-a302-4a66-8f38-8e118357a5aa	2025-07-03 13:29:54.931684	2025-07-03 13:29:54.931684	Women child health	Women child health	87287bfa-b290-4eba-bd7c-a4ddeca406d8
56a368d2-6189-487a-a2d5-219b552ac7a4	2025-07-03 13:30:01.617469	2025-07-03 13:30:01.617469	Womens health	Womens health	87287bfa-b290-4eba-bd7c-a4ddeca406d8
22f77686-5388-4eb9-b36f-db5cacf8efc7	2025-07-03 13:30:08.20421	2025-07-03 13:30:08.20421	Health information	Health information	87287bfa-b290-4eba-bd7c-a4ddeca406d8
60e8aaee-5ac1-47ed-8151-bff219d58f15	2025-07-03 13:30:16.114244	2025-07-03 13:30:16.114244	Telehealth	Telehealth	87287bfa-b290-4eba-bd7c-a4ddeca406d8
3bb49539-219f-4e30-ae8f-3ed55ef0168c	2025-07-03 13:34:44.46429	2025-07-03 13:34:44.46429	Savings	Saving money	1791532c-64ef-4074-a00e-161d1c981330
14c5d465-eb32-4444-93a9-53db7af44ba2	2025-07-03 13:35:01.625595	2025-07-03 13:35:01.625595	Financial Management	Financial Management	1791532c-64ef-4074-a00e-161d1c981330
812e29c0-8d0a-4e95-9b6a-339a00fbce04	2025-07-03 13:35:10.004155	2025-07-03 13:35:10.004155	Retirement savings	Retirement savings\n	1791532c-64ef-4074-a00e-161d1c981330
9f68ae6d-5de5-4771-80bc-a61d7c579a55	2025-07-03 13:35:16.440684	2025-07-03 13:35:16.440684	Mobile Money	Mobile Money	1791532c-64ef-4074-a00e-161d1c981330
ea194fb6-9d98-40e2-ab87-7d1387c5c506	2025-07-03 13:35:22.889788	2025-07-03 13:35:22.889788	Lending	Lending	1791532c-64ef-4074-a00e-161d1c981330
8d1ab3df-be73-425a-8b0f-d0f56f08e36c	2025-07-03 13:35:29.478219	2025-07-03 13:35:29.478219	Life Insurance	Life Insurance	1791532c-64ef-4074-a00e-161d1c981330
3f423097-e449-46e7-83cd-d4349efa9d27	2025-07-03 13:38:59.852422	2025-07-03 13:38:59.852422	Farmer education	Farmer education	041295f5-f311-45e1-9133-7e3e4af712b0
c7ae63c0-d689-4232-ba43-63d964402d4a	2025-07-03 13:39:09.037459	2025-07-03 13:39:09.037459	Market access	Market access	041295f5-f311-45e1-9133-7e3e4af712b0
e511e8ea-9986-4f31-bb4f-03e1d0f32852	2025-07-03 13:39:17.602572	2025-07-03 13:39:17.602572	Farming inputs	Farming inputs	041295f5-f311-45e1-9133-7e3e4af712b0
00d59305-6acc-4d88-9087-4e310c49bc3f	2025-07-03 13:39:24.684275	2025-07-03 13:39:24.684275	Weather	Weather\n	041295f5-f311-45e1-9133-7e3e4af712b0
b551d88c-3ee3-48d2-bfab-609812c39073	2025-07-03 13:39:31.661549	2025-07-03 13:39:31.661549	Business inventory	Business inventory	041295f5-f311-45e1-9133-7e3e4af712b0
3d87430b-e6e2-4a64-bfbf-d005c71aaadb	2025-07-03 13:39:38.638064	2025-07-03 13:39:38.638064	Business growth	Business growth	041295f5-f311-45e1-9133-7e3e4af712b0
1e16ad10-d3b0-4656-835f-e740ae9b10a6	2025-07-03 13:39:46.558791	2025-07-03 13:39:46.558791	Business loan	Business loan	041295f5-f311-45e1-9133-7e3e4af712b0
1a19d0db-0a57-42f7-bc57-2e6a3107683e	2025-07-03 13:39:53.291453	2025-07-03 13:39:53.291453	Business advice	Business advice\n	041295f5-f311-45e1-9133-7e3e4af712b0
51e992e9-6826-4271-8d4a-1a14018fda7d	2025-07-03 13:44:26.586928	2025-07-03 13:44:26.586928	Online courses	Online courses	8605c351-06d6-4696-bbe0-34fcfb1b47d8
b04f22db-ca81-451f-8f38-e3a3c22c70ef	2025-07-03 13:44:33.369991	2025-07-03 13:44:33.369991	Adult education	Adult education\n	8605c351-06d6-4696-bbe0-34fcfb1b47d8
bdb1b222-5fb5-4a54-a56c-029f371481e6	2025-07-03 13:44:39.399467	2025-07-03 13:44:39.399467	Skills development	Skills development	8605c351-06d6-4696-bbe0-34fcfb1b47d8
45f5a7d6-0478-4416-81cf-aa987e24e092	2025-07-03 13:44:46.061834	2025-07-03 13:44:46.061834	Reading	Reading	8605c351-06d6-4696-bbe0-34fcfb1b47d8
dbd2fc22-fabf-407b-b56c-c13e21dcb7ce	2025-07-03 13:44:52.231105	2025-07-03 13:44:52.231105	Basic education	Basic education	8605c351-06d6-4696-bbe0-34fcfb1b47d8
e4063538-6238-4bfa-9753-4653e4ed7ba8	2025-10-15 11:01:11.572595	2025-10-15 11:01:11.572595	Health insurance		87287bfa-b290-4eba-bd7c-a4ddeca406d8
7b877b95-4f52-4c7c-bb11-7adeee7ddfb6	2025-11-14 09:07:49.777586	2025-11-14 09:07:49.777586	micro- investment	Invest my money.	1791532c-64ef-4074-a00e-161d1c981330
4f280395-a72f-4994-a0bd-5574224ebfdc	2025-11-18 08:34:47.254949	2025-11-18 08:35:52.398707	Access to Technology	Access to Technology	35d28bb6-5f72-4235-aed1-018bafe8becd
e5debe89-b739-4616-b592-ee4ba586f2e8	2025-11-18 08:34:54.750974	2025-11-18 08:35:58.32607	Access to Gifts	Access to Gifts	35d28bb6-5f72-4235-aed1-018bafe8becd
\.


--
-- Data for Name: goals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.goals (id, "createdAt", "updatedAt", title, "displayText", "goalCategoryId", "goalSubCategoryId") FROM stdin;
358940c1-f3c5-4d57-a97b-8a6d0160c523	2025-07-03 13:30:40.532591	2025-07-03 13:30:40.532591	Remote medical consultation	Talk to a doctor while at home	87287bfa-b290-4eba-bd7c-a4ddeca406d8	9bdfb8d7-6954-4e1b-a86e-b9c464af7c16
5ab413e1-3900-49f8-b327-804defdf135a	2025-07-03 13:31:17.046933	2025-07-03 13:31:17.046933	Access affordable medicine	Access medicines quickly and affordably	87287bfa-b290-4eba-bd7c-a4ddeca406d8	70cbce37-b0c7-4fce-94f2-3a6a8e797e2a
3372910c-349f-42e7-8543-94e7eddf8ab1	2025-07-03 13:31:55.394263	2025-07-03 13:31:55.394263	Maternal child health	Get advice on maternal and child health	87287bfa-b290-4eba-bd7c-a4ddeca406d8	1d241665-a302-4a66-8f38-8e118357a5aa
5160b41b-d5e8-47ec-897a-5b69f59e9780	2025-07-03 13:32:31.720079	2025-07-03 13:32:31.720079	Womens health advice	Get advice on women's health and family planning	87287bfa-b290-4eba-bd7c-a4ddeca406d8	56a368d2-6189-487a-a2d5-219b552ac7a4
df77618d-14e7-4d21-a66e-53f0d5757072	2025-07-03 13:32:58.024289	2025-07-03 13:32:58.024289	Reliable health info	Find trustworthy health information and tips	87287bfa-b290-4eba-bd7c-a4ddeca406d8	22f77686-5388-4eb9-b36f-db5cacf8efc7
4c3c4e32-43cc-427a-a6ce-efd3070f039f	2025-07-03 13:33:30.866533	2025-07-03 13:33:30.866533	Access Healthcare	Get medical care when needed	87287bfa-b290-4eba-bd7c-a4ddeca406d8	60e8aaee-5ac1-47ed-8151-bff219d58f15
299709b5-90a6-41a3-85ea-8fd1d0816f98	2025-07-03 13:36:28.869319	2025-07-03 13:36:28.869319	Track spending	Track spending	1791532c-64ef-4074-a00e-161d1c981330	14c5d465-eb32-4444-93a9-53db7af44ba2
7b610c2d-82ac-4ffc-bd61-36a424b8bd57	2025-07-03 13:37:16.561148	2025-07-03 13:37:16.561148	Access fair loans	Get a loan with fair interest rates for my needs	1791532c-64ef-4074-a00e-161d1c981330	ea194fb6-9d98-40e2-ab87-7d1387c5c506
ef0cfd01-56d6-4f73-abaf-da0ef78c1f22	2025-07-03 13:36:55.041481	2025-07-03 13:37:31.498158	Mobile money transfers	Send and receive money safely using my phone	1791532c-64ef-4074-a00e-161d1c981330	9f68ae6d-5de5-4771-80bc-a61d7c579a55
536e2437-49f2-40e6-81a4-82c8fa19f907	2025-07-03 13:36:44.829856	2025-07-03 13:37:45.733708	Save for retirement	Saving money for old age	1791532c-64ef-4074-a00e-161d1c981330	812e29c0-8d0a-4e95-9b6a-339a00fbce04
66f343bd-2ffe-45df-af78-1d9667ec0e23	2025-07-03 13:38:28.188437	2025-07-03 13:38:28.188437	Family financial protection	Protect my family financially if something happens to me	1791532c-64ef-4074-a00e-161d1c981330	8d1ab3df-be73-425a-8b0f-d0f56f08e36c
baaa9855-6128-48b6-9104-41ee541d3b81	2025-07-03 13:40:20.519078	2025-07-03 13:40:20.519078	Crop growing guidance	Learn how and when to grow different types of crops	041295f5-f311-45e1-9133-7e3e4af712b0	3f423097-e449-46e7-83cd-d4349efa9d27
7fbfd6a6-2690-4f51-8448-c062002de596	2025-07-03 13:40:34.886633	2025-07-03 13:40:34.886633	Farming best practices	Get advice and tips on farming practices	041295f5-f311-45e1-9133-7e3e4af712b0	3f423097-e449-46e7-83cd-d4349efa9d27
a08a9fe9-2632-4e33-9d2f-13cd194061d4	2025-07-03 13:40:50.527207	2025-07-03 13:40:50.527207	Crop market access	Connect with buyers and markets for my crops	041295f5-f311-45e1-9133-7e3e4af712b0	c7ae63c0-d689-4232-ba43-63d964402d4a
5b8c870c-a288-4246-a804-0ce87b81cfc0	2025-07-03 13:41:06.459829	2025-07-03 13:41:06.459829	Better crop prices	Sell my farm produce for better prices	041295f5-f311-45e1-9133-7e3e4af712b0	c7ae63c0-d689-4232-ba43-63d964402d4a
f8c415f7-0942-48ae-a91a-7e1bcc91bcc8	2025-07-03 13:41:26.330625	2025-07-03 13:41:26.330625	Affordable farming inputs	Buy farming inputs at better prices	041295f5-f311-45e1-9133-7e3e4af712b0	e511e8ea-9986-4f31-bb4f-03e1d0f32852
a01acb4b-4acc-4428-9bee-dba9b3038ff8	2025-07-03 13:41:48.208134	2025-07-03 13:41:48.208134	Farming weather updates	Get weather updates to plan my farming activities	041295f5-f311-45e1-9133-7e3e4af712b0	00d59305-6acc-4d88-9087-4e310c49bc3f
a74e23b0-2d96-420d-a954-ee0aadc4e891	2025-07-03 13:42:10.672677	2025-07-03 13:42:10.672677	Business record keeping	Track and keep records of inventory and sales	041295f5-f311-45e1-9133-7e3e4af712b0	b551d88c-3ee3-48d2-bfab-609812c39073
a6b0724e-2ff6-4188-a6b0-0703640d2354	2025-07-03 13:45:19.719497	2025-07-03 13:45:19.719497	Learn new skills	Learn new skills for work	8605c351-06d6-4696-bbe0-34fcfb1b47d8	51e992e9-6826-4271-8d4a-1a14018fda7d
4b7af087-dbc5-4294-ad3d-57feaca6f119	2025-07-03 13:45:43.02155	2025-07-03 13:45:43.02155	Improve English skills	Enhance my English reading and writing skills	8605c351-06d6-4696-bbe0-34fcfb1b47d8	b04f22db-ca81-451f-8f38-e3a3c22c70ef
5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	2025-07-03 13:46:01.455437	2025-07-03 13:46:01.455437	Earn more income	Learn new skills to earn more money	8605c351-06d6-4696-bbe0-34fcfb1b47d8	bdb1b222-5fb5-4a54-a56c-029f371481e6
33a3b170-1a61-48da-add0-3b24678dbb4f	2025-07-03 13:46:18.020425	2025-07-03 13:46:18.020425	Access reading materials	Find books and stories for me and my children to read	8605c351-06d6-4696-bbe0-34fcfb1b47d8	45f5a7d6-0478-4416-81cf-aa987e24e092
d23e16b5-b2db-4cf0-9af4-a0c56e7a7db7	2025-07-03 13:46:35.279478	2025-07-03 13:46:35.279478	Support children education	Help my children with their schoolwork and studies	8605c351-06d6-4696-bbe0-34fcfb1b47d8	dbd2fc22-fabf-407b-b56c-c13e21dcb7ce
6e024481-3127-4002-a6b0-a70f718097b5	2025-09-25 09:59:19.657928	2025-09-25 09:59:19.657928	Keep fit	\N	87287bfa-b290-4eba-bd7c-a4ddeca406d8	7631499d-a115-40a4-961b-8f65bcc15ed3
d3cd5e14-2873-4c70-9b44-1242b79e96ac	2025-09-30 10:16:19.743254	2025-09-30 10:16:19.743254	Access to fair loans	Access to fair loans	041295f5-f311-45e1-9133-7e3e4af712b0	1e16ad10-d3b0-4656-835f-e740ae9b10a6
c8c35b8b-1c64-4544-b94f-488bc6d8823d	2025-10-15 11:02:11.017424	2025-10-15 11:02:11.017424	Access affordable health insurance	\N	87287bfa-b290-4eba-bd7c-a4ddeca406d8	e4063538-6238-4bfa-9753-4653e4ed7ba8
1679970e-8a38-4c06-8764-c63a40e593d2	2025-07-03 13:36:14.95758	2025-11-14 09:09:14.506395	Keep my money safe	Keep my money safe	1791532c-64ef-4074-a00e-161d1c981330	3bb49539-219f-4e30-ae8f-3ed55ef0168c
1bee8fe8-9344-4053-a7b2-e6a6a7a8e7b4	2025-07-03 13:35:54.283715	2025-11-14 09:09:51.948978	Invest my money	Invest my money	1791532c-64ef-4074-a00e-161d1c981330	3bb49539-219f-4e30-ae8f-3ed55ef0168c
0f6f6ae5-eab7-4b0c-b714-2f0d3210c31e	2025-11-18 08:35:29.622255	2025-11-18 08:35:39.323223	Technology and information access	Technology and information access	35d28bb6-5f72-4235-aed1-018bafe8becd	4f280395-a72f-4994-a0bd-5574224ebfdc
70aecef8-3e28-4dd8-a9f8-9cd92191c926	2025-11-18 08:35:10.333055	2025-11-18 08:35:45.182394	Get gifts	Get gifts	35d28bb6-5f72-4235-aed1-018bafe8becd	e5debe89-b739-4616-b592-ee4ba586f2e8
\.


--
-- Data for Name: high_watermarks; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.high_watermarks (id, source, last_processed_key, last_processed_timestamp, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: intervention_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.intervention_logs (id, queue_ids, message_text, user_ids, template_ids, intervention_ids, received_at, created_at, error_message) FROM stdin;
\.


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.languages (id, "createdAt", "updatedAt", title, code) FROM stdin;
10941e51-f9a8-4bcc-847e-d05056a6339a	2025-07-03 14:58:19.648752	2025-08-21 06:51:55.374989	Spanish	es
841db0fe-456b-4f28-a668-1f225141d2cb	2025-07-03 14:58:08.756337	2025-08-21 06:52:57.710268	Twi	tw
075f3a18-6587-4775-be4a-b165e27d3ab7	2025-07-03 14:58:02.042706	2025-11-13 12:23:38.313393	English	en
b6ab341d-fdac-42ad-9bfc-11c00ad36a10	2025-11-13 12:24:10.923804	2025-11-13 12:24:10.923804	French	FR
\.


--
-- Data for Name: message_queue; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.message_queue (id, "userIds", placeholders, status, error, "retryCount", "createdAt", "updatedAt", "processedUserIds", "templateId", "batchId") FROM stdin;
00ff2602-13a1-477d-b3df-fd3f03d13d6d	{ade67080-652a-45ba-80a9-9b48c06215e6}	\N	completed	\N	0	2025-11-19 22:46:18.654917	2025-11-19 22:46:20.152895	{ade67080-652a-45ba-80a9-9b48c06215e6}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
4b499efa-6f9f-49d9-945d-f93923b443ba	{dce40658-353e-467f-bafe-920524125e12}	\N	completed	\N	0	2025-11-19 21:55:55.734841	2025-11-19 21:56:00.1813	{dce40658-353e-467f-bafe-920524125e12}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
71628c37-b694-4c9d-a0e3-6b0197b5863a	{b5947c92-85b6-4b2c-a196-994d9c3b4739,a7295cab-0299-493d-9870-3ed59a04cfaa}	\N	completed	\N	0	2025-11-19 19:43:35.981223	2025-11-19 19:43:40.397414	{b5947c92-85b6-4b2c-a196-994d9c3b4739,a7295cab-0299-493d-9870-3ed59a04cfaa}	88d9fb05-fbc6-4f48-b99a-7b41cfe5800c	batch-1763581415828-u399gszuf
42b97c48-bd2b-450c-9f2b-8ec76d009c97	{ade67080-652a-45ba-80a9-9b48c06215e6}	\N	completed	\N	0	2025-11-19 22:52:22.921211	2025-11-19 22:52:30.177966	{ade67080-652a-45ba-80a9-9b48c06215e6}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
feb2bf87-6218-4f89-ba89-44d70e192aac	{dce40658-353e-467f-bafe-920524125e12}	\N	completed	\N	0	2025-11-19 22:37:41.05547	2025-11-19 22:37:50.157938	{dce40658-353e-467f-bafe-920524125e12}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
1bb50459-8264-4c8c-ab54-ed23307ea696	{dce40658-353e-467f-bafe-920524125e12}	\N	completed	\N	0	2025-11-19 22:48:09.789631	2025-11-19 22:48:10.134483	{dce40658-353e-467f-bafe-920524125e12}	1e40130f-60ae-44a1-81e3-099bc7b7126f	\N
3d8dee56-6756-44b4-88d5-b18510248f25	{b5947c92-85b6-4b2c-a196-994d9c3b4739,a7295cab-0299-493d-9870-3ed59a04cfaa}	\N	completed	\N	0	2025-11-19 19:43:36.381663	2025-11-19 19:43:44.025105	{b5947c92-85b6-4b2c-a196-994d9c3b4739,a7295cab-0299-493d-9870-3ed59a04cfaa}	8f5f5c42-d68b-480a-964b-7e8836db98d1	batch-1763581415828-u399gszuf
cf15bbe5-8928-40c8-a2c5-8026a50320b1	{ade67080-652a-45ba-80a9-9b48c06215e6}	\N	completed	\N	0	2025-11-19 22:37:52.294838	2025-11-19 22:38:00.185965	{ade67080-652a-45ba-80a9-9b48c06215e6}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
3e0ae48c-ca35-44f5-a870-bffe214b1c8b	{b5947c92-85b6-4b2c-a196-994d9c3b4739,a7295cab-0299-493d-9870-3ed59a04cfaa}	\N	completed	\N	0	2025-11-19 21:55:03.370412	2025-11-19 21:55:10.357224	{b5947c92-85b6-4b2c-a196-994d9c3b4739,a7295cab-0299-493d-9870-3ed59a04cfaa}	88d9fb05-fbc6-4f48-b99a-7b41cfe5800c	batch-1763589303365-i2z059x3x
40aa1338-db02-4885-babc-d27c16b5ed4c	{b5947c92-85b6-4b2c-a196-994d9c3b4739}	\N	completed	\N	0	2025-11-19 18:12:25.217417	2025-11-19 18:12:32.292672	{b5947c92-85b6-4b2c-a196-994d9c3b4739}	993b4b2e-48d7-43c8-85f0-0a5ce7f48df2	\N
33846ffe-bf74-4e09-8ef6-a8b4500ddb39	{b5947c92-85b6-4b2c-a196-994d9c3b4739,a7295cab-0299-493d-9870-3ed59a04cfaa}	\N	completed	\N	0	2025-11-19 21:55:03.397436	2025-11-19 21:55:10.705701	{b5947c92-85b6-4b2c-a196-994d9c3b4739,a7295cab-0299-493d-9870-3ed59a04cfaa}	8f5f5c42-d68b-480a-964b-7e8836db98d1	batch-1763589303365-i2z059x3x
bc9fb53f-1c44-4c2a-9d80-0c3b56862e7a	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	\N	completed	\N	0	2025-11-19 22:38:10.885315	2025-11-19 22:38:20.16268	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	56e99010-a8bd-4188-b15b-136c4430b431	batch-1763591890883-opjbw398c
1f55e0f0-ef01-4355-af9c-a1de52774f32	{ade67080-652a-45ba-80a9-9b48c06215e6}	\N	completed	\N	0	2025-11-19 22:48:35.117508	2025-11-19 22:48:40.153025	{ade67080-652a-45ba-80a9-9b48c06215e6}	8007a8e5-9b6b-45f9-8ed9-0ef8f757ba28	\N
741ef30d-ec05-4e6a-b48d-3089a3808a9d	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	\N	completed	\N	0	2025-11-19 22:38:10.903923	2025-11-19 22:38:20.320913	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	575a0b1b-09aa-43ec-b761-01dd6d0becde	batch-1763591890883-opjbw398c
c51ff76d-78f1-45c8-89da-83c1b39f62b1	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	\N	completed	\N	0	2025-11-19 22:55:53.88314	2025-11-19 22:56:00.306716	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	f0abbc31-ec14-4a98-b7e3-874683464479	batch-1763592953265-o8f3m770b
8b95f0bf-a2cb-4f84-9961-07754c136c64	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	\N	completed	\N	0	2025-11-19 22:52:37.045338	2025-11-19 22:52:40.162099	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	56e99010-a8bd-4188-b15b-136c4430b431	batch-1763592757043-614dhcww4
77c74f36-ec76-4e8e-a6c5-4d02689e4f35	{dce40658-353e-467f-bafe-920524125e12}	\N	completed	\N	0	2025-11-19 22:45:37.122271	2025-11-19 22:45:40.143797	{dce40658-353e-467f-bafe-920524125e12}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
994ff40d-3463-4312-8b63-5c53881a8a33	{dce40658-353e-467f-bafe-920524125e12}	\N	completed	\N	0	2025-11-19 22:49:21.226142	2025-11-19 22:49:30.149828	{dce40658-353e-467f-bafe-920524125e12}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
8e04c527-ab34-476c-b708-a18aa5481387	{ac26d78c-33db-4bbd-a387-bf38ff39ca23}	\N	completed	\N	0	2025-11-19 22:53:10.462866	2025-11-19 22:53:20.19174	{ac26d78c-33db-4bbd-a387-bf38ff39ca23}	8007a8e5-9b6b-45f9-8ed9-0ef8f757ba28	\N
5fa5d6a8-5c54-465f-8d49-88944341d5b8	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	\N	completed	\N	0	2025-11-19 22:52:37.063832	2025-11-19 22:52:40.31384	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	61bdf1d8-8706-4c21-a4c7-83c9ab4590c7	batch-1763592757043-614dhcww4
eac50ec7-30ff-430c-bac6-c182d9fc1f56	{dce40658-353e-467f-bafe-920524125e12}	\N	completed	\N	0	2025-11-19 22:52:00.662762	2025-11-19 22:52:10.162499	{dce40658-353e-467f-bafe-920524125e12}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
79d24b84-ec32-451d-bfed-6d4aab8fb3d3	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	\N	completed	\N	0	2025-11-19 22:55:53.509505	2025-11-19 22:56:00.15892	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	9c8c1ac6-6c53-4838-87a3-a698ee267808	batch-1763592953265-o8f3m770b
6eb2c617-2d32-49c0-a61e-fea74f171706	{ade67080-652a-45ba-80a9-9b48c06215e6}	\N	completed	\N	0	2025-11-19 23:18:44.958737	2025-11-19 23:18:50.16117	{ade67080-652a-45ba-80a9-9b48c06215e6}	8007a8e5-9b6b-45f9-8ed9-0ef8f757ba28	\N
126be2ed-0be7-4d12-b92e-0c46c9739579	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	\N	completed	\N	0	2025-11-19 22:52:52.606043	2025-11-19 22:53:00.17528	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	246ed280-8ae1-4854-bf52-ce1173dd4e51	\N
fd7ebcbe-e78d-4051-939e-77d0f4b83ab9	{4ffb4e82-e20c-457d-b46b-562c7017c8b1}	\N	completed	\N	0	2025-11-19 22:53:33.501507	2025-11-19 22:53:40.151464	{4ffb4e82-e20c-457d-b46b-562c7017c8b1}	8007a8e5-9b6b-45f9-8ed9-0ef8f757ba28	\N
1e2fb205-f4e2-4c09-8470-a53b081385d0	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	\N	completed	\N	0	2025-11-19 22:55:54.265107	2025-11-19 22:56:02.199319	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	119d5388-fadf-43a4-8eb6-ffa989690345	batch-1763592953265-o8f3m770b
3af560ec-2572-4509-83da-ee7809c5544d	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	\N	completed	\N	0	2025-11-19 22:59:42.029978	2025-11-19 22:59:50.179779	{b7637e6b-e023-4347-9cce-d51e7aacaab4}	5547b965-ef7e-4cdb-94c5-c19f3514d27e	\N
ade3c026-b2a7-4e87-833f-3c5ff2653511	{dce40658-353e-467f-bafe-920524125e12}	\N	completed	\N	0	2025-11-19 23:18:17.080914	2025-11-19 23:18:20.166834	{dce40658-353e-467f-bafe-920524125e12}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
798ad8ca-2a63-440d-8434-db20671e34d3	{dce40658-353e-467f-bafe-920524125e12}	\N	completed	\N	0	2025-11-19 23:23:34.902436	2025-11-19 23:23:40.165365	{dce40658-353e-467f-bafe-920524125e12}	1e40130f-60ae-44a1-81e3-099bc7b7126f	\N
f128e535-8cf9-41fb-9914-ffd1a3c2789e	{ade67080-652a-45ba-80a9-9b48c06215e6}	\N	completed	\N	0	2025-11-19 23:24:00.723793	2025-11-19 23:24:10.154159	{ade67080-652a-45ba-80a9-9b48c06215e6}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
e1ba2ee8-93bc-442a-96c1-ca102046e24a	{ac26d78c-33db-4bbd-a387-bf38ff39ca23}	\N	completed	\N	0	2025-11-19 23:24:43.428093	2025-11-19 23:24:50.16008	{ac26d78c-33db-4bbd-a387-bf38ff39ca23}	61bdf1d8-8706-4c21-a4c7-83c9ab4590c7	\N
0a8fdf2d-9587-437c-8b99-83e647d48f29	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	\N	completed	\N	0	2025-11-19 23:24:30.130391	2025-11-19 23:24:32.35784	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	56e99010-a8bd-4188-b15b-136c4430b431	batch-1763594670128-twn2bfo59
c3a75d37-01f8-4415-8171-2e44811a0f1c	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	\N	completed	\N	0	2025-11-19 23:24:30.147627	2025-11-19 23:24:33.935884	{dc72b8c0-f888-4282-a72b-553dd68ca0b0}	61bdf1d8-8706-4c21-a4c7-83c9ab4590c7	batch-1763594670128-twn2bfo59
13628ac6-b49a-4b3b-b272-4d16ee882db9	{0301ca26-e2e1-470a-9aa3-9616cfee45e5}	\N	completed	\N	0	2025-11-19 23:26:11.491794	2025-11-19 23:26:20.347403	{0301ca26-e2e1-470a-9aa3-9616cfee45e5}	61bdf1d8-8706-4c21-a4c7-83c9ab4590c7	batch-1763594771473-gcvgjp51o
e37b9bf7-87bd-4e02-aae7-dec2c75b0532	{4ffb4e82-e20c-457d-b46b-562c7017c8b1}	\N	completed	\N	0	2025-11-19 23:24:52.759955	2025-11-19 23:25:00.160574	{4ffb4e82-e20c-457d-b46b-562c7017c8b1}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
a4699567-c25e-43cf-9591-838c0f9587da	{03dc138a-04da-4a0c-bd19-e9efbf238407}	\N	completed	\N	0	2025-11-19 23:25:12.839084	2025-11-19 23:25:20.152796	{03dc138a-04da-4a0c-bd19-e9efbf238407}	56e99010-a8bd-4188-b15b-136c4430b431	batch-1763594712837-huluj68us
dd7f3c10-3a62-4a1d-bb62-203c36049346	{2f9a73de-22e5-45c4-90c5-ab909821d182}	\N	completed	\N	0	2025-11-19 23:26:25.098993	2025-11-19 23:26:30.313158	{2f9a73de-22e5-45c4-90c5-ab909821d182}	61bdf1d8-8706-4c21-a4c7-83c9ab4590c7	\N
31cdbcd3-dc16-476f-8345-c73d44e62bb6	{03dc138a-04da-4a0c-bd19-e9efbf238407}	\N	completed	\N	0	2025-11-19 23:25:12.856326	2025-11-19 23:25:20.299066	{03dc138a-04da-4a0c-bd19-e9efbf238407}	6f86e824-9f94-4263-acf8-a4db4a723512	batch-1763594712837-huluj68us
e6d2e17d-15b3-4674-9135-925d13f03e85	{c74b2ec1-5e33-420f-aaa7-adac48e5221c}	\N	completed	\N	0	2025-11-19 23:25:29.306496	2025-11-19 23:25:30.243583	{c74b2ec1-5e33-420f-aaa7-adac48e5221c}	61bdf1d8-8706-4c21-a4c7-83c9ab4590c7	\N
3fb846d4-04e5-472f-951b-8ff318274bbb	{aa8c967f-24be-49f1-be7e-d449e9d17246}	\N	completed	\N	0	2025-11-19 23:26:45.495582	2025-11-19 23:26:50.160309	{aa8c967f-24be-49f1-be7e-d449e9d17246}	61bdf1d8-8706-4c21-a4c7-83c9ab4590c7	\N
f630d08b-2894-45f3-b9d1-1392737c1f62	{38b3b5c5-ce46-439d-984f-be1dab002a57}	\N	completed	\N	0	2025-11-19 23:25:43.255885	2025-11-19 23:25:50.164269	{38b3b5c5-ce46-439d-984f-be1dab002a57}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
460684ba-6788-45d4-bf71-1568b5bd3fe2	{2c4db685-0707-4809-989d-6168e505cf43}	\N	completed	\N	0	2025-11-19 23:25:55.975536	2025-11-19 23:26:00.148148	{2c4db685-0707-4809-989d-6168e505cf43}	87080320-42ff-4513-b3c0-a4031d0221b8	\N
99612db5-e729-473a-b5d8-f55ce298cd4f	{5b26671d-5d53-4373-a113-c0339a4bbed3}	\N	completed	\N	0	2025-11-25 08:50:46.896863	2025-11-25 08:50:50.186789	{5b26671d-5d53-4373-a113-c0339a4bbed3}	993b4b2e-48d7-43c8-85f0-0a5ce7f48df2	\N
941e43f2-914a-4623-8705-4a8f7cb4298e	{0301ca26-e2e1-470a-9aa3-9616cfee45e5}	\N	completed	\N	0	2025-11-19 23:26:11.474831	2025-11-19 23:26:20.175507	{0301ca26-e2e1-470a-9aa3-9616cfee45e5}	56e99010-a8bd-4188-b15b-136c4430b431	batch-1763594771473-gcvgjp51o
\.


--
-- Data for Name: message_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.message_templates (id, "createdAt", "updatedAt", title, subject, content, category, translations, "subjectTranslations", "isActive", "videoUrls", "audioUrls") FROM stdin;
d32770b7-434a-49ba-82c3-ed5668d35e9a	2025-11-03 20:56:45.782624	2025-11-03 20:56:45.782624	business_advice.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used Oze for business advice for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	business_advice	\N	\N	t	\N	\N
fa390b1c-9cb0-4608-bb18-a28726c08d3f	2025-11-03 20:56:46.024462	2025-11-03 20:56:46.024462	business_advice.tier2_app_engaged.celebrate	You're learning business advice!	Great job {name}! 🎉 As an active Oze user, you're getting smarter about business. You're building skills that help your business grow!	business_advice	\N	\N	t	\N	\N
ed099336-f8d6-43ca-bde2-622cfcf304f3	2025-11-03 20:56:46.234078	2025-11-03 20:56:46.234078	business_advice.tier2_app_engaged.incentive	Keep going with business learning	{name}, you're doing well! Keep learning with Oze and earn 10 GHC in a few weeks. Every lesson helps your business!	business_advice	\N	\N	t	\N	\N
200b47ac-d942-44b3-9b3f-2d30101f4cb6	2025-11-03 20:56:46.469461	2025-11-03 20:56:46.469461	business_advice.tier2_app_engagement_dropoff.how	Quick Oze reminder	Hi {name}, we noticed you stopped using Oze lately. Quick reminders: \n• To get advice: Open Oze → Go to Tips section → Select a topic\n• To learn about customers: Find Marketing lessons\n• To improve sales: Look for Sales Strategy tips\n\nCome back for a refresher!	business_advice	\N	\N	t	\N	\N
9611dfa7-7be1-42ef-bd99-7d52d1598779	2025-11-03 20:56:46.699538	2025-11-03 20:56:46.699538	business_advice.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Oze and earn 10 GHC in a few weeks. Expert business advice helps you sell more and grow your business.	business_advice	\N	\N	t	\N	\N
8ee7a501-2186-470e-a591-5bf00edc9877	2025-11-03 20:56:46.944361	2025-11-03 20:56:46.944361	business_advice.tier2_app_engagement_dropoff.reactivation	Try Oze again?	{name}, you started building good business skills with Oze. Take 2 minutes today to use it again!	business_advice	\N	\N	t	\N	\N
9c29b88b-c462-44aa-893f-6ffc53562bcc	2025-11-03 20:56:47.207176	2025-11-03 20:56:47.207176	business_advice.tier2_app_engagement_dropoff.why	Business advice helps you succeed	{name}, Oze offers valuable guidance: \n• Expert strategies vs. trial and error \n• Learn what works for successful businesses \n• Get answers to business challenges \nYou already know how to use it - try it again!	business_advice	\N	\N	t	\N	\N
cb9ff688-672c-497e-832e-b725b7355bea	2025-11-03 20:56:47.422455	2025-11-03 20:56:47.422455	business_advice.tier2_app_engagement_sustained.celebrate	6 weeks of business learning!	Well done {name}! 🎉 You've used Oze consistently for 6 weeks. You're building strong business knowledge and improving your skills!	business_advice	\N	\N	t	\N	\N
b0cdc9dc-faba-4f8a-9612-495fb7e5e81a	2025-11-03 20:56:47.661633	2025-11-03 20:56:47.661633	business_advice.first_tier2_app_retained.reward	You've earned 10 GHC for your business learning!	Excellent {name}! 🎉 You've used Oze for business advice for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	business_advice	\N	\N	t	\N	\N
8a8fa528-9b7e-4d80-b46f-9615eeae8549	2025-11-03 20:56:47.920536	2025-11-03 20:56:47.920536	business_advice.tier2_app_retained.celebrate	You're a dedicated business learner!	Impressive {name}! 🎉 You've been learning from Oze consistently. You're building business expertise that helps you succeed. Well done!	business_advice	\N	\N	t	\N	\N
119d5388-fadf-43a4-8eb6-ffa989690345	2025-11-03 20:56:48.174282	2025-11-03 20:56:48.174282	business_advice.tier2_app_retained.incentive	Keep your business learning habit going	{name}, your consistent business learning is building valuable skills. You're becoming a smarter business owner. Keep it up!	business_advice	\N	\N	t	\N	\N
355320f9-aca5-4f46-814d-cd465b7e7053	2025-11-03 20:56:48.401452	2025-11-03 20:56:48.401452	business_advice.tier2_app_retention_dropoff.how	Quick Oze reminder	Hi {name}, we noticed you stopped using Oze lately. Quick reminders: \n• To get advice: Open Oze → Go to Tips section → Select a topic\n• To learn something new: Browse different business topics\n• To review lessons: Check your history\n\nCome back for more learning!	business_advice	\N	\N	t	\N	\N
812d595a-a4a5-4b0d-85a7-944ed79ccf21	2025-11-03 20:56:48.635461	2025-11-03 20:56:48.635461	business_advice.tier2_app_retention_dropoff.incentive	Your business knowledge is waiting	{name}, you built great learning habits with Oze. Come back and keep strengthening your business skills.	business_advice	\N	\N	t	\N	\N
1c77c9fb-a1af-488a-8615-60b193f4be59	2025-11-03 20:56:48.846429	2025-11-03 20:56:48.846429	business_advice.tier2_app_retention_dropoff.reactivation	Come back to business learning	{name}, you were doing great with Oze! Use it again today and keep building your business knowledge.	business_advice	\N	\N	t	\N	\N
41fdabbf-cedf-4f4f-b732-9a72d56b59ff	2025-11-03 20:56:49.058405	2025-11-03 20:56:49.058405	business_advice.tier2_app_retention_dropoff.why	Keep your business learning progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your business expertise \n• Competitive advantage \n• Smart decision-making skills \nUse it today to stay on track!	business_advice	\N	\N	t	\N	\N
f2ef1210-b840-4bee-bff6-19e1df7f1b6f	2025-11-03 20:56:49.271496	2025-11-03 20:56:49.271496	farming_inputs.tier1_app_opened_first_time.celebrate	Welcome to GROW for farming inputs!	Great start {name}! 🎉 You've opened GROW for the first time. Work is your most important goal. This is the beginning of something powerful - buying quality farming inputs at better prices. With GROW, you can: \n✓ Buy certified seeds and fertilizer \n✓ Compare prices before purchasing \n✓ Get quality inputs delivered to you \n✓ Avoid fake or expired products \n\nTake the next step: Register your account!	farming_inputs	\N	\N	t	\N	\N
2fbaa2b6-21c8-4d7f-98f2-a0a2ce053fac	2025-11-03 20:56:49.481497	2025-11-03 20:56:49.481497	farming_inputs.tier1_app_adopted.celebrate	You're taking control of your farm inputs!	Well done {name}! 🎉 You're now using GROW to buy farming inputs. You've taken control of your farm's success! By buying quality inputs through your phone, you're: \n✓ Getting certified products you can trust \n✓ Saving money with better prices \n✓ Improving your harvest quality \nKeep going!	farming_inputs	\N	\N	t	\N	\N
02edd1c1-926e-4596-88ab-70423e3c42bd	2025-11-03 20:56:49.703081	2025-11-03 20:56:49.703081	farming_inputs.tier1_app_registered.celebrate	Your farming inputs access is ready!	{name} congratulations on registering with GROW! 🎉 This is a major step forward! With your GROW account you can: \n✓ Browse seeds and fertilizer options \n✓ Compare prices across suppliers \n✓ Order quality inputs for delivery \n✓ Build better, healthier crops \nAll from your phone!	farming_inputs	\N	\N	t	\N	\N
e7bf8ba0-081f-4357-af53-f3ff045a2919	2025-11-03 20:56:49.931561	2025-11-03 20:56:49.931561	farming_inputs.tier1_app_low_activity.how	Get the most from GROW for inputs	Hi {name}, we noticed you haven't used GROW much for buying inputs. Here's how to find and order quality farming supplies: \n1. Open the GROW app\n2. Click on 'Buy Inputs'\n3. Browse categories: seeds, fertilizer, herbicides, pesticides\n4. Select items and add to cart\n5. Complete your order with delivery details	farming_inputs	\N	\N	t	\N	\N
1d05160a-e8dd-4f7f-9a37-5869afa38fcb	2025-11-03 20:56:50.141598	2025-11-03 20:56:50.141598	farming_inputs.tier1_app_low_activity.incentive	Your reward is waiting - start buying quality inputs!	{name}, start using GROW to buy farming inputs and earn a reward of 10 GHC in just three weeks! Every time you buy certified seeds or fertilizer, you're investing in better harvests and protecting yourself from fake products. \nThe sooner you start, the sooner you'll see healthier crops. Order quality inputs today!	farming_inputs	\N	\N	t	\N	\N
1e40130f-60ae-44a1-81e3-099bc7b7126f	2025-11-03 21:00:44.790331	2025-11-03 21:00:44.790331	uniti.goals_setting_started_abandoned.incentive	40 GHC waiting for you!	{name}, you're so close! Selecting your goals brings you one step closer to earning 40 GHC + 1GB data. You started choosing what matters most to you - healthcare, education, finance, or work. Finish selecting your goals in the next 24 hours and claim your reward! Don't miss out on apps that can truly help you achieve your dreams.	uniti_messages	\N	\N	t	\N	\N
85d1b987-4864-4627-b507-518b9235bacf	2025-11-03 20:56:50.389502	2025-11-03 20:56:50.389502	farming_inputs.tier1_app_low_activity.support	Need help buying inputs on GROW?	Hi {name}, need help using GROW for farming inputs? We're here for you! Common questions: \n• How to browse inputs? Open GROW → Click 'Buy Inputs' → Browse categories like seeds, fertilizer, herbicides.\n• How to order? Select items → Add to cart → Click 'Confirm' → Choose delivery date → Enter phone number and address.\n• When do I pay? Payment is made when products are delivered to you.\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	farming_inputs	\N	\N	t	\N	\N
5547b965-ef7e-4cdb-94c5-c19f3514d27e	2025-11-03 20:56:50.599448	2025-11-03 20:56:50.599448	farming_inputs.tier1_app_low_activity.why	Why quality farming inputs matter for your harvest	{name}, we know changing where you buy inputs can feel uncertain. But buying from local shops has real risks: \n• Fake or expired seeds that won't grow properly \n• Wrong fertilizer that wastes your money \n• No guarantee of product quality \n• Limited selection and higher prices \nGROW solves these problems. You get certified products, better prices, and delivery to your location. Other farmers in your area already trust it. Order quality inputs today - your harvest will thank you!	farming_inputs	\N	\N	t	\N	\N
d1125b19-42b0-4c40-a647-eb960d2769ab	2025-11-03 20:56:50.815322	2025-11-03 20:56:50.815322	farming_inputs.first_tier1_app_engaged.reward	3 weeks of smart farming! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using GROW for farming inputs for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - a modern farm with quality inputs and better harvests. Congratulations!	farming_inputs	\N	\N	t	\N	\N
17a9ca36-bde3-4fb0-a21f-ed0a0bae4e97	2025-11-03 20:56:51.041429	2025-11-03 20:56:51.041429	farming_inputs.tier1_app_engaged.celebrate	You're mastering smart input buying!	Excellent work {name}! 🎉 Now that you are an active GROW user for farming inputs you're: \n✓ Buying certified, quality products \n✓ Getting better prices than local shops \n✓ Improving your crop health and yields \n✓ Building a reputation as a smart, modern farmer \nYou're not just buying seeds - you're investing in your farm's future. Keep it up!	farming_inputs	\N	\N	t	\N	\N
88976286-ae2c-44a8-994e-fd25198ed556	2025-11-03 20:56:51.252386	2025-11-03 20:56:51.252386	farming_inputs.tier1_app_engaged.incentive	Keep going - bigger harvests ahead!	{name}, you're doing great with GROW for farming inputs! Keep using it actively and earn 10 GHC in a few weeks. The more you buy quality inputs, the better your harvests become. Keep it up!	farming_inputs	\N	\N	t	\N	\N
783a7721-2840-4540-bfec-f80e41d5f4ee	2025-11-03 20:56:51.485603	2025-11-03 20:56:51.485603	farming_inputs.tier1_app_engagement_dropoff.how	Come back to GROW - we can help!	Hi {name}, we noticed you stopped using GROW for inputs recently. Let's get you back on track! Quick reminders: \n• To browse inputs: Open GROW → 'Buy Inputs' → Browse seeds, fertilizer, pesticides\n• To order: Select items → Add to cart → Confirm → Choose delivery date and location\n• To track orders: Check WhatsApp for order confirmations and delivery updates\n\nWatch the video to learn how to make the most of buying farming inputs.	farming_inputs	\N	\N	t	["https://drive.google.com/file/d/12Y6-dPvIaKfHdh3laxtfQKLwyEPdT4Wb/view?usp=drive_link"]	\N
858487ea-103d-4f6e-87ee-8737addcd892	2025-11-03 20:56:51.824439	2025-11-03 20:56:51.824439	farming_inputs.tier1_app_engagement_dropoff.incentive	Don't lose your quality inputs momentum!	{name}, you were doing so well with GROW! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of buying certified inputs at better prices for healthier crops.	farming_inputs	\N	\N	t	\N	\N
ab8d9553-feb8-4e45-beae-82241e76e2e0	2025-11-03 20:56:52.086499	2025-11-03 20:56:52.086499	farming_inputs.tier1_app_engagement_dropoff.reactivation	GROW misses you - come back today!	{name}, we miss you! You were building something important with GROW: access to quality farming inputs at fair prices. Take 2 minutes today to browse inputs on GROW again and get back on track!	farming_inputs	\N	\N	t	\N	\N
9f0a0a1c-de38-4fd9-ba46-4bb8f628c09d	2025-11-03 20:56:52.326514	2025-11-03 20:56:52.326514	farming_inputs.tier1_app_engagement_dropoff.why	Remember why you started buying inputs through GROW	{name}, going back to buying only from local shops means going back to old problems: \n• Risk of fake seeds - GROW provides certified products \n• Higher prices - GROW offers competitive rates \n• Limited selection - GROW connects you to multiple suppliers \nYou already learned how to order quality inputs. Don't give up the better harvests and savings you worked for. Your next planting season will thank you!	farming_inputs	\N	\N	t	\N	\N
a031d507-a7f1-4137-9e22-d201cee66013	2025-11-03 20:56:52.549522	2025-11-03 20:56:52.549522	farming_inputs.tier1_app_engagement_sustained.celebrate	You're a consistent GROW inputs user!	Fantastic {name}! 🎉 You've maintained active farming inputs buying for 6 weeks. This isn't luck - this is YOU investing in your farm's success! You've proven that: \n✓ You can buy certified, quality products \n✓ You can save money with better prices \n✓ You're ready for even better harvests \n✓ You're building your farming excellence \nYou're thriving and you're an example to other farmers. Congratulations!	farming_inputs	\N	\N	t	\N	\N
eb68d049-390d-4ed1-8713-8000f7e627ca	2025-11-03 20:56:52.779536	2025-11-03 20:56:52.779536	farming_inputs.first_tier1_app_retained.reward	9 weeks of quality inputs! Collect your reward.	Exceptional achievement {name}! 🎉 You've used GROW for farming inputs actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced modern farming with quality inputs. Amazing!	farming_inputs	\N	\N	t	\N	\N
a4f7f3cb-7476-4799-9935-9636a7dacc2f	2025-11-03 20:56:52.993427	2025-11-03 20:56:52.993427	farming_inputs.tier1_app_retained.celebrate	You're a farming inputs expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term GROW user for farming inputs. Look at what you've achieved: \n✓ 9+ weeks of consistent quality input buying \n✓ Better harvests than ever before \n✓ Strong knowledge of what works best for your farm \n✓ Confidence using digital tools for farming supplies \nCongratulations!	farming_inputs	\N	\N	t	\N	\N
4f7a14eb-074a-46c3-9400-42eed28df12c	2025-11-03 20:56:53.243747	2025-11-03 20:56:53.243747	farming_inputs.tier1_app_retained.incentive	You're building real farming success	{name}, you've proven you can buy quality inputs digitally for 9+ weeks. This consistency is paying off: your crops are healthier, you're saving money, and you're protecting your investment in every planting season. The longer you keep going, the more your farm thrives. Your farming future is in your hands!	farming_inputs	\N	\N	t	\N	\N
558803ee-955e-4cef-8453-dbbc4c42feb7	2025-11-03 20:56:53.473557	2025-11-03 20:56:53.473557	farming_inputs.tier1_app_retention_dropoff.how	Let's solve your GROW inputs issue	Hi {name}, you were such a consistent GROW user for farming inputs! We noticed you haven't been active lately. Let's fix any issues: \n• To browse inputs: Open GROW → 'Buy Inputs' → Browse categories\n• To order: Select items → Add to cart → Confirm → Enter delivery details\n• To track orders: Check WhatsApp notifications for order status\n• To contact support: Click [HELP] button if you have questions\n\nWatch the video to learn how to make the most of buying farming inputs.	farming_inputs	\N	\N	t	["https://drive.google.com/file/d/12Y6-dPvIaKfHdh3laxtfQKLwyEPdT4Wb/view?usp=drive_link"]	\N
af50b3c0-145f-4926-89db-05aa7c6721d7	2025-11-03 20:56:53.706461	2025-11-03 20:56:53.706461	farming_inputs.tier1_app_retention_dropoff.incentive	Your quality inputs access is too valuable to lose	{name}, every week of buying quality inputs through GROW adds up to better harvests and farm success. By stopping now, you risk going back to uncertain product quality and higher prices. Order inputs on GROW this week and keep your farm thriving!	farming_inputs	\N	\N	t	\N	\N
95558984-b21d-4a8c-b0a0-bcd21ff1da09	2025-11-03 20:56:53.921433	2025-11-03 20:56:53.921433	farming_inputs.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a smart farming champion	{name}, we miss you! Your consistent use of GROW for inputs provided quality products and better prices for your farm. Make sure you don't let this slip away. Take 2 minutes today to browse farming inputs on GROW again and get back on track!	farming_inputs	\N	\N	t	\N	\N
34025159-cd58-462a-aec6-c7811743a20c	2025-11-03 20:56:54.128377	2025-11-03 20:56:54.128377	farming_inputs.tier1_app_retention_dropoff.why	Why your quality inputs track record matters	{name}, you spent many weeks building smart input buying habits. Here's what you lose by stopping: \n• Quality guarantee: Back to risking fake or expired products \n• Better prices: Back to paying higher rates at local shops \n• Farm success: Back to uncertain input quality affecting your harvests \n\nYou worked hard to become a farmer who invests in quality. Make sure that you continue to protect your farm with certified inputs. Take two minutes today to use GROW and get back on track.	farming_inputs	\N	\N	t	\N	\N
01a0f8a7-6db8-440f-9b43-6c8ac74017ee	2025-11-03 20:56:54.338567	2025-11-03 20:56:54.338567	farming_inputs.tier2_app_opened_first_time.celebrate	Welcome to GROW for farming inputs!	Great start {name}! 🎉 You've opened GROW for the first time. Work is your second most important goal. This is the beginning of something powerful - buying quality farming inputs at better prices. With GROW, you can: \n✓ Buy certified seeds and fertilizer \n✓ Compare prices before purchasing \n✓ Get quality inputs delivered to you \n✓ Avoid fake or expired products \n\nTake the next step: Register your account!	farming_inputs	\N	\N	t	\N	\N
9734666e-a0a2-4d37-a865-e1738d33baf2	2025-11-03 20:56:54.54962	2025-11-03 20:56:54.54962	farming_inputs.tier2_app_adopted.celebrate	You're taking control of your farm inputs!	Well done {name}! 🎉 You're now using GROW to buy farming inputs. You've taken control of your input quality!	farming_inputs	\N	\N	t	\N	\N
d6e9a071-b4bb-4427-963b-48b7df3b1e8c	2025-11-03 20:56:54.747358	2025-11-03 20:56:54.747358	farming_inputs.tier2_app_registered.celebrate	Your farming inputs access is ready!	{name} congratulations on registering with GROW! 🎉 This is a major step forward! With your GROW account you can: \n✓ Browse seeds and fertilizer \n✓ Compare prices \n✓ Order quality inputs \n✓ Build better crops \nAll from your phone!	farming_inputs	\N	\N	t	\N	\N
72ea080f-5873-4653-b525-43646283d033	2025-11-03 20:56:54.949666	2025-11-03 20:56:54.949666	farming_inputs.tier2_app_low_activity.how	Quick tips for buying inputs on GROW	Hi {name}, we noticed you haven't used GROW much for inputs. Ready to try it? Here's a quick start: \n1. Open GROW and browse farming inputs\n2. Try ordering one item like seeds or fertilizer\n3. See the quality difference for yourself \nStart small until you're comfortable!	farming_inputs	\N	\N	t	\N	\N
1725a7bb-791a-498b-ba79-2f6e13aa6826	2025-11-03 20:56:55.18943	2025-11-03 20:56:55.18943	farming_inputs.tier2_app_low_activity.incentive	Try GROW for farming inputs	{name}, start buying quality farming inputs on GROW and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll see healthier crops and better harvests.	farming_inputs	\N	\N	t	\N	\N
e3f17bd2-1fae-4341-b421-37c147503efc	2025-11-03 20:56:55.401575	2025-11-03 20:56:55.401575	farming_inputs.tier2_app_low_activity.support	Need help with GROW for inputs?	Hi {name}, need help buying farming inputs on GROW? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	farming_inputs	\N	\N	t	\N	\N
faac7ab2-be35-49f1-99bb-0c49ae3e1f48	2025-11-03 20:56:55.623303	2025-11-03 20:56:55.623303	farming_inputs.tier2_app_low_activity.why	Quality inputs make farming better	{name}, GROW offers real benefits for your farm: \n• Get certified seeds and fertilizer \n• Better prices than local shops \n• Products delivered to you \nGive it a try - many farmers in your area already use it!	farming_inputs	\N	\N	t	\N	\N
8a19a9fa-d2e1-4a69-8918-1dab0350ead4	2025-11-03 20:56:55.864606	2025-11-03 20:56:55.864606	farming_inputs.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used GROW for farming inputs for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	farming_inputs	\N	\N	t	\N	\N
9405587e-8c6f-4fed-a5e6-aa6e626e70f9	2025-11-03 20:56:56.138359	2025-11-03 20:56:56.138359	farming_inputs.tier2_app_engaged.celebrate	You're buying quality inputs!	Great job {name}! 🎉 As an active GROW user for inputs, you're getting certified products at better prices. You're building good farming habits!	farming_inputs	\N	\N	t	\N	\N
a4477673-0915-49de-a3c5-c82d53bf4cbd	2025-11-03 20:56:56.349498	2025-11-03 20:56:56.349498	farming_inputs.tier2_app_engaged.incentive	Keep going with GROW for inputs	{name}, you're doing well! Keep buying quality farming inputs and earn 10 GHC in a few weeks. Every purchase supports better harvests!	farming_inputs	\N	\N	t	\N	\N
b5c24ed9-51eb-43b0-b9c1-0074549632d0	2025-11-03 20:56:56.568527	2025-11-03 20:56:56.568527	farming_inputs.tier2_app_engagement_dropoff.how	Quick GROW inputs reminder	Hi {name}, we noticed that you stopped using GROW for inputs lately. Quick reminders: \n• To browse: Open GROW → 'Buy Inputs' → Browse seeds, fertilizer, pesticides\n• To order: Select items → Add to cart → Confirm → Enter delivery details\n• To track: Check WhatsApp for delivery updates\n\nWatch the video for a refresher.	farming_inputs	\N	\N	t	["https://drive.google.com/file/d/12Y6-dPvIaKfHdh3laxtfQKLwyEPdT4Wb/view?usp=drive_link"]	\N
14907988-c85f-47a3-9b37-20c294cea2f1	2025-11-03 20:56:56.792514	2025-11-03 20:56:56.792514	farming_inputs.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to GROW for inputs and earn 10 GHC in a few weeks. It provides quality products, better prices, and helps your crops grow healthier.	farming_inputs	\N	\N	t	\N	\N
4eabe967-ff1d-49dd-92d9-7020fa00332a	2025-11-03 20:56:57.03152	2025-11-03 20:56:57.03152	farming_inputs.tier2_app_engagement_dropoff.reactivation	Try GROW for inputs again?	{name}, you started building good input buying habits with GROW. Take 2 minutes today to browse farming supplies again!	farming_inputs	\N	\N	t	\N	\N
1d557642-25ce-4ba5-83bd-d80e9ce2ccbe	2025-11-03 20:56:57.270564	2025-11-03 20:56:57.270564	farming_inputs.tier2_app_engagement_dropoff.why	Quality inputs are essential	{name}, GROW offers better farming: \n• Certified products vs. risk of fakes \n• Better prices and delivered to you \n• Healthier crops and better yields \nYou already know how to use it - try it again!	farming_inputs	\N	\N	t	\N	\N
cad3db9b-35d8-4177-9409-23f230952791	2025-11-03 20:56:57.506454	2025-11-03 20:56:57.506454	farming_inputs.tier2_app_engagement_sustained.celebrate	6 weeks of quality input buying!	Well done {name}! 🎉 You've used GROW for farming inputs consistently for 6 weeks. You're investing wisely in your farm and seeing the results!	farming_inputs	\N	\N	t	\N	\N
be96967c-6710-4666-95e3-302d7937bfc9	2025-11-03 20:56:57.749803	2025-11-03 20:56:57.749803	farming_inputs.first_tier2_app_retained.reward	You've earned 10 GHC for consistent input buying!	Excellent {name}! 🎉 You've used GROW for farming inputs for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	farming_inputs	\N	\N	t	\N	\N
b1d41fda-9a5f-4630-91dc-d3fe481f3bfa	2025-11-03 20:56:57.990534	2025-11-03 20:56:57.990534	farming_inputs.tier2_app_retained.celebrate	You're a GROW inputs user!	Impressive {name}! 🎉 You've been buying quality farming inputs consistently. You're protecting your farm and building better harvests. Well done!	farming_inputs	\N	\N	t	\N	\N
1c5d12fc-ef78-4540-a843-d4a42d6792f9	2025-11-03 20:56:58.24151	2025-11-03 20:56:58.24151	farming_inputs.tier2_app_retained.incentive	Keep your quality inputs habit going	{name}, your consistent input buying through GROW is turning into valuable farming habits. Your crops are healthier and your farm is thriving. Keep it up!	farming_inputs	\N	\N	t	\N	\N
491119d8-70ce-4241-9fca-65895f8c08ee	2025-11-03 20:56:58.498568	2025-11-03 20:56:58.498568	farming_inputs.tier2_app_retention_dropoff.how	Quick GROW inputs reminder	Hi {name}, we noticed that you stopped using GROW for inputs lately. Quick reminders: \n• To browse: Open GROW → 'Buy Inputs' → Browse categories\n• To order: Select items → Add to cart → Confirm order\n• To track: Check WhatsApp notifications\n\nWatch the video for a refresher.	farming_inputs	\N	\N	t	["https://drive.google.com/file/d/12Y6-dPvIaKfHdh3laxtfQKLwyEPdT4Wb/view?usp=drive_link"]	\N
3dbafe52-d395-48c3-8944-409a98b6910a	2025-11-03 20:56:58.746437	2025-11-03 20:56:58.746437	farming_inputs.tier2_app_retention_dropoff.incentive	Your quality inputs access is waiting	{name}, you built great habits buying quality inputs. Come back and keep strengthening your farm with certified products.	farming_inputs	\N	\N	t	\N	\N
7033de41-7447-470c-a591-2ab874dfb400	2025-11-03 20:56:58.965499	2025-11-03 20:56:58.965499	farming_inputs.tier2_app_retention_dropoff.reactivation	Come back to GROW for inputs	{name}, you were doing great buying quality farming inputs! Use it again today and keep your farming habits strong.	farming_inputs	\N	\N	t	\N	\N
6ef2ee25-4778-42e9-9285-b0d4dbdb4bb9	2025-11-03 20:56:59.257402	2025-11-03 20:56:59.257402	farming_inputs.tier2_app_retention_dropoff.why	Keep your farming progress	{name}, you built weeks of smart input buying habits. Keep going to maintain: \n• Access to certified products \n• Better prices than local shops \n• Healthier crops and better yields \nUse it today to stay on track!	farming_inputs	\N	\N	t	\N	\N
07ae8574-80bd-4283-99c5-8bda0eeb5425	2025-11-03 20:56:59.47951	2025-11-03 20:56:59.47951	financial_management.tier1_app_opened_first_time.celebrate	Welcome to financial management!	Great start {name}! 🎉 You've opened your financial management app for the first time. Finance is your most important goal. This is the beginning of taking control of your money. With financial management, you can: \n✓ Track your income and expenses\n✓ See where your money goes \n✓ Plan ahead for important needs \n✓ Build good money habits \nTake the next step: Register your account!	financial_management	\N	\N	t	\N	\N
1bf17f89-9e41-49b2-9576-75878e9d5445	2025-11-03 20:56:59.698651	2025-11-03 20:56:59.698651	financial_management.tier1_app_adopted.celebrate	You're taking control of your finances!	Well done {name}! 🎉  You've started taking control of your money! By tracking your income and expenses, you're: \n✓ Gaining clarity on your spending \n✓ Making smarter money decisions \n✓ Building financial awareness \nKeep going!	financial_management	\N	\N	t	\N	\N
5d9ef68a-d192-4a9d-9cd9-396558c31b47	2025-11-03 20:56:59.94551	2025-11-03 20:56:59.94551	financial_management.tier1_app_registered.celebrate	Your financial tracker is ready!	{name} congratulations on registering for financial management! 🎉 This is a major step forward! With your account you can: \n✓ Track daily income and expenses \n✓ See spending patterns \n✓ Plan for goals \n✓ Build better money habits \nAll from your phone!	financial_management	\N	\N	t	\N	\N
79a0c121-ac9a-438b-a163-31214966b9cb	2025-11-03 20:57:00.168779	2025-11-03 20:57:00.168779	financial_management.tier1_app_low_activity.how	Get the most from your financial tracker	Hi {name}, we noticed you haven't used your financial management app much. It's easy to get started! Here's how: \n1. Open your financial management app \n2. Record an income or small expense - even just 5 GHC \n3. Check your daily or weekly summary \n4. Set a simple savings goal \nStart with small steps until you feel comfortable. Once you try it, you'll see how it helps you stay in control!	financial_management	\N	\N	t	\N	\N
82053243-95c8-43c6-b4d4-4b914f801823	2025-11-03 20:57:00.388543	2025-11-03 20:57:00.388543	financial_management.tier1_app_low_activity.incentive	Your reward is waiting - start tracking your money!	{name}, start using your financial management app actively and earn a reward of 10 GHC in just three weeks! Every transaction you track helps you understand where your money goes and plan better for your goals. The sooner you start, the sooner you'll have full control of your finances. Try tracking one expense today!	financial_management	\N	\N	t	\N	\N
a6a78136-ef8f-4dbb-a68c-0ae9e778d686	2025-11-03 20:57:00.640871	2025-11-03 20:57:00.640871	financial_management.tier1_app_low_activity.support	Need help with financial management?	Hi {name}, need help using your financial management app? We're here for you! Common questions: \n• How to track expenses? Tap on ‘Transaction’ → ‘Expense’ → ‘Add Manually’ → Enter the name, category, and cost price → Select the payment option and save.\n• How to track sales? Tap on ‘App transaction’ → ‘Sale’ → ‘Add Manually’ → Add the name, category and selling price → Choose payment method and save. \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	financial_management	\N	\N	t	\N	\N
910cb013-2365-40f5-87cf-eb405ff3792d	2025-11-03 20:57:00.859876	2025-11-03 20:57:00.859876	financial_management.tier1_app_low_activity.why	Why financial management matters for your success	{name}, we know tracking money takes effort. But not knowing where money goes has real costs: \n• Money disappears without knowing why \n• Hard to save for important goals \n• Difficult to plan for emergencies \n• Easy to overspend on small things \nFinancial management solves these problems. You'll see clearly where your money comes from and where it goes. Others in your community who track their money report feeling more in control and less stressed. Take the first step today - you'll be glad you did!	financial_management	\N	\N	t	\N	\N
2a45923d-040d-4a0a-8d97-69d615a95212	2025-11-03 20:57:01.101535	2025-11-03 20:57:01.101535	financial_management.first_tier1_app_engaged.reward	3 weeks of financial management! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively managing your finances for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! You're building something powerful - financial awareness and control. Congratulations!	financial_management	\N	\N	t	\N	\N
d235df83-84ce-40f2-8d6d-5b0cde3c921c	2025-11-03 20:57:01.302611	2025-11-03 20:57:01.302611	financial_management.tier1_app_engaged.celebrate	You're mastering financial management!	Excellent work {name}! 🎉 As an active financial managemer you're: \n✓ Understanding your money patterns \n✓ Making informed spending decisions \n✓ Planning better for your goals \n✓ Building the foundation for financial success \nYou're not just tracking money - you're building your financial future. Keep it up!	financial_management	\N	\N	t	\N	\N
040ed699-0ec5-41ca-88bc-c1bf48bc73d1	2025-11-03 20:57:01.522495	2025-11-03 20:57:01.522495	financial_management.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with financial management! Keep using it actively and earn 10 GHC in a few weeks. The more you track, the more control you have. The more control you have, the better you can save and plan for what matters most to you. Keep it up!	financial_management	\N	\N	t	\N	\N
200a6dbb-9f9b-4f8d-ba97-bd77a45bd4c0	2025-11-03 21:00:58.459328	2025-11-03 21:00:58.459328	women_child_health.tier1_app_low_activity.how	Get the most from Bebbo	Hi {name}, we noticed you haven't used your Bebbo app much. It's easy to get started! Here's how: \n1. Open the Bebbo app \n2. Click to read articles on topics like feeding, keeping safe, and staying healthy \n3. Watch videos on child development \n4. Try games and activities with your children \n5. Track their development milestones \nStart exploring today! Once you try it, you'll see how it helps you raise a healthy and smart child.	women_child_health	\N	\N	t	["https://drive.google.com/file/d/1Ik6as0gK9Q4v8Rtc9eVaFOSSAb_Cgw2M/view?usp=drive_link"]	\N
009439df-3ce8-4d08-8760-c51f0391e1a9	2025-11-03 20:57:01.737397	2025-11-03 20:57:01.737397	financial_management.tier1_app_engagement_dropoff.how	Come back to financial management - we can help!	Hi {name}, we noticed you stopped tracking your finances recently. Let's get you back on track! Quick reminders: \n• To track expenses: Tap on ‘Transaction’ → ‘Expense’ → ‘Add Manually’ → Enter the name, category, and cost price → Select the payment option and save.\n• To track sales: Tap on ‘App transaction’ → ‘Sale’ → ‘Add Manually’ → Add the name, category and selling price → Choose payment method and save. \n\nWatch the video to learn how to make the most of financial management.	financial_management	\N	\N	t	["https://drive.google.com/file/d/13Txm22A7RqMrRprO3err4tF6Y-FrmHiJ/view?usp=drive_link"]	\N
13582dc1-8962-40f6-aee9-692d11ea7294	2025-11-03 20:57:01.965391	2025-11-03 20:57:01.965391	financial_management.tier1_app_engagement_dropoff.incentive	Don't lose your financial management momentum!	{name}, you were doing so well tracking your money! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of knowing where every cedi goes and having control over your finances.	financial_management	\N	\N	t	\N	\N
84e48ad7-46e6-4a8c-9154-f4ca28e77999	2025-11-03 20:57:02.19557	2025-11-03 20:57:02.19557	financial_management.tier1_app_engagement_dropoff.reactivation	Your financial tracker misses you - come back today!	{name}, we miss you! You were building something important with financial management: clarity and control over your money. Take 2 minutes today to track one expense or income and get back on track!	financial_management	\N	\N	t	\N	\N
6f14444e-3e10-4d13-b7d6-6553dc27983c	2025-11-03 20:57:02.41953	2025-11-03 20:57:02.41953	financial_management.tier1_app_engagement_dropoff.why	Remember why you started tracking your money	{name}, going back to not tracking means going back to old problems: \n• Uncertainty: Not knowing where money goes - financial tracking shows you clearly \n• Lost opportunities: Missing chances to save - tracking helps you find savings \n• No planning: Reacting to needs instead of planning ahead - tracking enables planning \nYou already learned how to track your finances. Don't give up the clarity and control you worked for. Your future self will thank you!	financial_management	\N	\N	t	\N	\N
d91fb8f6-82f0-4d40-807b-305ee6b04d2c	2025-11-03 20:57:02.629703	2025-11-03 20:57:02.629703	financial_management.tier1_app_engagement_sustained.celebrate	You're a consistent financial tracker!	Fantastic {name}! 🎉 You've maintained active financial management for 6 weeks. This isn't luck - this is YOU taking control of your financial life! You've proven that: \n✓ You can track money consistently \n✓ You understand your spending patterns \n✓ You're ready to achieve bigger financial goals \n✓ You're securing your financial future \nYou're thriving and you're an example to others. Congratulations!	financial_management	\N	\N	t	\N	\N
b9176ba4-0c27-45c0-8ad6-c67ca9bec3ca	2025-11-03 20:57:02.866607	2025-11-03 20:57:02.866607	financial_management.first_tier1_app_retained.reward	9 weeks of financial management! Collect your reward.	Exceptional achievement {name}! 🎉 You've tracked your finances actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! This is remarkable. You've fully embraced financial awareness and control. Amazing!	financial_management	\N	\N	t	\N	\N
eb9e6118-9af6-4c84-ad4d-ae8a9c742210	2025-11-03 20:57:03.085358	2025-11-03 20:57:03.085358	financial_management.tier1_app_retained.celebrate	You're a financial management expert now. Congratulations!	Incredible {name}! 🎉 Look at what you've achieved by actively managing your finances: \n✓ 9+ weeks of consistent money tracking \n✓ Complete understanding of your financial patterns \n✓ The foundation for achieving your biggest goals \n✓ Confidence in managing your finances \nCongratulations!	financial_management	\N	\N	t	\N	\N
eb5ac199-e7fc-48a7-89b2-5b1db918cbdd	2025-11-03 20:57:03.372625	2025-11-03 20:57:03.372625	financial_management.tier1_app_retained.incentive	You're building real financial power	{name}, you've proven you can track your money consistently for 9+ weeks. This discipline is opening doors: you can now save with purpose, plan with confidence, and achieve goals that once seemed impossible. The longer you keep going, the more opportunities become available to you. Your financial future is in your hands!	financial_management	\N	\N	t	\N	\N
9d1c85ff-6d4e-4002-8721-ce66b508f3de	2025-11-03 20:57:03.581553	2025-11-03 20:57:03.581553	financial_management.tier1_app_retention_dropoff.how	Let's solve your financial management issue	Hi {name}, you were such a consistent financial tracker! We noticed you haven't been active lately. Let's fix any issues: \n• To track expenses: Tap on ‘Transaction’ → ‘Expense’ → ‘Add Manually’ → Enter the name, category, and cost price → Select the payment option and save.\n• To track sales: Tap on ‘App transaction’ → ‘Sale’ → ‘Add Manually’ → Add the name, category and selling price → Choose payment method and save. \n\nWatch the video to learn how to make the most of financial management.	financial_management	\N	\N	t	["https://drive.google.com/file/d/13Txm22A7RqMrRprO3err4tF6Y-FrmHiJ/view?usp=drive_link"]	\N
646f2fa2-475e-40a5-b625-b3dc33b07556	2025-11-03 20:57:03.789377	2025-11-03 20:57:03.789377	financial_management.tier1_app_retention_dropoff.incentive	Your financial awareness is too valuable to lose	{name}, every week of tracking you've built adds to your financial knowledge. By stopping now, you lose the insights that help you make better money decisions. Track your finances this week and keep your financial power strong!	financial_management	\N	\N	t	\N	\N
450f3589-ec6e-456f-8dec-9e97545566d5	2025-11-03 20:57:04.025619	2025-11-03 20:57:04.025619	financial_management.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a financial management champion	{name}, we miss you! Your consistent tracking provided clarity and control over your money. Make sure you don't let this slip away. Take 2 minutes today to track one expense and get back on track!	financial_management	\N	\N	t	\N	\N
f269ed2e-7996-4bc6-be01-025b0b5638a7	2025-11-03 20:57:04.261506	2025-11-03 20:57:04.261506	financial_management.tier1_app_retention_dropoff.why	Why your financial tracking record matters	{name}, you spent many weeks building financial awareness. Here's what you lose by stopping: \n• Clarity: Back to not knowing where money goes \n• Control: Back to reacting instead of planning \n• Progress: Losing the foundation for achieving your goals \nYou worked hard to become a financial management expert. Make sure that you continue to use this expertise to achieve your financial goals. Take two minutes today to track your money and get back on track.	financial_management	\N	\N	t	\N	\N
bb21963a-17a4-44e7-9e20-42685d749ad8	2025-11-03 20:57:04.461031	2025-11-03 20:57:04.461031	financial_management.tier2_app_opened_first_time.celebrate	Welcome to financial management!	Great start {name}! 🎉 You've opened your financial management app for the first time. Finance is your second most important goal. This is the beginning of taking control of your money. With financial management, you can: \n✓ Track your income and expenses \n✓ See where your money goes \n✓ Plan for important needs \n✓ Build good money habits \nTake the next step: Register your account!	financial_management	\N	\N	t	\N	\N
dd778bce-f367-4580-ac11-aaa070f3386e	2025-11-03 20:57:04.665485	2025-11-03 20:57:04.665485	financial_management.tier2_app_adopted.celebrate	You're taking control of your finances!	Well done {name}! 🎉 You’re now managing your finances. You've started gaining control over your money!	financial_management	\N	\N	t	\N	\N
519e81bc-5b5a-41cd-9714-3df5edfd8190	2025-11-03 20:57:04.867477	2025-11-03 20:57:04.867477	financial_management.tier2_app_registered.celebrate	Your financial tracker is ready!	{name} congratulations on registering for financial management! 🎉 This is a major step forward! With your account you can: \n✓ Track income and expenses \n✓ See spending patterns \n✓ Plan for goals \n✓ Build better habits \nAll from your phone!	financial_management	\N	\N	t	\N	\N
416c5a06-0373-4d33-a748-2bfaeb5e7b15	2025-11-03 20:57:05.082693	2025-11-03 20:57:05.082693	financial_management.tier2_app_low_activity.how	Quick tips for financial management	Hi {name}, we noticed you haven't used your financial management app much. Ready to try it? Here's a quick start: \n1. Open your app and record one expense \n2. Check your daily summary \n3. Try tracking for one week \nStart small until you're comfortable!	financial_management	\N	\N	t	\N	\N
4d173b92-36a1-45bd-808b-4360c8c4acb3	2025-11-03 20:57:05.284564	2025-11-03 20:57:05.284564	financial_management.tier2_app_low_activity.incentive	Try financial management	{name}, start using your financial management app and earn a reward of 10 GHC in just three weeks. The sooner you start tracking, the sooner you'll have control over your money.	financial_management	\N	\N	t	\N	\N
f75aafd6-c5f1-4beb-9d8e-31417e0bec51	2025-11-03 20:57:05.498454	2025-11-03 20:57:05.498454	financial_management.tier2_app_low_activity.support	Need help with financial management?	Hi {name}, need help using your financial management app? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	financial_management	\N	\N	t	\N	\N
c3443ef7-d506-4435-a5c0-2040da509c52	2025-11-03 20:57:05.707434	2025-11-03 20:57:05.707434	financial_management.tier2_app_low_activity.why	Financial management helps you succeed	{name}, financial management offers real benefits: \n• See clearly where your money goes \n• Make better spending decisions \n• Plan for important goals \nGive it a try - many in your community already use it!	financial_management	\N	\N	t	\N	\N
31dc536c-7f54-4eb5-bbf5-a7f365d6cb62	2025-11-03 20:57:05.922526	2025-11-03 20:57:05.922526	financial_management.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've tracked your finances for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	financial_management	\N	\N	t	\N	\N
a3d36870-9abb-42ea-9f22-66cde438b042	2025-11-03 20:57:06.131544	2025-11-03 20:57:06.131544	financial_management.tier2_app_engaged.celebrate	You're tracking your money!	Great job {name}! 🎉 By actively managing your finances, you’re gaining clarity on your spending and building better money habits!	financial_management	\N	\N	t	\N	\N
fb0fe6b1-1131-4239-8a92-cb598f030a3c	2025-11-03 20:57:06.344471	2025-11-03 20:57:06.344471	financial_management.tier2_app_engaged.incentive	Keep going with financial management	{name}, you're doing well! Keep tracking your finances and earn 10 GHC in a few weeks. Every record counts!	financial_management	\N	\N	t	\N	\N
fe3fd567-dee6-4227-b15a-4fd89b6a05d5	2025-11-03 20:57:06.636407	2025-11-03 20:57:06.636407	financial_management.tier2_app_engagement_dropoff.how	Quick financial management reminder	Hi {name}, we noticed that you stopped tracking lately. Quick reminders: \n• To track expenses: Tap on ‘Transaction’ → ‘Expense’ → ‘Add Manually’ → Enter the name, category, and cost price → Select the payment option and save.\n• To track sales: Tap on ‘App transaction’ → ‘Sale’ → ‘Add Manually’ → Add the name, category and selling price → Choose payment method and save. \n\nWatch the video for a refresher.	financial_management	\N	\N	t	["https://drive.google.com/file/d/13Txm22A7RqMrRprO3err4tF6Y-FrmHiJ/view?usp=drive_link"]	\N
f5c42572-64d8-45da-aa0e-c9256f24af34	2025-11-03 20:57:06.863082	2025-11-03 20:57:06.863082	financial_management.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to financial management and earn 10 GHC in a few weeks. It helps you understand your spending and plan better.	financial_management	\N	\N	t	\N	\N
3b6db90d-6215-4321-8c4b-b0395a53a2d5	2025-11-03 20:57:07.078433	2025-11-03 20:57:07.078433	financial_management.tier2_app_engagement_dropoff.reactivation	Try financial management again?	{name}, you started building good financial habits. Take 2 minutes today to track one expense!	financial_management	\N	\N	t	\N	\N
c941acb7-5e36-4898-b1ca-a95d730c8f1f	2025-11-03 20:57:07.300564	2025-11-03 20:57:07.300564	financial_management.tier2_app_engagement_dropoff.why	Financial management gives you control	{name}, financial management offers clarity and control: \n• See where money goes vs. guessing \n• Plan ahead instead of reacting \n• Build awareness of spending patterns \nYou already know how to use it - try it again!	financial_management	\N	\N	t	\N	\N
a8bce2c5-8325-441c-81d4-939b511a87a2	2025-11-03 20:57:07.510744	2025-11-03 20:57:07.510744	financial_management.tier2_app_engagement_sustained.celebrate	6 weeks of financial tracking!	Well done {name}! 🎉 You've tracked your finances consistently for 6 weeks. You're building good money management habits!	financial_management	\N	\N	t	\N	\N
771a735a-940f-4743-a843-ad367b9fb8f5	2025-11-03 20:57:07.741435	2025-11-03 20:57:07.741435	financial_management.first_tier2_app_retained.reward	You've earned 10 GHC for consistency!	Excellent {name}! 🎉 You've tracked your finances for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	financial_management	\N	\N	t	\N	\N
7c76be69-ca25-456b-a3f5-842cf0a7c4ef	2025-11-03 20:57:07.979446	2025-11-03 20:57:07.979446	financial_management.tier2_app_retained.celebrate	You're a financial tracker!	Impressive {name}! 🎉 You've been tracking your finances consistently. You have clarity on your spending and you're building strong money management habits. Well done!	financial_management	\N	\N	t	\N	\N
ea97a1ff-3f41-4a73-8016-f87ff78dceda	2025-11-03 20:57:08.192551	2025-11-03 20:57:08.192551	financial_management.tier2_app_retained.incentive	Keep your tracking habit going	{name}, your consistent tracking is building valuable financial awareness. You understand your money better now. Keep it up!	financial_management	\N	\N	t	\N	\N
b38c5994-fae8-4877-9ab7-f43c53ef6bb7	2025-11-03 20:57:08.408484	2025-11-03 20:57:08.408484	financial_management.tier2_app_retention_dropoff.how	Quick financial management reminder	Hi {name}, we noticed that you stopped tracking lately. Quick reminders: \n• To track expenses: Tap on ‘Transaction’ → ‘Expense’ → ‘Add Manually’ → Enter the name, category, and cost price → Select the payment option and save.\n• To track sales: Tap on ‘App transaction’ → ‘Sale’ → ‘Add Manually’ → Add the name, category and selling price → Choose payment method and save. \n\nWatch the video for a refresher.	financial_management	\N	\N	t	["https://drive.google.com/file/d/13Txm22A7RqMrRprO3err4tF6Y-FrmHiJ/view?usp=drive_link"]	\N
b67319fd-ebb1-460e-afa1-5c8ac0d8a6f0	2025-11-03 20:57:08.649394	2025-11-03 20:57:08.649394	financial_management.tier2_app_retention_dropoff.incentive	Your tracking is waiting	{name}, you built great tracking habits. Come back and keep building your financial awareness.	financial_management	\N	\N	t	\N	\N
a697b494-8cbe-44c0-b95d-031a4d810a13	2025-11-03 20:57:08.860594	2025-11-03 20:57:08.860594	financial_management.tier2_app_retention_dropoff.reactivation	Come back to financial management	{name}, you were doing great tracking your money! Use it again today and keep your financial habits strong.	financial_management	\N	\N	t	\N	\N
2fac068f-4f20-49c4-8671-1759e1a69c89	2025-11-03 20:57:09.082544	2025-11-03 20:57:09.082544	financial_management.tier2_app_retention_dropoff.why	Keep your financial progress	{name}, you built weeks of good tracking habits. Keep going to maintain: \n• Clarity on spending \n• Better planning ability \n• Strong money awareness \nTrack one expense today to stay on track!	financial_management	\N	\N	t	\N	\N
ea7f7c7c-f736-4599-8eb7-396a188a375e	2025-11-03 20:57:09.300515	2025-11-03 20:57:09.300515	health_access.tier1_app_opened_first_time.celebrate	Welcome to Ghinger Health!	Great start {name}! 🎉 You've opened Ghinger Health for the first time. Health is your most important goal. This is the beginning of something powerful - healthcare from the comfort of your home. With Ghinger Health, you can:\n✓ Talk to qualified doctors anytime\n✓ Get medical advice without traveling to the clinic\n✓ Save time and transport costs\n✓ Keep your family healthy and safe\n\nTake the next step: Register your account!	health_access	\N	\N	t	\N	\N
84da0c1f-f2c3-44cb-9ba2-8b444846f820	2025-11-03 20:57:09.541605	2025-11-03 20:57:09.541605	health_access.tier1_app_adopted.celebrate	You're taking charge of your health!	Well done {name}! 🎉 You're now using Ghinger Health. You've taken control of your family's healthcare! By consulting doctors from your phone instead of traveling to the clinic, you're:\n✓ Getting professional medical care instantly\n✓ Saving time and transport money\n✓ Protecting your family from clinic exposure\n✓ Managing health issues before they become serious\nKeep going!	health_access	\N	\N	t	\N	\N
63f2905d-93d3-4aea-a39a-d3cb0cb8349c	2025-11-03 20:57:09.772409	2025-11-03 20:57:09.772409	health_access.tier1_app_registered.celebrate	Your health account is ready!	{name}, congratulations on registering for Ghinger Health! 🎉 This is a major step forward! With your account you can:\n✓ Consult qualified doctors 24/7\n✓ Get prescriptions delivered\n✓ Track your health history\n✓ Book video or phone consultations\nAll from your phone!	health_access	\N	\N	t	\N	\N
1c70f5d8-9eba-4a55-897e-b3ef42bc3416	2025-11-03 20:57:10.009836	2025-11-03 20:57:10.009836	health_access.tier1_app_low_activity.how	Get the most from Ghinger Health	Hi {name}, we noticed you haven't used your Ghinger Health account much. Here's how to book a consultation:\n1. Open the Ghinger Health app\n2. Click on 'Sign Up' or 'Login'\n3. Click on 'Book Consultation'\n4. Choose 'Phone Consultation' or 'Video Consultation'\n5. Select your preferred time slot\n6. Describe your health concern\n7. Confirm and pay the consultation fee\n\nDon't wait for emergencies - use it for health questions, prescription renewals, or follow-ups!	health_access	\N	\N	t	\N	\N
79145df5-d9b3-4f71-96c8-4602c0e345d8	2025-11-03 20:57:10.225876	2025-11-03 20:57:10.225876	health_access.tier1_app_low_activity.incentive	Your reward is waiting - start using Ghinger Health!	{name}, start using your Ghinger Health app and earn a reward of 10 GHC in just three weeks! Every consultation saves you travel time, keeps you safe at home, and gives you professional medical advice. \nThe sooner you start, the sooner you'll wonder how you managed without it. Book one consultation today!	health_access	\N	\N	t	\N	\N
3cb4f95b-c027-46eb-8a30-b04f9ec7bc0c	2025-11-03 20:57:10.453652	2025-11-03 20:57:10.453652	health_access.tier1_app_low_activity.support	Need help with Ghinger Health?	Hi {name}, need help using your Ghinger Health account? We're here for you! Common questions:\n• How to book a consultation? Open app → 'Book Consultation' → Choose phone or video → Select time → Pay consultation fee\n• How to pay? You can pay using mobile money or card\n• What if doctor is not available? Try a different time slot or choose another doctor\n• Forgot your password? Click 'Forgot Password' and follow the reset instructions\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	health_access	\N	\N	t	\N	\N
8902c389-32ef-4d9d-b939-423ec9a361de	2025-11-03 20:57:10.659646	2025-11-03 20:57:10.659646	health_access.tier1_app_low_activity.why	Why Ghinger Health matters for your family	{name}, we know it feels easier to just go to the clinic when someone is sick. But traveling to clinics has real challenges:\n• Long waiting times - hours away from work or home\n• Transport costs add up quickly\n• Exposure to other sick people at the clinic\n• Sometimes clinics are far away\n\nGhinger Health solves these problems. Your family gets professional medical care instantly, safely from home, and at a lower total cost. Others in your community already trust it. Book your first consultation today - you'll be glad you did!	health_access	\N	\N	t	\N	\N
83a44b81-0711-403e-9e28-726c43b1b459	2025-11-03 20:57:10.870846	2025-11-03 20:57:10.870846	health_access.first_tier1_app_engaged.reward	3 weeks of smart healthcare! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using Ghinger Health for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're building something powerful - proactive family healthcare. Congratulations!	health_access	\N	\N	t	\N	\N
b65067a6-4c83-4f96-8565-d2c94e57045a	2025-11-03 20:57:11.097323	2025-11-03 20:57:11.097323	health_access.tier1_app_engaged.celebrate	You're managing your family's health smartly!	Excellent work {name}! 🎉 Now that you are an active Ghinger Health user, you're:\n✓ Getting professional medical care from home\n✓ Saving time and transport money\n✓ Catching health problems early before they become serious\n✓ Always having access to doctors, day or night\nYou're not just using an app - you're protecting your family's health. Keep it up!	health_access	\N	\N	t	\N	\N
e6f73d36-7074-4b75-995e-cbee7ff04bb6	2025-11-03 20:57:11.309652	2025-11-03 20:57:11.309652	health_access.tier1_app_engaged.incentive	Keep going - bigger health benefits ahead!	{name}, you're doing great with Ghinger Health! Keep using it actively and earn 10 GHC in a few weeks. The more you use Ghinger Health for health questions and consultations, the healthier your family stays. Keep it up!	health_access	\N	\N	t	\N	\N
dea44e65-b3fa-4748-a4c6-4cdf1a7c663d	2025-11-03 20:57:11.538812	2025-11-03 20:57:11.538812	health_access.tier1_app_engagement_dropoff.how	Come back to Ghinger Health - we can help!	Hi {name}, we noticed you stopped using Ghinger Health recently. Let's get you back on track! Quick reminders:\n• To book a consultation: Open app → 'Book Consultation' → Choose phone or video call → Select available time → Describe your concern → Confirm and pay\n• To check past consultations: Open app → 'My Consultations' → View history\n• To get prescriptions: After consultation, doctor sends prescription directly through the app\n\nWatch the video to learn how to make the most of Ghinger Health.	health_access	\N	\N	t	["https://drive.google.com/file/d/1bRUkNQTLBhG5brTm1DAx_7mwK2m-pmLc/view?usp=drive_link"]	\N
32c0d336-6d36-4c06-b24c-04bc90fbf9ff	2025-11-03 20:57:11.799244	2025-11-03 20:57:11.799244	health_access.tier1_app_engagement_dropoff.incentive	Don't lose your health progress!	{name}, you were doing so well with Ghinger Health! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of getting instant medical advice and protecting your family's health without leaving home.	health_access	\N	\N	t	\N	\N
e6a90031-9709-4e8d-8b19-271d601c4743	2025-11-03 20:57:12.012429	2025-11-03 20:57:12.012429	health_access.tier1_app_engagement_dropoff.reactivation	Your family's health matters - come back today!	{name}, we miss you! You were building something important with Ghinger Health: instant access to professional healthcare for your family. Take 2 minutes today to book a consultation and get back on track!	health_access	\N	\N	t	\N	\N
a10281b0-cab6-452d-9ce4-c1a2be094fc2	2025-11-03 20:57:12.230959	2025-11-03 20:57:12.230959	health_access.tier1_app_engagement_dropoff.why	Remember why you started using Ghinger Health	{name}, going back to only clinic visits means going back to old problems:\n• Time: Long trips and waiting at clinics - Ghinger Health works instantly from home\n• Cost: Transport money adds up - Ghinger Health saves travel costs\n• Safety: Exposure to other sick people at clinics - Ghinger Health keeps you safe at home\n• Convenience: Can't always get to clinic - Ghinger Health available 24/7\n\nYou already learned how to use Ghinger Health. Don't give up the convenience and safety you worked for. Your family's health will thank you!	health_access	\N	\N	t	\N	\N
74876a59-cf9a-4f63-b78b-3af04c78d294	2025-11-03 20:57:12.443499	2025-11-03 20:57:12.443499	health_access.tier1_app_engagement_sustained.celebrate	You're a consistent Ghinger Health user!	Fantastic {name}! 🎉 You've maintained active Ghinger Health use for 6 weeks. This isn't luck - this is YOU taking control of your family's healthcare! You've proven that:\n✓ You trust digital healthcare\n✓ You can manage health from your phone\n✓ You're protecting your family proactively\n✓ You're saving time and money consistently\nYou're thriving and you're an example to others. Congratulations!	health_access	\N	\N	t	\N	\N
f1d8c984-e934-41ae-9194-86d42f71ba45	2025-11-03 20:57:12.678643	2025-11-03 20:57:12.678643	health_access.first_tier1_app_retained.reward	9 weeks of Ghinger Health! Collect your reward.	Exceptional achievement {name}! 🎉 You've used Ghinger Health actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nThis is remarkable. You've fully embraced smart digital healthcare. Amazing!	health_access	\N	\N	t	\N	\N
91fc0106-4fbc-4452-9696-e3d5a8b04ea4	2025-11-03 20:57:12.881537	2025-11-03 20:57:12.881537	health_access.tier1_app_retained.celebrate	You're a healthcare champion now. Congratulations!	Incredible {name}! 🎉 You're now a long-term Ghinger Health user. Look at what you've achieved:\n✓ 9+ weeks of consistent healthcare access\n✓ Professional medical care whenever you need it\n✓ Hundreds of cedis saved on transport and waiting time\n✓ Your family's health protected and monitored\nCongratulations!	health_access	\N	\N	t	\N	\N
8e829247-796a-4c7e-a5d7-fd3ff4d92d6f	2025-11-03 20:57:13.110608	2025-11-03 20:57:13.110608	health_access.tier1_app_retained.incentive	You're building real health security	{name}, you've proven you can manage your family's healthcare digitally for 9+ weeks. This consistency is protecting your loved ones: doctors can see your health history, you catch problems early, and your family has instant access to care. The longer you keep going, the healthier your family stays. Your family's wellbeing is in your hands!	health_access	\N	\N	t	\N	\N
50b1c403-d6bd-4930-a8b4-e2578ab86099	2025-11-03 20:57:13.311613	2025-11-03 20:57:13.311613	health_access.tier1_app_retention_dropoff.how	Let's solve your Ghinger Health issue	Hi {name}, you were such a consistent Ghinger Health user! We noticed you haven't been active lately. Let's fix any issues:\n• To book consultation: Open app → 'Book Consultation' → Select phone or video → Choose time → Pay fee\n• To view past consultations: Open app → 'My Consultations' \n• To get prescription refills: Book consultation → Tell doctor you need refill\n• Having payment issues: You can pay with mobile money or card\n\nWatch the video to learn how to make the most of Ghinger Health.	health_access	\N	\N	t	["https://drive.google.com/file/d/1bRUkNQTLBhG5brTm1DAx_7mwK2m-pmLc/view?usp=drive_link"]	\N
de3dd3f3-54e4-4cce-b70d-54240bb7c6a4	2025-11-03 20:57:13.541368	2025-11-03 20:57:13.541368	health_access.tier1_app_retention_dropoff.incentive	Your health record is too valuable to lose	{name}, every week of Ghinger Health use you've built adds to your medical history. Doctors can see your records and give better advice. By stopping now, you lose this continuity of care. Use Ghinger Health this week and keep your family's health protected!	health_access	\N	\N	t	\N	\N
1de96d36-a891-4ab8-b660-f6d71c88e72d	2025-11-03 20:57:13.753462	2025-11-03 20:57:13.753462	health_access.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a health champion	{name}, we miss you! Your consistent use of Ghinger Health provided instant medical care and protected your family's health. Make sure you don't let this slip away. Take 2 minutes today to book a consultation and get back on track!	health_access	\N	\N	t	\N	\N
3fa29196-582d-46f0-bb57-0e2686854a76	2025-11-03 20:57:13.981555	2025-11-03 20:57:13.981555	health_access.tier1_app_retention_dropoff.why	Why your health journey matters	{name}, you spent many weeks building good healthcare habits. Here's what you lose by stopping:\n• Continuity: Your medical history helps doctors give better advice - starting over means they don't know your background\n• Safety: Back to risky clinic visits and exposure to other illnesses\n• Convenience: Back to long trips and waiting times for simple health questions\n\nYou worked hard to become a Ghinger Health expert. Make sure that you continue to use this for your family's health goals. Take two minutes today to book a consultation and get back on track.	health_access	\N	\N	t	\N	\N
8366cc5c-a83d-4df2-9b27-78f7f3d63749	2025-11-03 20:57:14.210549	2025-11-03 20:57:14.210549	health_access.tier2_app_opened_first_time.celebrate	Welcome to Ghinger Health!	Great start {name}! 🎉 You've opened Ghinger Health for the first time. Health is your second most important goal. This is the beginning of something powerful - healthcare from the comfort of your home. With Ghinger Health, you can:\n✓ Talk to qualified doctors anytime\n✓ Get medical advice without traveling\n✓ Save time and transport costs\n✓ Keep your family healthy\n\nTake the next step: Register your account!	health_access	\N	\N	t	\N	\N
e89cae7a-8655-4549-bab8-9617d9f40772	2025-11-03 20:57:14.419458	2025-11-03 20:57:14.419458	health_access.tier2_app_adopted.celebrate	You're taking charge of your health!	Well done {name}! 🎉 You're now using Ghinger Health. You've taken control of your healthcare!	health_access	\N	\N	t	\N	\N
755b207d-964a-4ec8-b4df-5551ea3ce31c	2025-11-03 20:57:14.638385	2025-11-03 20:57:14.638385	health_access.tier2_app_registered.celebrate	Your health account is ready!	{name}, congratulations on registering for Ghinger Health! 🎉 This is a major step forward! With your account you can:\n✓ Consult qualified doctors 24/7\n✓ Get prescriptions delivered\n✓ Track your health history\n✓ Book consultations when you need them\nAll from your phone!	health_access	\N	\N	t	\N	\N
7daa18e8-4e29-438e-936b-231ef240e017	2025-11-03 20:57:14.859555	2025-11-03 20:57:14.859555	health_access.tier2_app_low_activity.how	Quick tips for Ghinger Health	Hi {name}, we noticed you haven't used your Ghinger Health account much. Ready to try it? Here's a quick start:\n1. Open the app and login\n2. Click 'Book Consultation'\n3. Choose phone or video call\n4. Select a time that works for you\nStart with a simple health question until you're comfortable!	health_access	\N	\N	t	\N	\N
fc343541-b9f6-4f17-b803-041e472a6059	2025-11-03 20:57:15.079538	2025-11-03 20:57:15.079538	health_access.tier2_app_low_activity.incentive	Try Ghinger Health	{name}, start using your Ghinger Health app and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll have a doctor available whenever you need one.	health_access	\N	\N	t	\N	\N
e1c34ec3-08dd-43c8-aaa6-124066ca9995	2025-11-03 20:57:15.286464	2025-11-03 20:57:15.286464	health_access.tier2_app_low_activity.support	Need help with Ghinger Health?	Hi {name}, need help using your Ghinger Health account? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	health_access	\N	\N	t	\N	\N
55e4c457-5687-49b3-b5da-2b80e11de319	2025-11-03 20:57:15.519713	2025-11-03 20:57:15.519713	health_access.tier2_app_low_activity.why	Ghinger Health makes life easier	{name}, Ghinger Health offers real benefits:\n• Get medical advice without traveling to clinic\n• Save time and transport money\n• Consult doctors from the safety of your home\nGive it a try - many in your community already use it!	health_access	\N	\N	t	\N	\N
984c48a3-d553-46a7-be94-469533dd8e50	2025-11-03 20:57:15.72353	2025-11-03 20:57:15.72353	health_access.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used Ghinger Health for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	health_access	\N	\N	t	\N	\N
7d842a55-dc44-4419-8654-28697ffbdaa2	2025-11-03 20:57:15.941404	2025-11-03 20:57:15.941404	health_access.tier2_app_engaged.celebrate	You're using Ghinger Health!	Great job {name}! 🎉 As an active Ghinger Health user, you're getting professional healthcare from home and saving time. You're building good health habits!	health_access	\N	\N	t	\N	\N
013c3918-c9c6-44dc-a3b9-35342444ccc1	2025-11-03 20:57:16.156362	2025-11-03 20:57:16.156362	health_access.tier2_app_engaged.incentive	Keep going with Ghinger Health	{name}, you're doing well! Keep using Ghinger Health and earn 10 GHC in a few weeks. Every consultation counts!	health_access	\N	\N	t	\N	\N
6103ba80-704a-4912-be15-01175223316c	2025-11-03 21:00:58.680188	2025-11-03 21:00:58.680188	women_child_health.tier1_app_low_activity.incentive	Your reward is waiting - start using Bebbo!	{name}, start using your Bebbo app and earn a reward of 10 GHC in just three weeks! Every time you use the app, you're learning how to help your child grow healthy and strong. You're becoming a more confident parent. \nThe sooner you start, the sooner you'll have expert guidance at your fingertips. Check the app today!	women_child_health	\N	\N	t	\N	\N
9ca86b4e-395b-4d04-a240-23aa30edd002	2025-11-03 20:57:16.593617	2025-11-03 20:57:16.593617	health_access.tier2_app_engagement_dropoff.how	Quick Ghinger Health reminder	Hi {name}, we noticed that you stopped using Ghinger Health lately. Quick reminders:\n• To book: Open app → 'Book Consultation' → Choose phone or video → Select time → Pay\n• To check history: Open app → 'My Consultations'\n• To get prescriptions: Doctor sends them through the app after consultation\n\nWatch the video for a refresher.	health_access	\N	\N	t	["https://drive.google.com/file/d/1bRUkNQTLBhG5brTm1DAx_7mwK2m-pmLc/view?usp=drive_link"]	\N
839c16b9-dfdf-45a7-9ea8-0841d2fcaea6	2025-11-03 20:57:16.80767	2025-11-03 20:57:16.80767	health_access.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Ghinger Health and earn 10 GHC in a few weeks. It gives you instant access to doctors and saves you time and transport money.	health_access	\N	\N	t	\N	\N
2e63aac2-1f20-4781-bce6-4e46b42645ac	2025-11-03 20:57:17.04548	2025-11-03 20:57:17.04548	health_access.tier2_app_engagement_dropoff.reactivation	Try Ghinger Health again?	{name}, you started building good healthcare habits with Ghinger Health. Take 2 minutes today to book a consultation again!	health_access	\N	\N	t	\N	\N
6445b7ef-89c7-42de-8b7f-ae70ec5f0adb	2025-11-03 20:57:17.279482	2025-11-03 20:57:17.279482	health_access.tier2_app_engagement_dropoff.why	Ghinger Health is convenient and safe	{name}, Ghinger Health offers convenience and professional care:\n• Talk to real doctors from home\n• Save travel time and money\n• Get help quickly when someone is sick\nYou already know how to use it - try it again!	health_access	\N	\N	t	\N	\N
05c80212-392c-4bf3-b2c6-0e9b01915227	2025-11-03 20:57:17.509639	2025-11-03 20:57:17.509639	health_access.tier2_app_engagement_sustained.celebrate	6 weeks of Ghinger Health!	Well done {name}! 🎉 You've used Ghinger Health consistently for 6 weeks. You're managing your family's health well and getting professional medical advice when you need it!	health_access	\N	\N	t	\N	\N
72d63089-8630-40dd-8bf7-c44f54ffdf86	2025-11-03 20:57:17.734784	2025-11-03 20:57:17.734784	health_access.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency!	Excellent {name}! 🎉 You've used Ghinger Health for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	health_access	\N	\N	t	\N	\N
a5d0b99d-0f83-41e6-8838-71c8096e6fba	2025-11-03 20:57:18.03245	2025-11-03 20:57:18.03245	health_access.tier2_app_retained.celebrate	You're a Ghinger Health user!	Impressive {name}! 🎉 You've been using Ghinger Health consistently. You're keeping your family healthy with professional medical care from home. Well done!	health_access	\N	\N	t	\N	\N
bec19b3a-9b17-4b2c-96dc-0f3ce0e0dccd	2025-11-03 20:57:18.277827	2025-11-03 20:57:18.277827	health_access.tier2_app_retained.incentive	Keep your healthcare habit going	{name}, your consistent Ghinger Health use is protecting your family's health. You're getting professional advice and catching health problems early. Keep it up!	health_access	\N	\N	t	\N	\N
9c831c0d-8179-4b3a-a244-27e551d24a00	2025-11-03 20:57:18.491635	2025-11-03 20:57:18.491635	health_access.tier2_app_retention_dropoff.how	Quick Ghinger Health reminder	Hi {name}, we noticed that you stopped using Ghinger Health lately. Quick reminders:\n• To book: Open app → 'Book Consultation' → Choose phone or video → Select time → Pay\n• To check history: Open app → 'My Consultations'\n• To get prescriptions: Doctor sends them after consultation\n\nWatch the video for a refresher.	health_access	\N	\N	t	["https://drive.google.com/file/d/1bRUkNQTLBhG5brTm1DAx_7mwK2m-pmLc/view?usp=drive_link"]	\N
b9f30201-20fd-4799-8bc6-052d7f43f815	2025-11-03 20:57:18.705512	2025-11-03 20:57:18.705512	health_access.tier2_app_retention_dropoff.incentive	Your healthcare access is waiting	{name}, you built great Ghinger Health habits. Come back and keep protecting your family's health with instant access to doctors.	health_access	\N	\N	t	\N	\N
a9306082-509a-43d0-8c8b-2029c2801ead	2025-11-03 20:57:18.941622	2025-11-03 20:57:18.941622	health_access.tier2_app_retention_dropoff.reactivation	Come back to Ghinger Health	{name}, you were doing great with Ghinger Health! Use it again today and keep your family's health protected.	health_access	\N	\N	t	\N	\N
37ba1358-7fdf-4059-94be-9a55117944ee	2025-11-03 20:57:19.181545	2025-11-03 20:57:19.181545	health_access.tier2_app_retention_dropoff.why	Keep your health progress	{name}, you built weeks of good healthcare habits. Keep going to maintain:\n• Instant access to professional doctors\n• Your medical history and records\n• Quick, safe consultations from home\nUse it today to stay on track!	health_access	\N	\N	t	\N	\N
488b48a6-458a-4f08-b9d4-688131658898	2025-11-03 20:57:19.460394	2025-11-03 20:57:19.460394	health_information.tier1_app_opened_first_time.celebrate	Welcome to trusted health information!	Great start {name}! 🎉 You've opened ExpressMed for the first time. Health is your most important goal. This is the beginning of something powerful - access to reliable health information right on your phone. With ExpressMed, you can: \n✓ Find trustworthy answers to health questions \n✓ Learn about diseases and treatments \n✓ Get tips for staying healthy \n✓ Understand symptoms and when to seek care \n\nTake the next step: Register your account!	health_information	\N	\N	t	\N	\N
159588fa-b5b6-4a50-9582-5aea18726fec	2025-11-03 20:57:19.765497	2025-11-03 20:57:19.765497	health_information.tier1_app_adopted.celebrate	You're taking control of your health knowledge!	Well done {name}! 🎉 You're now using ExpressMed. You've taken control of your health information! By learning about health from trusted sources on your phone, you're: \n✓ Making better health decisions for your family \n✓ Understanding when to seek medical help \n✓ Preventing diseases through knowledge \n✓ Building confidence in managing health \nKeep going!	health_information	\N	\N	t	\N	\N
36d0c01e-9bc9-4a04-a30f-d9e2eadd885c	2025-11-03 20:57:19.984524	2025-11-03 20:57:19.984524	health_information.tier1_app_registered.celebrate	Your health information library is ready!	{name} congratulations on registering for ExpressMed! 🎉 This is a major step forward! With your account you can: \n✓ Search for any health topic \n✓ Read articles in simple language \n✓ Learn about medicines and treatments \n✓ Get daily health tips \nAll from your phone!	health_information	\N	\N	t	\N	\N
dfb5e7f6-5912-4983-aecf-3cbf23734b86	2025-11-03 20:57:20.206605	2025-11-03 20:57:20.206605	health_information.tier1_app_low_activity.how	Get the most from your health information app	Hi {name}, we noticed you haven't used ExpressMed much. Here's how to find health information: \n1. Open the ExpressMed app\n2. Type your health question in the search box\n3. Read articles about your topic\n4. Browse different health categories\n5. Save important articles to read again	health_information	\N	\N	t	\N	\N
8ef5be25-9a3d-48c6-8f86-86aa023b8890	2025-11-03 20:57:20.426489	2025-11-03 20:57:20.426489	health_information.tier1_app_low_activity.incentive	Your reward is waiting - start using ExpressMed!	{name}, start using ExpressMed and earn a reward of 10 GHC in just three weeks! Every time you learn about health, you're protecting your family from illness and making better decisions. \nThe sooner you start, the sooner you'll have trusted answers to your health questions. Try it today!	health_information	\N	\N	t	\N	\N
15450480-2b9f-4eca-8439-89f6fa3ea6b8	2025-11-03 20:57:20.686727	2025-11-03 20:57:20.686727	health_information.tier1_app_low_activity.why	Why health information matters for your family	{name}, we know it's easier to just ask neighbors or guess about health issues. But getting wrong information has real risks: \n• Wrong treatments can make illness worse \n• Delays in seeking help can be dangerous \n• Fear from not knowing causes stress \n• Spending money on things that don't work \nExpressMed gives you reliable answers from medical experts. Your family's health is too important for guesswork. Learn the facts today - you'll be glad you did!	health_information	\N	\N	t	\N	\N
9d4cd174-3448-4669-97fc-f22759ad821a	2025-11-03 20:57:20.920466	2025-11-03 20:57:20.920466	health_information.first_tier1_app_engaged.reward	3 weeks of health learning! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using ExpressMed for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - health knowledge that protects your family. Congratulations!	health_information	\N	\N	t	\N	\N
42baf254-47ed-4ea8-818c-a3b86e31cb07	2025-11-03 20:57:21.133351	2025-11-03 20:57:21.133351	health_information.tier1_app_engaged.celebrate	You're mastering health information!	Excellent work {name}! 🎉 Now that you are an active ExpressMed user you're: \n✓ Making informed health decisions \n✓ Recognizing symptoms early \n✓ Knowing when to see a doctor and when to treat at home \n✓ Protecting your family through knowledge \nYou're not just reading - you're becoming your family's health expert. Keep it up!	health_information	\N	\N	t	\N	\N
a644bd31-636b-4d97-9a3a-081a0c01659f	2025-11-03 20:57:21.421499	2025-11-03 20:57:21.421499	health_information.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with ExpressMed! Keep using it actively and earn 10 GHC in a few weeks. The more you learn about health, the better you can protect your family. Keep it up!	health_information	\N	\N	t	\N	\N
5a9135e4-681f-4523-9c9e-6bf683ddd5df	2025-11-03 20:57:21.666837	2025-11-03 20:57:21.666837	health_information.tier1_app_engagement_dropoff.how	Come back to health learning - we can help!	Hi {name}, we noticed you stopped using ExpressMed recently. Let's get you back on track! Quick reminders: \n• To search: Open ExpressMed → Type your health question in the search box → Read the article \n• To browse: Open ExpressMed → Choose a category like Child Health or Common Diseases → Select a topic \n• To save articles: Click the bookmark icon to find important information again later \n\nWatch the video to learn how to get the most from ExpressMed.	health_information	\N	\N	t	\N	\N
51128b60-b6b8-4ca4-b7a2-f7cf6d3e65c7	2025-11-03 20:57:22.020576	2025-11-03 20:57:22.020576	health_information.tier1_app_engagement_dropoff.incentive	Don't lose your health learning momentum!	{name}, you were doing so well with ExpressMed! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the confidence that comes from having trusted health answers at your fingertips.	health_information	\N	\N	t	\N	\N
3baa67a8-ae36-47fa-bcbe-fc3249ba176f	2025-11-03 20:57:22.241453	2025-11-03 20:57:22.241453	health_information.tier1_app_engagement_dropoff.reactivation	Your health knowledge is waiting - come back today!	{name}, we miss you! You were building something important with ExpressMed: health knowledge that protects your family from illness. Take 2 minutes today to read a health article and get back on track!	health_information	\N	\N	t	\N	\N
ee85dadf-28a7-4542-9090-feb745d3e3d0	2025-11-03 20:57:22.470564	2025-11-03 20:57:22.470564	health_information.tier1_app_engagement_dropoff.why	Remember why health knowledge matters	{name}, not having reliable health information means going back to old problems: \n• Risk: Believing wrong information can harm your family \n• Worry: Not knowing causes fear and stress \n• Costly mistakes: Trying treatments that don't work wastes money \nExpressMed gives you trusted answers from medical experts. You already learned how to use it. Don't give up the confidence that comes from knowing the truth about health. Your family needs you!	health_information	\N	\N	t	\N	\N
b05ac93e-6fa3-405d-bb2e-8947087e21d9	2025-11-03 20:57:22.691505	2025-11-03 20:57:22.691505	health_information.tier1_app_engagement_sustained.celebrate	You're a consistent health information user!	Fantastic {name}! 🎉 You've maintained active ExpressMed use for 6 weeks. This isn't luck - this is YOU taking responsibility for your family's health! You've proven that: \n✓ You seek reliable information \n✓ You make informed health decisions \n✓ You're prepared for health challenges \n✓ You're protecting what matters most \nYou're thriving and you're an example to others. Congratulations!	health_information	\N	\N	t	\N	\N
139617ac-6381-4dbc-9fd4-b5b0ba7883be	2025-11-03 20:57:22.913529	2025-11-03 20:57:22.913529	health_information.first_tier1_app_retained.reward	9 weeks of health learning! Collect your reward.	Exceptional achievement {name}! 🎉 You've used ExpressMed actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced being your family's health knowledge keeper. Amazing!	health_information	\N	\N	t	\N	\N
0caf3368-741a-4dc9-ada7-202c9681f50c	2025-11-03 20:57:23.115605	2025-11-03 20:57:23.115605	health_information.tier1_app_retained.celebrate	You're a health information expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term ExpressMed user. Look at what you've achieved: \n✓ 9+ weeks of consistent health learning \n✓ Better health decisions for your family \n✓ Confidence handling health questions \n✓ Knowledge that protects your loved ones \nCongratulations!	health_information	\N	\N	t	\N	\N
3e33ca7a-7623-4fef-9622-9d926be6efae	2025-11-03 20:57:23.362414	2025-11-03 20:57:23.362414	health_information.tier1_app_retained.incentive	You're building real health expertise	{name}, you've proven you can learn about health for 9+ weeks. This knowledge is protecting your family from illness and helping you make the right decisions when someone gets sick. The more you continue, the more confident you become. Your family's health is in good hands!	health_information	\N	\N	t	\N	\N
9038a671-be3b-4c4d-82b8-504673a73960	2025-11-03 20:57:23.569578	2025-11-03 20:57:23.569578	health_information.tier1_app_retention_dropoff.how	Let's solve your health learning issue	Hi {name}, you were such a consistent ExpressMed user! We noticed you haven't been active lately. Let's fix any issues: \n• To search: Open ExpressMed → Type your health question → Read the answer \n• To browse topics: Open ExpressMed → Select a category → Choose an article \n• To save information: Click the bookmark icon to save articles \n• To get daily tips: Check the home screen for new health advice \n\nWatch the video to learn how to get the most from ExpressMed.	health_information	\N	\N	t	\N	\N
8201923c-4e50-434e-b279-7a2a1aad2f73	2025-11-03 20:57:23.790573	2025-11-03 20:57:23.790573	health_information.tier1_app_retention_dropoff.incentive	Your health knowledge is too valuable to lose	{name}, every week of health learning you've done has made you more capable of protecting your family. By stopping now, you're losing that advantage. Use ExpressMed this week and keep your knowledge growing!	health_information	\N	\N	t	\N	\N
fda3f354-f092-4e79-93fe-6a723d17da2b	2025-11-03 20:57:24.126671	2025-11-03 20:57:24.126671	health_information.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a health knowledge champion	{name}, we miss you! Your consistent use of ExpressMed gave you knowledge that protects your family's health. Make sure you don't let this slip away. Take 2 minutes today to read a health article and get back on track!	health_information	\N	\N	t	\N	\N
3a701776-ce00-4868-b303-cb9822ff1332	2025-11-03 20:57:24.340568	2025-11-03 20:57:24.340568	health_information.tier1_app_retention_dropoff.why	Why your health knowledge matters	{name}, you spent many weeks building health knowledge. Here's what you lose by stopping: \n• Confidence: Back to guessing and worrying about symptoms \n• Safety: Back to believing unreliable information that could harm your family \n• Quick action: Back to not knowing when illness is serious \n\nYou worked hard to become a health information expert. Make sure that you continue to use this knowledge to protect your family. Take two minutes today to read an article and get back on track.	health_information	\N	\N	t	\N	\N
5748564d-903e-49fe-bb90-9fc5a1d20a5e	2025-11-03 20:57:24.5495	2025-11-03 20:57:24.5495	health_information.tier2_app_opened_first_time.celebrate	Welcome to health information!	Great start {name}! 🎉 You've opened ExpressMed for the first time. Health is your second most important goal. This is the beginning of something powerful - access to reliable health information right on your phone. With ExpressMed, you can: \n✓ Find trustworthy answers to health questions \n✓ Learn about diseases and treatments \n✓ Get tips for staying healthy \n✓ Understand symptoms and when to seek care \n\nTake the next step: Register your account!	health_information	\N	\N	t	\N	\N
07dfb6be-ac84-4118-8ec5-866288b5412c	2025-11-03 20:57:24.762397	2025-11-03 20:57:24.762397	health_information.tier2_app_adopted.celebrate	You're learning about health!	Well done {name}! 🎉 You're now using ExpressMed. You've taken control of your health information!	health_information	\N	\N	t	\N	\N
03871e15-c9d9-4f21-ad8b-28fb10a8100d	2025-11-03 20:57:25.020311	2025-11-03 20:57:25.020311	health_information.tier2_app_registered.celebrate	Your health information library is ready!	{name} congratulations on registering for ExpressMed! 🎉 This is a major step forward! With your account you can: \n✓ Search for any health topic \n✓ Read articles about diseases \n✓ Learn about treatments \n✓ Get health tips \nAll from your phone!	health_information	\N	\N	t	\N	\N
02046c45-e86f-4c14-a06a-def56dbe74f6	2025-11-03 20:57:25.260346	2025-11-03 20:57:25.260346	health_information.tier2_app_low_activity.how	Quick tips for health information	Hi {name}, we noticed you haven't used ExpressMed much. Ready to try it? Here's a quick start: \n1. Open ExpressMed \n2. Type a health question\n3. Read the article\n4. Browse different health topics \nStart small until you're comfortable!	health_information	\N	\N	t	\N	\N
ecb38977-7388-4007-b6a9-d3ee9703904e	2025-11-03 20:57:25.497352	2025-11-03 20:57:25.497352	health_information.tier2_app_low_activity.incentive	Try health information learning	{name}, start using ExpressMed and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll have reliable answers to your health questions.	health_information	\N	\N	t	\N	\N
c31d15fe-5dbb-4cac-b6dc-22170ff6a24a	2025-11-03 20:57:25.720506	2025-11-03 20:57:25.720506	health_information.tier2_app_low_activity.support	Need help with ExpressMed?	Hi {name}, need help using ExpressMed? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	health_information	\N	\N	t	\N	\N
e4029c41-8e7f-44a9-848e-35f2a617befe	2025-11-03 20:57:25.930871	2025-11-03 20:57:25.930871	health_information.tier2_app_low_activity.why	Health information helps protect your family	{name}, ExpressMed offers real benefits: \n• Get reliable health answers \n• Know when to see a doctor\n• Learn how to prevent diseases\nGive it a try - many in your community already use it!	health_information	\N	\N	t	\N	\N
8fd672d2-5d85-423a-96a6-6347cc1ec835	2025-11-03 20:57:26.135463	2025-11-03 20:57:26.135463	health_information.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used ExpressMed for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	health_information	\N	\N	t	\N	\N
0756fa7a-4823-47a9-99a5-fe18ba951653	2025-11-03 20:57:26.339772	2025-11-03 20:57:26.339772	health_information.tier2_app_engaged.celebrate	You're using health information!	Great job {name}! 🎉 As an active ExpressMed user, you're learning about health and making better decisions for your family. You're building good knowledge habits!	health_information	\N	\N	t	\N	\N
75f36f4d-986a-437d-bf27-753aa7b3d427	2025-11-03 20:57:26.552029	2025-11-03 20:57:26.552029	health_information.tier2_app_engaged.incentive	Keep going with health learning	{name}, you're doing well! Keep using ExpressMed and earn 10 GHC in a few weeks. Every article you read helps protect your family!	health_information	\N	\N	t	\N	\N
ff56fa38-996d-4842-9db5-09a7cb671bf2	2025-11-03 20:57:26.776452	2025-11-03 20:57:26.776452	health_information.tier2_app_engagement_dropoff.how	Quick health information reminder	Hi {name}, we noticed that you stopped using ExpressMed lately. Quick reminders: \n• To search: Open ExpressMed → Type your question → Read the article \n• To browse: Select a category → Choose a topic \n• To save articles: Click the bookmark icon \n\nWatch the video for a refresher.	health_information	\N	\N	t	\N	\N
5f679c61-00b7-4220-ab4c-0de0dc005b5b	2025-11-03 20:57:27.03751	2025-11-03 20:57:27.03751	health_information.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to ExpressMed and earn 10 GHC in a few weeks. It gives you reliable health answers and helps you protect your family.	health_information	\N	\N	t	\N	\N
b0747099-bfad-4c10-9749-4f44412ffe74	2025-11-03 20:57:27.307479	2025-11-03 20:57:27.307479	health_information.tier2_app_engagement_dropoff.reactivation	Try health information again?	{name}, you started building good health knowledge habits with ExpressMed. Take 2 minutes today to read an article again!	health_information	\N	\N	t	\N	\N
f89f394c-c67d-4614-a49a-11ddb40cb401	2025-11-03 20:57:27.564634	2025-11-03 20:57:27.564634	health_information.tier2_app_engagement_dropoff.why	Health information is reliable and helpful	{name}, ExpressMed offers reliable health knowledge \n• Trusted medical information \n• Learn when to seek help \n• Understand treatments and prevention \nYou already know how to use it - try it again!	health_information	\N	\N	t	\N	\N
3b90db11-7aa2-4140-85f9-72a8d6acfb8d	2025-11-03 20:57:27.778673	2025-11-03 20:57:27.778673	health_information.tier2_app_engagement_sustained.celebrate	6 weeks of health learning!	Well done {name}! 🎉 You've used ExpressMed consistently for 6 weeks. You're learning about health well and building good knowledge habits!	health_information	\N	\N	t	\N	\N
6b0d5ea3-a259-47e8-9967-f7e54a1ff1d9	2025-11-03 20:57:28.003671	2025-11-03 20:57:28.003671	health_information.first_tier2_app_retained.reward	You've earned 10 GHC for your health learning!	Excellent {name}! 🎉 You've used ExpressMed for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	health_information	\N	\N	t	\N	\N
09d78bb3-9350-41ed-8ee4-f3e25e38dadf	2025-11-03 20:57:28.220414	2025-11-03 20:57:28.220414	health_information.tier2_app_retained.celebrate	You're a health information user!	Impressive {name}! 🎉 You've been using ExpressMed consistently. You're learning about health and building valuable knowledge. Well done!	health_information	\N	\N	t	\N	\N
b660dc6b-c48b-4ab5-b2f3-f78b45bdea0b	2025-11-03 20:57:28.422472	2025-11-03 20:57:28.422472	health_information.tier2_app_retained.incentive	Keep your health learning habit going	{name}, your consistent use of ExpressMed is building valuable health knowledge. You're learning how to protect your family better. Keep it up!	health_information	\N	\N	t	\N	\N
c636de2e-f84d-4b4f-b819-e7b01166eb74	2025-11-03 20:57:28.639493	2025-11-03 20:57:28.639493	health_information.tier2_app_retention_dropoff.how	Quick health information reminder	Hi {name}, we noticed that you stopped using ExpressMed lately. Quick reminders: \n• To search: Open ExpressMed → Type your question → Read the article \n• To browse: Select a category → Choose a topic \n• To save articles: Click the bookmark icon \n\nWatch the video for a refresher.	health_information	\N	\N	t	\N	\N
f65e7504-b085-4332-83d4-9d007bd6d200	2025-11-03 20:57:28.846504	2025-11-03 20:57:28.846504	health_information.tier2_app_retention_dropoff.incentive	Your health learning is waiting	{name}, you built great health learning habits. Come back and keep growing your knowledge.	health_information	\N	\N	t	\N	\N
791ec2b0-0dbe-4409-b322-fadf1a18d145	2025-11-03 20:57:29.049459	2025-11-03 20:57:29.049459	health_information.tier2_app_retention_dropoff.reactivation	Come back to health information	{name}, you were doing great with ExpressMed! Use it again today and keep your health knowledge strong.	health_information	\N	\N	t	\N	\N
562bc623-2809-446f-8840-7dabe6a70d62	2025-11-03 20:57:29.271728	2025-11-03 20:57:29.271728	health_information.tier2_app_retention_dropoff.why	Keep your health knowledge progress	{name}, you built weeks of good health learning. Keep going to maintain: \n• Your health knowledge \n• Better health decisions \n• Family protection through information \nUse it today to stay on track!	health_information	\N	\N	t	\N	\N
b9dd7a85-fb62-439b-9bb9-d04dce4cea62	2025-11-03 20:57:29.485592	2025-11-03 20:57:29.485592	health_insurance.tier1_app_opened_first_time.celebrate	Welcome to health insurance!	Great start {name}! 🎉 You've opened your myNHIS app for the first time. Health is your most important goal. This is the beginning of something powerful - affordable healthcare protection for you and your family. With health insurance, you can: \n✓ Access medical care without worrying about high costs \n✓ Get treatment at NHIS-accredited facilities nationwide \n✓ Protect yourself and your family from health emergencies \n✓ Manage your NHIS membership easily from your phone \n\nTake the next step: Register your account!	health_insurance	\N	\N	t	\N	\N
75eec5b4-b93e-4cab-bff7-210be5d0534a	2025-11-03 20:57:29.741378	2025-11-03 20:57:29.741378	health_insurance.tier1_app_adopted.celebrate	You're taking control of your health protection!	Well done {name}! 🎉 You're now using health insurance. You've taken control of your family's healthcare! By having active NHIS coverage, you're: \n✓ Protecting your family from unexpected medical bills \n✓ Ensuring access to quality healthcare when you need it \n✓ Building a safety net for health emergencies \nKeep going!	health_insurance	\N	\N	t	\N	\N
e25eb75f-d6c1-4110-852f-5417832ee186	2025-11-03 20:57:29.960574	2025-11-03 20:57:29.960574	health_insurance.tier1_app_registered.celebrate	Your health insurance is ready!	{name} congratulations on registering with myNHIS! 🎉 This is a major step forward! With your NHIS membership you can: \n✓ Visit accredited hospitals and clinics \n✓ Access covered medical services \n✓ Protect your family's health and finances \n✓ Renew your membership easily \nAll from your phone!	health_insurance	\N	\N	t	\N	\N
d2e2b7b0-57ab-475e-adc9-9d6b2b1af1a1	2025-11-03 20:57:30.178475	2025-11-03 20:57:30.178475	health_insurance.tier1_app_low_activity.how	Get the most from your health insurance	Hi {name}, we noticed you haven't used your myNHIS app much. It's easy to get started! Here's how: \n1. Open your myNHIS app \n2. Check your membership status and expiry date \n3. Renew your membership when needed \n4. View your digital NHIS card \n5. Find accredited facilities near you \nStart exploring the app to understand all its benefits. Once you see how easy it is to manage your health insurance, you'll have peace of mind!	health_insurance	\N	\N	t	["https://drive.google.com/file/d/1LF02vrW8hvO9guXJkqIinl4iaeYkMUIA/view?usp=drive_link"]	\N
f82ad32a-a036-4f30-a2da-c44e5ddc7c63	2025-11-03 20:57:30.44138	2025-11-03 20:57:30.44138	health_insurance.tier1_app_low_activity.incentive	Your reward is waiting - start using your health insurance app!	{name}, start using your myNHIS app and earn a reward of 10 GHC in just three weeks! Every time you use the app, you're protecting your family's health and financial security. Health emergencies can happen anytime - having active insurance gives you peace of mind. The sooner you start, the sooner you'll feel secure. Check your app today!	health_insurance	\N	\N	t	\N	\N
5ab7fd59-9aef-45bf-8775-a5706ee57a54	2025-11-03 20:57:30.660553	2025-11-03 20:57:30.660553	health_insurance.tier1_app_low_activity.support	Need help with health insurance?	Hi {name}, need help using your myNHIS app? We're here for you! Common questions: \n• How to check membership status? Open myNHIS app → View your card → Check expiry date \n• How to renew? Open app → New Registration or Renewal → Follow payment steps \n• Where can I use it? Open app → Find Facility → See accredited hospitals near you \n• What's covered? The NHIS benefit package covers consultations, medications, surgeries, maternity care, and more \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	health_insurance	\N	\N	t	\N	\N
7cda2b21-1452-4a69-8bbd-bfba8b558455	2025-11-03 20:57:30.881553	2025-11-03 20:57:30.881553	health_insurance.tier1_app_low_activity.why	Why health insurance matters for your family	{name}, we know paying for insurance can feel like an extra expense. But having no health coverage has real risks: \n• Unexpected medical bills can wipe out savings - insurance protects your money \n• Without coverage, families delay treatment until problems get worse \n• Hospital bills can push you into debt or force you to borrow \n• Children miss school, adults miss work due to untreated illness \nHealth insurance solves these problems. For a small annual fee, you get peace of mind and financial protection. Your family deserves this security. Take the first step today!	health_insurance	\N	\N	t	\N	\N
819a68ac-10b0-4ee7-821c-9f0bd9033231	2025-11-03 20:57:31.098416	2025-11-03 20:57:31.098416	health_insurance.first_tier1_app_engaged.reward	3 weeks of health protection! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using myNHIS for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - health security for your family. Congratulations!	health_insurance	\N	\N	t	\N	\N
c7c3bf76-8258-403d-865b-8e65be01d23e	2025-11-03 20:57:31.301598	2025-11-03 20:57:31.301598	health_insurance.tier1_app_engaged.celebrate	You're protecting your family's health!	Excellent work {name}! 🎉 Now that you're an active health insurance user you're: \n✓ Protecting your family from medical debt \n✓ Ensuring access to quality healthcare \n✓ Building a safety net for emergencies \n✓ Managing your coverage easily from your phone \nYou're not just using an app - you're securing your family's health future. Keep it up!	health_insurance	\N	\N	t	\N	\N
a21d4aad-68a6-46b2-8177-6f1631e159f5	2025-11-03 20:57:31.562575	2025-11-03 20:57:31.562575	health_insurance.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with health insurance! Keep using it actively and earn 10 GHC in a few weeks. Having active coverage means your family can access healthcare without fear of high bills. This protection is priceless. Keep it up!	health_insurance	\N	\N	t	\N	\N
ebc9154e-a875-49ce-9d4a-0a1d480ab5d4	2025-11-03 20:57:31.795585	2025-11-03 20:57:31.795585	health_insurance.tier1_app_engagement_dropoff.how	Come back to health insurance - we can help!	Hi {name}, we noticed you stopped using myNHIS recently. Let's get you back on track! Quick reminders: \n• To check status: Open myNHIS app → View Card → Check expiry date \n• To renew: Open app → New Registration → Pay with Mobile Money or Card \n• To find facilities: Open app → Find Pharmacy or Hospital → See locations near you \n• To view benefits: Check what medical services are covered under NHIS \n\nWatch the video below to learn how to make the most of your health insurance.\n<video>	health_insurance	\N	\N	t	["https://drive.google.com/file/d/1LF02vrW8hvO9guXJkqIinl4iaeYkMUIA/view?usp=drive_link"]	\N
9e7bd153-3949-4d2d-ae33-7f209bec9f13	2025-11-03 20:57:32.021443	2025-11-03 20:57:32.021443	health_insurance.tier1_app_engagement_dropoff.incentive	Don't lose your health protection momentum!	{name}, you were doing so well with health insurance! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the peace of mind that comes from knowing your family is protected. Check your coverage status today!	health_insurance	\N	\N	t	\N	\N
c2128816-fe68-49c7-ba65-ed22aa787c9c	2025-11-03 20:57:32.265449	2025-11-03 20:57:32.265449	health_insurance.tier1_app_engagement_dropoff.reactivation	Your health protection matters - come back today!	{name}, we miss you! You were building something important: health security for your family. Medical emergencies can happen anytime - don't let your coverage lapse. Take 2 minutes today to check your myNHIS status and get back on track!	health_insurance	\N	\N	t	\N	\N
a713ad76-2de8-488e-9c8e-449389eee593	2025-11-03 21:00:58.899279	2025-11-03 21:00:58.899279	women_child_health.tier1_app_low_activity.support	Need help with Bebbo?	Hi {name}, need help using the Bebbo app? We're here for you! \nThe app gives you trusted information to help you raise a healthy child. Click on topics that interest you, read articles, and watch videos. \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	women_child_health	\N	\N	t	\N	\N
f24e9fda-56a3-4e95-a4aa-73746d1b4ead	2025-11-03 20:57:32.501124	2025-11-03 20:57:32.501124	health_insurance.tier1_app_engagement_dropoff.why	Remember why you started health insurance	{name}, not having health coverage means going back to old worries: \n• Risk: One medical emergency could wipe out your savings \n• Stress: Wondering how to pay for treatment when family gets sick \n• Delays: Postponing care because you can't afford it \n• Debt: Borrowing money or selling assets to pay hospital bills \nYou already took the important step of getting coverage. Don't give up that protection. Your family's health security matters. Check your app today!	health_insurance	\N	\N	t	\N	\N
21c83d17-d312-4e5b-9dd4-7ef6e349e155	2025-11-03 20:57:32.712962	2025-11-03 20:57:32.712962	health_insurance.tier1_app_engagement_sustained.celebrate	You're a consistent health insurance user!	Fantastic {name}! 🎉 You've maintained active health insurance use for 6 weeks. This isn't luck - this is YOU protecting your family's future! You've proven that: \n✓ You prioritize your family's health security \n✓ You understand the value of protection \n✓ You're ready for any health emergency \n✓ You're building long-term stability \nYou're thriving and you're an example to others. Congratulations!	health_insurance	\N	\N	t	\N	\N
6ac22727-117b-4706-ac9a-6af3cf5bb801	2025-11-03 20:57:32.949899	2025-11-03 20:57:32.949899	health_insurance.first_tier1_app_retained.reward	9 weeks of health protection! Collect your reward.	Exceptional achievement {name}! 🎉 You've actively managed your health insurance for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced protecting your family's health. Amazing!	health_insurance	\N	\N	t	\N	\N
d1aecf11-5b7f-4a27-80d6-24a8d8f37977	2025-11-03 20:57:33.171598	2025-11-03 20:57:33.171598	health_insurance.tier1_app_retained.celebrate	You're a health insurance champion now. Congratulations!	Incredible {name}! 🎉 You're now a long-term health insurance user. Look at what you've achieved: \n✓ 9+ weeks of active health coverage \n✓ Peace of mind about medical emergencies \n✓ Financial protection for your family \n✓ Easy access to healthcare when needed \nCongratulations!	health_insurance	\N	\N	t	\N	\N
172b44f7-ace3-4131-a6e6-5625a8d237b4	2025-11-03 20:57:33.385572	2025-11-03 20:57:33.385572	health_insurance.tier1_app_retained.incentive	You're building real health security	{name}, you've proven you can maintain health coverage for 9+ weeks. This consistency is protecting your family's future. Medical emergencies won't catch you unprepared anymore. The longer you keep your coverage active, the more secure your family becomes. Your family's health is in good hands!	health_insurance	\N	\N	t	\N	\N
f85f6ebb-d485-4add-9a76-fa5f974a849a	2025-11-03 20:57:33.602551	2025-11-03 20:57:33.602551	health_insurance.tier1_app_retention_dropoff.how	Let's restore your health protection	Hi {name}, you were such a consistent health insurance user! We noticed you haven't been active lately. Let's fix any issues: \n• To check status: Open myNHIS app → View Card → Check if renewal is needed \n• To renew membership: Open app → New Registration → Pay annual fee \n• To find facilities: Open app → Find Hospital/Pharmacy → See covered locations \n• To check benefits: Review what services NHIS covers \n\nWatch the video below to learn how to make the most of your health insurance.\n<video>	health_insurance	\N	\N	t	["https://drive.google.com/file/d/1LF02vrW8hvO9guXJkqIinl4iaeYkMUIA/view?usp=drive_link"]	\N
f1cd112f-e87c-4e47-9590-be1295ab83b4	2025-11-03 20:57:33.811581	2025-11-03 20:57:33.811581	health_insurance.tier1_app_retention_dropoff.incentive	Your health protection is too valuable to lose	{name}, every week of health coverage you've built protects your family from financial disaster. By stopping now, you're leaving your family vulnerable to unexpected medical bills. Renew your coverage this week and keep your protection strong!	health_insurance	\N	\N	t	\N	\N
ae3d43be-158e-4fe9-b1ae-a764c8865929	2025-11-03 20:57:34.050407	2025-11-03 20:57:34.050407	health_insurance.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a health protection champion	{name}, we miss you! Your consistent health insurance coverage protected your family from medical emergencies and financial stress. Make sure you don't let this protection slip away. Take 2 minutes today to check your coverage status and renew if needed!	health_insurance	\N	\N	t	\N	\N
275d8fba-791f-4abb-95f6-ec2a12d360b6	2025-11-03 20:57:34.261621	2025-11-03 20:57:34.261621	health_insurance.tier1_app_retention_dropoff.why	Why your health coverage matters	{name}, you spent many weeks building health protection habits. Here's what you lose by stopping: \n• Financial risk: Back to worrying about how to pay medical bills \n• No access: Can't use NHIS facilities without active coverage \n• Emergency stress: One illness could wipe out your savings \n• Family vulnerability: Your loved ones are unprotected \n\nYou worked hard to build this security. Make sure you continue protecting your family. Check your coverage today and renew if needed!	health_insurance	\N	\N	t	\N	\N
38ca040c-87f3-4ddf-bb30-8d822ca72299	2025-11-03 20:57:34.485631	2025-11-03 20:57:34.485631	health_insurance.tier2_app_opened_first_time.celebrate	Welcome to health insurance!	Great start {name}! 🎉 You've opened your myNHIS app for the first time. Health is your second most important goal. This is the beginning of something powerful - affordable healthcare protection for you and your family. With health insurance, you can: \n✓ Access medical care without worrying about high costs \n✓ Get treatment at NHIS-accredited facilities \n✓ Protect yourself from health emergencies \n✓ Manage your membership from your phone \n\nTake the next step: Register your account!	health_insurance	\N	\N	t	\N	\N
0709c657-1bb4-4b4b-8531-88fd44d7ff47	2025-11-03 20:57:34.719444	2025-11-03 20:57:34.719444	health_insurance.tier2_app_adopted.celebrate	You're taking control of your health protection!	Well done {name}! 🎉 You're now using health insurance. You've taken an important step to protect your family's healthcare!	health_insurance	\N	\N	t	\N	\N
3d14c280-d745-474e-97fb-e2c3c70c7b32	2025-11-03 20:57:34.933504	2025-11-03 20:57:34.933504	health_insurance.tier2_app_registered.celebrate	Your health insurance is ready!	{name} congratulations on registering with myNHIS! 🎉 This is a major step forward! With your NHIS membership you can: \n✓ Visit accredited hospitals \n✓ Access covered services \n✓ Protect your family's health \n✓ Renew easily \nAll from your phone!	health_insurance	\N	\N	t	\N	\N
96dd1c1d-c5f9-4292-ae90-8f3709b1da95	2025-11-03 20:57:35.141475	2025-11-03 20:57:35.141475	health_insurance.tier2_app_low_activity.how	Quick tips for health insurance	Hi {name}, we noticed you haven't used your myNHIS app much. Ready to get started? Here's a quick guide: \n1. Open your app and check your membership status \n2. Find accredited facilities near you \n3. Renew when your membership expires \nStart exploring - it's simpler than you think!	health_insurance	\N	\N	t	\N	\N
86aa9a44-f0e3-427c-a3ca-16e44ab8658f	2025-11-03 20:57:35.418534	2025-11-03 20:57:35.418534	health_insurance.tier2_app_low_activity.incentive	Try health insurance	{name}, start using your myNHIS app and earn a reward of 10 GHC in just three weeks. The sooner you get started, the sooner your family will have health protection. Try it today!	health_insurance	\N	\N	t	\N	\N
a567a36e-10ef-4e14-9d62-c585feeb289a	2025-11-03 20:57:35.65358	2025-11-03 20:57:35.65358	health_insurance.tier2_app_low_activity.support	Need help with health insurance?	Hi {name}, need help using your myNHIS app? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	health_insurance	\N	\N	t	\N	\N
a14217b8-f8d0-46b9-9294-5fd58c49d04a	2025-11-03 20:57:35.861488	2025-11-03 20:57:35.861488	health_insurance.tier2_app_low_activity.why	Health insurance protects your family	{name}, health insurance offers real benefits: \n• Financial protection from unexpected medical bills \n• Access to quality healthcare when you need it \n• Peace of mind for you and your family \nGive it a try - protect your family's health today!	health_insurance	\N	\N	t	\N	\N
dac7c98b-ea20-43fb-95f4-026021c7daa7	2025-11-03 20:57:36.069525	2025-11-03 20:57:36.069525	health_insurance.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've been using health insurance for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	health_insurance	\N	\N	t	\N	\N
8ff01727-f980-445f-af81-bd1b3ed354bf	2025-11-03 20:57:36.33341	2025-11-03 20:57:36.33341	health_insurance.tier2_app_engaged.celebrate	You're protecting your health!	Great job {name}! 🎉 As an active health insurance user, you're protecting your family from medical emergencies and building financial security. Well done!	health_insurance	\N	\N	t	\N	\N
71611f9d-31c0-4024-bf41-fefdedfd2d09	2025-11-03 20:57:36.549457	2025-11-03 20:57:36.549457	health_insurance.tier2_app_engaged.incentive	Keep going with health insurance	{name}, you're doing well! Keep using health insurance and earn 10 GHC in a few weeks. Every week of coverage counts!	health_insurance	\N	\N	t	\N	\N
809cbcaf-bc85-4e29-87e3-4ab6663d370d	2025-11-03 20:57:36.805442	2025-11-03 20:57:36.805442	health_insurance.tier2_app_engagement_dropoff.how	Quick health insurance reminder	Hi {name}, we noticed you stopped using myNHIS lately. Quick reminders: \n• To check status: Open app → View Card → Check expiry \n• To renew: Open app → New Registration → Pay fee \n• To find facilities: Open app → Find Hospital \n\nWatch the video for a refresher: <video>	health_insurance	\N	\N	t	["https://drive.google.com/file/d/1LF02vrW8hvO9guXJkqIinl4iaeYkMUIA/view?usp=drive_link"]	\N
721da5dc-784c-43db-bfc7-730da4bc6241	2025-11-03 20:57:37.00563	2025-11-03 20:57:37.00563	health_insurance.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to health insurance and earn 10 GHC in a few weeks. It protects your family from medical bills and gives you peace of mind. Check your app today!	health_insurance	\N	\N	t	\N	\N
2e7ab5ec-f86a-4dab-a05e-874c732cf313	2025-11-03 20:57:37.221391	2025-11-03 20:57:37.221391	health_insurance.tier2_app_engagement_dropoff.reactivation	Try health insurance again?	{name}, you started building health protection with insurance. Take 2 minutes today to check your coverage status!	health_insurance	\N	\N	t	\N	\N
6d247385-934e-4685-b922-b0299955fa56	2025-11-03 20:57:37.430287	2025-11-03 20:57:37.430287	health_insurance.tier2_app_engagement_dropoff.why	Health insurance gives peace of mind	{name}, health insurance offers protection and security: \n• Protected from high medical bills \n• Access to accredited facilities \n• Peace of mind for emergencies \nYou already know how to use it - check your app again!	health_insurance	\N	\N	t	\N	\N
d1488bb8-c73f-4cb5-867f-0f82d3414721	2025-11-03 20:57:37.665487	2025-11-03 20:57:37.665487	health_insurance.tier2_app_engagement_sustained.celebrate	6 weeks of health protection!	Well done {name}! 🎉 You've maintained health insurance for 6 weeks. You're protecting your family well!	health_insurance	\N	\N	t	\N	\N
3891b7e2-4771-4439-a846-e4c351313100	2025-11-03 20:57:37.901661	2025-11-03 20:57:37.901661	health_insurance.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency with health insurance!	Excellent {name}! 🎉 You've maintained health insurance for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	health_insurance	\N	\N	t	\N	\N
2272bf03-a33c-4f46-9ba8-cce3e30ec357	2025-11-03 20:57:38.126703	2025-11-03 20:57:38.126703	health_insurance.tier2_app_retained.celebrate	You're a health insurance user!	Impressive {name}! 🎉 You've been maintaining health insurance consistently. You're protecting your family well. Keep it up!	health_insurance	\N	\N	t	\N	\N
29d021c9-0fbb-46ee-be5e-817c8f1f1b0b	2025-11-03 20:57:38.829485	2025-11-03 20:57:38.829485	health_insurance.tier2_app_retained.incentive	Keep your health insurance active	{name}, your consistent health insurance coverage is building valuable protection for your family. Your loved ones are safer because of your commitment. Keep it up!	health_insurance	\N	\N	t	\N	\N
c10f181f-0e36-4a5e-95ee-9927a446d719	2025-11-03 20:57:39.041116	2025-11-03 20:57:39.041116	health_insurance.tier2_app_retention_dropoff.how	Quick health insurance reminder	Hi {name}, we noticed you stopped using myNHIS lately. Quick reminders: \n• To check status: Open app → View Card → Check expiry \n• To renew: Open app → New Registration → Pay fee \n• To find facilities: Open app → Find Hospital \n\nWatch the video for a refresher: <video>	health_insurance	\N	\N	t	["https://drive.google.com/file/d/1LF02vrW8hvO9guXJkqIinl4iaeYkMUIA/view?usp=drive_link"]	\N
78d768a5-5087-4b2e-99c0-74f32c97fe1b	2025-11-03 20:57:39.269603	2025-11-03 20:57:39.269603	health_insurance.tier2_app_retention_dropoff.incentive	Your health coverage is waiting	{name}, you built good health insurance habits. Come back and keep your family protected from medical emergencies.	health_insurance	\N	\N	t	\N	\N
dc2bb927-8af0-46fb-8064-aa295850ca2b	2025-11-03 20:57:39.484514	2025-11-03 20:57:39.484514	health_insurance.tier2_app_retention_dropoff.reactivation	Come back to health insurance	{name}, you were doing great with health insurance! Check your coverage today and keep your family protected.	health_insurance	\N	\N	t	\N	\N
d5fa8801-a6be-4fe8-821e-98c4d0c45444	2025-11-03 20:57:39.740612	2025-11-03 20:57:39.740612	health_insurance.tier2_app_retention_dropoff.why	Keep your health protection	{name}, you built weeks of health coverage. Keep going to maintain: \n• Financial protection from medical bills \n• Access to quality healthcare \n• Peace of mind for your family \nCheck your app today to stay protected!	health_insurance	\N	\N	t	\N	\N
f04176fb-2d69-43cc-8da9-740a320ea64b	2025-11-03 20:57:39.959489	2025-11-03 20:57:39.959489	reading.tier1_app_opened_first_time.celebrate	Welcome to Booksmart!	Great start {name}! 🎉 You've opened Booksmart for the first time. Education is your most important goal. This is the beginning of something powerful - a library of thousands of books right on your phone. With Booksmart, you can: \n✓ Read or listen to stories anytime \n✓ Find books for yourself and your children \n✓ Build reading skills step by step \n✓ Discover new worlds through stories \n\nTake the next step: Create your account!	reading	\N	\N	t	\N	\N
03676474-cafa-4d6e-81e6-4b3b969d5916	2025-11-03 20:57:40.174384	2025-11-03 20:57:40.174384	reading.tier1_app_adopted.celebrate	You're building reading habits!	Well done {name}! 🎉 You're now using Booksmart. You've opened a world of stories and learning! By reading regularly, you're: \n✓ Strengthening your reading skills \n✓ Expanding your vocabulary \n✓ Enjoying stories from around the world \n✓ Setting an example for your children \nKeep going!	reading	\N	\N	t	\N	\N
eacfd569-364c-405c-8864-c66a5357cf6a	2025-11-03 20:57:40.416355	2025-11-03 20:57:40.416355	reading.tier1_app_registered.celebrate	Your reading account is ready!	{name} congratulations on registering for Booksmart! 🎉 This is a major step forward! With your account you can: \n✓ Access thousands of books \n✓ Save books to read later \n✓ Listen to stories with audio \n✓ Read in English or local languages \nAll from your phone!	reading	\N	\N	t	\N	\N
cce69efe-cdf2-40b1-90b6-0b9f8f98f96e	2025-11-03 20:57:40.61953	2025-11-03 20:57:40.61953	reading.tier1_app_low_activity.how	Get the most from Booksmart	Hi {name}, we noticed you haven't used Booksmart much. Here's how to find and read books: \n1. Open the Booksmart app\n2. Click on search to find specific books\n3. Or browse by categories like adventure, family, or learning\n4. Click on a book to open it\n5. Swipe to turn pages\n\nYou can also select books by age range if they're for your children!	reading	\N	\N	t	\N	\N
a5a07618-4a82-4a96-a599-b61dfcaef752	2025-11-03 20:57:40.821455	2025-11-03 20:57:40.821455	reading.tier1_app_low_activity.incentive	Your reward is waiting - start reading with Booksmart!	{name}, start using Booksmart and earn a reward of 10 GHC in just three weeks! Every story you read strengthens your skills and brings joy to your day. The sooner you start, the sooner you'll discover the pleasure of reading. Try one book today!	reading	\N	\N	t	\N	\N
ad1defed-cada-41fe-a06d-4aa9456547c7	2025-11-03 20:57:41.062605	2025-11-03 20:57:41.062605	reading.tier1_app_low_activity.support	Need help with Booksmart?	Hi {name}, need help using Booksmart? We're here for you! Common questions: \n• How to find books? Use the search function or browse categories at the top of the screen. \n• How to read a book? Click on any book cover to open it and start reading. Swipe to turn pages. \n• Can't find what you want? Try different categories or use the age filter for children's books. \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	reading	\N	\N	t	\N	\N
55f09e8a-dd8d-4c2f-8569-52cf379f5c3d	2025-11-03 20:57:41.27163	2025-11-03 20:57:41.27163	reading.tier1_app_low_activity.why	Why reading with Booksmart matters	{name}, we know starting something new can feel uncertain. But missing out on reading has real costs: \n• Limited vocabulary and reading skills \n• No access to knowledge and stories \n• Children miss out on bedtime stories \n• No way to learn new things through books \n\nBooksmart solves these problems. You have thousands of books on your phone - stories that entertain, educate, and inspire. Take the first step today - you'll be glad you did!	reading	\N	\N	t	\N	\N
f484c844-2555-40e2-b4cd-b4b49fe9e699	2025-11-03 20:57:41.525583	2025-11-03 20:57:41.525583	reading.first_tier1_app_engaged.reward	3 weeks of reading! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively reading on Booksmart for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - a love for reading and learning. Congratulations!	reading	\N	\N	t	\N	\N
fa3cc28d-59d3-4d63-b674-81119591a4a4	2025-11-03 20:57:41.740677	2025-11-03 20:57:41.740677	reading.tier1_app_engaged.celebrate	You're becoming a great reader!	Excellent work {name}! 🎉 Now that you are an active Booksmart user you're: \n✓ Strengthening your reading skills daily\n✓ Discovering new stories and ideas \n✓ Building vocabulary and understanding \n✓ Enjoying the joy that reading brings \nYou're not just reading books - you're opening your mind to new possibilities. Keep it up!	reading	\N	\N	t	\N	\N
0b1faabb-1133-4a3b-99f5-171ffd193aba	2025-11-03 20:57:41.94948	2025-11-03 20:57:41.94948	reading.tier1_app_engaged.incentive	Keep reading - more stories await!	{name}, you're doing great with Booksmart! Keep reading actively and earn 10 GHC in a few weeks. Every story you read makes you a stronger reader. Keep it up!	reading	\N	\N	t	\N	\N
b9cbdf0d-ef24-4b36-87e5-0de5f115b13a	2025-11-03 20:57:42.186482	2025-11-03 20:57:42.186482	reading.tier1_app_engagement_dropoff.how	Come back to Booksmart - we can help!	Hi {name}, we noticed you stopped using Booksmart recently. Let's get you back on track! Quick reminders: \n• To find books: Open app → Use search or browse categories \n• To read: Click on a book cover → Swipe to turn pages \n• To save books: Click the bookmark icon to save for later \n• To find children's books: Use the age filter (3-5, 6-8, 9-12) \n\nWatch the video to learn how to make the most of your reading experience.	reading	\N	\N	t	["https://drive.google.com/file/d/1aac4IjGm9JHyl0W1MejB97pJHYvoSLb6/view?usp=drive_link"]	\N
9efe31f2-bc2d-4091-a360-605bd315d559	2025-11-03 20:57:42.418464	2025-11-03 20:57:42.418464	reading.tier1_app_engagement_dropoff.incentive	Don't lose your reading momentum!	{name}, you were doing so well building your reading habit! Come back now and earn 10 GHC in just a few weeks. Reading brings knowledge, joy, and stronger skills. Start again today!	reading	\N	\N	t	\N	\N
a7846ae2-bc22-4851-94f6-58894d80f01a	2025-11-03 20:57:42.655226	2025-11-03 20:57:42.655226	reading.tier1_app_engagement_dropoff.reactivation	Your books miss you - come back today!	{name}, we miss you! You were building something important with Booksmart: stronger reading skills and a world of knowledge. Take 2 minutes today to read again and get back on track!	reading	\N	\N	t	\N	\N
eeb90833-3abc-4394-8e27-4db7dd67b4d8	2025-11-03 20:57:42.861456	2025-11-03 20:57:42.861456	reading.tier1_app_engagement_dropoff.why	Remember why you started reading	{name}, stopping your reading habit means losing important benefits: \n• Reading skills get weaker without practice \n• Missing out on knowledge and stories \n• No entertainment through books \n• Lost progress in building vocabulary \n\nYou already learned how to use Booksmart. Don't give up the joy and learning that reading brings. Your future self will thank you!	reading	\N	\N	t	\N	\N
24d0e412-3bfc-49e1-a507-cce684d4a04e	2025-11-03 20:57:43.057647	2025-11-03 20:57:43.057647	reading.tier1_app_engagement_sustained.celebrate	You're a consistent reader!	Fantastic {name}! 🎉 You've maintained active reading on Booksmart for 6 weeks. This isn't luck - this is YOU committing to learning and growth! You've proven that: \n✓ You can build strong reading habits \n✓ You enjoy discovering new stories \n✓ You're expanding your knowledge \n✓ You're setting a great example \nYou're inspiring others through your reading journey. Congratulations!	reading	\N	\N	t	\N	\N
eb97533d-2482-40c9-9497-9410a2271c49	2025-11-03 20:57:43.33056	2025-11-03 20:57:43.33056	reading.first_tier1_app_retained.reward	9 weeks of reading! Collect your reward.	Exceptional achievement {name}! 🎉 You've read actively on Booksmart for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've truly become a dedicated reader. Amazing!	reading	\N	\N	t	\N	\N
64d8b826-c81c-411f-9a1c-b093fb04b4a6	2025-11-03 20:57:43.561791	2025-11-03 20:57:43.561791	reading.tier1_app_retained.celebrate	You're a reading champion now. Congratulations!	Incredible {name}! 🎉 You're now a long-term Booksmart reader. Look at what you've achieved: \n✓ 9+ weeks of consistent reading \n✓ Stronger vocabulary and comprehension \n✓ Countless stories enjoyed \n✓ Knowledge gained through books \nYour dedication to reading is inspiring. Congratulations!	reading	\N	\N	t	\N	\N
182a02d2-1fc9-4b46-be27-5426cb9b9a84	2025-11-03 20:57:43.764992	2025-11-03 20:57:43.764992	reading.tier1_app_retained.incentive	You're building real knowledge	{name}, you've proven you can maintain a reading habit for 9+ weeks. This consistency is expanding your mind and strengthening your skills. The more you read, the more you grow. Your reading journey is just beginning!	reading	\N	\N	t	\N	\N
e5e782ab-b5be-43c2-be15-2575befa6e5e	2025-11-03 20:57:43.98144	2025-11-03 20:57:43.98144	reading.tier1_app_retention_dropoff.how	Let's solve your Booksmart issue	Hi {name}, you were such a consistent reader! We noticed you haven't been active lately. Let's fix any issues: \n• To find books: Open app → Search or browse categories \n• To read: Click book → Swipe pages → Enjoy the story \n• To save favorites: Use the bookmark function \n• To try different books: Explore various categories \n\nWatch the video to rediscover the joy of reading with Booksmart.	reading	\N	\N	t	["https://drive.google.com/file/d/1aac4IjGm9JHyl0W1MejB97pJHYvoSLb6/view?usp=drive_link"]	\N
63a459f9-6402-4a6e-90a4-89425c65880d	2025-11-03 20:57:44.219418	2025-11-03 20:57:44.219418	reading.tier1_app_retention_dropoff.incentive	Your reading skills are too valuable to lose	{name}, every week of reading you've done has made you a stronger reader. By stopping now, those skills can weaken. Read on Booksmart this week and keep growing!	reading	\N	\N	t	\N	\N
8960f9b0-fa83-4eed-8c0d-844f45d3f13b	2025-11-03 20:57:44.443507	2025-11-03 20:57:44.443507	reading.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a reading champion	{name}, we miss you! Your consistent reading was building stronger skills and bringing you knowledge and joy. Don't let this slip away. Take 2 minutes today to read again and continue your journey!	reading	\N	\N	t	\N	\N
0a99b76c-b3fa-46c2-9034-b2c3473bed69	2025-11-03 20:57:44.659506	2025-11-03 20:57:44.659506	reading.tier1_app_retention_dropoff.why	Why your reading habit matters	{name}, you spent many weeks building a reading habit. Here's what you lose by stopping: \n• Reading skills weaken without practice \n• Missing new stories and knowledge \n• Lost entertainment and learning \n• Example to children is weakened \n\nYou worked hard to become a regular reader. Don't let your progress slip away. Take two minutes today to read and get back on track.	reading	\N	\N	t	\N	\N
933d0294-a5f6-4250-9a9f-7fb2a1649058	2025-11-03 20:57:44.871043	2025-11-03 20:57:44.871043	reading.tier2_app_opened_first_time.celebrate	Welcome to Booksmart!	Great start {name}! 🎉 You've opened Booksmart for the first time. Education is your second most important goal. This is the beginning of something wonderful - thousands of books on your phone. With Booksmart, you can: \n✓ Read stories anytime \n✓ Find books for all ages \n✓ Improve your reading \n✓ Enjoy learning through stories \n\nTake the next step: Create your account!	reading	\N	\N	t	\N	\N
b5fd4886-b47f-4ac1-bf23-4a1f96cf217e	2025-11-03 20:57:45.096752	2025-11-03 20:57:45.096752	reading.tier2_app_adopted.celebrate	You're starting to read!	Well done {name}! 🎉 You're now using Booksmart. You've opened a world of stories!	reading	\N	\N	t	\N	\N
08c23947-1bf2-4b96-b7d3-eb14e7887650	2025-11-03 20:57:45.300455	2025-11-03 20:57:45.300455	reading.tier2_app_registered.celebrate	Your reading account is ready!	{name} congratulations on registering for Booksmart! 🎉 This is a great step! With your account you can: \n✓ Access many books \n✓ Save stories to read later \n✓ Listen to audio books \n✓ Read at your own pace \nAll from your phone!	reading	\N	\N	t	\N	\N
34a8f1aa-507e-4817-9e55-877fe7e04d59	2025-11-03 20:57:45.515623	2025-11-03 20:57:45.515623	reading.tier2_app_low_activity.how	Quick tips for Booksmart	Hi {name}, we noticed you haven't used Booksmart much. Ready to try reading? Here's a quick start: \n1. Open the app and browse categories\n2. Click on a book that interests you  \n3. Swipe to read through the pages \nStart with short stories until you're comfortable!	reading	\N	\N	t	\N	\N
a8de66a2-ab57-45f4-bcc2-60c1a247560b	2025-11-03 20:57:45.721449	2025-11-03 20:57:45.721449	reading.tier2_app_low_activity.incentive	Try Booksmart and earn a reward	{name}, start using Booksmart and earn a reward of 10 GHC in just three weeks. Discover the joy of reading today!	reading	\N	\N	t	\N	\N
dfe86ac9-027d-4657-8191-98512e126edf	2025-11-03 21:00:59.099282	2025-11-03 21:00:59.099282	women_child_health.tier1_app_low_activity.why	Why Bebbo matters for your family's health	{name}, raising a healthy child can sometimes feel uncertain. Common worries include: \n• Not knowing if your child is developing normally \n• Confusion about feeding and nutrition \n• Not being able to afford frequent doctor visits for advice \n• Feeling alone with your questions \nBebbo solves these problems. You get expert health guidance on your phone - anytime you need it. Thousands of parents trust Bebbo. Take the first step today - you and your child deserve it!	women_child_health	\N	\N	t	\N	\N
55752449-f5a1-4b0e-aeaf-1852654b7a8a	2025-11-03 21:00:59.311206	2025-11-03 21:00:59.311206	women_child_health.first_tier1_app_engaged.reward	3 weeks of Bebbo success! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using Bebbo for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - knowledge that helps your child thrive. Congratulations!	women_child_health	\N	\N	t	\N	\N
d1ce26ed-9dfc-4279-8963-19697481cba4	2025-11-03 21:00:59.546225	2025-11-03 21:00:59.546225	women_child_health.tier1_app_engaged.celebrate	You're becoming a confident parent!	Excellent work {name}! 🎉 Now that you're an active Bebbo user, you're: \n✓ Learning how to support your child's development \n✓ Getting answers to your health questions \n✓ Building confidence in your parenting decisions \n✓ Giving your child the best start in life \nYou're not just using an app - you're investing in your family's future. Keep it up!	women_child_health	\N	\N	t	\N	\N
956b5cbc-6760-49ac-a382-a8e4123a6ed7	2025-11-03 21:00:59.766092	2025-11-03 21:00:59.766092	women_child_health.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with Bebbo! Keep using it actively and earn 10 GHC in a few weeks. The more you learn from Bebbo, the more confident you become as a parent. Your child benefits from everything you learn. Keep it up!	women_child_health	\N	\N	t	\N	\N
66080fd5-1ac7-46e0-a732-57e8e2ebf5eb	2025-11-03 21:00:59.9801	2025-11-03 21:00:59.9801	women_child_health.tier1_app_engagement_dropoff.how	Come back to Bebbo - we can help!	Hi {name}, we noticed you stopped using Bebbo recently. Let's get you back on track! Quick reminders: \n• Open the Bebbo app \n• Click on topics that interest you - feeding, development, health, play \n• Read articles and watch videos in your language \n• Try suggested activities with your child \n• Save important articles for later \n\nIf you find something helpful, you can save it to access easily. Your child's health journey continues - come back today!	women_child_health	\N	\N	t	["https://drive.google.com/file/d/1Ik6as0gK9Q4v8Rtc9eVaFOSSAb_Cgw2M/view?usp=drive_link"]	\N
52ae7114-ba4f-4dcb-941f-1acb6e5bc1a2	2025-11-03 21:01:00.195125	2025-11-03 21:01:00.195125	women_child_health.tier1_app_engagement_dropoff.incentive	Don't lose your Bebbo momentum!	{name}, you were doing so well with Bebbo! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of having expert health guidance at your fingertips. Your child needs you to keep learning and growing as a parent!	women_child_health	\N	\N	t	\N	\N
331112b4-4705-4575-b498-da6040d5aa2c	2025-11-03 21:01:00.406432	2025-11-03 21:01:00.406432	women_child_health.tier1_app_engagement_dropoff.reactivation	Your health guide misses you - come back today!	{name}, we miss you! You were building something important with Bebbo: confidence and knowledge to raise a healthy child. Take 2 minutes today to use Bebbo again and get back on track!	women_child_health	\N	\N	t	\N	\N
9acacdda-76d6-426d-aaa7-71598a8b4db1	2025-11-03 21:01:00.611255	2025-11-03 21:01:00.611255	women_child_health.tier1_app_engagement_dropoff.why	Remember why you started Bebbo	{name}, going without expert health guidance means: \n• Uncertainty: Not knowing if your child is developing as they should \n• Worry: Feeling unsure about health decisions \n• Isolation: Facing parenting challenges alone \n• Missed opportunities: Not knowing the best activities to help your child learn and grow \nYou already learned how to use Bebbo. Don't give up the confidence and peace of mind you worked for. Your child's healthy future is worth it!	women_child_health	\N	\N	t	\N	\N
be6067dd-e882-4c0e-ad59-256d0a2a4b81	2025-11-03 21:01:00.863135	2025-11-03 21:01:00.863135	women_child_health.tier1_app_engagement_sustained.celebrate	You're a committed parent!	Fantastic {name}! 🎉 You've maintained active Bebbo use for 6 weeks. This isn't luck - this is YOU taking charge of your family's health! You've proven that: \n✓ You're dedicated to learning and growing as a parent \n✓ You value expert health guidance \n✓ You're giving your child the attention they deserve \n✓ You're building a healthier future for your family \nYou're thriving and you're an example to others. Congratulations!	women_child_health	\N	\N	t	\N	\N
0e8e92c3-cbdc-46d6-b77d-fe7bf78456c9	2025-11-03 21:01:01.175222	2025-11-03 21:01:01.175222	women_child_health.first_tier1_app_retained.reward	9 weeks of Bebbo! Collect your reward.	Exceptional achievement {name}! 🎉 You've used Bebbo actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced learning and growing as a parent. Amazing!	women_child_health	\N	\N	t	\N	\N
868e1250-e6de-42c7-a87a-b6dda6832e3e	2025-11-03 20:57:45.928478	2025-11-03 20:57:45.928478	reading.tier2_app_low_activity.support	Need help with Booksmart?	Hi {name}, need help using Booksmart? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	reading	\N	\N	t	\N	\N
fe1dffcf-6993-4c72-ba0a-1c28d5dbe87c	2025-11-03 20:57:46.133583	2025-11-03 20:57:46.133583	reading.tier2_app_low_activity.why	Booksmart brings stories to life	{name}, Booksmart offers wonderful benefits: \n• Thousands of free books \n• Stories in different languages\n• Reading practice anytime\nGive it a try - discover the joy of reading!	reading	\N	\N	t	\N	\N
d5400459-33df-4609-9cba-8fcaa5428858	2025-11-03 20:57:46.3346	2025-11-03 20:57:46.3346	reading.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used Booksmart for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep reading!	reading	\N	\N	t	\N	\N
189313a8-5081-4935-8912-49d5932d2275	2025-11-03 20:57:46.540448	2025-11-03 20:57:46.540448	reading.tier2_app_engaged.celebrate	You're reading regularly!	Great job {name}! 🎉 As an active Booksmart user, you're building reading skills and enjoying great stories!	reading	\N	\N	t	\N	\N
993bb0d9-5bbe-477f-a20d-10c55c6ab3dd	2025-11-03 20:57:46.749501	2025-11-03 20:57:46.749501	reading.tier2_app_engaged.incentive	Keep reading with Booksmart	{name}, you're doing well! Keep using Booksmart and earn 10 GHC in a few weeks. Every story you read counts!	reading	\N	\N	t	\N	\N
2b705cee-130d-4371-8986-2435044786e9	2025-11-03 20:57:47.017531	2025-11-03 20:57:47.017531	reading.tier2_app_engagement_dropoff.how	Quick Booksmart reminder	Hi {name}, we noticed you stopped reading lately. Quick reminders: \n• To find books: Open app → Browse or search \n• To read: Click book → Swipe pages \n• To save books: Use bookmark feature \n\nWatch the video for a refresher.	reading	\N	\N	t	["https://drive.google.com/file/d/1aac4IjGm9JHyl0W1MejB97pJHYvoSLb6/view?usp=drive_link"]	\N
ae076a1f-2843-4410-93db-e4537ec095b2	2025-11-03 20:57:47.309402	2025-11-03 20:57:47.309402	reading.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Booksmart and earn 10 GHC in a few weeks. Keep enjoying great stories!	reading	\N	\N	t	\N	\N
ec34b623-c213-4649-b5f2-2996cc0822dc	2025-11-03 20:57:47.521579	2025-11-03 20:57:47.521579	reading.tier2_app_engagement_dropoff.reactivation	Try reading again?	{name}, you started building a reading habit with Booksmart. Take 2 minutes today to read again!	reading	\N	\N	t	\N	\N
351d341a-fa51-44f6-8f26-c0498d132b35	2025-11-03 20:57:47.726843	2025-11-03 20:57:47.726843	reading.tier2_app_engagement_dropoff.why	Reading brings joy and learning	{name}, Booksmart gives you access to: \n• Free books and stories \n• Reading practice \n• Knowledge and entertainment \nYou already know how to use it - try it again!	reading	\N	\N	t	\N	\N
18c85076-7bad-42d6-8c08-5bdd05043b64	2025-11-03 20:57:47.941433	2025-11-03 20:57:47.941433	reading.tier2_app_engagement_sustained.celebrate	6 weeks of reading!	Well done {name}! 🎉 You've used Booksmart consistently for 6 weeks. You're building great reading habits and enjoying wonderful stories!	reading	\N	\N	t	\N	\N
a5111e32-fe48-453a-9463-1a05760d01a9	2025-11-03 20:57:48.155466	2025-11-03 20:57:48.155466	reading.first_tier2_app_retained.reward	You've earned 10 GHC for reading!	Excellent {name}! 🎉 You've used Booksmart for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great reading consistency!	reading	\N	\N	t	\N	\N
04bd131d-83e1-4e6f-9d3d-b2eb480e6429	2025-11-03 20:57:48.355498	2025-11-03 20:57:48.355498	reading.tier2_app_retained.celebrate	You're a regular reader!	Impressive {name}! 🎉 You've been using Booksmart consistently. You're enjoying books and building strong reading skills. Well done!	reading	\N	\N	t	\N	\N
d03a9d84-4712-4868-836f-27b27b196b91	2025-11-03 20:57:48.569378	2025-11-03 20:57:48.569378	reading.tier2_app_retained.incentive	Keep your reading habit going	{name}, your consistent reading is building valuable skills. Keep it up and continue enjoying great stories!	reading	\N	\N	t	\N	\N
d636d83f-85c2-4848-beb1-c6548609e558	2025-11-03 20:57:48.796471	2025-11-03 20:57:48.796471	reading.tier2_app_retention_dropoff.how	Quick Booksmart reminder	Hi {name}, we noticed you stopped reading lately. Quick reminders: \n• To find books: Open app → Browse categories \n• To read: Click book → Swipe to turn pages \n• To save favorites: Use bookmark \n\nWatch the video for a refresher.	reading	\N	\N	t	["https://drive.google.com/file/d/1aac4IjGm9JHyl0W1MejB97pJHYvoSLb6/view?usp=drive_link"]	\N
2a826879-7d3b-4c6d-9ff5-64d7e7164664	2025-11-03 20:57:49.001888	2025-11-03 20:57:49.001888	reading.tier2_app_retention_dropoff.incentive	Your reading habit is waiting	{name}, you built a great reading habit. Come back and continue enjoying books!	reading	\N	\N	t	\N	\N
d3d5d0b0-e1f1-4aaf-ad0a-1f126e0c8f9b	2025-11-03 20:57:49.208516	2025-11-03 20:57:49.208516	reading.tier2_app_retention_dropoff.reactivation	Come back to Booksmart	{name}, you were doing great with reading! Use Booksmart again today and continue your reading journey.	reading	\N	\N	t	\N	\N
d0be2ea4-0244-4293-a656-ff7d058f4674	2025-11-03 20:57:49.414476	2025-11-03 20:57:49.414476	reading.tier2_app_retention_dropoff.why	Keep reading and learning	{name}, you built weeks of reading habits. Keep going to maintain: \n• Reading skills \n• Access to great stories \n• Learning and entertainment \nRead today to continue your journey!	reading	\N	\N	t	\N	\N
6c71a883-8482-4771-8c20-b34a3d3b4a26	2025-11-03 20:57:49.626527	2025-11-03 20:57:49.626527	retirement_savings.tier1_app_opened_first_time.celebrate	Welcome to retirement savings!	Great start {name}! 🎉 You've opened your retirement savings app for the first time. Finance is your most important goal. This is the beginning of something powerful - securing your future. With retirement savings, you can: \n✓ Save small amounts for old age \n✓ Watch your money grow over time \n✓ Build independence for your future \n✓ Protect yourself when you can't work \nTake the next step: Register your account!	retirement_savings	\N	\N	t	\N	\N
975d9d74-7ac1-4e93-bdf5-621f4dadcbd3	2025-11-03 20:57:49.875579	2025-11-03 20:57:49.875579	retirement_savings.tier1_app_adopted.celebrate	You're securing your future!	Well done {name}! 🎉 You're now using retirement savings. You've taken an important step toward your future! By saving for retirement, you're: \n✓ Building long-term security \n✓ Gaining independence \n✓ Planning beyond today's needs \nKeep going!	retirement_savings	\N	\N	t	\N	\N
b68c780d-1c9d-456e-ac27-c783667c3284	2025-11-03 20:57:50.085331	2025-11-03 20:57:50.085331	retirement_savings.tier1_app_registered.celebrate	Your retirement account is ready!	{name} congratulations on registering for retirement savings! 🎉 This is a major step forward! With your retirement account you can: \n✓ Save small amounts regularly \n✓ Watch your savings grow \n✓ Build security for old age \n✓ Create independence for your future \nAll from your phone!	retirement_savings	\N	\N	t	\N	\N
35fa48cb-608e-41af-89a2-0cfabef1b325	2025-11-03 20:57:50.299639	2025-11-03 20:57:50.299639	retirement_savings.tier1_app_low_activity.how	Get the most from your retirement savings	Hi {name}, we noticed you haven't used your retirement savings app much. It's easy to get started! Here's how: \n1. Open your retirement savings app \n2. Set up a small regular contribution - even 10 GHC per month helps \n3. Check your balance to see your savings grow \n4. Review your progress toward your retirement goal \nStart with small amounts until you feel comfortable. Once you see your savings growing, you'll feel proud of your progress!\n\nWatch the video to learn how to make the most of retirement savings.	retirement_savings	\N	\N	t	["https://drive.google.com/file/d/1FV7sWzx8vZU_9-p00dlj1wnC-nOMsrlb/view?usp=drive_link"]	\N
8cdcf2eb-5539-4110-8a11-d91660e8c259	2025-11-03 20:57:50.502487	2025-11-03 20:57:50.502487	retirement_savings.tier1_app_low_activity.incentive	Your reward is waiting - start saving for your future!	{name}, start using your retirement savings app actively and earn a reward of 10 GHC in just three weeks! Every small amount you save today means security and independence tomorrow. The sooner you start, the more time your money has to grow. Make your first contribution today!	retirement_savings	\N	\N	t	\N	\N
da80018b-ffed-4524-9a3f-3cea3bdd3815	2025-11-03 20:57:50.745619	2025-11-03 20:57:50.745619	retirement_savings.tier1_app_low_activity.support	Need help with retirement savings?	Hi {name}, need help using your retirement savings app? We're here for you! Common questions: \n• How to make a contribution? Click on ‘Contribute’ → Enter an amount you are comfortable with → Pick payment mode → Add your mobile number → Choose how often you want to make payments to your pension account → Pay Now. \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	retirement_savings	\N	\N	t	\N	\N
a15ae333-da01-4019-9377-c9aa8ebd3001	2025-11-03 20:57:51.083035	2025-11-03 20:57:51.083035	retirement_savings.tier1_app_low_activity.why	Why retirement savings matters for your independence	{name}, we know planning for old age feels distant. But saving for retirement has real benefits: \n• Future security: When you can't work, you'll have money to rely on \n• Independence: You won't need to depend only on family for support • Dignity: You'll have your own resources in old age \n• Peace of mind: Knowing you're preparing reduces worry \nSmall amounts add up over time. Others in your community are already securing their futures. Start today - your future self will thank you!	retirement_savings	\N	\N	t	\N	\N
94625d30-5915-4d4b-a44a-54958e93744d	2025-11-03 20:57:51.309597	2025-11-03 20:57:51.309597	retirement_savings.first_tier1_app_engaged.reward	3 weeks of smart saving! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively saving for retirement for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! You're building something powerful - security for your future. Congratulations!	retirement_savings	\N	\N	t	\N	\N
ef39522f-d5d5-471f-a9af-9d00c4d7e164	2025-11-03 20:57:51.532418	2025-11-03 20:57:51.532418	retirement_savings.tier1_app_engaged.celebrate	You're mastering retirement savings!	Excellent work {name}! 🎉 As an active retirement saver you're: \n✓ Building real security for your future \n✓ Growing your savings steadily \n✓ Creating independence for old age \n✓ Setting an example for others \nYou're not just saving money - you're building your future independence. Keep it up!	retirement_savings	\N	\N	t	\N	\N
9bc67f1d-a4cf-4adf-97b7-55596402a110	2025-11-03 20:57:51.739707	2025-11-03 20:57:51.739707	retirement_savings.tier1_app_engaged.incentive	Keep going - your future self will thank you!	{name}, you're doing great with retirement savings! Keep contributing actively and earn 10 GHC in a few weeks. Every amount you save now multiplies over time. The more you save, the more secure your future becomes. Keep it up!	retirement_savings	\N	\N	t	\N	\N
ce7a67cd-e1d3-48d8-90d8-f5acd57fbcb4	2025-11-03 20:57:51.944818	2025-11-03 20:57:51.944818	retirement_savings.tier1_app_engagement_dropoff.how	Come back to retirement savings - we can help!	Hi {name}, have you been contributing to retirement recently? If not, let's get you back on track! Quick reminders: \n• To contribute: Click on ‘Contribute’ → Enter an amount you are comfortable with → Pick payment mode → Add your mobile number → Choose how often you want to make payments to your pension account → Pay Now.  \n\nWatch the video to learn how to make the most of retirement savings.	retirement_savings	\N	\N	t	["https://drive.google.com/file/d/1FV7sWzx8vZU_9-p00dlj1wnC-nOMsrlb/view?usp=drive_link"]	\N
a0720ccc-6372-4dd6-8b7d-2fa966f56c60	2025-11-03 20:57:52.175359	2025-11-03 20:57:52.175359	retirement_savings.tier1_app_engagement_dropoff.incentive	Don't lose your retirement momentum!	{name}, you were doing so well building your future! Come back now and earn 10 GHC in just a few weeks. Every week without saving is a week your future security doesn't grow.	retirement_savings	\N	\N	t	\N	\N
af5bdf7a-e262-4285-af4a-d2745ac663a7	2025-11-03 20:57:52.451421	2025-11-03 20:57:52.451421	retirement_savings.tier1_app_engagement_dropoff.reactivation	Your retirement savings is waiting for you!	{name}, we miss you! You were building something important: security and independence for your future. Take 2 minutes today to make a small contribution and get back on track!	retirement_savings	\N	\N	t	\N	\N
1cde87d3-0163-4618-965c-429039d83c30	2025-11-03 20:57:52.732966	2025-11-03 20:57:52.732966	retirement_savings.tier1_app_engagement_dropoff.why	Remember why you started saving for retirement	{name}, going back to not saving means going back to old worries: \n• Uncertainty: Not knowing how you'll manage when you can't work - retirement savings provides security \n• Dependence: Having to rely only on family - savings gives you independence \n• Lost time: The longer you wait, the less time your money has to grow \n\nYou already started building your future. Don't give up the security you're creating. Your future self will thank you!	retirement_savings	\N	\N	t	\N	\N
887a19e7-0613-4865-be0a-0d8474033d04	2025-11-03 20:57:52.939457	2025-11-03 20:57:52.939457	retirement_savings.tier1_app_engagement_sustained.celebrate	You're building a secure future!	Fantastic {name}! 🎉 You've maintained active retirement savings for 6 weeks. This isn't luck - this is YOU planning for your future! You've proven that: \n✓ You can save consistently \n✓ You value your future independence \n✓ You're building real long-term security \n✓ You're thinking beyond today \nYou're thriving and you're an example to others. Congratulations!	retirement_savings	\N	\N	t	\N	\N
c53bd7ec-dbb1-436f-bafe-593e4ce75e22	2025-11-03 20:57:53.149473	2025-11-03 20:57:53.149473	retirement_savings.first_tier1_app_retained.reward	9 weeks of retirement savings! Collect your reward.	Exceptional achievement {name}! 🎉 You've been saving for retirement actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced planning for your future. Amazing!	retirement_savings	\N	\N	t	\N	\N
6c36c53a-5503-4eb7-a63f-1afaacf50fd7	2025-11-03 20:57:53.399545	2025-11-03 20:57:53.399545	retirement_savings.tier1_app_retained.celebrate	You're a retirement savings champion. Congratulations!	Incredible {name}! 🎉 You're now a long-term retirement saver. Look at what you've achieved: \n✓ 9+ weeks of consistent saving \n✓ Growing security for your future \n✓ Independence being built week by week \n✓ Confidence in your financial future \nCongratulations!	retirement_savings	\N	\N	t	\N	\N
6a52fb31-a205-4295-9683-73ef9013cd1f	2025-11-03 20:57:53.620436	2025-11-03 20:57:53.620436	retirement_savings.tier1_app_retained.incentive	You're building real future security	{name}, you've proven you can save for your future consistently for 9+ weeks. This discipline is creating something powerful: when you reach old age, you'll have resources of your own. The longer you keep going, the stronger your future becomes. Your future self will thank you!	retirement_savings	\N	\N	t	\N	\N
7adedaf5-6683-4377-a0c7-e268a0500b4a	2025-11-03 20:57:53.82158	2025-11-03 20:57:53.82158	retirement_savings.tier1_app_retention_dropoff.how	Let's solve your retirement savings issue	Hi {name}, you were such a consistent saver for your future! We noticed you haven't been active lately. Let's fix any issues: \n• To contribute: Click on ‘Contribute’ → Enter an amount you are comfortable with → Pick payment mode → Add your mobile number → Choose how often you want to make payments to your pension account → Pay Now. \n\nWatch the video to learn how to make the most of retirement savings.	retirement_savings	\N	\N	t	["https://drive.google.com/file/d/1FV7sWzx8vZU_9-p00dlj1wnC-nOMsrlb/view?usp=drive_link"]	\N
e35e48ca-9a55-4e37-8d29-450f66168c29	2025-11-03 20:57:54.090527	2025-11-03 20:57:54.090527	retirement_savings.tier1_app_retention_dropoff.incentive	Your future security is too valuable to lose	{name}, every week of saving you've built adds to your future independence. By stopping now, you lose the momentum and time for growth. Contribute this week and keep building your secure future!	retirement_savings	\N	\N	t	\N	\N
cf31c712-cfcc-44bb-afc7-97a0c8d4d855	2025-11-03 20:57:54.298467	2025-11-03 20:57:54.298467	retirement_savings.tier1_app_retention_dropoff.reactivation	We miss you! Come back to securing your future	{name}, we miss you! Your consistent saving was building real security for old age. Make sure you don't let this slip away. Take 2 minutes today to make a contribution and get back on track!	retirement_savings	\N	\N	t	\N	\N
9b180820-10ef-4e1f-95a7-7ac5dbdf717d	2025-11-03 20:57:54.499552	2025-11-03 20:57:54.499552	retirement_savings.tier1_app_retention_dropoff.why	Why your retirement savings matter	{name}, you spent many weeks building future security. Here's what you lose by stopping: \n• Lost growth: Your money stops growing - time is your biggest advantage \n• Broken habits: Good saving habits are hard to rebuild once lost \n• Future worry: Back to uncertainty about how you'll manage in old age \n\nYou worked hard to become a consistent saver. Make sure that you continue building your future security. Take two minutes today to contribute and get back on track.	retirement_savings	\N	\N	t	\N	\N
4bc1181c-7f6f-4056-bbdd-969d7235b562	2025-11-03 20:57:54.735186	2025-11-03 20:57:54.735186	retirement_savings.tier2_app_opened_first_time.celebrate	Welcome to retirement savings!	Great start {name}! 🎉 You've opened your retirement savings app for the first time. Finance is your second most important goal. This is the beginning of securing your future. With retirement savings, you can: \n✓ Save small amounts for old age \n✓ Watch your money grow \n✓ Build independence \n✓ Secure your future \nTake the next step: Register your account!	retirement_savings	\N	\N	t	\N	\N
c47a81bb-0c25-4de2-aa32-a856afda81ec	2025-11-03 20:57:54.944825	2025-11-03 20:57:54.944825	retirement_savings.tier2_app_adopted.celebrate	You're planning for your future!	Well done {name}! 🎉 You're now using retirement savings. You've started building future security!	retirement_savings	\N	\N	t	\N	\N
d711a46e-1979-4630-a208-1676adc3fefb	2025-11-03 20:57:55.17356	2025-11-03 20:57:55.17356	retirement_savings.tier2_app_registered.celebrate	Your retirement account is ready!	{name} congratulations on registering for retirement savings! 🎉 This is a major step forward! With your account you can: \n✓ Save regularly \n✓ Watch savings grow \n✓ Build security \n✓ Create independence \nAll from your phone!	retirement_savings	\N	\N	t	\N	\N
93e6a0a2-8c7d-4470-bc33-477aca5fe89a	2025-11-03 20:57:55.37951	2025-11-03 20:57:55.37951	retirement_savings.tier2_app_low_activity.how	Quick tips for retirement savings	Hi {name}, we noticed you haven't used your retirement savings app much. Ready to start saving? Here's a quick start: \n1. Open your app and make a small contribution \n2. Check your balance \n3. Set up regular saving if possible \nStart small until you're comfortable!	retirement_savings	\N	\N	t	["https://drive.google.com/file/d/1FV7sWzx8vZU_9-p00dlj1wnC-nOMsrlb/view?usp=drive_link"]	\N
537d310b-e500-4b44-b982-c95e5e77e9d5	2025-11-03 20:57:55.599512	2025-11-03 20:57:55.599512	retirement_savings.tier2_app_low_activity.incentive	Try retirement savings	{name}, start using your retirement savings app and earn a reward of 10 GHC in just three weeks. Small amounts today become security tomorrow.	retirement_savings	\N	\N	t	\N	\N
18ddd51f-c5b6-4ef9-9d7d-d61e381b25b8	2025-11-03 20:57:55.819974	2025-11-03 20:57:55.819974	retirement_savings.tier2_app_low_activity.support	Need help with retirement savings?	Hi {name}, need help using your retirement savings app? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	retirement_savings	\N	\N	t	\N	\N
9b27ecfb-e1fb-44e1-80e3-6dd167b90be7	2025-11-03 20:57:56.046409	2025-11-03 20:57:56.046409	retirement_savings.tier2_app_low_activity.why	Retirement savings gives you future security	{name}, retirement savings offers real benefits: \n• Security in old age \n• Independence from full family dependence \n• Peace of mind about the future \nGive it a try - many in your community are planning ahead!	retirement_savings	\N	\N	t	\N	\N
252353fa-64cf-4074-980c-267d10b7d9fb	2025-11-03 20:57:56.739494	2025-11-03 20:57:56.739494	retirement_savings.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've been saving for retirement for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	retirement_savings	\N	\N	t	\N	\N
81b2ba14-06d2-4c6f-9076-084c6a500b31	2025-11-03 20:57:56.9495	2025-11-03 20:57:56.9495	retirement_savings.tier2_app_engaged.celebrate	You're saving for your future!	Great job {name}! 🎉 As an active retirement saver, you're building security for old age and creating independence. You're planning wisely!	retirement_savings	\N	\N	t	\N	\N
12a64711-2a8a-44b7-ba9b-c9ee68888ad2	2025-11-03 20:57:57.168691	2025-11-03 20:57:57.168691	retirement_savings.tier2_app_engaged.incentive	Keep going with retirement savings	{name}, you're doing well! Keep saving regularly and earn 10 GHC in a few weeks. Every contribution counts for your future!	retirement_savings	\N	\N	t	\N	\N
40fb1553-4c03-4d69-8db7-70df84b45784	2025-11-03 20:57:57.404706	2025-11-03 20:57:57.404706	retirement_savings.tier2_app_engagement_dropoff.how	Quick retirement savings reminder	Hi {name}, have you been contributing to retirement recently? If not, let's get you back on track! Quick reminders: \n• To contribute: Click on ‘Contribute’ → Enter an amount you are comfortable with → Pick payment mode → Add your mobile number → Choose how often you want to make payments to your pension account → Pay Now. \n\nWatch the video for a refresher	retirement_savings	\N	\N	t	["https://drive.google.com/file/d/1FV7sWzx8vZU_9-p00dlj1wnC-nOMsrlb/view?usp=drive_link"]	\N
77ca1804-2d74-4d80-b371-21ea1fb97602	2025-11-03 20:57:57.62042	2025-11-03 20:57:57.62042	retirement_savings.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to retirement savings and earn 10 GHC in a few weeks. Your future security depends on saving now.	retirement_savings	\N	\N	t	\N	\N
48f35100-a0a8-4238-b602-c7ebc235feaa	2025-11-03 20:57:57.830402	2025-11-03 20:57:57.830402	retirement_savings.tier2_app_engagement_dropoff.reactivation	Try retirement savings again?	{name}, you started planning for your future. Make a contribution today and keep building your security!	retirement_savings	\N	\N	t	\N	\N
17c686de-9e68-47a7-8460-13c28b6f01bb	2025-11-03 20:57:58.040472	2025-11-03 20:57:58.040472	retirement_savings.tier2_app_engagement_dropoff.why	Retirement savings secures your future	{name}, retirement savings offers important benefits: \n• Security when you can't work \n• Independence in old age \n• Peace of mind now \nYou already know how to use it - start saving again!	retirement_savings	\N	\N	t	\N	\N
7ee8eab6-3724-44f5-b526-c6f2a6fed827	2025-11-03 20:57:58.281494	2025-11-03 20:57:58.281494	retirement_savings.tier2_app_engagement_sustained.celebrate	6 weeks of future planning!	Well done {name}! 🎉 You've been saving for retirement consistently for 6 weeks. You're building real future security!	retirement_savings	\N	\N	t	\N	\N
12f3a15c-35f7-419d-a003-fbcaa8905e61	2025-11-03 20:57:58.499505	2025-11-03 20:57:58.499505	retirement_savings.first_tier2_app_retained.reward	You've earned 10 GHC for consistency!	Excellent {name}! 🎉 You've saved for retirement for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great planning!	retirement_savings	\N	\N	t	\N	\N
c5141942-6c2f-439f-9dfa-8d9b86f37b24	2025-11-03 20:57:58.721923	2025-11-03 20:57:58.721923	retirement_savings.tier2_app_retained.celebrate	You're a future planner!	Impressive {name}! 🎉 You've been saving for retirement consistently. You're building security for old age and independence for your future. Well done!	retirement_savings	\N	\N	t	\N	\N
f556bc7d-b1b2-41a4-8390-8a2ebdad8711	2025-11-03 20:57:58.930518	2025-11-03 20:57:58.930518	retirement_savings.tier2_app_retained.incentive	Keep your saving habit going	{name}, your consistent saving is building real future security. You're creating independence for old age. Keep it up!	retirement_savings	\N	\N	t	\N	\N
b34466a1-b03a-4d6f-afd8-ddea7188da4f	2025-11-03 20:57:59.155597	2025-11-03 20:57:59.155597	retirement_savings.tier2_app_retention_dropoff.how	Quick retirement savings reminder	Hi {name}, have you been contributing to retirement recently? If not, let's get you back on track! Quick reminders: \n• To contribute: Click on ‘Contribute’ → Enter an amount you are comfortable with → Pick payment mode → Add your mobile number → Choose how often you want to make payments to your pension account → Pay Now. \n\nWatch the video for a refresher.	retirement_savings	\N	\N	t	["https://drive.google.com/file/d/1FV7sWzx8vZU_9-p00dlj1wnC-nOMsrlb/view?usp=drive_link"]	\N
4088e778-d183-41ae-9759-832899ea6c2f	2025-11-03 20:57:59.369596	2025-11-03 20:57:59.369596	retirement_savings.tier2_app_retention_dropoff.incentive	Your retirement savings is waiting	{name}, you built great saving habits. Come back and keep building your future security.	retirement_savings	\N	\N	t	\N	\N
d224203b-8e5f-4f49-a39f-e18b34dbc54e	2025-11-03 20:57:59.603615	2025-11-03 20:57:59.603615	retirement_savings.tier2_app_retention_dropoff.reactivation	Come back to retirement savings	{name}, you were doing great planning ahead! Make a contribution today and keep your future secure.	retirement_savings	\N	\N	t	\N	\N
2ed96d59-3bb9-4e75-81fc-41d841085278	2025-11-03 20:57:59.819556	2025-11-03 20:57:59.819556	retirement_savings.tier2_app_retention_dropoff.why	Keep your future security growing	{name}, you built weeks of good saving habits. Keep going to maintain: \n• Your growing savings \n• Security for old age \n• Independence for your future \nMake a contribution today to stay on track!	retirement_savings	\N	\N	t	\N	\N
77094893-30fd-4364-9618-abce89579f33	2025-11-03 20:58:00.041661	2025-11-03 20:58:00.041661	savings.tier1_app_opened_first_time.celebrate	Welcome to savings!	Great start {name}! 🎉 You've opened your PPT savings app for the first time. Finance is your most important goal. This is the beginning of something powerful - building security for your future. With PPT savings, you can: \n✓ Save small amounts safely over time \n✓ Keep money separate from daily spending \n✓ Set goals for important needs \n✓ Build a financial cushion for emergencies \n\nTake the next step: Register your account!	savings	\N	\N	t	\N	\N
8d1fc724-eeef-4a72-892d-b18129e18048	2025-11-03 20:58:00.254501	2025-11-03 20:58:00.254501	savings.tier1_app_adopted.celebrate	You're taking control of your future!	Well done {name}! 🎉 You're now using savings. You've taken an important step toward financial security! By putting money aside, you're: \n✓ Protecting your future \n✓ Building discipline and good habits \n✓ Preparing for emergencies and goals \nKeep going!	savings	\N	\N	t	\N	\N
984a9329-a35f-4487-8530-9662e0de44b8	2025-11-03 20:58:00.467352	2025-11-03 20:58:00.467352	savings.tier1_app_registered.celebrate	Your savings account is ready!	{name} congratulations on registering for PPT savings! 🎉 This is a major step forward! With your savings account you can: \n✓ Set aside small amounts regularly \n✓ Keep money safe and separate \n✓ Track your progress toward goals \n✓ Build a financial cushion \nAll from your phone!	savings	\N	\N	t	\N	\N
6b4d86b2-1195-46eb-89de-2ef455c15572	2025-11-03 20:58:00.688491	2025-11-03 20:58:00.688491	savings.tier1_app_low_activity.how	Get the most from your savings account	Hi {name}, we noticed you haven't used your PPT savings account much. It's easy to get started! Here's how: \n1. Open your PPT app \n2. Start with a small deposit - even 5-10 GHC \n3. Set a simple savings goal \n4. Make regular deposits when you can \nStart small until you feel comfortable. Once you experience the security of having savings, you'll see how valuable it is!	savings	\N	\N	t	\N	\N
0f6ba366-75a5-488e-82c7-4dd337bc9f5f	2025-11-03 20:58:00.921509	2025-11-03 20:58:00.921509	savings.tier1_app_low_activity.incentive	Your reward is waiting - start saving today!	{name}, start using your PPT savings account actively and earn a reward of 10 GHC in just three weeks! Every cedi you save protects you from emergencies and helps you reach important goals. The sooner you start, the sooner you'll have the security of knowing money is there when you need it. Try your first deposit today!	savings	\N	\N	t	\N	\N
5d360529-3d6a-40e6-95ef-931e6ba0fea8	2025-11-03 20:58:01.135488	2025-11-03 20:58:01.135488	savings.tier1_app_low_activity.support	Need help with savings?	Hi {name}, need help using your PPT savings account? We're here for you! Common questions: \n• How to make deposits? Open PPT app → Select 'Deposit' → Choose amount → Confirm with PIN \n• How to set a goal? Go to 'Goals' → Create new goal → Set target amount and date \n• How to check balance? Open app → View 'Account Balance' on main screen \n• How to withdraw? Select 'Withdraw' → Enter amount → Confirm (note: frequent withdrawals reduce your savings growth) \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	savings	\N	\N	t	\N	\N
725188b8-b8ca-4f67-9719-d158ee893de1	2025-11-03 20:58:01.349567	2025-11-03 20:58:01.349567	savings.tier1_app_low_activity.why	Why savings matters for your security	{name}, we know saving can feel difficult when money is tight. But not having savings has real costs: \n• No cushion for emergencies - illness, repairs, or unexpected expenses \n• Hard to plan for important goals like school fees or business needs \n• Forced to borrow at high interest when urgent needs arise \n• Money mixed with daily cash gets spent too easily \nSavings solves these problems. Even small amounts add up over time. Your money stays protected and grows toward what matters most. Others in your community who save report feeling less stressed and more in control. Take the first step today - you'll be glad you did!	savings	\N	\N	t	\N	\N
14d322d6-e8ec-44ee-9488-d030d20d470c	2025-11-03 20:58:01.559897	2025-11-03 20:58:01.559897	savings.first_tier1_app_engaged.reward	3 weeks of smart saving! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively saving for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - financial security and peace of mind. Congratulations!	savings	\N	\N	t	\N	\N
604a79a7-2bd3-415f-9d11-28f56d46e66d	2025-11-03 20:58:01.774449	2025-11-03 20:58:01.774449	savings.tier1_app_engaged.celebrate	You're mastering savings!	Excellent work {name}! 🎉 As an active saver you're: \n✓ Building a financial cushion \n✓ Creating security for your family \n✓ Developing disciplined money habits \n✓ Preparing for both emergencies and goals \nYou're not just saving money - you're building your financial future. Keep it up!	savings	\N	\N	t	\N	\N
58ee0f9e-cbaf-46b6-ac33-512a5ed4f25c	2025-11-03 20:58:02.42756	2025-11-03 20:58:02.42756	savings.tier1_app_engaged.incentive	Keep going - bigger security ahead!	{name}, you're doing great with savings! Keep using it actively and earn 10 GHC in a few weeks. The more you save consistently, the stronger your financial foundation becomes. You're protecting yourself and your family. Keep it up!	savings	\N	\N	t	\N	\N
90b39dcd-62de-42d0-a864-c07a5c812668	2025-11-03 20:58:02.6999	2025-11-03 20:58:02.6999	savings.tier1_app_engagement_dropoff.how	Come back to savings - we can help!	Hi {name}, we noticed you stopped saving recently. Let's get you back on track! Quick reminders: \n• To deposit: Open PPT app → Select 'Deposit' → Choose amount → Confirm with PIN \n• To check progress: View your balance and goal progress on the main screen \n• To adjust goals: Go to 'Goals' → Edit existing goal or create a new one \n\nEven small deposits count. Every cedi you save today protects you tomorrow!	savings	\N	\N	t	\N	\N
96293a54-0141-493e-803a-12d733c4ae75	2025-11-03 20:58:02.907454	2025-11-03 20:58:02.907454	savings.tier1_app_engagement_dropoff.incentive	Don't lose your savings momentum!	{name}, you were building such a strong financial cushion! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the peace of mind that comes from knowing you have money set aside for when you need it.	savings	\N	\N	t	\N	\N
ebbbd2e5-70b6-4182-a382-99c27bf33931	2025-11-03 20:58:03.108418	2025-11-03 20:58:03.108418	savings.tier1_app_engagement_dropoff.reactivation	Your savings account is waiting for you!	{name}, we miss you! You were building something important: financial security and peace of mind. Take 2 minutes today to make a small deposit and get back on track!	savings	\N	\N	t	\N	\N
96c33270-6b99-43fc-9b56-9970d9314422	2025-11-03 20:58:03.320537	2025-11-03 20:58:03.320537	savings.tier1_app_engagement_dropoff.why	Remember why you started saving	{name}, going back to no savings means going back to old problems: \n• Vulnerability: No cushion for emergencies - savings provides security \n• Stress: Worrying about unexpected expenses - savings brings peace of mind \n• No progress: Can't reach important goals - savings makes them possible \nYou already learned how to save. Don't give up the security and progress you worked for. Your future self will thank you!	savings	\N	\N	t	\N	\N
0cb98e23-72f5-40a7-81a3-5a65b22ee91c	2025-11-03 20:58:03.57633	2025-11-03 20:58:03.57633	savings.tier1_app_engagement_sustained.celebrate	You're a consistent saver!	Fantastic {name}! 🎉 You've maintained active saving for 6 weeks. This isn't luck - this is YOU building financial security! You've proven that: \n✓ You can save consistently \n✓ You have the discipline to protect your future \n✓ You're ready to achieve bigger financial goals \n✓ You're securing your family's wellbeing \nYou're thriving and you're an example to others. Congratulations!	savings	\N	\N	t	\N	\N
c2bb4bae-a73b-4ee9-a996-2686a20a2d16	2025-11-03 20:58:03.783077	2025-11-03 20:58:03.783077	savings.first_tier1_app_retained.reward	9 weeks of committed saving! Collect your reward.	Exceptional achievement {name}! 🎉 You've saved actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced financial security. Amazing!	savings	\N	\N	t	\N	\N
e3553f6c-0260-4642-8ebe-3d7f2006f806	2025-11-03 20:58:03.990557	2025-11-03 20:58:03.990557	savings.tier1_app_retained.celebrate	You're a savings expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term saver. Look at what you've achieved: \n✓ 9+ weeks of consistent saving \n✓ A growing financial cushion for your needs \n✓ The discipline that opens doors to bigger goals \n✓ Confidence in managing your financial future \nCongratulations!	savings	\N	\N	t	\N	\N
c0da99f9-79c7-4362-8073-1d68a5315e3e	2025-11-03 20:58:04.210427	2025-11-03 20:58:04.210427	savings.tier1_app_retained.incentive	You're building real financial power	{name}, you've proven you can save consistently for 9+ weeks. This discipline is opening doors: you have security for emergencies, you can plan for important goals, and you're in control of your financial future. The longer you keep going, the stronger your foundation becomes. Your financial future is in your hands!	savings	\N	\N	t	\N	\N
a613f1f5-9e96-44f1-a508-0e94a1816951	2025-11-03 20:58:04.412652	2025-11-03 20:58:04.412652	savings.tier1_app_retention_dropoff.how	Let's solve your savings issue	Hi {name}, you were such a consistent saver! We noticed you haven't been active lately. Let's fix any issues: \n• To deposit: Open PPT app → 'Deposit' → Choose amount → Confirm \n• To check balance: View main screen for current savings \n• To manage goals: 'Goals' section → View or edit your targets \n• Forgot PIN? Use 'Forgot PIN' option to reset \n\nYour savings are safe and waiting. Take 2 minutes to make a deposit today!	savings	\N	\N	t	\N	\N
caef3984-d6f3-4996-abcb-bcc966a44084	2025-11-03 20:58:04.626573	2025-11-03 20:58:04.626573	savings.tier1_app_retention_dropoff.incentive	Your financial cushion is too valuable to lose	{name}, every week of saving you've built adds to your financial security. By stopping now, you lose the cushion that protects you from emergencies. Make a deposit this week and keep your financial security strong!	savings	\N	\N	t	\N	\N
68047639-4383-4bc7-a3d8-c6528ba3fa8f	2025-11-03 20:58:04.83441	2025-11-03 20:58:04.83441	savings.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a savings champion	{name}, we miss you! Your consistent saving provided security and peace of mind. Make sure you don't let this slip away. Take 2 minutes today to make a deposit and get back on track!	savings	\N	\N	t	\N	\N
6661b77b-2d6a-45a0-99be-bfa1aa0aed92	2025-11-03 20:58:05.041612	2025-11-03 20:58:05.041612	savings.tier1_app_retention_dropoff.why	Why your savings record matters	{name}, you spent many weeks building financial security. Here's what you lose by stopping: \n• Protection: Back to having no cushion for emergencies \n• Progress: Losing ground on important goals \n• Peace of mind: Back to worrying about unexpected expenses \nYou worked hard to become a disciplined saver. Make sure that you continue building toward your financial goals. Take two minutes today to save and get back on track.	savings	\N	\N	t	\N	\N
ae602e2b-472a-471a-b427-33ca7646cba7	2025-11-03 20:58:05.28853	2025-11-03 20:58:05.28853	savings.tier2_app_opened_first_time.celebrate	Welcome to savings!	Great start {name}! 🎉 You've opened your PPT savings app for the first time. Finance is your second most important goal. This is the beginning of building security for your future. With PPT savings, you can: \n✓ Save small amounts safely \n✓ Keep money separate from daily spending \n✓ Set goals for important needs \n✓ Build a cushion for emergencies \n\nTake the next step: Register your account!	savings	\N	\N	t	\N	\N
6b139376-f7f1-426c-9599-c4a02fefc872	2025-11-03 20:58:05.502736	2025-11-03 20:58:05.502736	savings.tier2_app_adopted.celebrate	You're taking control of your future!	Well done {name}! 🎉 You're now using savings. You've started building financial security!	savings	\N	\N	t	\N	\N
d6d7bdd6-1782-44da-adcd-3b5199f9a80c	2025-11-03 20:58:05.870616	2025-11-03 20:58:05.870616	savings.tier2_app_registered.celebrate	Your savings account is ready!	{name} congratulations on registering for PPT savings! 🎉 This is a major step forward! With your account you can: \n✓ Save small amounts regularly \n✓ Keep money safe \n✓ Track your goals \n✓ Build a financial cushion \nAll from your phone!	savings	\N	\N	t	\N	\N
d1db2f48-40c7-4f0c-9186-63998030451c	2025-11-03 20:58:06.271977	2025-11-03 20:58:06.271977	savings.tier2_app_low_activity.how	Quick tips for savings	Hi {name}, we noticed you haven't used your PPT savings account much. Ready to start saving? Here's a quick start: \n1. Open your app and make a small deposit \n2. Set a simple savings goal \n3. Try saving a little each week \nStart small until you're comfortable!	savings	\N	\N	t	\N	\N
f23eaefe-ba61-4df2-9c24-9a6dba9fe1b3	2025-11-03 20:58:06.500548	2025-11-03 20:58:06.500548	savings.tier2_app_low_activity.incentive	Try savings	{name}, start using your PPT savings account and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll have financial security.	savings	\N	\N	t	\N	\N
4d7c81a3-a59e-4c0c-a824-8918182478ba	2025-11-03 20:58:06.712662	2025-11-03 20:58:06.712662	savings.tier2_app_low_activity.support	Need help with savings?	Hi {name}, need help using your PPT savings account? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	savings	\N	\N	t	\N	\N
105cdf42-b8dd-4a3a-a228-9e3c537da5e8	2025-11-03 20:58:06.93966	2025-11-03 20:58:06.93966	savings.tier2_app_low_activity.why	Savings gives you security	{name}, savings offers real benefits: \n• Cushion for emergencies \n• Progress toward important goals \n• Money protected and separate \nGive it a try - many in your community already save!	savings	\N	\N	t	\N	\N
566fdf7a-8e16-43c0-8bf0-f5a6b2f1a69e	2025-11-03 20:58:07.189696	2025-11-03 20:58:07.189696	savings.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've been saving for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	savings	\N	\N	t	\N	\N
ea9f07e4-f8a7-483a-9674-4ceb94aa411b	2025-11-03 20:58:07.420523	2025-11-03 20:58:07.420523	savings.tier2_app_engaged.celebrate	You're building savings!	Great job {name}! 🎉 As an active saver, you're building financial security and working toward your goals. You're creating a strong foundation!	savings	\N	\N	t	\N	\N
df35a952-b519-498d-abdc-1ca700fcda58	2025-11-03 20:58:07.645506	2025-11-03 20:58:07.645506	savings.tier2_app_engaged.incentive	Keep going with savings	{name}, you're doing well! Keep saving and earn 10 GHC in a few weeks. Every deposit counts!	savings	\N	\N	t	\N	\N
34a6c4b9-13c1-4770-bb97-012c1f780e65	2025-11-03 20:58:07.863435	2025-11-03 20:58:07.863435	savings.tier2_app_engagement_dropoff.how	Quick savings reminder	Hi {name}, we noticed you stopped saving lately. Quick reminder: \n• To deposit: Open PPT app → 'Deposit' → Choose amount → Confirm \n• To check balance: View main screen \n• Small deposits add up over time!	savings	\N	\N	t	\N	\N
b241d78b-a4a0-4c71-85b9-1eb5bd09e578	2025-11-03 20:58:08.093796	2025-11-03 20:58:08.093796	savings.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to savings and earn 10 GHC in a few weeks. It builds your financial cushion and helps you reach your goals.	savings	\N	\N	t	\N	\N
9a1b3f7d-2f66-4034-a423-75e77d226610	2025-11-03 20:58:08.346681	2025-11-03 20:58:08.346681	savings.tier2_app_engagement_dropoff.reactivation	Try savings again?	{name}, you started building good financial habits. Take 2 minutes today to make a deposit!	savings	\N	\N	t	\N	\N
b88a24d7-7b1a-4792-ab7b-daa4df6902e6	2025-11-03 20:58:08.559548	2025-11-03 20:58:08.559548	savings.tier2_app_engagement_dropoff.why	Savings brings security	{name}, savings offers important benefits: \n• Protection from emergencies \n• Progress toward goals \n• Peace of mind \nYou already know how to use it - try it again!	savings	\N	\N	t	\N	\N
418f8688-3709-46f9-bb61-15c597caebca	2025-11-03 20:58:08.840529	2025-11-03 20:58:08.840529	savings.tier2_app_engagement_sustained.celebrate	6 weeks of saving!	Well done {name}! 🎉 You've saved consistently for 6 weeks. You're building a strong financial cushion!	savings	\N	\N	t	\N	\N
c7e0bf4b-05f9-4cdf-8191-139791269c5b	2025-11-03 20:58:09.070503	2025-11-03 20:58:09.070503	savings.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency!	Excellent {name}! 🎉 You've saved for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	savings	\N	\N	t	\N	\N
33045295-74f0-4f41-8cae-081dc4565993	2025-11-03 20:58:09.307731	2025-11-03 20:58:09.307731	savings.tier2_app_retained.celebrate	You're a committed saver!	Impressive {name}! 🎉 You've been saving consistently. You have a financial cushion and you're working steadily toward your goals. Well done!	savings	\N	\N	t	\N	\N
eed70eb3-67d8-4369-9bd6-bc88c6ac4716	2025-11-03 20:58:09.531459	2025-11-03 20:58:09.531459	savings.tier2_app_retained.incentive	Keep your savings habit going	{name}, your consistent saving is building valuable financial security. Your cushion grows stronger each week. Keep it up!	savings	\N	\N	t	\N	\N
3f888f0b-bd15-4976-bc18-9f452a046952	2025-11-03 20:58:09.820423	2025-11-03 20:58:09.820423	savings.tier2_app_retention_dropoff.how	Quick savings reminder	Hi {name}, we noticed you stopped saving lately. Quick reminder: \n• To deposit: Open PPT app → 'Deposit' → Choose amount → Confirm \n• To check balance: View main screen \n• Every small deposit helps!	savings	\N	\N	t	\N	\N
2c105e58-619c-4012-8c5a-f0f69e8a58b1	2025-11-03 20:58:10.029473	2025-11-03 20:58:10.029473	savings.tier2_app_retention_dropoff.incentive	Your savings are waiting	{name}, you built great saving habits. Come back and keep building your financial security.	savings	\N	\N	t	\N	\N
ec949b9d-5400-4a84-8e8e-a1ca66a1b18f	2025-11-03 20:58:10.264506	2025-11-03 20:58:10.264506	savings.tier2_app_retention_dropoff.reactivation	Come back to savings	{name}, you were doing great with saving! Make a deposit today and keep your financial habits strong.	savings	\N	\N	t	\N	\N
366f27f4-1bc2-4468-a33e-f6d0f06a0d8e	2025-11-03 20:58:10.501497	2025-11-03 20:58:10.501497	savings.tier2_app_retention_dropoff.why	Keep your financial progress	{name}, you built weeks of good saving habits. Keep going to maintain: \n• Your financial cushion \n• Progress toward goals \n• Peace of mind \nSave a little today to stay on track!	savings	\N	\N	t	\N	\N
777e72a5-4fde-423b-ba37-bbbcb5e8e3b1	2025-11-03 20:58:10.75552	2025-11-03 20:58:10.75552	skills_development.tier1_app_opened_first_time.celebrate	Welcome to Skillshare!	Great start {name}! 🎉 You've opened your skills development app for the first time. Education is your most important goal. This is the beginning of something powerful - learning new skills that can improve your work and income. With skills training, you can: \n✓ Learn practical work skills \n✓ Improve how you serve customers \n✓ Grow your business knowledge \n✓ Build confidence in your abilities \n\nTake the next step: Register your account!	skills_development	\N	\N	t	\N	\N
bdbd0ed9-71d9-4048-9336-75b8d51465f9	2025-11-03 20:58:10.980674	2025-11-03 20:58:10.980674	skills_development.tier1_app_adopted.celebrate	You're building valuable skills!	Well done {name}! 🎉 You're now using your skills development app. You've taken control of your professional growth! By learning new skills, you're: \n✓ Increasing your earning potential \n✓ Improving your work quality \n✓ Building confidence in what you do \n✓ Opening doors to new opportunities \nKeep going!	skills_development	\N	\N	t	\N	\N
a2dd025d-dc0a-49f5-b3c1-75af77581228	2025-11-03 20:58:11.192489	2025-11-03 20:58:11.192489	skills_development.tier1_app_registered.celebrate	Your learning account is ready!	{name} congratulations on registering for skills training! 🎉 This is a major step forward! With your account you can: \n✓ Access practical lessons \n✓ Learn at your own pace \n✓ Apply skills immediately at work \n✓ Track your learning progress \nAll from your phone!	skills_development	\N	\N	t	\N	\N
bc3a0560-d82a-445b-bbc4-705ec1269a22	2025-11-03 20:58:11.403675	2025-11-03 20:58:11.403675	skills_development.tier1_app_low_activity.how	Get the most from your skills training	Hi {name}, we noticed you haven't used your skills app much. Here's how to start learning: \n1. Open the app\n2. Browse available courses\n3. Select a topic that interests you\n4. Watch the lessons step by step\n5. Practice what you learn in your daily work\n\nSkills like customer service, digital marketing, and business basics are waiting for you!	skills_development	\N	\N	t	\N	\N
1b0a4e27-1250-4bcf-a491-a602e7da237c	2025-11-03 20:58:11.621449	2025-11-03 20:58:11.621449	skills_development.tier1_app_low_activity.incentive	Your reward is waiting - start learning new skills!	{name}, start using your skills training app and earn a reward of 10 GHC in just three weeks! Every skill you learn can help you earn more and work better. The sooner you start, the sooner you'll see results. Try one lesson today!	skills_development	\N	\N	t	\N	\N
d7d9deb2-7b01-48c5-92af-ebe52f9520f0	2025-11-03 20:58:11.84541	2025-11-03 20:58:11.84541	skills_development.tier1_app_low_activity.support	Need help with skills training?	Hi {name}, need help using your skills app? We're here for you! Common questions: \n• How to find courses? Browse the catalog by category or search for specific topics. \n• How to start learning? Click on a course, then start the first lesson. \n• Can't understand something? Replay lessons as many times as you need. \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	skills_development	\N	\N	t	\N	\N
087cb0c5-2384-49d8-a239-d110d0cc8753	2025-11-03 20:58:12.146672	2025-11-03 20:58:12.146672	skills_development.tier1_app_low_activity.why	Why skills development matters for your success	{name}, we know learning something new can feel challenging. But without new skills, it's hard to grow: \n• Stuck doing things the same old way \n• Missing opportunities to earn more \n• No confidence in trying new methods \n• Can't compete with others who know more \n\nSkills training solves these problems. You can learn practical abilities that immediately improve your work and income. Take the first step today - you'll be glad you did!	skills_development	\N	\N	t	\N	\N
c6585dcc-22ae-4338-84a4-b68482a2bd66	2025-11-03 20:58:12.369551	2025-11-03 20:58:12.369551	skills_development.first_tier1_app_engaged.reward	3 weeks of skills learning! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively learning new skills for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - professional skills that last a lifetime. Congratulations!	skills_development	\N	\N	t	\N	\N
49d7e930-d81e-41ec-a152-ec976968f95f	2025-11-03 20:58:12.579591	2025-11-03 20:58:12.579591	skills_development.tier1_app_engaged.celebrate	You're mastering new skills!	Excellent work {name}! 🎉 Now that you are actively learning new skills you're: \n✓ Improving your work quality\n✓ Increasing your earning potential \n✓ Building confidence and expertise \n✓ Standing out from others in your field \nYou're not just learning - you're investing in your future success. Keep it up!	skills_development	\N	\N	t	\N	\N
0c468d2b-aacc-45d0-ba8c-4cac2056a24e	2025-11-03 20:58:12.789703	2025-11-03 20:58:12.789703	skills_development.tier1_app_engaged.incentive	Keep learning - bigger opportunities ahead!	{name}, you're doing great with your skills training! Keep learning actively and earn 10 GHC in a few weeks. Every new skill makes you more valuable and opens new doors. Keep it up!	skills_development	\N	\N	t	\N	\N
154a5392-5a00-45f9-9d5d-4a4019c172a8	2025-11-03 20:58:12.999594	2025-11-03 20:58:12.999594	skills_development.tier1_app_engagement_dropoff.how	Come back to skills learning - we can help!	Hi {name}, we noticed you stopped learning recently. Let's get you back on track! Quick reminders: \n• To find courses: Open app → Browse by category or search topics \n• To continue learning: Go to your course → Resume where you left off \n• To practice: Apply what you learn immediately in your daily work \n\nWatch the video to learn how to make the most of your skills training.	skills_development	\N	\N	t	\N	\N
5400d4bc-99f2-46f1-93cd-295c32a9b045	2025-11-03 20:58:13.208664	2025-11-03 20:58:13.208664	skills_development.tier1_app_engagement_dropoff.incentive	Don't lose your learning momentum!	{name}, you were doing so well building new skills! Come back now and earn 10 GHC in just a few weeks. These skills can help you earn more and work better. Don't give up now!	skills_development	\N	\N	t	\N	\N
cc95473d-38ad-41ea-bb8a-73a2a3471bb4	2025-11-03 20:58:13.455317	2025-11-03 20:58:13.455317	skills_development.tier1_app_engagement_dropoff.reactivation	Your skills growth misses you - come back today!	{name}, we miss you! You were building something important: professional skills that increase your value. Take 2 minutes today to continue learning and get back on track!	skills_development	\N	\N	t	\N	\N
4b6317e0-3929-4df2-bf1e-a34866f53986	2025-11-03 20:58:13.670452	2025-11-03 20:58:13.670452	skills_development.tier1_app_engagement_dropoff.why	Remember why you started learning	{name}, stopping your learning means missing out on growth opportunities: \n• Stuck with old methods that limit income \n• Missing new skills that others are gaining \n• Lost confidence from not finishing what you started \n• No competitive edge in your work \n\nYou already started learning. Don't give up the advantage you're building. Your success depends on it!	skills_development	\N	\N	t	\N	\N
cdbfddc0-3c28-406e-9aaf-e1c6113ed091	2025-11-03 20:58:13.897512	2025-11-03 20:58:13.897512	skills_development.tier1_app_engagement_sustained.celebrate	You're a consistent learner!	Fantastic {name}! 🎉 You've maintained active skills learning for 6 weeks. This isn't luck - this is YOU committing to growth! You've proven that: \n✓ You can master new abilities \n✓ You're serious about professional growth \n✓ You're building lasting expertise \n✓ You're preparing for bigger opportunities \nYou're an example to others. Congratulations!	skills_development	\N	\N	t	\N	\N
20eb9cf9-4ab3-4c85-a015-6e8a872e87d1	2025-11-03 20:58:14.118454	2025-11-03 20:58:14.118454	skills_development.first_tier1_app_retained.reward	9 weeks of skills learning! Collect your reward.	Exceptional achievement {name}! 🎉 You've been learning new skills actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've truly invested in your professional development. Amazing!	skills_development	\N	\N	t	\N	\N
c351a1f3-a0cd-4615-8bfc-9be7c671c4d7	2025-11-03 20:58:14.330475	2025-11-03 20:58:14.330475	skills_development.tier1_app_retained.celebrate	You're a skills expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term skills learner. Look at what you've achieved: \n✓ 9+ weeks of consistent learning \n✓ Multiple new skills mastered \n✓ Improved work quality and confidence \n✓ Greater earning potential \nYour dedication to growth is inspiring. Congratulations!	skills_development	\N	\N	t	\N	\N
8bda01db-9bb9-4e4d-98ab-269ef80b5f21	2025-11-03 20:58:14.533434	2025-11-03 20:58:14.533434	skills_development.tier1_app_retained.incentive	You're building real professional power	{name}, you've proven you can commit to learning for 9+ weeks. This consistency is building expertise that sets you apart. The more skills you gain, the more valuable you become. Your professional future is bright!	skills_development	\N	\N	t	\N	\N
43d45364-70aa-49de-bd26-a8633af0c1b4	2025-11-03 20:58:14.749645	2025-11-03 20:58:14.749645	skills_development.tier1_app_retention_dropoff.how	Let's solve your learning challenge	Hi {name}, you were such a consistent learner! We noticed you haven't been active lately. Let's fix any issues: \n• To resume courses: Open app → Go to your enrolled courses → Continue learning \n• To find new topics: Browse the catalog for fresh skills to master \n• To review: Replay any lesson as many times as you need \n\nWatch the video to rediscover the power of skills learning.	skills_development	\N	\N	t	\N	\N
9ee1ebde-661a-4bc1-9ad3-244314ba2044	2025-11-03 20:58:14.973491	2025-11-03 20:58:14.973491	skills_development.tier1_app_retention_dropoff.incentive	Your skills are too valuable to lose	{name}, every week of learning has added to your professional abilities. By stopping now, you halt your growth and earning potential. Continue learning this week and keep building your expertise!	skills_development	\N	\N	t	\N	\N
6b736a7f-de37-4f0b-9743-7d60f7b1c06e	2025-11-03 20:58:15.214675	2025-11-03 20:58:15.214675	skills_development.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a learning champion	{name}, we miss you! Your consistent learning was building professional skills that increase your value and income. Don't let this slip away. Take 2 minutes today to continue learning and grow your expertise!	skills_development	\N	\N	t	\N	\N
b73f2f91-3580-45f9-9c18-151ee04c2c20	2025-11-03 20:58:15.428499	2025-11-03 20:58:15.428499	skills_development.tier1_app_retention_dropoff.why	Why your skills development matters	{name}, you spent many weeks building professional abilities. Here's what you lose by stopping: \n• Skill development stops, competitors move ahead \n• Lost momentum in mastering new abilities \n• Missed opportunities to increase income \n• Reduced confidence in your capabilities \n\nYou worked hard to become a learner. Don't let your professional growth stop. Take two minutes today to continue learning and keep advancing.	skills_development	\N	\N	t	\N	\N
b1123dc3-638d-4f5d-9e39-843b10ea8c62	2025-11-03 20:58:15.653649	2025-11-03 20:58:15.653649	skills_development.tier2_app_opened_first_time.celebrate	Welcome to skills learning!	Great start {name}! 🎉 You've opened your skills development app for the first time. Education is your second most important goal. This is the beginning of something valuable - learning practical skills for your work. With skills training, you can: \n✓ Learn useful work abilities \n✓ Improve your services \n✓ Grow your income potential \n✓ Build confidence \n\nTake the next step: Register your account!	skills_development	\N	\N	t	\N	\N
42dac356-8952-45a5-9cc1-f1a66d7962fb	2025-11-03 20:58:15.930586	2025-11-03 20:58:15.930586	skills_development.tier2_app_adopted.celebrate	You're starting to build skills!	Well done {name}! 🎉 You're now using your skills training app. You've taken a good step in professional growth!	skills_development	\N	\N	t	\N	\N
0c4ff0ee-94e0-4e33-9055-042f567f69f8	2025-11-03 20:58:16.660336	2025-11-03 20:58:16.660336	skills_development.tier2_app_registered.celebrate	Your learning account is ready!	{name} congratulations on registering for skills training! 🎉 This is a great step! With your account you can: \n✓ Access lessons \n✓ Learn practical skills \n✓ Improve your work \n✓ Track your progress \nAll from your phone!	skills_development	\N	\N	t	\N	\N
5961b382-1903-46d3-84fb-c54754d5242f	2025-11-03 20:58:16.86151	2025-11-03 20:58:16.86151	skills_development.tier2_app_low_activity.how	Quick tips for skills learning	Hi {name}, we noticed you haven't used your skills app much. Ready to start learning? Here's a quick start: \n1. Open the app and browse courses\n2. Pick a topic that interests you  \n3. Start with the first lesson \nLearn at your own pace until you're comfortable!	skills_development	\N	\N	t	\N	\N
e4b35cb2-cd09-44f6-8f71-6e0b7a32a4f8	2025-11-03 20:58:17.134399	2025-11-03 20:58:17.134399	skills_development.tier2_app_low_activity.incentive	Try skills training and earn a reward	{name}, start using your skills app and earn a reward of 10 GHC in just three weeks. Learn skills that help you work better!	skills_development	\N	\N	t	\N	\N
269edaf6-3143-4116-9b34-c3caea1f8259	2025-11-03 20:58:17.356567	2025-11-03 20:58:17.356567	skills_development.tier2_app_low_activity.support	Need help with skills training?	Hi {name}, need help using your skills app? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	skills_development	\N	\N	t	\N	\N
97536c68-2253-4c24-ac88-bfb4ddaaee4f	2025-11-03 20:58:17.581577	2025-11-03 20:58:17.581577	skills_development.tier2_app_low_activity.why	Skills training helps you succeed	{name}, skills training offers real benefits: \n• Learn practical work abilities \n• Improve how you serve customers\n• Increase your earning potential\nGive it a try - invest in your professional growth!	skills_development	\N	\N	t	\N	\N
38f081e8-f19a-4dc1-b474-cfb39666fad4	2025-11-03 20:58:17.799523	2025-11-03 20:58:17.799523	skills_development.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've been learning new skills for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep building your abilities!	skills_development	\N	\N	t	\N	\N
d8d6921d-9ec7-4c03-a02c-b5736638aed4	2025-11-03 20:58:18.009515	2025-11-03 20:58:18.009515	skills_development.tier2_app_engaged.celebrate	You're learning new skills!	Great job {name}! 🎉 As an active skills learner, you're improving your work abilities and building professional confidence!	skills_development	\N	\N	t	\N	\N
866b8fdd-6645-4fb4-8bd4-8c6ab1ae3344	2025-11-03 20:58:18.214693	2025-11-03 20:58:18.214693	skills_development.tier2_app_engaged.incentive	Keep learning skills	{name}, you're doing well! Keep using your skills app and earn 10 GHC in a few weeks. Every skill you learn counts!	skills_development	\N	\N	t	\N	\N
778ef769-d96b-48b4-a085-0ab291b64c2a	2025-11-03 20:58:18.461497	2025-11-03 20:58:18.461497	skills_development.tier2_app_engagement_dropoff.how	Quick skills learning reminder	Hi {name}, we noticed you stopped learning lately. Quick reminders: \n• To find courses: Open app → Browse categories \n• To continue: Go to your course → Resume lesson \n• To practice: Use skills in your work \n\nWatch the video for a refresher.	skills_development	\N	\N	t	\N	\N
4d4f189c-4586-4079-a25f-74e2db5a984b	2025-11-03 20:58:18.662624	2025-11-03 20:58:18.662624	skills_development.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to skills learning and earn 10 GHC in a few weeks. Keep building abilities that help you succeed!	skills_development	\N	\N	t	\N	\N
eb0ac20b-afb3-4e26-8c9d-0a6df3da34e0	2025-11-03 20:58:18.866593	2025-11-03 20:58:18.866593	skills_development.tier2_app_engagement_dropoff.reactivation	Try skills learning again?	{name}, you started building professional skills. Take 2 minutes today to continue learning!	skills_development	\N	\N	t	\N	\N
3336ab6f-4b46-4c46-a827-87871d1e793e	2025-11-03 20:58:19.084442	2025-11-03 20:58:19.084442	skills_development.tier2_app_engagement_dropoff.why	Skills help you grow	{name}, skills training gives you: \n• Practical work abilities \n• Better service delivery \n• Increased confidence \nYou already started - try it again!	skills_development	\N	\N	t	\N	\N
c39cde33-2e4a-47d3-ac12-e3f01a862023	2025-11-03 20:58:19.303708	2025-11-03 20:58:19.303708	skills_development.tier2_app_engagement_sustained.celebrate	6 weeks of skills learning!	Well done {name}! 🎉 You've been learning new skills consistently for 6 weeks. You're building valuable professional abilities!	skills_development	\N	\N	t	\N	\N
836d39f9-ee2c-4c35-93ad-3aa5f365b21a	2025-11-03 20:58:19.565463	2025-11-03 20:58:19.565463	skills_development.first_tier2_app_retained.reward	You've earned 10 GHC for learning!	Excellent {name}! 🎉 You've been learning skills for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great learning consistency!	skills_development	\N	\N	t	\N	\N
c8b3b572-12ec-4706-9ceb-3763106513c1	2025-11-03 20:58:19.771027	2025-11-03 20:58:19.771027	skills_development.tier2_app_retained.celebrate	You're a committed learner!	Impressive {name}! 🎉 You've been learning skills consistently. You're building professional abilities that help you succeed. Well done!	skills_development	\N	\N	t	\N	\N
d263e5d9-14c6-47d7-a237-9212a79eba5b	2025-11-03 20:58:19.984322	2025-11-03 20:58:19.984322	skills_development.tier2_app_retained.incentive	Keep your learning going	{name}, your consistent skills learning is building valuable abilities. Keep it up and watch your professional growth!	skills_development	\N	\N	t	\N	\N
70479afa-3570-490b-937b-2cbc5c0ea5dc	2025-11-03 20:58:20.217501	2025-11-03 20:58:20.217501	skills_development.tier2_app_retention_dropoff.how	Quick skills learning reminder	Hi {name}, we noticed you stopped learning lately. Quick reminders: \n• To find courses: Open app → Browse topics \n• To continue: Resume your course \n• To practice: Apply skills at work \n\nWatch the video for a refresher.	skills_development	\N	\N	t	\N	\N
a3d64555-f159-40a7-abb6-b6594af420d0	2025-11-03 20:58:20.42883	2025-11-03 20:58:20.42883	skills_development.tier2_app_retention_dropoff.incentive	Your skills development is waiting	{name}, you built great learning habits. Come back and continue building professional abilities!	skills_development	\N	\N	t	\N	\N
5fd9c574-e212-463a-83da-36b856a0577d	2025-11-03 20:58:20.659387	2025-11-03 20:58:20.659387	skills_development.tier2_app_retention_dropoff.reactivation	Come back to skills learning	{name}, you were doing great learning new skills! Continue today and keep growing professionally.	skills_development	\N	\N	t	\N	\N
8fcb86ec-7fd6-4e2b-9f68-011547b2c4fe	2025-11-03 20:58:20.869486	2025-11-03 20:58:20.869486	skills_development.tier2_app_retention_dropoff.why	Keep building your skills	{name}, you built weeks of learning habits. Keep going to maintain: \n• Professional skill development \n• Work improvement \n• Earning potential \nLearn today to continue growing!	skills_development	\N	\N	t	\N	\N
4b173d99-87ef-4b5a-ad3f-6bdf1defa656	2025-11-03 20:58:21.106531	2025-11-03 20:58:21.106531	telehealth.tier1_app_opened_first_time.celebrate	Welcome to telehealth!	Great start {name}! 🎉 You've opened your Ghinger Health app for the first time. Health is your most important goal. This is the beginning of something powerful - access to doctors from anywhere, anytime. With Ghinger Health, you can: \n✓ Talk to licensed doctors from home \n✓ Get medical advice without traveling \n✓ Save time and transport costs \n✓ Access healthcare day or night \n\nTake the next step: Register your account!	telehealth	\N	\N	t	\N	\N
e7e7adaf-69fa-4998-98ea-fe4f287c99ef	2025-11-03 20:58:21.339496	2025-11-03 20:58:21.339496	telehealth.tier1_app_adopted.celebrate	You're taking control of your health!	Well done {name}! 🎉 You're now using telehealth. You've taken an important step toward better healthcare! By having doctor access on your phone, you're: \n✓ Getting medical help faster \n✓ Saving time and travel costs \n✓ Protecting your family's health \nKeep going!	telehealth	\N	\N	t	\N	\N
4f974164-1434-42a0-87ff-b07bc9b68e00	2025-11-03 20:58:21.539473	2025-11-03 20:58:21.539473	telehealth.tier1_app_registered.celebrate	Your telehealth account is ready!	{name} congratulations on registering for Ghinger Health! 🎉 This is a major step forward! With your telehealth account you can: \n✓ Consult doctors anytime \n✓ Get medical advice from home \n✓ Receive prescriptions digitally \n✓ Save time and money \nAll from your phone!	telehealth	\N	\N	t	\N	\N
0ec92948-c427-4252-a1a9-cd8e4470c8a4	2025-11-03 20:58:21.777665	2025-11-03 20:58:21.777665	telehealth.tier1_app_low_activity.how	Get the most from your telehealth access	Hi {name}, we noticed you haven't used your Ghinger Health account much. It's easy to get started! Here's how: \n1. Open your Ghinger Health app \n2. Select 'Consult a Doctor' \n3. Describe your health concern \n4. Choose call or chat consultation \n5. Speak with a licensed doctor \nStart with a simple question until you feel comfortable. Once you experience how convenient it is, you'll see how valuable it is for you and your family!	telehealth	\N	\N	t	\N	\N
6f841727-b5fb-484d-882d-b7dc96bd05fe	2025-11-03 20:58:21.989416	2025-11-03 20:58:21.989416	telehealth.tier1_app_low_activity.incentive	Your reward is waiting - try telehealth today!	{name}, start using your Ghinger Health account actively and earn a reward of 10 GHC in just three weeks! Every consultation saves you time, transport costs, and long waits at clinics. The sooner you start, the sooner you'll wonder how you managed without it. Try a consultation today!	telehealth	\N	\N	t	\N	\N
f5e16605-c7b3-41f7-8150-b0f0435c001d	2025-11-03 20:58:22.240611	2025-11-03 20:58:22.240611	telehealth.tier1_app_low_activity.support	Need help with telehealth?	Hi {name}, need help using your Ghinger Health account? We're here for you! Common questions: \n• How to start a consultation? Open app → 'Consult a Doctor' → Describe your concern → Choose call or chat \n• What can I ask about? Common illnesses, fever, cough, stomach pain, child health, general medical advice \n• How much does it cost? Check app for consultation fees - much cheaper than clinic visits! \n• Is it private? Yes, all consultations are confidential \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	telehealth	\N	\N	t	\N	\N
2b1d1628-4404-4412-a333-e91b753834cd	2025-11-03 20:58:22.45145	2025-11-03 20:58:22.45145	telehealth.tier1_app_low_activity.why	Why telehealth matters for your family	{name}, we know it feels different talking to a doctor on the phone. But going to clinics has real costs: \n• Time lost from work or business \n• Transport expenses add up quickly \n• Long waits in crowded clinics \n• Exposure to other sick people \nTelehealth solves these problems. Get medical advice from home in minutes, not hours. Save money on transport. Get help early before problems become serious. Others in your community trust it for common health issues. Try it today - you'll be glad you did!	telehealth	\N	\N	t	\N	\N
311ede9e-14a9-4637-b51d-529fa22f84a1	2025-11-03 20:58:22.72915	2025-11-03 20:58:22.72915	telehealth.first_tier1_app_engaged.reward	3 weeks of smart healthcare! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using telehealth for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - convenient healthcare for you and your family. Congratulations!	telehealth	\N	\N	t	\N	\N
83f1af51-928f-49cf-9f2b-487f706ffb0e	2025-11-03 20:58:22.931632	2025-11-03 20:58:22.931632	telehealth.tier1_app_engaged.celebrate	You're mastering telehealth!	Excellent work {name}! 🎉 As an active telehealth user you're: \n✓ Getting medical help conveniently \n✓ Saving time and money on healthcare \n✓ Taking care of your family's health \n✓ Getting help before problems become serious \nYou're not just using an app - you're protecting your family's wellbeing. Keep it up!	telehealth	\N	\N	t	\N	\N
c25603ad-7e7c-45d3-a146-0c1f29291b71	2025-11-03 20:58:23.146455	2025-11-03 20:58:23.146455	telehealth.tier1_app_engaged.incentive	Keep going - better health ahead!	{name}, you're doing great with telehealth! Keep using it actively and earn 10 GHC in a few weeks. The more you use it, the more convenient healthcare becomes. You're taking control of your family's health. Keep it up!	telehealth	\N	\N	t	\N	\N
b9625309-7564-46a8-b0df-d8cb2b76d933	2025-11-03 20:58:23.405521	2025-11-03 20:58:23.405521	telehealth.tier1_app_engagement_dropoff.how	Come back to telehealth - we can help!	Hi {name}, we noticed you stopped using telehealth recently. Let's get you back on track! Quick reminders: \nTo book a consultation, open the app and:\n• Choose ‘Phone Consultation’ or ‘Video Consultation’\n• Select time slot\n• Confirm your booking and pay the consultation fee\n• Make a note of the date and time of the consultation so you don’t forget!\n• For prescriptions: Doctor will send digital prescription after consultation \n• For follow-up: You can request same doctor for continuing care \n\nWatch the video below to learn how to make the most of telehealth.	telehealth	\N	\N	t	["https://drive.google.com/file/d/1bRUkNQTLBhG5brTm1DAx_7mwK2m-pmLc/view?usp=drive_link"]	\N
7facc3d4-51c3-4b72-8501-43ffa765a509	2025-11-03 20:58:23.611628	2025-11-03 20:58:23.611628	telehealth.tier1_app_engagement_dropoff.incentive	Don't lose your telehealth access!	{name}, you were taking such great care of your family! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the convenience of getting medical help from home without traveling or waiting.	telehealth	\N	\N	t	\N	\N
86ce0319-9888-435e-b3ce-7d897899747b	2025-11-03 20:58:23.820716	2025-11-03 20:58:23.820716	telehealth.tier1_app_engagement_dropoff.reactivation	Your doctor access is waiting!	{name}, we miss you! You were building something important: convenient healthcare for your family. Take 2 minutes today to have a consultation and get back on track!	telehealth	\N	\N	t	\N	\N
4fdfa3c5-a54f-41ad-a853-de71ae836951	2025-11-03 20:58:24.061233	2025-11-03 20:58:24.061233	telehealth.tier1_app_engagement_dropoff.why	Remember why you started using telehealth	{name}, going back to only clinic visits means going back to old problems: \n• Time lost: Half-day trips to see a doctor - telehealth takes minutes \n• Costs: Transport expenses add up - telehealth saves money \n• Delays: Small problems become big without early help - telehealth provides quick access \nYou already learned how to use telehealth. Don't give up the convenience you worked for. Your family's health will thank you!	telehealth	\N	\N	t	\N	\N
98b75ce3-78ad-4a4b-a968-4de949fa91e9	2025-11-03 20:58:24.286438	2025-11-03 20:58:24.286438	telehealth.tier1_app_engagement_sustained.celebrate	You're a consistent telehealth user!	Fantastic {name}! 🎉 You've maintained active telehealth use for 6 weeks. This isn't luck - this is YOU taking control of your family's healthcare! You've proven that: \n✓ You can get quality medical advice from your phone \n✓ You manage health concerns quickly and conveniently \n✓ You're protecting your family's wellbeing \n✓ You're saving time and money \nYou're thriving and you're an example to others. Congratulations!	telehealth	\N	\N	t	\N	\N
e266d044-3069-41ff-a3b6-841c94b9e282	2025-11-03 20:58:24.510772	2025-11-03 20:58:24.510772	telehealth.first_tier1_app_retained.reward	9 weeks of smart healthcare! Collect your reward.	Exceptional achievement {name}! 🎉 You've used telehealth actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced convenient healthcare. Amazing!	telehealth	\N	\N	t	\N	\N
d6c32015-1d4f-4a5c-beab-2f4de272b0c0	2025-11-03 20:58:24.738489	2025-11-03 20:58:24.738489	telehealth.tier1_app_retained.celebrate	You're a telehealth expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term telehealth user. Look at what you've achieved: \n✓ 9+ weeks of convenient healthcare \n✓ Consistent care for you and your family \n✓ Time and money saved on every consultation \n✓ Confidence using digital healthcare \nCongratulations!	telehealth	\N	\N	t	\N	\N
ea11bb73-3bc7-4565-8808-b299a9cf08da	2025-11-03 20:58:24.940612	2025-11-03 20:58:24.940612	telehealth.tier1_app_retained.incentive	You're building real health power	{name}, you've proven you can manage healthcare digitally for 9+ weeks. This consistency means your family gets help faster, you save money on transport and time, and you catch problems early. The longer you keep going, the healthier your family stays. Your family's wellbeing is in your hands!	telehealth	\N	\N	t	\N	\N
064c0592-852c-4ab5-ac2a-63977309bd55	2025-11-03 20:58:25.149538	2025-11-03 20:58:25.149538	telehealth.tier1_app_retention_dropoff.how	Let's solve your telehealth issue	Hi {name}, you were such a consistent telehealth user! We noticed you haven't been active lately. Let's fix any issues: \nTo book a consultation, open the app and:\n• Choose ‘Phone Consultation’ or ‘Video Consultation’\n• Select time slot\n• Confirm your booking and pay the consultation fee\n• Make a note of the date and time of the consultation so you don’t forget!\n• For emergencies: Telehealth is for common issues; visit clinic for serious emergencies \n• For prescriptions: Doctors send digital prescriptions during consultations \n• Network problems? Try at different times or from locations with better signal \n\nWatch the video below to learn how to make the most of telehealth.	telehealth	\N	\N	t	["https://drive.google.com/file/d/1bRUkNQTLBhG5brTm1DAx_7mwK2m-pmLc/view?usp=drive_link"]	\N
f402d92b-7de1-4e6f-9996-6d3e9b9258d4	2025-11-03 20:58:25.350632	2025-11-03 20:58:25.350632	telehealth.tier1_app_retention_dropoff.incentive	Your convenient healthcare is too valuable to lose	{name}, every week of telehealth use you've built means easier access to medical care. By stopping now, you go back to time-consuming clinic visits. Use telehealth this week and keep your convenient healthcare access!	telehealth	\N	\N	t	\N	\N
fcc8a0f0-6fc2-44f4-aeb3-2bb64f785df3	2025-11-03 20:58:25.558372	2025-11-03 20:58:25.558372	telehealth.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a telehealth champion	{name}, we miss you! Your consistent use provided convenient healthcare for your family. Make sure you don't let this slip away. Take 2 minutes today to have a consultation and get back on track!	telehealth	\N	\N	t	\N	\N
3c36c05e-5f09-4e56-ab27-1a2ab4009c5b	2025-11-03 20:58:25.775435	2025-11-03 20:58:25.775435	telehealth.tier1_app_retention_dropoff.why	Why your telehealth access matters	{name}, you spent many weeks building convenient healthcare habits. Here's what you lose by stopping: \n• Convenience: Back to long clinic trips instead of quick phone consultations \n• Costs: Transport expenses return instead of saving money \n• Delays: Small problems grow without quick access to medical advice \nYou worked hard to master telehealth. Make sure that you continue protecting your family's health conveniently. Take two minutes today to use telehealth and get back on track.	telehealth	\N	\N	t	\N	\N
ecf3575d-cbd0-4ecc-8fc7-962500969194	2025-11-03 20:58:26.029571	2025-11-03 20:58:26.029571	telehealth.tier2_app_opened_first_time.celebrate	Welcome to telehealth!	Great start {name}! 🎉 You've opened your Ghinger Health app for the first time. Health is your second most important goal. This is the beginning of convenient healthcare - access to doctors from anywhere. With Ghinger Health, you can: \n✓ Talk to doctors from home \n✓ Get medical advice without traveling \n✓ Save time and costs \n✓ Access healthcare when you need it \n\nTake the next step: Register your account!	telehealth	\N	\N	t	\N	\N
3fce124d-5020-4515-82a8-32d276e02f79	2025-11-03 20:58:26.238348	2025-11-03 20:58:26.238348	telehealth.tier2_app_adopted.celebrate	You're taking control of your health!	Well done {name}! 🎉 You're now using telehealth. You've started accessing convenient healthcare!	telehealth	\N	\N	t	\N	\N
667b0f8c-ca18-4636-b7b6-31171e1a8ee3	2025-11-03 20:58:26.459593	2025-11-03 20:58:26.459593	telehealth.tier2_app_registered.celebrate	Your telehealth account is ready!	{name} congratulations on registering for Ghinger Health! 🎉 This is a major step forward! With your account you can: \n✓ Consult doctors anytime \n✓ Get advice from home \n✓ Receive prescriptions \n✓ Save time and money \nAll from your phone!	telehealth	\N	\N	t	\N	\N
0721bbb6-2f87-45a4-a379-af0526eff5b7	2025-11-03 20:58:26.6747	2025-11-03 20:58:26.6747	telehealth.tier2_app_low_activity.how	Quick tips for telehealth	Hi {name}, we noticed you haven't used your Ghinger Health account much. Ready to try it? Here's a quick start: \n1. Open your app \n2. Select 'Consult a Doctor' \n3. Describe your health concern \n4. Talk to a doctor \nStart with a simple question!	telehealth	\N	\N	t	\N	\N
1f94f467-d126-429d-a84d-51b01c423654	2025-11-03 20:58:26.869934	2025-11-03 20:58:26.869934	telehealth.tier2_app_low_activity.incentive	Try telehealth	{name}, start using your Ghinger Health account and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll have convenient healthcare access.	telehealth	\N	\N	t	\N	\N
a4e81429-056e-4523-9ad3-f97dd041f52e	2025-11-03 20:58:27.09544	2025-11-03 20:58:27.09544	telehealth.tier2_app_low_activity.support	Need help with telehealth?	Hi {name}, need help using your Ghinger Health account? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	telehealth	\N	\N	t	\N	\N
2102eda3-b7df-48a1-b1f2-4cd7cd29b59e	2025-11-03 20:58:27.307482	2025-11-03 20:58:27.307482	telehealth.tier2_app_low_activity.why	Telehealth makes healthcare convenient	{name}, telehealth offers real benefits: \n• Doctor access from home \n• Save time and transport costs \n• Quick medical advice \nGive it a try - many in your community use it!	telehealth	\N	\N	t	\N	\N
88fc33f2-7e77-48d6-8987-56af0d6ab516	2025-11-03 20:58:27.516529	2025-11-03 20:58:27.516529	telehealth.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used telehealth for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	telehealth	\N	\N	t	\N	\N
a9cc898b-5c53-4abb-96c2-30cf6db2302e	2025-11-03 20:58:27.741471	2025-11-03 20:58:27.741471	telehealth.tier2_app_engaged.celebrate	You're using telehealth!	Great job {name}! 🎉 As an active telehealth user, you're getting convenient medical care and saving time. You're taking good care of your health!	telehealth	\N	\N	t	\N	\N
3ea2d0b2-6708-413b-89c7-f5c6a550c073	2025-11-03 20:58:27.948677	2025-11-03 20:58:27.948677	telehealth.tier2_app_engaged.incentive	Keep going with telehealth	{name}, you're doing well! Keep using telehealth and earn 10 GHC in a few weeks. Every consultation saves time!	telehealth	\N	\N	t	\N	\N
e3f08b09-cf0a-4db6-939b-75dd71f62d98	2025-11-03 20:58:28.170944	2025-11-03 20:58:28.170944	telehealth.tier2_app_engagement_dropoff.how	Quick telehealth reminder	Hi {name}, we noticed you stopped using telehealth lately. Quick reminder: \nTo book a consultation, open the app and:\n• Choose ‘Phone Consultation’ or ‘Video Consultation’\n• Select time slot\n• Confirm your booking and pay the consultation fee\n• Make a note of the date and time of the consultation so you don’t forget!\n\nWatch the video for a refresher.	telehealth	\N	\N	t	["https://drive.google.com/file/d/1bRUkNQTLBhG5brTm1DAx_7mwK2m-pmLc/view?usp=drive_link"]	\N
7b4156b4-8cc5-46cb-8eb9-734a9e89179a	2025-11-03 20:58:28.369477	2025-11-03 20:58:28.369477	telehealth.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to telehealth and earn 10 GHC in a few weeks. It saves time and keeps you healthy.	telehealth	\N	\N	t	\N	\N
83b04bc6-98c6-4359-aa53-ad9146d9d069	2025-11-03 20:58:28.579559	2025-11-03 20:58:28.579559	telehealth.tier2_app_engagement_dropoff.reactivation	Try telehealth again?	{name}, you started getting convenient healthcare. Take 2 minutes today to have a consultation!	telehealth	\N	\N	t	\N	\N
86dafe74-37f3-4c71-b4e6-2eed9a5a8960	2025-11-03 20:58:28.792701	2025-11-03 20:58:28.792701	telehealth.tier2_app_engagement_dropoff.why	Telehealth is convenient and fast	{name}, telehealth offers convenience: \n• Doctor access from home \n• Save time and costs \n• Quick medical advice \nYou already know how to use it - try it again!	telehealth	\N	\N	t	\N	\N
e1791b9c-2a7f-457a-b38d-ea68217ccfae	2025-11-03 20:58:29.003502	2025-11-03 20:58:29.003502	telehealth.tier2_app_engagement_sustained.celebrate	6 weeks of telehealth!	Well done {name}! 🎉 You've used telehealth consistently for 6 weeks. You're managing your health conveniently!	telehealth	\N	\N	t	\N	\N
25b6fd01-a0b0-4eb6-9d86-a42386da721c	2025-11-03 20:58:29.231385	2025-11-03 20:58:29.231385	telehealth.first_tier2_app_retained.reward	You've earned 10 GHC for consistency!	Excellent {name}! 🎉 You've used telehealth for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	telehealth	\N	\N	t	\N	\N
c5064757-fe0c-4595-95d9-d8259857ac0c	2025-11-03 20:58:29.443512	2025-11-03 20:58:29.443512	telehealth.tier2_app_retained.celebrate	You're a regular telehealth user!	Impressive {name}! 🎉 You've been using telehealth consistently. You have convenient healthcare access and you're managing your health well. Well done!	telehealth	\N	\N	t	\N	\N
66097bbf-4e1d-478d-bd3d-2ad31d46498b	2025-11-03 20:58:29.663389	2025-11-03 20:58:29.663389	telehealth.tier2_app_retained.incentive	Keep your telehealth habit going	{name}, your consistent telehealth use means convenient healthcare whenever you need it. Keep it up!	telehealth	\N	\N	t	\N	\N
02201c99-03fd-4286-a112-9bf7be6521ea	2025-11-03 20:58:29.909559	2025-11-03 20:58:29.909559	telehealth.tier2_app_retention_dropoff.how	Quick telehealth reminder	Hi {name}, we noticed you stopped using telehealth lately. Quick reminder: \nTo book a consultation, open the app and:\n• Choose ‘Phone Consultation’ or ‘Video Consultation’\n• Select time slot\n• Confirm your booking and pay the consultation fee\n• Make a note of the date and time of the consultation so you don’t forget!\n\nWatch the video for a refresher.	telehealth	\N	\N	t	["https://drive.google.com/file/d/1bRUkNQTLBhG5brTm1DAx_7mwK2m-pmLc/view?usp=drive_link"]	\N
27770b32-d4ab-4819-97b9-af2617f2a8df	2025-11-03 20:58:30.11946	2025-11-03 20:58:30.11946	telehealth.tier2_app_retention_dropoff.incentive	Your healthcare access is waiting	{name}, you built great telehealth habits. Come back and keep your convenient healthcare access.	telehealth	\N	\N	t	\N	\N
6b5e67ab-1986-486d-9d95-1865fac74f71	2025-11-03 20:58:30.324437	2025-11-03 20:58:30.324437	telehealth.tier2_app_retention_dropoff.reactivation	Come back to telehealth	{name}, you were doing great with convenient healthcare! Use it again today and keep your health habits strong.	telehealth	\N	\N	t	\N	\N
8f127e8f-8dce-4cf6-b284-617f88e86b4f	2025-11-03 20:58:30.549666	2025-11-03 20:58:30.549666	telehealth.tier2_app_retention_dropoff.why	Keep your healthcare access	{name}, you built weeks of good telehealth habits. Keep going to maintain: \n• Convenient doctor access \n• Time and cost savings \n• Quick medical help \nHave a consultation today to stay on track!	telehealth	\N	\N	t	\N	\N
da0e9f42-22a4-4f45-b165-5af0b409d909	2025-11-03 20:58:30.79642	2025-11-03 20:58:30.79642	wellness.tier1_app_opened_first_time.celebrate	Welcome to Home Workout!	Great start {name}! 🎉 You've opened Home Workout for the first time. Health is your most important goal. This is the beginning of something powerful - a stronger, healthier you. With Home Workout, you can: \n✓ Exercise at home without any equipment \n✓ Build strength and energy for your work \n✓ Feel better and more confident \n✓ Work out at your own pace \n\nTake the next step: Start your first workout!	wellness	\N	\N	t	\N	\N
3f2c10ca-c008-466e-9751-9815f2b2e956	2025-11-03 20:58:31.021152	2025-11-03 20:58:31.021152	wellness.tier1_app_adopted.celebrate	You're taking control of your health!	Well done {name}! 🎉 You're now using Home Workout. You've taken control of your fitness! By exercising regularly, you're: \n✓ Building strength for your daily work \n✓ Improving your health and energy \n✓ Feeling more confident and capable \nKeep going!	wellness	\N	\N	t	\N	\N
1d7cbbe9-fb79-4ed1-b73c-db77a12f6202	2025-11-03 20:58:31.229718	2025-11-03 20:58:31.229718	wellness.tier1_app_registered.celebrate	Your fitness journey is ready!	{name} congratulations on setting up Home Workout! 🎉 This is a major step forward! With Home Workout you can: \n✓ Exercise anytime, anywhere \n✓ Build strength without gym equipment \n✓ Improve your health and energy \n✓ Feel stronger every day \nAll from your phone!	wellness	\N	\N	t	\N	\N
710a1a7a-bbd5-45c3-8be6-56089f30ff29	2025-11-03 20:58:31.468425	2025-11-03 20:58:31.468425	wellness.tier1_app_low_activity.how	Get the most from Home Workout	Hi {name}, we noticed you haven't used Home Workout much. Here's how to start exercising: \n1. Open the Home Workout app \n2. Choose your fitness level (Beginner, Intermediate, or Advanced) \n3. Pick which body part you want to strengthen - hands, legs, stomach, etc. \n4. Tap on an exercise to see how to do it \n5. When ready, tap 'Start' and begin your workout \n6. Tap 'Done' when you finish \n\nWatch the video to learn more about using Home Workout.	wellness	\N	\N	t	["https://drive.google.com/file/d/1FSy9cMB2-Wxa27P8kEQAm3CRYrzlBvL0/view?usp=drive_link"]	\N
a038a654-39e3-4d76-ba3f-a65d6068912d	2025-11-03 20:58:31.713368	2025-11-03 20:58:31.713368	wellness.tier1_app_low_activity.incentive	Your reward is waiting - start exercising today!	{name}, start using Home Workout and earn a reward of 10 GHC in just three weeks! Every workout you do builds your strength, gives you more energy for your work, and improves your health. \nThe sooner you start, the sooner you'll feel stronger and healthier. Try one workout today!	wellness	\N	\N	t	\N	\N
1ef15eb7-a805-45c1-8f7b-f1a9ff813cdc	2025-11-03 20:58:31.926485	2025-11-03 20:58:31.926485	wellness.tier1_app_low_activity.support	Need help with Home Workout?	Hi {name}, need help using Home Workout? We're here for you! Common questions: \n• How to find exercises? Open the app → Choose your fitness level → Pick the body part you want to strengthen → Select an exercise \n• How to start a workout? Tap on an exercise → Watch the video to learn how → Tap 'Start' → Do the exercise → Tap 'Done' \n• Which level should I choose? Start with Beginner if you're new to exercise, then move up as you get stronger \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	wellness	\N	\N	t	\N	\N
2673757d-b687-4520-8e18-e1ac317efb84	2025-11-03 20:58:32.141572	2025-11-03 20:58:32.141572	wellness.tier1_app_low_activity.why	Why Home Workout matters for your health	{name}, we know starting something new can feel difficult. But not exercising has real costs: \n• Low energy: Feeling tired makes work harder \n• Weak body: Less strength for daily tasks \n• Health problems: No exercise leads to illness \n• Less confidence: Feeling weak affects how you see yourself \nHome Workout solves these problems. You can exercise at home, at your own pace, without any equipment. Others in your community already use it. Take the first step today - you'll be glad you did!	wellness	\N	\N	t	\N	\N
ecca59a4-69df-4cab-94dc-f7727d3aa72b	2025-11-03 20:58:32.367466	2025-11-03 20:58:32.367466	wellness.first_tier1_app_engaged.reward	3 weeks of fitness success! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using Home Workout for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - a stronger, healthier body. Congratulations!	wellness	\N	\N	t	\N	\N
9eff6610-5a4c-4744-9bb7-be25bd1693fc	2025-11-03 20:58:32.595055	2025-11-03 20:58:32.595055	wellness.tier1_app_engaged.celebrate	You're mastering Home Workout!	Excellent work {name}! 🎉 Now that you are an active Home Workout user you're: \n✓ Building strength for your work \n✓ Having more energy every day \n✓ Improving your health and confidence \n✓ Feeling stronger and more capable \nYou're not just using an app - you're building a healthier future. Keep it up!	wellness	\N	\N	t	\N	\N
1e52cf99-6531-40d0-bad9-3b6a259358cd	2025-11-03 20:58:32.821326	2025-11-03 20:58:32.821326	wellness.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with Home Workout! Keep exercising actively and earn 10 GHC in a few weeks. The more you exercise, the stronger and healthier you become. Keep it up!	wellness	\N	\N	t	\N	\N
932a7708-e752-436d-a4f7-d25c311a2a51	2025-11-03 20:58:33.030003	2025-11-03 20:58:33.030003	wellness.tier1_app_engagement_dropoff.how	Come back to Home Workout - we can help!	Hi {name}, we noticed you stopped using Home Workout recently. Let's get you back on track! Quick reminders: \n• To find exercises: Open Home Workout → Choose your fitness level → Pick the body part (hands, legs, stomach) → Select an exercise \n• To start: Tap on an exercise → Watch the video → Tap 'Start' → Do the workout → Tap 'Done' \n• Choose exercises you enjoy: Try different body parts and difficulty levels \n\nWatch the video to learn how to make the most of Home Workout.	wellness	\N	\N	t	["https://drive.google.com/file/d/1FSy9cMB2-Wxa27P8kEQAm3CRYrzlBvL0/view?usp=drive_link"]	\N
de61b1fb-610e-44ca-b699-a9d2ce8b53df	2025-11-03 20:58:33.246956	2025-11-03 20:58:33.246956	wellness.tier1_app_engagement_dropoff.incentive	Don't lose your fitness momentum!	{name}, you were doing so well with Home Workout! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of having more energy, feeling stronger, and improving your health.	wellness	\N	\N	t	\N	\N
b7930ef7-6c17-40c3-86ca-191dd22f54e0	2025-11-03 20:58:33.463489	2025-11-03 20:58:33.463489	wellness.tier1_app_engagement_dropoff.reactivation	Your fitness journey misses you - come back today!	{name}, we miss you! You were building something important with Home Workout: a stronger body and better health. Take 2 minutes today to do one workout and get back on track!	wellness	\N	\N	t	\N	\N
2944994d-319e-4708-92b5-17fb2c207b9d	2025-11-03 20:58:33.676395	2025-11-03 20:58:33.676395	wellness.tier1_app_engagement_dropoff.why	Remember why you started exercising	{name}, stopping your workouts means going back to old problems: \n• Tired body: Less energy for your work and family \n• Lost strength: The strength you built is fading \n• Health risks: No exercise leads to health problems \n• Less confidence: You felt better when you were exercising \nYou already learned how to use Home Workout. Don't give up the strength and energy you worked for. Your future self will thank you!	wellness	\N	\N	t	\N	\N
ce0680dc-9e81-4a93-97b0-75da663834bc	2025-11-03 20:58:33.898485	2025-11-03 20:58:33.898485	wellness.tier1_app_engagement_sustained.celebrate	You're a consistent fitness user!	Fantastic {name}! 🎉 You've maintained active Home Workout use for 6 weeks. This isn't luck - this is YOU taking control of your health! You've proven that: \n✓ You can build healthy habits \n✓ You can stay strong through exercise \n✓ You're committed to your health \n✓ You're building lasting strength \nYou're thriving and you're an example to others. Congratulations!	wellness	\N	\N	t	\N	\N
f0dfe4ab-efa9-4d27-82ba-9a293c092d6d	2025-11-03 20:58:34.101743	2025-11-03 20:58:34.101743	wellness.first_tier1_app_retained.reward	9 weeks of fitness! Collect your reward.	Exceptional achievement {name}! 🎉 You've used Home Workout actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced a healthy, active life. Amazing!	wellness	\N	\N	t	\N	\N
147e83c0-bddb-4be8-9fbc-e5933e313150	2025-11-03 20:58:34.316259	2025-11-03 20:58:34.316259	wellness.tier1_app_retained.celebrate	You're a Home Workout expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term Home Workout user. Look at what you've achieved: \n✓ 9+ weeks of consistent exercise \n✓ Stronger body and better health \n✓ More energy for your work and family \n✓ Confidence and pride in your fitness \nCongratulations!	wellness	\N	\N	t	\N	\N
80346424-a251-46a0-bc69-c7b0ad321c13	2025-11-03 20:58:34.523776	2025-11-03 20:58:34.523776	wellness.tier1_app_retained.incentive	You're building real strength and health	{name}, you've proven you can exercise consistently for 9+ weeks. This commitment is changing your life: you have more energy, you're stronger, and you feel better every day. The longer you keep going, the healthier and more capable you become. Your health is in your hands!	wellness	\N	\N	t	\N	\N
1b872aca-83cd-49f4-99b0-ab51c438d2b4	2025-11-03 20:58:34.731662	2025-11-03 20:58:34.731662	wellness.tier1_app_retention_dropoff.how	Let's solve your fitness issue	Hi {name}, you were such a consistent Home Workout user! We noticed you haven't been active lately. Let's fix any issues: \n• To find exercises: Open Home Workout → Choose your fitness level → Pick the body part → Select an exercise \n• To start: Tap on an exercise → Watch the video → Tap 'Start' → Do the workout → Tap 'Done' \n• Try different exercises: Explore exercises for different body parts and levels \n• Start small: Even 5 minutes of exercise is valuable \n\nWatch the video to learn how to make the most of Home Workout.	wellness	\N	\N	t	["https://drive.google.com/file/d/1FSy9cMB2-Wxa27P8kEQAm3CRYrzlBvL0/view?usp=drive_link"]	\N
384fd8e8-0a24-48a0-b568-56b81f93ee61	2025-11-03 20:58:34.94947	2025-11-03 20:58:34.94947	wellness.tier1_app_retention_dropoff.incentive	Your fitness progress is too valuable to lose	{name}, every week of exercise you've done has made you stronger and healthier. By stopping now, you're losing the strength and energy you built. Exercise this week and keep your health strong!	wellness	\N	\N	t	\N	\N
4dd7ae15-2ee8-4ab9-9bb2-44c92fc0f22b	2025-11-03 20:58:35.168501	2025-11-03 20:58:35.168501	wellness.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a fitness champion	{name}, we miss you! Your consistent exercise gave you strength, energy, and better health. Make sure you don't let this slip away. Take 2 minutes today to do one workout and get back on track!	wellness	\N	\N	t	\N	\N
babee32f-7324-4d19-ae96-7b9294862868	2025-11-03 20:58:35.381705	2025-11-03 20:58:35.381705	wellness.tier1_app_retention_dropoff.why	Why your fitness journey matters	{name}, you spent many weeks building healthy exercise habits. Here's what you lose by stopping: \n• Lost strength: The muscles you built are getting weaker \n• Less energy: Back to feeling tired for your work \n• Health risks: No exercise leads to health problems \n\nYou worked hard to become fit and strong. Make sure that you continue exercising to maintain your health and strength. Take two minutes today to do one workout and get back on track.	wellness	\N	\N	t	\N	\N
a9e2eb2f-dbb6-41a3-a8a7-af78c01e7f57	2025-11-03 20:58:35.590609	2025-11-03 20:58:35.590609	wellness.tier2_app_opened_first_time.celebrate	Welcome to Home Workout!	Great start {name}! 🎉 You've opened Home Workout for the first time. Health is your second most important goal. This is the beginning of something powerful - a stronger, healthier you. With Home Workout, you can: \n✓ Exercise at home without any equipment \n✓ Build strength and energy \n✓ Feel better and more confident \n✓ Work out at your own pace \n\nTake the next step: Start your first workout!	wellness	\N	\N	t	\N	\N
951f507d-5a59-49cf-b5a3-509f4e40c928	2025-11-03 20:58:35.849289	2025-11-03 20:58:35.849289	wellness.tier2_app_adopted.celebrate	You're taking control of your health!	Well done {name}! 🎉 You're now using Home Workout. You've taken control of your fitness!	wellness	\N	\N	t	\N	\N
39d1b5ca-bc6b-437a-a6b6-c62c6825b333	2025-11-03 20:58:36.059452	2025-11-03 20:58:36.059452	wellness.tier2_app_registered.celebrate	Your fitness journey is ready!	{name} congratulations on setting up Home Workout! 🎉 This is a major step forward! With Home Workout you can: \n✓ Exercise anytime, anywhere \n✓ Build strength without equipment \n✓ Improve your health and energy \n✓ Feel stronger every day \nAll from your phone!	wellness	\N	\N	t	\N	\N
a4701892-ab3f-48d9-a398-f892973f1867	2025-11-03 20:58:36.261487	2025-11-03 20:58:36.261487	wellness.tier2_app_low_activity.how	Quick tips for Home Workout	Hi {name}, we noticed you haven't used Home Workout much. Ready to try exercising? Here's a quick start: \n1. Open the app and choose your fitness level \n2. Pick a body part you want to strengthen \n3. Try an exercise - watch the video to learn how \nStart small until you're comfortable!	wellness	\N	\N	t	\N	\N
67eb62b1-e85a-41eb-88d1-37ec24ce99cb	2025-11-03 20:58:36.47038	2025-11-03 20:58:36.47038	wellness.tier2_app_low_activity.incentive	Try Home Workout	{name}, start using Home Workout and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll feel stronger and healthier.	wellness	\N	\N	t	\N	\N
45aafe41-f561-4a3a-84d6-7e9fd94d004b	2025-11-03 20:58:36.688552	2025-11-03 20:58:36.688552	wellness.tier2_app_low_activity.support	Need help with Home Workout?	Hi {name}, need help using Home Workout? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	wellness	\N	\N	t	\N	\N
3e1ed67d-4c15-4f63-9c23-3913f91cc6c6	2025-11-03 20:58:36.909519	2025-11-03 20:58:36.909519	wellness.tier2_app_low_activity.why	Home Workout makes life better	{name}, Home Workout offers real benefits: \n• Build strength for your daily work \n• Have more energy throughout the day \n• Improve your health without going to a gym \nGive it a try - many in your community already use it!	wellness	\N	\N	t	\N	\N
cf5c95ad-06cb-498a-82cd-cfa263da8b74	2025-11-03 20:58:37.140495	2025-11-03 20:58:37.140495	wellness.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used Home Workout for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	wellness	\N	\N	t	\N	\N
20597126-f8db-49ba-bf08-3a82d3106309	2025-11-03 20:58:37.35051	2025-11-03 20:58:37.35051	wellness.tier2_app_engaged.celebrate	You're using Home Workout!	Great job {name}! 🎉 As an active Home Workout user, you're building strength and improving your health. You're building good fitness habits!	wellness	\N	\N	t	\N	\N
5f054a62-49a4-4699-9116-7edceb23ee77	2025-11-03 20:58:37.574994	2025-11-03 20:58:37.574994	wellness.tier2_app_engaged.incentive	Keep going with Home Workout	{name}, you're doing well! Keep using Home Workout and earn 10 GHC in a few weeks. Every workout counts!	wellness	\N	\N	t	\N	\N
127fea44-56d5-4e61-9e6e-7439b3b0ca1a	2025-11-03 20:58:37.789577	2025-11-03 20:58:37.789577	wellness.tier2_app_engagement_dropoff.how	Quick Home Workout reminder	Hi {name}, we noticed that you stopped Home Workout lately. Quick reminders: \n• To find exercises: Open Home Workout → Choose fitness level → Pick body part → Select exercise \n• To start: Tap exercise → Watch video → Tap 'Start' → Do workout → Tap 'Done' \n• Try different exercises for variety \n\nWatch the video for a refresher.	wellness	\N	\N	t	["https://drive.google.com/file/d/1FSy9cMB2-Wxa27P8kEQAm3CRYrzlBvL0/view?usp=drive_link"]	\N
75a5ff59-5487-4ae3-b317-0e79bddf0872	2025-11-03 20:58:38.019425	2025-11-03 20:58:38.019425	wellness.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Home Workout and earn 10 GHC in a few weeks. It builds your strength, gives you energy, and improves your health.	wellness	\N	\N	t	\N	\N
1ecd99ed-44c3-4306-b0aa-50de890e16b1	2025-11-03 20:58:38.256349	2025-11-03 20:58:38.256349	wellness.tier2_app_engagement_dropoff.reactivation	Try Home Workout again?	{name}, you started building good fitness habits with Home Workout. Take 2 minutes today to do one workout again!	wellness	\N	\N	t	\N	\N
4057c896-fb0e-4d8b-840a-da23cf052557	2025-11-03 20:58:38.481416	2025-11-03 20:58:38.481416	wellness.tier2_app_engagement_dropoff.why	Home Workout builds strength and health	{name}, Home Workout offers strength and health benefits: \n• Build strength for your work \n• Have more energy every day \n• Improve your health at home \nYou already know how to use it - try it again!	wellness	\N	\N	t	\N	\N
5e3a9a5c-fcd8-47b3-ba7c-c2a3dfdc808b	2025-11-03 20:58:38.819628	2025-11-03 20:58:38.819628	wellness.tier2_app_engagement_sustained.celebrate	6 weeks of Home Workout!	Well done {name}! 🎉 You've used Home Workout consistently for 6 weeks. You're building strength and improving your health!	wellness	\N	\N	t	\N	\N
cc487240-f39c-45bd-8774-3a6ec3e5619d	2025-11-03 20:58:39.034371	2025-11-03 20:58:39.034371	wellness.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency with Home Workout!	Excellent {name}! 🎉 You've used Home Workout for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	wellness	\N	\N	t	\N	\N
2c522283-f2f0-4389-81eb-ef74a13300c0	2025-11-03 20:58:39.302421	2025-11-03 20:58:39.302421	wellness.tier2_app_retained.celebrate	You're a Home Workout user!	Impressive {name}! 🎉 You've been using Home Workout consistently. You're building strength and staying healthy. Well done!	wellness	\N	\N	t	\N	\N
21acdc04-3e1b-40db-b8b6-b6a9b714559b	2025-11-03 20:58:39.544606	2025-11-03 20:58:39.544606	wellness.tier2_app_retained.incentive	Keep your Home Workout habit going	{name}, your consistent exercise is turning into valuable fitness habits. You're stronger and healthier. Keep it up!	wellness	\N	\N	t	\N	\N
f44cf675-8083-4e54-9727-769311ca933e	2025-11-03 20:58:39.780059	2025-11-03 20:58:39.780059	wellness.tier2_app_retention_dropoff.how	Quick Home Workout reminder	Hi {name}, we noticed that you stopped Home Workout lately. Quick reminders: \n• To find exercises: Open Home Workout → Choose fitness level → Pick body part → Select exercise \n• To start: Tap exercise → Watch video → Tap 'Start' → Do workout → Tap 'Done' \n• Try different exercises for variety \n\nWatch the video for a refresher.	wellness	\N	\N	t	["https://drive.google.com/file/d/1FSy9cMB2-Wxa27P8kEQAm3CRYrzlBvL0/view?usp=drive_link"]	\N
c188f854-a46d-49bf-ba77-05f1f9defcf2	2025-11-03 20:58:40.015504	2025-11-03 20:58:40.015504	wellness.tier2_app_retention_dropoff.incentive	Your fitness is waiting	{name}, you built great exercise habits. Come back and keep building your strength and health.	wellness	\N	\N	t	\N	\N
210953b8-88af-4e80-a5e3-9f9efb3172b7	2025-11-03 20:58:40.255321	2025-11-03 20:58:40.255321	wellness.tier2_app_retention_dropoff.reactivation	Come back to Home Workout	{name}, you were doing great with Home Workout! Use it again today and keep your fitness habits strong.	wellness	\N	\N	t	\N	\N
e6712f46-a9fd-414c-8015-addb36be0152	2025-11-03 20:58:40.46948	2025-11-03 20:58:40.46948	wellness.tier2_app_retention_dropoff.why	Keep your fitness progress	{name}, you built weeks of good exercise habits. Keep going to maintain: \n• Your strength and energy \n• Your improved health \n• Your fitness confidence \nUse it today to stay on track!	wellness	\N	\N	t	\N	\N
8a2f566c-8780-4f46-a157-643bccf294db	2025-11-03 20:58:40.720572	2025-11-03 20:58:40.720572	womens_health.tier1_app_opened_first_time.celebrate	Welcome to women's health!	Great start {name}! 🎉 You've opened Flo for the first time. Health is your most important goal. This is the beginning of something powerful - a private space to understand your body and health. With Flo, you can:\n✓ Track your cycle privately and plan your family\n✓ Get personalized health advice for women\n✓ Understand your body better\n✓ Prepare for pregnancy or avoid it\n\nTake the next step: Register your account!	women’s_health	\N	\N	t	\N	\N
e0b00f9a-3494-42b8-b9a3-75cb977dde49	2025-11-03 20:58:40.941456	2025-11-03 20:58:40.941456	womens_health.tier1_app_adopted.celebrate	You're taking control of your health!	Well done {name}! 🎉 You're now using Flo. You've taken control of your women's health! By tracking your cycle and understanding your body, you're:\n✓ Planning your family confidently\n✓ Avoiding surprises with your period\n✓ Understanding your health patterns\n✓ Getting answers to questions you feel shy to ask\nKeep going!	women’s_health	\N	\N	t	\N	\N
50dc2940-f0a8-4399-97da-2f4d3110b197	2025-11-03 20:58:41.181469	2025-11-03 20:58:41.181469	womens_health.tier1_app_registered.celebrate	Your personal health companion is ready!	{name} congratulations on registering for Flo! 🎉 This is a major step forward! With your Flo account you can:\n✓ Track your cycle and predict your period\n✓ Get advice on women's health\n✓ Plan for pregnancy or avoid it\n✓ Understand mood and health changes\nAll private and on your phone!	women’s_health	\N	\N	t	\N	\N
363403dc-a71d-4e0d-9e95-b551a6029fa9	2025-11-03 20:58:41.388561	2025-11-03 20:58:41.388561	womens_health.tier1_app_low_activity.how	Get the most from Flo - here's how	Hi {name}, we noticed you haven't used Flo much. It's easy to get started! Here's how:\n1. Open Flo and log your period start date\n2. The app will predict your next cycle\n3. Check daily health tips for women\n4. Track symptoms, mood, and health patterns\nStart with small steps - just log your period dates. Once you try it, you'll see how helpful it is for planning and understanding your body!	women’s_health	\N	\N	t	\N	\N
fa006914-3fd8-402d-acdd-1e5c36307f4b	2025-11-03 20:58:41.599473	2025-11-03 20:58:41.599473	womens_health.tier1_app_low_activity.incentive	Your reward is waiting - start using Flo!	{name}, start using Flo actively and earn a reward of 10 GHC in just three weeks! Every time you track your cycle, you gain control over your life and can plan better. Understanding your body gives you confidence and helps you make informed decisions.\nThe sooner you start, the sooner you'll wonder how you managed without it. Try logging your cycle today!	women’s_health	\N	\N	t	\N	\N
86ae273c-df80-481c-8f4d-e48b83c43464	2025-11-03 20:58:41.8185	2025-11-03 20:58:41.8185	womens_health.tier1_app_low_activity.support	Need help with Flo?	Hi {name}, need help using Flo? We're here for you! Common questions:\n• How to track your period? Open Flo → Click 'Log Period' → Select start date → Confirm\n• How to predict your cycle? The app automatically predicts after you log 2-3 cycles\n• How to get health advice? Check the 'Today' tab for daily tips\n• Forgot your password? Click 'Forgot Password' on login screen\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	women’s_health	\N	\N	t	\N	\N
1c41ee87-d457-40bf-a9f6-5f9df20291b9	2025-11-03 20:58:42.03264	2025-11-03 20:58:42.03264	womens_health.tier1_app_low_activity.why	Why Flo matters for your life	{name}, we know talking about women's health can feel uncomfortable. But tracking your cycle has real benefits:\n• Avoid surprises: Know when your period will come\n• Plan your life: Schedule important events around your cycle\n• Understand your body: Learn what's normal for you\n• Family planning: Plan pregnancy or avoid it confidently\n• Private and safe: No one else needs to know\nFlo solves these problems. Your health information is private, always accessible, and helps you plan confidently. Take the first step today - you'll be glad you did!	women’s_health	\N	\N	t	\N	\N
e71439e8-e8a4-4f8c-b0ad-68beeaaa2c28	2025-11-03 20:58:42.259555	2025-11-03 20:58:42.259555	womens_health.first_tier1_app_engaged.reward	3 weeks of Flo success! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using Flo for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're building something powerful - understanding and controlling your health. Congratulations!	women’s_health	\N	\N	t	\N	\N
a5b8581e-5715-4577-858d-fa1691ff2e88	2025-11-03 20:58:42.469497	2025-11-03 20:58:42.469497	womens_health.tier1_app_engaged.celebrate	You're mastering women's health!	Excellent work {name}! 🎉 Now that you are an active Flo user you're:\n✓ Tracking your cycle and planning ahead\n✓ Understanding your body's patterns\n✓ Making informed decisions about your health\n✓ Never being surprised by your period again\nYou're not just using an app - you're taking control of your life. Keep it up!	women’s_health	\N	\N	t	\N	\N
8f1b80d3-4824-4426-9e05-8c75c1555e0f	2025-11-03 20:58:42.734379	2025-11-03 20:58:42.734379	womens_health.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with Flo! Keep using it actively and earn 10 GHC in a few weeks. The more you track and understand your body, the more confident and in control you feel. Keep it up!	women’s_health	\N	\N	t	\N	\N
0eb20db5-56ca-4511-ba18-ad13944a05fa	2025-11-03 20:58:42.94958	2025-11-03 20:58:42.94958	womens_health.tier1_app_engagement_dropoff.how	Come back to Flo - we can help!	Hi {name}, we noticed you stopped using Flo recently. Let's get you back on track! Quick reminders:\n• To log period: Open Flo → Click 'Log Period' → Select start date\n• To check predictions: Open 'Cycle' tab to see your predicted period\n• To get health tips: Check 'Today' tab for daily advice\n• To track symptoms: Click '+' button and select symptoms\n\nWatch the video below to learn how to make the most of Flo.\n<video>	women’s_health	\N	\N	t	\N	\N
76d057b1-d22d-47f2-9984-c50866228e32	2025-11-03 20:58:43.190544	2025-11-03 20:58:43.190544	womens_health.tier1_app_engagement_dropoff.incentive	Don't lose your Flo momentum!	{name}, you were doing so well with Flo! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of knowing when your period will come and being able to plan your life confidently.	women’s_health	\N	\N	t	\N	\N
1c46a9d7-8009-436d-851f-66b3f47790e8	2025-11-03 20:58:43.395707	2025-11-03 20:58:43.395707	womens_health.tier1_app_engagement_dropoff.reactivation	Flo misses you - come back today!	{name}, we miss you! You were building something important with Flo: control over your health and life planning. Take 2 minutes today to log your period and get back on track!	women’s_health	\N	\N	t	\N	\N
1712137a-fc73-4447-9931-df184128e280	2025-11-03 20:58:43.602606	2025-11-03 20:58:43.602606	womens_health.tier1_app_engagement_dropoff.why	Remember why you started Flo	{name}, not tracking your cycle means going back to old problems:\n• Surprise periods: Caught unprepared at inconvenient times\n• Poor planning: Can't schedule events confidently\n• No control: Unable to plan or prevent pregnancy\n• Questions unanswered: Shy to ask others about health concerns\nFlo solves these problems. You already learned how to use it. Don't give up the confidence and control you worked for. Your future self will thank you!	women’s_health	\N	\N	t	\N	\N
ff778ade-92ba-4436-aaf8-598879bbaee2	2025-11-03 20:58:43.802553	2025-11-03 20:58:43.802553	womens_health.tier1_app_engagement_sustained.celebrate	You're a consistent Flo user!	Fantastic {name}! 🎉 You've maintained active Flo use for 6 weeks. This isn't luck - this is YOU taking control of your health and life! You've proven that:\n✓ You can track your health consistently\n✓ You can plan your life around your cycle\n✓ You understand your body better\n✓ You're empowered to make informed decisions\nYou're thriving and you're an example to others. Congratulations!	women’s_health	\N	\N	t	\N	\N
10b7a3a3-2a75-470a-8c04-217477a03608	2025-11-03 20:58:44.017702	2025-11-03 20:58:44.017702	womens_health.first_tier1_app_retained.reward	9 weeks of Flo! Collect your reward.	Exceptional achievement {name}! 🎉 You've used Flo actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nThis is remarkable. You've fully embraced managing your health. Amazing!	women’s_health	\N	\N	t	\N	\N
2caf37d8-8d87-4ae8-a91f-188add535b6e	2025-11-03 20:58:44.234724	2025-11-03 20:58:44.234724	womens_health.tier1_app_retained.celebrate	You're a women's health champion now. Congratulations!	Incredible {name}! 🎉 You're now a long-term Flo user. Look at what you've achieved:\n✓ 9+ weeks of consistent cycle tracking\n✓ Complete control over your health planning\n✓ Deep understanding of your body\n✓ Confidence in making health decisions\nCongratulations!	women’s_health	\N	\N	t	\N	\N
1689e0b8-a04a-47e2-a863-e43d1f40d5aa	2025-11-03 20:58:44.445489	2025-11-03 20:58:44.445489	womens_health.tier1_app_retained.incentive	You're building real health confidence	{name}, you've proven you can track your health consistently for 9+ weeks. This discipline gives you control over your life that most women don't have. The longer you keep going, the better you understand your body and the more confidently you can plan. Your health future is in your hands!	women’s_health	\N	\N	t	\N	\N
947d3fc3-471f-4d0e-9c74-21d9167dacaa	2025-11-03 20:58:44.648503	2025-11-03 20:58:44.648503	womens_health.tier1_app_retention_dropoff.how	Let's solve your Flo issue	Hi {name}, you were such a consistent Flo user! We noticed you haven't been active lately. Let's fix any issues:\n• To log period: Open app → 'Log Period' → Select date → Confirm\n• To check predictions: Open 'Cycle' tab\n• To track symptoms: Click '+' and select symptoms\n• To get advice: Check 'Today' tab daily\n\nWatch the video below to learn how to make the most of Flo.\n<video>	women’s_health	\N	\N	t	\N	\N
95ead82b-377a-47f4-8351-729a4b5e432c	2025-11-03 20:58:45.320462	2025-11-03 20:58:45.320462	womens_health.tier1_app_retention_dropoff.incentive	Your health tracking is too valuable to lose	{name}, every week of tracking you've built adds to your understanding of your body. By stopping now, you lose the patterns and insights you worked to build. Use Flo this week and keep your control!	women’s_health	\N	\N	t	\N	\N
adbc7b1f-4877-414a-ae6a-493cc882c192	2025-11-03 20:58:45.54069	2025-11-03 20:58:45.54069	womens_health.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a health champion	{name}, we miss you! Your consistent use of Flo gave you control over your health and life planning. Make sure you don't let this slip away. Take 2 minutes today to log your cycle and get back on track!	women’s_health	\N	\N	t	\N	\N
dfdf08fc-57f1-46dc-9c95-765165083d65	2025-11-03 20:58:45.756471	2025-11-03 20:58:45.756471	womens_health.tier1_app_retention_dropoff.why	Why your health tracking matters	{name}, you spent many weeks building health habits. Here's what you lose by stopping:\n• Control lost: Back to surprise periods and poor planning\n• Patterns forgotten: All the insights you built disappear\n• Confidence reduced: Back to uncertainty about your body\nYou worked hard to understand your health. Make sure that you continue using this knowledge to plan your life confidently. Take two minutes today to use Flo and get back on track.	women’s_health	\N	\N	t	\N	\N
cd0295a8-4a66-4bbe-8dbc-fe2626976916	2025-11-03 21:01:01.379192	2025-11-03 21:01:01.379192	women_child_health.tier1_app_retained.celebrate	You're a health-conscious parent now. Congratulations!	Incredible {name}! 🎉 You're now a long-term Bebbo user. Look at what you've achieved: \n✓ 9+ weeks of consistent health guidance \n✓ Better knowledge of child development \n✓ Confidence in your parenting decisions \n✓ A healthier, happier child \nCongratulations!	women_child_health	\N	\N	t	\N	\N
e33559aa-d97f-4ae0-b34d-f596a642f89c	2025-11-03 21:01:01.591517	2025-11-03 21:01:01.591517	women_child_health.tier1_app_retained.incentive	You're building real parenting confidence	{name}, you've proven you're committed to your child's health for 9+ weeks. This consistency is making a real difference - your child is benefiting from everything you learn. The longer you keep going, the more confident and capable you become. Your family's healthy future is in your hands!	women_child_health	\N	\N	t	\N	\N
a1579b25-2fcd-4202-b03c-940fd3906de0	2025-11-03 21:01:01.802288	2025-11-03 21:01:01.802288	women_child_health.tier1_app_retention_dropoff.how	Let's solve your Bebbo issue	Hi {name}, you were such a consistent Bebbo user! We noticed you haven't been active lately. Let's get back to it: \n• Open the Bebbo app \n• Browse topics - pregnancy, feeding, development, play, safety \n• Read an article that interests you \n• Watch a video about child development \n• Try an activity with your child \n\nEverything you need is right there. Take 2 minutes today to reconnect with the guidance that was helping you!	women_child_health	\N	\N	t	["https://drive.google.com/file/d/1Ik6as0gK9Q4v8Rtc9eVaFOSSAb_Cgw2M/view?usp=drive_link"]	\N
1e65224e-b410-4abf-b92b-39ec4ce13c07	2025-11-03 21:01:02.027299	2025-11-03 21:01:02.027299	women_child_health.tier1_app_retention_dropoff.incentive	Your parenting journey is too valuable to stop	{name}, every week you used Bebbo added to your knowledge and confidence as a parent. By stopping now, you lose access to guidance that helps your child thrive. Use Bebbo this week and keep building the healthy future you started!	women_child_health	\N	\N	t	\N	\N
dcd0e395-fcdf-48fc-adfe-0feaefe4a4c5	2025-11-03 21:01:02.2363	2025-11-03 21:01:02.2363	women_child_health.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a Bebbo champion	{name}, we miss you! Your consistent use of Bebbo was giving you confidence and knowledge to raise a healthy child. Don't let this slip away. Take 2 minutes today to use Bebbo again and get back on track!	women_child_health	\N	\N	t	\N	\N
fdf1ca10-ff89-4425-a93b-c686db07b5a3	2025-11-03 21:01:02.475285	2025-11-03 21:01:02.475285	women_child_health.tier1_app_retention_dropoff.why	Why your Bebbo commitment matters	{name}, you spent many weeks learning and growing as a parent. Here's what you lose by stopping: \n• Knowledge: Missing out on age-appropriate guidance as your child grows \n• Confidence: Going back to uncertainty about health decisions \n• Support: Losing your trusted health companion \n• Your child's development: Missing activities that help them learn and thrive \n\nYou worked hard to become a committed parent. Keep using this knowledge to help your family. Take two minutes today to use Bebbo and get back on track.	women_child_health	\N	\N	t	\N	\N
d00e47dd-2073-4492-b66b-d3ca0021e305	2025-11-03 21:01:02.6994	2025-11-03 21:01:02.6994	women_child_health.tier2_app_opened_first_time.celebrate	Welcome to Bebbo!	Great start {name}! 🎉 You've opened your Bebbo app for the first time. Health is your second most important goal. This is the beginning of something wonderful - expert guidance for you and your child. With Bebbo, you can: \n✓ Get trusted advice on pregnancy and child development \n✓ Track your child's growth milestones \n✓ Learn activities to help your child thrive \n✓ Find answers to your health questions \n\nTake the next step: Register your account!	women_child_health	\N	\N	t	\N	\N
8e5aa3aa-5f70-48b8-959c-021893790205	2025-11-03 21:01:02.908066	2025-11-03 21:01:02.908066	women_child_health.tier2_app_adopted.celebrate	You're caring for your family's health!	Well done {name}! 🎉 You're now using Bebbo. You're taking positive steps for your child's health and development!	women_child_health	\N	\N	t	\N	\N
4e85ea56-fc93-4e3e-9b71-5de4916eb5f8	2025-11-03 21:01:03.139192	2025-11-03 21:01:03.139192	women_child_health.tier2_app_registered.celebrate	Your health companion is ready!	{name} congratulations on registering for Bebbo! 🎉 This is a major step forward! With your Bebbo account you can: \n✓ Track your child's development \n✓ Get age-appropriate activities \n✓ Learn about nutrition and health \nAll from your phone!	women_child_health	\N	\N	t	\N	\N
d70ab515-b777-41a3-a5ea-6670e7e05151	2025-11-03 21:01:03.340257	2025-11-03 21:01:03.340257	women_child_health.tier2_app_low_activity.how	Quick tips for using Bebbo	Hi {name}, we noticed you haven't used your Bebbo app much. Ready to try it? Here's a quick start: \n1. Open the Bebbo app \n2. Browse topics that interest you \n3. Read articles and watch videos \n4. Try activities with your child \nStart exploring today!	women_child_health	\N	\N	t	["https://drive.google.com/file/d/1Ik6as0gK9Q4v8Rtc9eVaFOSSAb_Cgw2M/view?usp=drive_link"]	\N
dac9d23c-fdb3-41e9-82d6-8ff506a21475	2025-11-03 21:01:03.549889	2025-11-03 21:01:03.549889	women_child_health.tier2_app_low_activity.incentive	Try Bebbo and earn a reward	{name}, start using your Bebbo app and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll have expert health guidance for your family.	women_child_health	\N	\N	t	\N	\N
7b17526c-6072-4904-a36d-95b75a24a80c	2025-11-03 21:01:03.782255	2025-11-03 21:01:03.782255	women_child_health.tier2_app_low_activity.support	Need help with Bebbo?	Hi {name}, need help using Bebbo? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	women_child_health	\N	\N	t	\N	\N
d60eac18-ac57-42ab-9314-7bfeb155d13c	2025-11-03 21:01:03.994403	2025-11-03 21:01:03.994403	women_child_health.tier2_app_low_activity.why	Bebbo helps you raise healthy children	{name}, Bebbo offers real benefits: \n• Get trusted health advice anytime \n• Learn about your child's development \n• Find activities that help your child grow \n• Feel more confident as a parent \nGive it a try - many parents already use it!	women_child_health	\N	\N	t	\N	\N
8a6f05c5-d4ba-48fa-b103-d1780036b5b0	2025-11-03 21:01:04.226272	2025-11-03 21:01:04.226272	women_child_health.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used Bebbo for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	women_child_health	\N	\N	t	\N	\N
015ae917-dbf4-4a54-b78c-7b11e7dba869	2025-11-03 21:01:04.466267	2025-11-03 21:01:04.466267	women_child_health.tier2_app_engaged.celebrate	You're using Bebbo!	Great job {name}! 🎉 As an active Bebbo user, you're learning how to help your child grow healthy and strong. You're building good parenting habits!	women_child_health	\N	\N	t	\N	\N
993dde21-44e6-451a-8eb9-9f48e69bbeea	2025-11-03 21:01:04.718112	2025-11-03 21:01:04.718112	women_child_health.tier2_app_engaged.incentive	Keep going with Bebbo	{name}, you're doing well! Keep using Bebbo and earn 10 GHC in a few weeks. Every time you learn something new, your child benefits!	women_child_health	\N	\N	t	\N	\N
f701e451-f5aa-4e97-ad6d-f8d00173fa84	2025-11-03 20:58:45.970502	2025-11-03 20:58:45.970502	womens_health.tier2_app_opened_first_time.celebrate	Welcome to women's health!	Great start {name}! 🎉 You've opened Flo for the first time. Health is your second most important goal. This is the beginning of something powerful - a private space to understand your body and health. With Flo, you can:\n✓ Track your cycle privately\n✓ Get personalized health advice for women\n✓ Plan your family confidently\n✓ Understand your body better\n\nTake the next step: Register your account!	women’s_health	\N	\N	t	\N	\N
ec6b24e6-ecb2-4923-82dc-5dabe64e11c4	2025-11-03 20:58:46.189422	2025-11-03 20:58:46.189422	womens_health.tier2_app_adopted.celebrate	You're taking control of your health!	Well done {name}! 🎉 You're now using Flo. You've taken control of your women's health!	women’s_health	\N	\N	t	\N	\N
5a294da3-725c-435c-9b04-cf45fcaf5013	2025-11-03 20:58:46.401491	2025-11-03 20:58:46.401491	womens_health.tier2_app_registered.celebrate	Your personal health companion is ready!	{name} congratulations on registering for Flo! 🎉 This is a major step forward! With your Flo account you can:\n✓ Track your cycle\n✓ Get health advice\n✓ Plan confidently\n✓ Understand your body\nAll private on your phone!	women’s_health	\N	\N	t	\N	\N
d88178db-2f72-4413-82be-2d03b86e56cb	2025-11-03 20:58:46.619453	2025-11-03 20:58:46.619453	womens_health.tier2_app_low_activity.how	Quick tips for Flo	Hi {name}, we noticed you haven't used Flo much. Ready to try it? Here's a quick start:\n1. Open Flo and log your period\n2. Check your cycle predictions\n3. Read daily health tips\nStart small until you're comfortable!	women’s_health	\N	\N	t	\N	\N
4177a368-7fa4-48f3-844a-d7217b30cf6f	2025-11-03 20:58:46.837487	2025-11-03 20:58:46.837487	womens_health.tier2_app_low_activity.incentive	Try Flo	{name}, start using Flo and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll have more control over planning your life.	women’s_health	\N	\N	t	\N	\N
ba1b33f0-75f1-45f1-83b0-04359236b841	2025-11-03 20:58:47.042539	2025-11-03 20:58:47.042539	womens_health.tier2_app_low_activity.support	Need help with Flo?	Hi {name}, need help using Flo? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	women’s_health	\N	\N	t	\N	\N
13668db0-ada0-4894-b6ac-e339e61a5851	2025-11-03 20:58:47.251875	2025-11-03 20:58:47.251875	womens_health.tier2_app_low_activity.why	Flo makes life easier	{name}, Flo offers real benefits:\n• Know when your period will come\n• Plan your life confidently\n• Understand your body better\n• Private health advice\nGive it a try - many women already use it!	women’s_health	\N	\N	t	\N	\N
21d95c48-71e2-477d-9243-622825b23542	2025-11-03 20:58:47.458571	2025-11-03 20:58:47.458571	womens_health.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used Flo for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	women’s_health	\N	\N	t	\N	\N
8a63c079-dfa3-4cf8-9bfb-cea02457c74b	2025-11-03 20:58:47.66945	2025-11-03 20:58:47.66945	womens_health.tier2_app_engaged.celebrate	You're using Flo!	Great job {name}! 🎉 As an active Flo user, you're tracking your health and planning better. You're building good health habits!	women’s_health	\N	\N	t	\N	\N
19c2fe68-660d-426f-948a-8acadc412f79	2025-11-03 20:58:47.882528	2025-11-03 20:58:47.882528	womens_health.tier2_app_engaged.incentive	Keep going with Flo	{name}, you're doing well! Keep using Flo and earn 10 GHC in a few weeks. Every time you track helps you plan better!	women’s_health	\N	\N	t	\N	\N
748135d2-e85d-42fd-96a2-b12cc17c41ec	2025-11-03 20:58:48.094445	2025-11-03 20:58:48.094445	womens_health.tier2_app_engagement_dropoff.how	Quick Flo reminder	Hi {name}, we noticed that you stopped using Flo lately. Quick reminders:\n• To log period: Open Flo → 'Log Period' → Select date\n• To check predictions: Open 'Cycle' tab\n• To get tips: Check 'Today' tab\n\nWatch the video for a refresher: <video>	women’s_health	\N	\N	t	\N	\N
506ce297-4e9c-49dc-808f-db8c55ad5481	2025-11-03 20:58:48.293559	2025-11-03 20:58:48.293559	womens_health.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Flo and earn 10 GHC in a few weeks. It helps you plan your life and understand your body better.	women’s_health	\N	\N	t	\N	\N
c188b491-8ce4-4329-b239-dfb7d2dfcbe2	2025-11-03 20:58:48.502456	2025-11-03 20:58:48.502456	womens_health.tier2_app_engagement_dropoff.reactivation	Try Flo again?	{name}, you started building good health habits with Flo. Take 2 minutes today to use it again!	women’s_health	\N	\N	t	\N	\N
e2435c08-62a2-4e52-add3-027311151a4b	2025-11-03 20:58:48.754775	2025-11-03 20:58:48.754775	womens_health.tier2_app_engagement_dropoff.why	Flo helps you plan confidently	{name}, Flo helps with:\n• Knowing when your period will come\n• Planning events confidently\n• Understanding your body\nYou already know how to use it - try it again!	women’s_health	\N	\N	t	\N	\N
24286256-f949-447e-9842-d0de8ad3582f	2025-11-03 20:58:48.959478	2025-11-03 20:58:48.959478	womens_health.tier2_app_engagement_sustained.celebrate	6 weeks of Flo!	Well done {name}! 🎉 You've used Flo consistently for 6 weeks. You're managing your health well and understanding your body better!	women’s_health	\N	\N	t	\N	\N
ac0b4137-21af-48ea-ac3c-d2d48814ce54	2025-11-03 20:58:49.196319	2025-11-03 20:58:49.196319	womens_health.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency with Flo!	Excellent {name}! 🎉 You've used Flo for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	women’s_health	\N	\N	t	\N	\N
f82d2e30-0064-4107-b032-e126632ab73e	2025-11-03 20:58:49.418368	2025-11-03 20:58:49.418368	womens_health.tier2_app_retained.celebrate	You're a Flo user!	Impressive {name}! 🎉 You've been using Flo consistently. You're managing your health well and understanding your body. Well done!	women’s_health	\N	\N	t	\N	\N
f9515296-bb12-4aa9-9fcd-710bbc84eb1b	2025-11-03 20:58:49.621355	2025-11-03 20:58:49.621355	womens_health.tier2_app_retained.incentive	Keep your Flo habit going	{name}, your consistent Flo tracking is helping you understand your body and plan your life. Keep it up!	women’s_health	\N	\N	t	\N	\N
29ca92ac-2139-4302-a2dd-65675d86d391	2025-11-03 20:58:49.862328	2025-11-03 20:58:49.862328	womens_health.tier2_app_retention_dropoff.how	Quick Flo reminder	Hi {name}, we noticed that you stopped using Flo lately. Quick reminders:\n• To log period: Open Flo → 'Log Period' → Select date\n• To check predictions: Open 'Cycle' tab\n• To get tips: Check 'Today' tab\n\nWatch the video for a refresher: <video>	women’s_health	\N	\N	t	\N	\N
80d68216-37f4-4cb3-84db-a0cc95eec83d	2025-11-03 20:58:51.022663	2025-11-03 20:58:51.022663	womens_health.tier2_app_retention_dropoff.incentive	Your Flo tracking is waiting	{name}, you built great tracking habits. Come back and keep understanding your body.	women’s_health	\N	\N	t	\N	\N
8860b17b-032e-4aa4-8fda-a8cf73a3bf3a	2025-11-03 20:58:51.230479	2025-11-03 20:58:51.230479	womens_health.tier2_app_retention_dropoff.reactivation	Come back to Flo	{name}, you were doing great with Flo! Use it again today and keep your health habits strong.	women’s_health	\N	\N	t	\N	\N
e7549e94-ef33-4e79-938d-795a13a2e529	2025-11-03 20:58:51.891673	2025-11-03 20:58:51.891673	womens_health.tier2_app_retention_dropoff.why	Keep your health progress	{name}, you built weeks of good health habits. Keep going to maintain:\n• Your cycle knowledge\n• Your planning ability\n• Your body understanding\nUse it today to stay on track!	women’s_health	\N	\N	t	\N	\N
02309fb1-9db6-4bb3-aeec-02b66df7740f	2025-11-03 20:58:52.098621	2025-11-03 20:58:52.098621	adult_education.tier1_app_opened_first_time.celebrate	Welcome to adult education!	Great start {name}! 🎉 You've opened your Duolingo learning app for the first time. Education is your most important goal. This is the beginning of something powerful - learning new skills at your own pace. With Duolingo, you can: \n✓ Learn languages step by step \n✓ Improve reading and speaking \n✓ Practice anytime from your phone \n✓ Build confidence and open new opportunities \n\nTake the next step: Register your account!	adult_education	\N	\N	t	\N	\N
cceff860-f830-46bf-a178-1bc586bc1254	2025-11-03 20:58:52.309487	2025-11-03 20:58:52.309487	adult_education.tier1_app_adopted.celebrate	You're taking control of your learning!	Well done {name}! 🎉 You're now using adult education. You've taken an important step toward personal growth! By learning new skills, you're: \n✓ Building confidence \n✓ Opening new opportunities \n✓ Improving communication \nKeep going!	adult_education	\N	\N	t	\N	\N
3af55b8e-2e9b-4507-baa0-0fcfdf31a52e	2025-11-03 20:58:53.000609	2025-11-03 20:58:53.000609	adult_education.tier1_app_registered.celebrate	Your learning account is ready!	{name} congratulations on registering for Duolingo! 🎉 This is a major step forward! With your learning account you can: \n✓ Learn at your own pace \n✓ Practice daily in short lessons \n✓ Track your progress \n✓ Build valuable skills \nAll from your phone!	adult_education	\N	\N	t	\N	\N
7fff7865-6dab-4a8f-bba0-a6958ef1091d	2025-11-03 20:58:53.227753	2025-11-03 20:58:53.227753	adult_education.tier1_app_low_activity.how	Get the most from your learning app	Hi {name}, we noticed you haven't used your Duolingo account much. It's easy to get started! Here's how: \n1. Open your Duolingo app \n2. Start with a simple beginner lesson \n3. Practice for just 5-10 minutes \n4. Return daily to build your streak \nStart small until you feel comfortable. Once you see yourself improving, you'll feel proud and motivated to continue!	adult_education	\N	\N	t	\N	\N
3a6e4cc9-a46a-433d-8c64-c949ee055dcd	2025-11-03 20:58:53.439503	2025-11-03 20:58:53.439503	adult_education.tier1_app_low_activity.incentive	Your reward is waiting - start learning today!	{name}, start using your Duolingo account actively and earn a reward of 10 GHC in just three weeks! Every lesson you complete builds your skills and confidence. The sooner you start, the sooner you'll see yourself grow. Try your first lesson today!	adult_education	\N	\N	t	\N	\N
fa8ee38f-57f2-43ae-9287-60c1acb14f8f	2025-11-03 20:58:53.661497	2025-11-03 20:58:53.661497	adult_education.tier1_app_low_activity.support	Need help with learning?	Hi {name}, need help using your Duolingo account? We're here for you! Common questions: \n• How to start learning? Open app → Select your course → Start first lesson → Follow instructions \n• Lessons too hard? Try easier level or review basics \n• Need audio help? Tap speaker icon to hear pronunciation \n• Track progress: View your streak and points on home screen \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	adult_education	\N	\N	t	\N	\N
663e30de-a395-4f6a-a6d5-3604c1bc3a47	2025-11-03 20:58:53.869538	2025-11-03 20:58:53.869538	adult_education.tier1_app_low_activity.why	Why learning matters for your future	{name}, we know learning as an adult can feel challenging. But not learning has real costs: \n• Missed opportunities for better jobs or income \n• Difficulty understanding messages or forms \n• Less confidence in daily situations \n• Can't help children with schoolwork \nLearning solves these problems. Even small improvements make a big difference. You can read better, communicate more, and feel more confident. Others in your community who started learning report feeling proud and capable. Take the first step today - you'll be glad you did!	adult_education	\N	\N	t	\N	\N
211715e0-b101-4b71-9f40-bdeb7b1d28d9	2025-11-03 20:58:54.179505	2025-11-03 20:58:54.179505	adult_education.first_tier1_app_engaged.reward	3 weeks of dedicated learning! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively learning for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - knowledge and confidence. Congratulations!	adult_education	\N	\N	t	\N	\N
bb311d6f-9ac5-4959-9918-702f9b92236a	2025-11-03 20:58:54.380848	2025-11-03 20:58:54.380848	adult_education.tier1_app_engaged.celebrate	You're mastering learning!	Excellent work {name}! 🎉 As an active learner you're: \n✓ Building valuable skills \n✓ Gaining confidence \n✓ Opening new opportunities \n✓ Proving you can achieve your goals \nYou're not just learning - you're changing your future. Keep it up!	adult_education	\N	\N	t	\N	\N
0fdb763c-6196-4756-a9c1-9231499df93f	2025-11-03 20:58:54.589495	2025-11-03 20:58:54.589495	adult_education.tier1_app_engaged.incentive	Keep going - bigger opportunities ahead!	{name}, you're doing great with learning! Keep using it actively and earn 10 GHC in a few weeks. The more you learn, the more confident you become. The more confident you become, the more opportunities open up. Keep it up!	adult_education	\N	\N	t	\N	\N
7d94e3ec-8768-4705-8aff-d14a87dc06ff	2025-11-03 20:58:54.819543	2025-11-03 20:58:54.819543	adult_education.tier1_app_engagement_dropoff.how	Come back to learning - we can help!	Hi {name}, we noticed you stopped learning recently. Let's get you back on track! Quick reminders: \n• To practice: Open Duolingo → Select lesson → Complete activities → Review if needed \n• Short sessions work: Even 5 minutes daily builds skills \n• Stuck on something? Try reviewing earlier lessons first \n\nWatch the video to learn how to make the most of learning.	adult_education	\N	\N	t	["https://drive.google.com/file/d/1-a1HKJHWYWxnvlTBT3DYkRJs6JJTwEcC/view?usp=drive_link"]	\N
2c4d49b5-75d0-4455-9a0d-74661c548eb6	2025-11-03 20:58:55.04163	2025-11-03 20:58:55.04163	adult_education.tier1_app_engagement_dropoff.incentive	Don't lose your learning momentum!	{name}, you were building such valuable skills! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the pride of learning something new and growing your abilities.	adult_education	\N	\N	t	\N	\N
d75eefee-ab47-472c-88ae-bd4fa6acf0c9	2025-11-03 20:58:55.269416	2025-11-03 20:58:55.269416	adult_education.tier1_app_engagement_dropoff.reactivation	Your learning journey is waiting!	{name}, we miss you! You were building something important: confidence and skills. Take 2 minutes today to do one lesson and get back on track!	adult_education	\N	\N	t	\N	\N
d9351bb6-cfb3-4554-862d-2926aa9ef259	2025-11-03 20:58:55.482678	2025-11-03 20:58:55.482678	adult_education.tier1_app_engagement_dropoff.why	Remember why you started learning	{name}, going back to not learning means going back to old limits: \n• Missed opportunities: Jobs or income chances pass by - learning opens doors \n• Less confidence: Feeling uncertain in situations - learning builds confidence \n• No growth: Staying the same instead of improving - learning creates progress \nYou already started learning. Don't give up the skills and confidence you worked for. Your future self will thank you!	adult_education	\N	\N	t	\N	\N
896b93ba-75eb-49bf-9070-4458794ffef6	2025-11-03 20:58:55.699521	2025-11-03 20:58:55.699521	adult_education.tier1_app_engagement_sustained.celebrate	You're a consistent learner!	Fantastic {name}! 🎉 You've maintained active learning for 6 weeks. This isn't luck - this is YOU investing in yourself! You've proven that: \n✓ You can learn new things \n✓ You have the discipline to keep improving \n✓ You're ready for bigger opportunities \n✓ You're building your future \nYou're thriving and you're an example to others. Congratulations!	adult_education	\N	\N	t	\N	\N
56f39f0b-83da-4b42-b1fb-19aca8c3f5a5	2025-11-03 20:58:55.921589	2025-11-03 20:58:55.921589	adult_education.first_tier1_app_retained.reward	9 weeks of committed learning! Collect your reward.	Exceptional achievement {name}! 🎉 You've learned actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced continuous learning. Amazing!	adult_education	\N	\N	t	\N	\N
142bda5b-61e5-4f7e-b9f7-1d3980b4ad5d	2025-11-03 20:58:56.141717	2025-11-03 20:58:56.141717	adult_education.tier1_app_retained.celebrate	You're a learning champion now. Congratulations!	Incredible {name}! 🎉 You're now a long-term learner. Look at what you've achieved: \n✓ 9+ weeks of consistent learning \n✓ Significant skill improvement \n✓ The confidence that opens new doors \n✓ Proof you can achieve your goals \nCongratulations!	adult_education	\N	\N	t	\N	\N
d0c74a5b-e7cc-49e7-a3bb-464c89838145	2025-11-03 20:58:56.364404	2025-11-03 20:58:56.364404	adult_education.tier1_app_retained.incentive	You're building real learning power	{name}, you've proven you can learn consistently for 9+ weeks. This dedication is opening doors: you communicate better, you understand more, and you're ready for opportunities that once seemed impossible. The longer you keep going, the more you can achieve. Your future is in your hands!	adult_education	\N	\N	t	\N	\N
4130eff4-c3bf-41cf-b586-cc1082dcf985	2025-11-03 20:58:56.579522	2025-11-03 20:58:56.579522	adult_education.tier1_app_retention_dropoff.how	Let's solve your learning issue	Hi {name}, you were such a consistent learner! We noticed you haven't been active lately. Let's fix any issues: \n• To practice: Open Duolingo → Select lesson → Complete activities \n• Lessons too hard? Review basics or adjust level \n• Lost motivation? Try shorter sessions or different topics \n• Track progress: Check your achievements to see how far you've come \n\nWatch the video to learn how to make the most of learning.	adult_education	\N	\N	t	["https://drive.google.com/file/d/1-a1HKJHWYWxnvlTBT3DYkRJs6JJTwEcC/view?usp=drive_link"]	\N
8292e351-aa1b-45a1-8016-3ced69734b9b	2025-11-03 20:58:56.779553	2025-11-03 20:58:56.779553	adult_education.tier1_app_retention_dropoff.incentive	Your learning progress is too valuable to lose	{name}, every week of learning you've built adds to your skills. By stopping now, you lose the progress and confidence you've worked for. Do one lesson this week and keep your learning strong!	adult_education	\N	\N	t	\N	\N
039c8458-9161-43e2-a0c1-d73daf9e4d16	2025-11-03 20:58:56.989683	2025-11-03 20:58:56.989683	adult_education.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a learning champion	{name}, we miss you! Your consistent learning built valuable skills and confidence. Make sure you don't let this slip away. Take 2 minutes today to do one lesson and get back on track!	adult_education	\N	\N	t	\N	\N
902e47fe-e43c-4800-a687-cb358ec08a3a	2025-11-03 20:58:57.219584	2025-11-03 20:58:57.219584	adult_education.tier1_app_retention_dropoff.why	Why your learning matters	{name}, you spent many weeks building skills. Here's what you lose by stopping: \n• Progress: Back to old limits instead of growing abilities \n• Confidence: Losing the pride of achievement \n• Opportunities: Missing chances that require better skills \nYou worked hard to become a learner. Make sure that you continue building your skills and opportunities. Take two minutes today to learn and get back on track.	adult_education	\N	\N	t	\N	\N
3f89d9b8-d711-41c4-9358-c538d1b036a5	2025-11-03 20:58:57.439086	2025-11-03 20:58:57.439086	adult_education.tier2_app_opened_first_time.celebrate	Welcome to adult education!	Great start {name}! 🎉 You've opened your Duolingo learning app for the first time. Education is your second most important goal. This is the beginning of learning at your own pace. With Duolingo, you can: \n✓ Learn languages step by step \n✓ Improve reading and speaking \n✓ Practice anytime \n✓ Build confidence \n\nTake the next step: Register your account!	adult_education	\N	\N	t	\N	\N
e1610e0d-1965-4b75-a7ee-7a0d78f32d21	2025-11-03 20:58:57.640678	2025-11-03 20:58:57.640678	adult_education.tier2_app_adopted.celebrate	You're taking control of your learning!	Well done {name}! 🎉 You're now learning. You've started building new skills!	adult_education	\N	\N	t	\N	\N
081075be-66e8-427c-988e-b985e832d981	2025-11-03 20:58:57.849517	2025-11-03 20:58:57.849517	adult_education.tier2_app_registered.celebrate	Your learning account is ready!	{name} congratulations on registering for Duolingo! 🎉 This is a major step forward! With your account you can: \n✓ Learn at your pace \n✓ Practice daily \n✓ Track progress \n✓ Build skills \nAll from your phone!	adult_education	\N	\N	t	\N	\N
63d38832-69da-4c96-98b9-2bcfa603ffba	2025-11-03 20:58:58.051459	2025-11-03 20:58:58.051459	adult_education.tier2_app_low_activity.how	Quick tips for learning	Hi {name}, we noticed you haven't used your Duolingo account much. Ready to start learning? Here's a quick start: \n1. Open your app \n2. Start a beginner lesson \n3. Practice for 5-10 minutes \n4. Try daily for best results \nStart small until you're comfortable!	adult_education	\N	\N	t	\N	\N
62828706-5b69-46cd-b730-4338a846d11c	2025-11-03 20:58:58.259473	2025-11-03 20:58:58.259473	adult_education.tier2_app_low_activity.incentive	Try learning	{name}, start using your Duolingo account and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll build confidence.	adult_education	\N	\N	t	\N	\N
d03e24fd-352b-4043-a024-7ab96a266b0a	2025-11-03 20:58:58.487373	2025-11-03 20:58:58.487373	adult_education.tier2_app_low_activity.support	Need help with learning?	Hi {name}, need help using your Duolingo account? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	adult_education	\N	\N	t	\N	\N
facff6be-5191-477c-b4d2-7690faef5f83	2025-11-03 20:58:58.69957	2025-11-03 20:58:58.69957	adult_education.tier2_app_low_activity.why	Learning builds confidence	{name}, learning offers real benefits: \n• Better communication \n• More confidence \n• New opportunities \nGive it a try - many in your community are learning!	adult_education	\N	\N	t	\N	\N
5d67c93d-4641-42cf-b45a-fed738eab8eb	2025-11-03 20:58:58.909502	2025-11-03 20:58:58.909502	adult_education.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've been learning for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	adult_education	\N	\N	t	\N	\N
5c0027e8-0f17-43a3-9002-dee34a3c86aa	2025-11-03 20:58:59.145665	2025-11-03 20:58:59.145665	adult_education.tier2_app_engaged.celebrate	You're learning!	Great job {name}! 🎉 As an active learner, you're building skills and confidence. You're investing in yourself!	adult_education	\N	\N	t	\N	\N
8aafcc3e-9bb9-4699-a16a-5b44fb816107	2025-11-03 20:58:59.369441	2025-11-03 20:58:59.369441	adult_education.tier2_app_engaged.incentive	Keep going with learning	{name}, you're doing well! Keep learning and earn 10 GHC in a few weeks. Every lesson counts!	adult_education	\N	\N	t	\N	\N
e38f4369-10fc-4236-93ac-cea6b9d9c310	2025-11-03 20:58:59.586546	2025-11-03 20:58:59.586546	adult_education.tier2_app_engagement_dropoff.how	Quick learning reminder	Hi {name}, we noticed you stopped learning lately. Quick reminder: \n• To practice: Open Duolingo → Select lesson → Complete activities \n• Short sessions work well \n• Even 5 minutes daily helps \n\nWatch the video for a refresher.	adult_education	\N	\N	t	["https://drive.google.com/file/d/1-a1HKJHWYWxnvlTBT3DYkRJs6JJTwEcC/view?usp=drive_link"]	\N
28e7aadd-c053-4f08-9e78-5772bd3f2611	2025-11-03 20:58:59.808289	2025-11-03 20:58:59.808289	adult_education.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to learning and earn 10 GHC in a few weeks. It builds your skills and confidence.	adult_education	\N	\N	t	\N	\N
2096cbd2-996e-4e20-8e85-4c93fd1647a4	2025-11-03 20:59:00.020646	2025-11-03 20:59:00.020646	adult_education.tier2_app_engagement_dropoff.reactivation	Try learning again?	{name}, you started building good learning habits. Take 2 minutes today to do one lesson!	adult_education	\N	\N	t	\N	\N
2248d25d-96e7-4c68-b929-58a56318c5f3	2025-11-03 20:59:00.240584	2025-11-03 20:59:00.240584	adult_education.tier2_app_engagement_dropoff.why	Learning opens doors	{name}, learning offers important benefits: \n• Better skills \n• More confidence \n• New opportunities \nYou already started - try it again!	adult_education	\N	\N	t	\N	\N
4c8d4c1e-6b6a-400f-b3a0-7f397b09680d	2025-11-03 20:59:00.453491	2025-11-03 20:59:00.453491	adult_education.tier2_app_engagement_sustained.celebrate	6 weeks of learning!	Well done {name}! 🎉 You've learned consistently for 6 weeks. You're building valuable skills!	adult_education	\N	\N	t	\N	\N
4149b868-a7d6-45a6-b57c-d3a56a30431f	2025-11-03 20:59:00.696517	2025-11-03 20:59:00.696517	adult_education.first_tier2_app_retained.reward	You've earned 10 GHC for consistency!	Excellent {name}! 🎉 You've learned for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	adult_education	\N	\N	t	\N	\N
37d8e485-9318-4a7f-ab29-5d3d0a4b934f	2025-11-03 20:59:00.899449	2025-11-03 20:59:00.899449	adult_education.tier2_app_retained.celebrate	You're a committed learner!	Impressive {name}! 🎉 You've been learning consistently. You're building strong skills and growing your abilities. Well done!	adult_education	\N	\N	t	\N	\N
0e773098-a362-4b5a-890e-a095dd692580	2025-11-03 20:59:01.125321	2025-11-03 20:59:01.125321	adult_education.tier2_app_retained.incentive	Keep your learning habit going	{name}, your consistent learning is building valuable skills. You're more confident now. Keep it up!	adult_education	\N	\N	t	\N	\N
72bd6925-87b6-4929-9430-4934fb3aa2a6	2025-11-03 20:59:01.349514	2025-11-03 20:59:01.349514	adult_education.tier2_app_retention_dropoff.how	Quick learning reminder	Hi {name}, we noticed you stopped learning lately. Quick reminder: \n• To practice: Open Duolingo → Select lesson → Complete activities \n• Short sessions work \n• Every lesson helps \n\nWatch the video for a refresher.	adult_education	\N	\N	t	["https://drive.google.com/file/d/1-a1HKJHWYWxnvlTBT3DYkRJs6JJTwEcC/view?usp=drive_link"]	\N
764f0104-0539-41eb-831e-7488976efc95	2025-11-03 20:59:01.583458	2025-11-03 20:59:01.583458	adult_education.tier2_app_retention_dropoff.incentive	Your learning is waiting	{name}, you built great learning habits. Come back and keep building your skills.	adult_education	\N	\N	t	\N	\N
daa2be76-0196-4e7e-8061-fe66b41b1286	2025-11-03 20:59:01.781406	2025-11-03 20:59:01.781406	adult_education.tier2_app_retention_dropoff.reactivation	Come back to learning	{name}, you were doing great learning! Do one lesson today and keep your learning habits strong.	adult_education	\N	\N	t	\N	\N
f2483d3b-6092-4cb2-8f62-1bf0bd9dd0d8	2025-11-03 20:59:02.006497	2025-11-03 20:59:02.006497	adult_education.tier2_app_retention_dropoff.why	Keep your learning progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your growing skills \n• Your confidence \n• Your opportunities \nDo one lesson today to stay on track!	adult_education	\N	\N	t	\N	\N
e8df1ed3-bdd4-4ab2-9167-a1c5770a63b2	2025-11-03 20:59:02.245452	2025-11-03 20:59:02.245452	basic_education.tier1_app_opened_first_time.celebrate	Welcome to SyllabusGH!	Great start {name}! 🎉 You've opened SyllabusGH for the first time. Education is your most important goal. This is the beginning of something powerful - a way to help your children succeed in school. With SyllabusGH, you can: \n✓ Access complete school curriculum \n✓ Get past exam questions for practice \n✓ Help your children prepare for BECE and WASSCE \n✓ Support their studies anytime, anywhere \n\nTake the next step: Create your account!	basic_education	\N	\N	t	\N	\N
883d7879-087a-4713-99e8-aa113d4f4fad	2025-11-03 20:59:02.460436	2025-11-03 20:59:02.460436	basic_education.tier1_app_adopted.celebrate	You're supporting your children's education!	Well done {name}! 🎉 You're now using SyllabusGH. You've taken an important step in your children's education! By having the school curriculum on your phone, you're: \n✓ Becoming your child's best study partner \n✓ Helping them prepare for exams \n✓ Supporting their learning at home \nKeep going!	basic_education	\N	\N	t	\N	\N
eb28384b-84c0-4ee2-90a7-3836ee570231	2025-11-03 20:59:02.672583	2025-11-03 20:59:02.672583	basic_education.tier1_app_registered.celebrate	Your learning account is ready!	{name} congratulations on registering for SyllabusGH! 🎉 This is a major step forward! With your account you can: \n✓ Access complete curriculum \n✓ Find past exam questions \n✓ Track study progress \n✓ Help your children excel in school \nAll from your phone!	basic_education	\N	\N	t	\N	\N
98fb5b5e-c34c-47ec-ae99-a0e9e584d7ff	2025-11-03 20:59:02.900587	2025-11-03 20:59:02.900587	basic_education.tier1_app_low_activity.how	Get the most from SyllabusGH	Hi {name}, we noticed you haven't used SyllabusGH much. Here's how to find study material for your children: \n1. Open the SyllabusGH app\n2. Click on a subject like English Language\n3. You will see various options\n4. Click on sample questions to open them\n5. Explore different topics - this uses small amounts of data\n\nYou can also find questions from different years and levels!	basic_education	\N	\N	t	\N	\N
70616108-7b6f-48b9-bd6a-3fce0d28d5e3	2025-11-03 20:59:03.113346	2025-11-03 20:59:03.113346	basic_education.tier1_app_low_activity.incentive	Your reward is waiting - start using SyllabusGH!	{name}, start using SyllabusGH and earn a reward of 10 GHC in just three weeks! Every time you use it to help your children, you're investing in their future success. The sooner you start, the sooner you'll see their grades improve. Try it today!	basic_education	\N	\N	t	\N	\N
aad44518-9a3c-47d1-9993-fcdea9b6d1a5	2025-11-03 20:59:03.314599	2025-11-03 20:59:03.314599	basic_education.tier1_app_low_activity.support	Need help with SyllabusGH?	Hi {name}, need help using SyllabusGH? We're here for you! Common questions: \n• How to find curriculum? Open the app and browse by subject - you'll find study material for many topics. \n• How to access past questions? Select a subject, then choose sample questions to see exam papers from previous years. \n• Can't find what you need? Try searching or exploring different subject areas.\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	basic_education	\N	\N	t	\N	\N
68b2e06a-49bf-4955-be5d-fb66009a91de	2025-11-03 20:59:03.528355	2025-11-03 20:59:03.528355	basic_education.tier1_app_low_activity.why	Why SyllabusGH matters for your children's future	{name}, we know you want your children to succeed in school. But without the right study materials, it's hard to help them: \n• No access to past exam questions for practice \n• Can't review curriculum topics at home \n• Children struggle without extra support \n• No way to prepare properly for BECE and WASSCE \n\nSyllabusGH solves these problems. You have the complete curriculum and past questions on your phone, ready to help your children anytime. Take the first step today - their future depends on it!	basic_education	\N	\N	t	\N	\N
b8f38bed-2047-4f54-84ec-f5e749b917d6	2025-11-03 20:59:03.740174	2025-11-03 20:59:03.740174	basic_education.first_tier1_app_engaged.reward	3 weeks of supporting education! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using SyllabusGH for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - your children's future through education. Congratulations!	basic_education	\N	\N	t	\N	\N
8b318324-3dd7-4b0d-ac76-01850f6ae9e7	2025-11-03 20:59:03.952645	2025-11-03 20:59:03.952645	basic_education.tier1_app_engaged.celebrate	You're helping your children succeed!	Excellent work {name}! 🎉 Now that you are an active SyllabusGH user you're: \n✓ Supporting your children's studies at home\n✓ Helping them prepare for exams \n✓ Giving them access to quality study materials \n✓ Building their confidence and skills \nYou're not just using an app - you're investing in your children's future. Keep it up!	basic_education	\N	\N	t	\N	\N
31f7a6eb-a7fa-4774-94a9-d4c7cfd7091b	2025-11-03 20:59:04.190505	2025-11-03 20:59:04.190505	basic_education.tier1_app_engaged.incentive	Keep going - your children's success is ahead!	{name}, you're doing great with SyllabusGH! Keep using it actively and earn 10 GHC in a few weeks. The more you help your children study, the better they'll perform in school. Your commitment is making a real difference!	basic_education	\N	\N	t	\N	\N
3d33d014-ac3a-4183-aab9-a5b16cb5b29a	2025-11-03 20:59:04.413666	2025-11-03 20:59:04.413666	basic_education.tier1_app_engagement_dropoff.how	Come back to SyllabusGH - we can help!	Hi {name}, we noticed you stopped using SyllabusGH recently. Let's get you back on track! Quick reminders: \n• To find curriculum: Open app → Select subject → Click on an option\n• To get past questions: Choose subject → Sample questions \n• To help with homework: Search for specific subjects your children are studying \n\nWatch the video to learn how to make the most of SyllabusGH for your children's education.	basic_education	\N	\N	t	["https://drive.google.com/file/d/1Figpz0EoaV3fkxeisJCWI8kNxYEMKZT3/view?usp=drive_link"]	\N
0e827a77-70de-4b40-84cd-90d086588f07	2025-11-03 20:59:04.621632	2025-11-03 20:59:04.621632	basic_education.tier1_app_engagement_dropoff.incentive	Don't lose your education support momentum!	{name}, you were doing so well helping your children with SyllabusGH! Come back now and earn 10 GHC in just a few weeks. Your children's exam preparation is important - don't let it slip away!	basic_education	\N	\N	t	\N	\N
3c9d9ecb-a1c4-4e96-9033-3058270c6fbd	2025-11-03 20:59:04.826538	2025-11-03 20:59:04.826538	basic_education.tier1_app_engagement_dropoff.reactivation	Your children need your support - come back today!	{name}, we miss you! You were building something important with SyllabusGH: giving your children the study support they need to excel. Take 2 minutes today to use SyllabusGH again and get back on track!	basic_education	\N	\N	t	\N	\N
c2bec81e-0880-4a41-8236-33e0f7a4cdd9	2025-11-03 20:59:05.061617	2025-11-03 20:59:05.061617	basic_education.tier1_app_engagement_dropoff.why	Remember why you started using SyllabusGH	{name}, stopping your support means your children miss out on important study help: \n• No access to exam practice questions \n• Missing curriculum guidance for homework \n• Children struggle without structured study support \n• No preparation materials for important exams \n\nYou already learned how to use SyllabusGH. Don't give up the advantage you're giving your children. Their school success depends on you!	basic_education	\N	\N	t	\N	\N
ac2707fa-7b7f-4467-9775-98f9482be874	2025-11-03 20:59:05.268564	2025-11-03 20:59:05.268564	basic_education.tier1_app_engagement_sustained.celebrate	You're a consistent education supporter!	Fantastic {name}! 🎉 You've maintained active SyllabusGH use for 6 weeks. This isn't luck - this is YOU investing in your children's future! You've proven that: \n✓ You can support learning at home \n✓ You're helping your children build confidence \n✓ You're preparing them for exam success \n✓ You're committed to their education \nYou're an example to other parents. Congratulations!	basic_education	\N	\N	t	\N	\N
4bb3bc42-38d1-4f03-b6da-e5c282331894	2025-11-03 20:59:05.473313	2025-11-03 20:59:05.473313	basic_education.first_tier1_app_retained.reward	9 weeks of education support! Collect your reward.	Exceptional achievement {name}! 🎉 You've used SyllabusGH actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully committed to supporting your children's education. Amazing!	basic_education	\N	\N	t	\N	\N
d7105524-f984-434b-a313-6d1f6ed28fe0	2025-11-03 20:59:05.808659	2025-11-03 20:59:05.808659	basic_education.tier1_app_retained.celebrate	You're an education champion now. Congratulations!	Incredible {name}! 🎉 You're now a long-term SyllabusGH user. Look at what you've achieved: \n✓ 9+ weeks of consistent education support \n✓ Regular help with your children's studies \n✓ Better exam preparation for your family \n✓ Confidence using digital learning tools \nYour children are blessed to have your support. Congratulations!	basic_education	\N	\N	t	\N	\N
32a9a424-6980-42d1-a836-52d894577230	2025-11-03 20:59:06.021176	2025-11-03 20:59:06.021176	basic_education.tier1_app_retained.incentive	You're building real academic success	{name}, you've proven you can support your children's education for 9+ weeks. This consistency is making a real difference in their school performance. The longer you keep going, the better prepared they'll be for their future. Their success is in your hands!	basic_education	\N	\N	t	\N	\N
2b1f1a81-bed6-4746-a5d5-41702b027533	2025-11-03 20:59:06.229963	2025-11-03 20:59:06.229963	basic_education.tier1_app_retention_dropoff.how	Let's solve your SyllabusGH issue	Hi {name}, you were such a consistent SyllabusGH user! We noticed you haven't been active lately. Let's fix any issues: \n• To find curriculum: Open app → Select subject → Click on an option\n• To get past questions: Choose subject → Sample questions \n• To help with homework: Look up the subject your children are studying \n\nWatch the video to learn how to make the most of SyllabusGH for your children.	basic_education	\N	\N	t	["https://drive.google.com/file/d/1Figpz0EoaV3fkxeisJCWI8kNxYEMKZT3/view?usp=drive_link"]	\N
c14ea8d2-0287-49d4-9c7c-c7813e4396da	2025-11-03 20:59:06.442486	2025-11-03 20:59:06.442486	basic_education.tier1_app_retention_dropoff.incentive	Your children's education support is too valuable to lose	{name}, every week you've used SyllabusGH has helped your children build stronger academic skills. By stopping now, they lose access to valuable study support. Use SyllabusGH this week and keep helping them succeed!	basic_education	\N	\N	t	\N	\N
cce96dde-c03d-45d5-a534-5a5862c19e3d	2025-11-03 20:59:06.696379	2025-11-03 20:59:06.696379	basic_education.tier1_app_retention_dropoff.reactivation	We miss you! Come back as an education champion	{name}, we miss you! Your consistent use of SyllabusGH was helping your children prepare for academic success. Don't let this slip away. Take 2 minutes today to use SyllabusGH again and continue supporting their education!	basic_education	\N	\N	t	\N	\N
d4a744f2-5b07-4ff9-8d03-f56f1fccc342	2025-11-03 20:59:06.927758	2025-11-03 20:59:06.927758	basic_education.tier1_app_retention_dropoff.why	Why your education support matters	{name}, you spent many weeks helping your children with SyllabusGH. Here's what they lose by you stopping: \n• No exam practice materials at home \n• Missing study support for difficult topics \n• Less preparation for BECE and WASSCE \n• Falling behind in their classes \n\nYou worked hard to become an education supporter. Don't let your children's academic progress slip. Take two minutes today to use SyllabusGH and get back on track.	basic_education	\N	\N	t	\N	\N
518734d1-ad05-4667-854c-3899fdc39191	2025-11-03 20:59:07.191232	2025-11-03 20:59:07.191232	basic_education.tier2_app_opened_first_time.celebrate	Welcome to SyllabusGH!	Great start {name}! 🎉 You've opened SyllabusGH for the first time. Education is your second most important goal. This is the beginning of something powerful - a way to help your children with their schoolwork. With SyllabusGH, you can: \n✓ Access school curriculum on your phone \n✓ Get past exam questions \n✓ Support your children's studies \n✓ Help them prepare for exams \n\nTake the next step: Create your account!	basic_education	\N	\N	t	\N	\N
3421d578-c739-4ce1-8acd-c28d709afe7d	2025-11-03 20:59:07.395524	2025-11-03 20:59:07.395524	basic_education.tier2_app_adopted.celebrate	You're supporting education!	Well done {name}! 🎉 You're now using SyllabusGH. You've taken a good step in helping your children learn!	basic_education	\N	\N	t	\N	\N
640262f7-61a9-4885-b1c5-863bb0704bed	2025-11-03 20:59:07.611486	2025-11-03 20:59:07.611486	basic_education.tier2_app_registered.celebrate	Your learning account is ready!	{name} congratulations on registering for SyllabusGH! 🎉 This is a great step! With your account you can: \n✓ Access curriculum \n✓ Find past questions \n✓ Help your children study \n✓ Support their learning \nAll from your phone!	basic_education	\N	\N	t	\N	\N
2326171f-6015-4dd9-99a9-0d445887d4ff	2025-11-03 20:59:07.848493	2025-11-03 20:59:07.848493	basic_education.tier2_app_low_activity.how	Quick tips for SyllabusGH	Hi {name}, we noticed you haven't used SyllabusGH much. Ready to try it? Here's a quick start: \n1. Open the app and select a subject\n2. Browse available study materials  \n3. Check past exam questions \nStart exploring until you're comfortable!	basic_education	\N	\N	t	\N	\N
6e078185-67f2-4282-b62e-a53cf80b3d1e	2025-11-03 20:59:08.064542	2025-11-03 20:59:08.064542	basic_education.tier2_app_low_activity.incentive	Try SyllabusGH and earn a reward	{name}, start using SyllabusGH and earn a reward of 10 GHC in just three weeks. Help your children with their studies and get rewarded for it!	basic_education	\N	\N	t	\N	\N
b8b0d683-9a97-422a-9148-6159ffdda04f	2025-11-03 20:59:08.279501	2025-11-03 20:59:08.279501	basic_education.tier2_app_low_activity.support	Need help with SyllabusGH?	Hi {name}, need help using SyllabusGH? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	basic_education	\N	\N	t	\N	\N
bd0ef264-2351-4510-9e7a-ebe09ec5a201	2025-11-03 20:59:08.500534	2025-11-03 20:59:08.500534	basic_education.tier2_app_low_activity.why	SyllabusGH helps your children succeed	{name}, SyllabusGH offers real benefits for your family: \n• Complete school curriculum on your phone \n• Past exam questions for practice\n• Study support available anytime\nGive it a try - help your children do better in school!	basic_education	\N	\N	t	\N	\N
199a61ac-1d9f-4229-90e8-fcc40bdf8728	2025-11-03 20:59:08.724408	2025-11-03 20:59:08.724408	basic_education.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used SyllabusGH for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep supporting your children's education!	basic_education	\N	\N	t	\N	\N
e75abf6b-5e87-4f66-96b5-18c62affbe6d	2025-11-03 20:59:08.939655	2025-11-03 20:59:08.939655	basic_education.tier2_app_engaged.celebrate	You're using SyllabusGH!	Great job {name}! 🎉 As an active SyllabusGH user, you're helping your children with their studies and supporting their academic growth!	basic_education	\N	\N	t	\N	\N
f574a693-9f2f-49a6-8f43-1c5a4b4d451c	2025-11-03 20:59:09.139494	2025-11-03 20:59:09.139494	basic_education.tier2_app_engaged.incentive	Keep going with SyllabusGH	{name}, you're doing well! Keep using SyllabusGH and earn 10 GHC in a few weeks. Every time you help your children study counts!	basic_education	\N	\N	t	\N	\N
ca99de2f-b7ca-412c-bbd6-194070b0faaf	2025-11-03 20:59:09.349608	2025-11-03 20:59:09.349608	basic_education.tier2_app_engagement_dropoff.how	Quick SyllabusGH reminder	Hi {name}, we noticed you stopped using SyllabusGH lately. Quick reminders: \n• To find curriculum: Open app → Select subject → Click on an option\n• To get past questions: Choose subject → Sample questions \n• To help with studies: Search for specific topics \n\nWatch the video for a refresher.	basic_education	\N	\N	t	["https://drive.google.com/file/d/1Figpz0EoaV3fkxeisJCWI8kNxYEMKZT3/view?usp=drive_link"]	\N
0c47bdd9-348e-4b6e-8d42-eaf78d95c175	2025-11-03 20:59:09.559653	2025-11-03 20:59:09.559653	basic_education.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to SyllabusGH and earn 10 GHC in a few weeks. Keep helping your children with their schoolwork!	basic_education	\N	\N	t	\N	\N
797ce24a-326c-46fc-a0a7-b7df95595542	2025-11-03 20:59:09.777575	2025-11-03 20:59:09.777575	basic_education.tier2_app_engagement_dropoff.reactivation	Try SyllabusGH again?	{name}, you started helping your children with SyllabusGH. Take 2 minutes today to use it again!	basic_education	\N	\N	t	\N	\N
4e448a9f-59a3-484e-a73a-ab90e03d0930	2025-11-03 20:59:10.014482	2025-11-03 20:59:10.014482	basic_education.tier2_app_engagement_dropoff.why	SyllabusGH helps your children learn	{name}, SyllabusGH gives your children important study support: \n• Access to curriculum materials \n• Practice with past exam questions \n• Help with homework at home \nYou already know how to use it - try it again!	basic_education	\N	\N	t	\N	\N
f1f83c6e-48ce-406f-93bd-b5163bebe719	2025-11-03 20:59:10.220509	2025-11-03 20:59:10.220509	basic_education.tier2_app_engagement_sustained.celebrate	6 weeks of education support!	Well done {name}! 🎉 You've used SyllabusGH consistently for 6 weeks. You're helping your children learn and preparing them for academic success!	basic_education	\N	\N	t	\N	\N
30e615d0-2b32-4c7b-a74e-525e346e0e1f	2025-11-03 20:59:10.454354	2025-11-03 20:59:10.454354	basic_education.first_tier2_app_retained.reward	You've earned 10 GHC for supporting education!	Excellent {name}! 🎉 You've used SyllabusGH for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency in supporting your children!	basic_education	\N	\N	t	\N	\N
d05e9be7-2458-4214-b8be-9751bdfd478b	2025-11-03 20:59:10.66959	2025-11-03 20:59:10.66959	basic_education.tier2_app_retained.celebrate	You're a committed education supporter!	Impressive {name}! 🎉 You've been using SyllabusGH consistently. You're helping your children study well and building their academic confidence. Well done!	basic_education	\N	\N	t	\N	\N
3db5082c-3b1a-4675-a578-e86a843153be	2025-11-03 20:59:10.879572	2025-11-03 20:59:10.879572	basic_education.tier2_app_retained.incentive	Keep your education support going	{name}, your consistent SyllabusGH use is making a real difference in your children's learning. Keep it up and watch them succeed!	basic_education	\N	\N	t	\N	\N
a680f039-2ba8-4ded-b028-932a1a6b2e18	2025-11-03 20:59:11.130491	2025-11-03 20:59:11.130491	basic_education.tier2_app_retention_dropoff.how	Quick SyllabusGH reminder	Hi {name}, we noticed you stopped using SyllabusGH lately. Quick reminders: \n• To find curriculum: Open app → Select subject → Click on an option\n• To get past questions: Choose subject → Sample questions \n• To help with studies: Search for specific topics \n\nWatch the video for a refresher.	basic_education	\N	\N	t	["https://drive.google.com/file/d/1Figpz0EoaV3fkxeisJCWI8kNxYEMKZT3/view?usp=drive_link"]	\N
cfd306f8-4a24-41bb-90ff-0aa16b779561	2025-11-03 20:59:11.329464	2025-11-03 20:59:11.329464	basic_education.tier2_app_retention_dropoff.incentive	Your education support is waiting	{name}, you built great habits helping your children study. Come back and continue supporting their academic growth!	basic_education	\N	\N	t	\N	\N
c07dc705-0610-4f40-b976-473cecc7a257	2025-11-03 20:59:11.544576	2025-11-03 20:59:11.544576	basic_education.tier2_app_retention_dropoff.reactivation	Come back to SyllabusGH	{name}, you were doing great supporting your children with SyllabusGH! Use it again today and continue helping them learn.	basic_education	\N	\N	t	\N	\N
a0b1fb3c-dab2-4eb3-ba79-506bd6ae0ed2	2025-11-03 20:59:11.789571	2025-11-03 20:59:11.789571	basic_education.tier2_app_retention_dropoff.why	Keep helping your children learn	{name}, you built weeks of education support habits. Keep going to maintain: \n• Study materials access \n• Exam preparation help \n• Academic support at home \nUse it today to continue helping your children succeed!	basic_education	\N	\N	t	\N	\N
a2d526dd-9e8d-476e-a447-4a7ec86b381f	2025-11-03 20:59:12.027611	2025-11-03 20:59:12.027611	business_growth.tier1_app_opened_first_time.celebrate	Welcome to business growth with GROW!	Great start {name}! 🎉 You've opened GROW for the first time. Growing your business is your most important goal. This is the beginning of something powerful - a way to reach more customers and grow your sales. With GROW, you can:\n✓ Find new customers for your products\n✓ Advertise your business to nearby communities\n✓ Track customer interest and inquiries\n✓ Connect with buyers who want what you sell\n\nTake the next step: Register your account!	business_growth	\N	\N	t	\N	\N
82ba3b7e-ef91-4570-8ca6-799faf886f93	2025-11-03 20:59:12.294093	2025-11-03 20:59:12.294093	business_growth.tier1_app_adopted.celebrate	You're expanding your business reach!	Well done {name}! 🎉 You're now using GROW to grow your business. You've taken control of finding new customers! By connecting with buyers digitally instead of waiting for local foot traffic, you're:\n✓ Reaching more potential customers\n✓ Making it easier for buyers to find you\n✓ Building your business reputation\nKeep going!	business_growth	\N	\N	t	\N	\N
22210ee3-8ac9-4d9a-8054-da1590d5952f	2025-11-03 20:59:12.499542	2025-11-03 20:59:12.499542	business_growth.tier1_app_registered.celebrate	Your business growth account is ready!	{name} congratulations on registering for GROW! 🎉 This is a major step forward! With your GROW account you can:\n✓ Advertise your products or services\n✓ Receive inquiries and orders directly\n✓ Track which products are popular\n✓ Connect with more buyers\nAll from your phone!	business_growth	\N	\N	t	\N	\N
ab6e6e35-5fc8-4627-b9f9-996d83252060	2025-11-03 20:59:12.709682	2025-11-03 20:59:12.709682	business_growth.tier1_app_low_activity.how	Get the most from GROW for your business	Hi {name}, we noticed you haven't used GROW much. Here's how to start finding new customers:\n1. Open the GROW app\n2. Click on your business profile\n3. Add photos and descriptions of your products\n4. Share your contact information\n5. Post what you have for sale\n6. Respond to customer inquiries\n\nWatch the video to learn how to connect with buyers.	business_growth	\N	\N	t	\N	\N
237dd2f1-b8ae-47a8-ba63-9d097a5c29cc	2025-11-03 20:59:12.949456	2025-11-03 20:59:12.949456	business_growth.tier1_app_low_activity.incentive	Your reward is waiting - start growing your business!	{name}, start using GROW to find new customers and earn a reward of 10 GHC in just three weeks! Every customer inquiry you receive expands your business reach and increases your income. The sooner you start, the sooner you'll see more sales. Try posting one product today!	business_growth	\N	\N	t	\N	\N
f8659aff-aaaa-4b49-a631-9e432cc7590e	2025-11-03 20:59:13.169472	2025-11-03 20:59:13.169472	business_growth.tier1_app_low_activity.support	Need help with GROW?	Hi {name}, need help using GROW to grow your business? We're here for you! Common questions:\n• How to post products? Open GROW, click on your profile, select 'Add product', upload a photo, add description and price.\n• How to respond to buyers? Check your inquiries section regularly and reply to interested customers.\n• How to share your business? Use GROW to create posts about your products that nearby communities can see.\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	business_growth	\N	\N	t	\N	\N
9c77fa99-c98c-406a-a585-4f142df81252	2025-11-03 20:59:13.380531	2025-11-03 20:59:13.380531	business_growth.tier1_app_low_activity.why	Why GROW matters for your business success	{name}, we know trying new ways to find customers can feel uncertain. But relying only on local foot traffic has real limits:\n• Small customer base - only people nearby know about you\n• No way to reach new communities or markets\n• Hard to show what you sell to interested buyers\n• No record of customer interest\nGROW solves these problems. You can reach more customers, show your products digitally, and build your business reputation. Others in your community already trust it. Take the first step today - you'll be glad you did!	business_growth	\N	\N	t	\N	\N
0e61bf13-7a78-4a8d-b993-f6aaeffe268e	2025-11-03 20:59:13.621496	2025-11-03 20:59:13.621496	business_growth.first_tier1_app_engaged.reward	3 weeks of business growth success! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using GROW for 3 weeks straight to grow your business. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're building something powerful - a larger customer base and more opportunities. Congratulations!	business_growth	\N	\N	t	\N	\N
cc6f5b02-6866-4688-8e1a-41f5765e31e3	2025-11-03 20:59:13.850677	2025-11-03 20:59:13.850677	business_growth.tier1_app_engaged.celebrate	You're mastering business growth with GROW!	Excellent work {name}! 🎉 Now that you are actively using GROW you're:\n✓ Reaching more potential customers\n✓ Getting more inquiries and sales\n✓ Building recognition for your business\n✓ Expanding beyond your local area\nYou're not just running a business - you're growing it digitally. Keep it up!	business_growth	\N	\N	t	\N	\N
5b12bb10-dbc3-4815-ad19-7ed37836204b	2025-11-03 20:59:14.061538	2025-11-03 20:59:14.061538	business_growth.tier1_app_engaged.incentive	Keep going - more customers ahead!	{name}, you're doing great with GROW! Keep using it actively to find customers and earn 10 GHC in a few weeks. The more you connect with buyers, the more opportunities open up for you. Keep it up!	business_growth	\N	\N	t	\N	\N
55bb2e94-a9c7-4698-9a72-366da7cc23a7	2025-11-03 20:59:14.302217	2025-11-03 20:59:14.302217	business_growth.all_tier1_app_engaged.reward	You're a business growth champion! Collect your reward.	Outstanding {name}! 🎉 You're actively using GROW to reach customers and grow your business. You've earned 500MB. The data will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nKeep it up. This is just the beginning!	business_growth	\N	\N	t	\N	\N
75f6fbdc-463b-424e-8b1e-a79c449d210c	2025-11-03 20:59:14.509674	2025-11-03 20:59:14.509674	business_growth.tier1_app_engagement_dropoff.how	Come back to GROW - we can help you find more customers!	Hi {name}, we noticed you stopped using GROW recently. Let's get you back to growing your business! Quick reminders:\n• To post products: Open GROW → Click your profile → Add product → Upload photo, add description and price\n• To check inquiries: Open GROW → Click inquiries → Reply to interested buyers\n• To update your business: Keep your products and contact information current\n\nWatch the video to learn how to maximize customer reach.	business_growth	\N	\N	t	\N	\N
62fd3bb3-fcd5-44bf-9102-76784ccdadb9	2025-11-03 20:59:14.736763	2025-11-03 20:59:14.736763	business_growth.tier1_app_engagement_dropoff.incentive	Don't lose your business growth momentum!	{name}, you were doing so well with GROW! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of reaching more customers and getting more inquiries that lead to sales.	business_growth	\N	\N	t	\N	\N
a17a5105-859c-4e4f-a867-6e69a5246280	2025-11-03 20:59:14.93951	2025-11-03 20:59:14.93951	business_growth.tier1_app_engagement_dropoff.reactivation	Your customers are waiting - come back to GROW today!	{name}, we miss you! You were building something important with GROW: more customers and more sales opportunities. Take 2 minutes today to post a product on GROW and get back on track!	business_growth	\N	\N	t	\N	\N
16226f4d-6e63-4fba-9a94-bb74785f1371	2025-11-03 20:59:15.149616	2025-11-03 20:59:15.149616	business_growth.tier1_app_engagement_dropoff.why	Remember why you started using GROW	{name}, going back to relying only on local customers means going back to old limits:\n• Small reach: Only nearby people know about your business\n• Fewer sales: Missing buyers who want what you sell\n• No growth: Can't expand beyond your immediate area\nGROW changes this automatically: more customer reach, more inquiries, more sales opportunities. You already learned how to use it. Don't give up the growth you worked for. Your business success depends on it!	business_growth	\N	\N	t	\N	\N
dd75f659-61d8-460f-a914-ad6337637b9a	2025-11-03 20:59:15.379621	2025-11-03 20:59:15.379621	business_growth.tier1_app_engagement_sustained.celebrate	You're consistently growing your customer base!	Fantastic {name}! 🎉 You've maintained active GROW use for 6 weeks. This isn't luck - this is YOU expanding your business reach! You've proven that:\n✓ You can attract customers digitally\n✓ You can manage business inquiries on your phone\n✓ You're ready for even more business opportunities\n✓ You're securing your business growth\nYou're thriving and you're an example to others. Congratulations!	business_growth	\N	\N	t	\N	\N
1ba88799-1f7d-4d82-a7e8-f4404930a051	2025-11-03 20:59:15.580468	2025-11-03 20:59:15.580468	business_growth.first_tier1_app_retained.reward	9 weeks of business growth! Collect your reward.	Exceptional achievement {name}! 🎉 You've used GROW actively for 9 weeks straight to grow your business! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nThis is remarkable. You've fully embraced digital business growth. Amazing!	business_growth	\N	\N	t	\N	\N
051dd5a6-03d1-4dd4-84c4-3d60952534c3	2025-11-03 20:59:15.804547	2025-11-03 20:59:15.804547	business_growth.tier1_app_retained.celebrate	You're a business growth expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term GROW user. Look at what you've achieved:\n✓ 9+ weeks of consistent customer outreach\n✓ Larger customer base than ever before\n✓ Strong business reputation that attracts buyers\n✓ Confidence using digital tools for business growth\nCongratulations!	business_growth	\N	\N	t	\N	\N
30d80b7a-56a9-477d-9a0d-9a32973e8efd	2025-11-03 20:59:16.078293	2025-11-03 20:59:16.078293	business_growth.tier1_app_retained.incentive	You're building real business power	{name}, you've proven you can grow your customer base digitally for 9+ weeks. This consistency is opening doors: more buyers can find you and your business is becoming known beyond your local area. The longer you keep going, the more your business can grow. Your success is in your hands!	business_growth	\N	\N	t	\N	\N
c62f4968-f8c0-4cc3-957f-4872477750c8	2025-11-03 20:59:16.291439	2025-11-03 20:59:16.291439	business_growth.tier1_app_retention_dropoff.how	Let's solve your GROW issue and get back to growth	Hi {name}, you were such a consistent GROW user! We noticed you haven't been active lately. Let's fix any issues:\n• To post products: Open app → Your profile → Add product → Upload photo → Add description and price\n• To respond to inquiries: Open app → Check inquiries → Reply to interested customers\n• To update offerings: Keep your product list current and attractive\n\nWatch the video to learn how to maximize your business reach with GROW.	business_growth	\N	\N	t	\N	\N
d43c81cf-0b07-4e76-8687-2134b2e6c0a0	2025-11-03 20:59:16.506537	2025-11-03 20:59:16.506537	business_growth.tier1_app_retention_dropoff.incentive	Your customer base is too valuable to lose	{name}, every week of GROW use you've built adds more customers who know about your business. By stopping now, you lose visibility with potential buyers. Use GROW this week and keep your business opportunities open!	business_growth	\N	\N	t	\N	\N
1261d80e-5414-4bc8-9f78-42024137a06d	2025-11-03 20:59:16.76951	2025-11-03 20:59:16.76951	business_growth.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a business growth champion	{name}, we miss you! Your consistent use of GROW provided more customers and more sales opportunities. Make sure you don't let this slip away. Take 2 minutes today to post on GROW and get back on track!	business_growth	\N	\N	t	\N	\N
5e804d0f-be07-4101-980e-1815ac19d889	2025-11-03 20:59:17.190647	2025-11-03 20:59:17.190647	business_growth.tier1_app_retention_dropoff.why	Why your business growth record matters	{name}, you spent many weeks building customer connections. Here's what you lose by stopping:\n• Visibility: Buyers can't find you without your GROW presence\n• Growth: Back to limited local customers only\n• Opportunities: Missing inquiries from interested buyers who want what you sell\n\nYou worked hard to become a GROW expert. Make sure that you continue to use this tool to grow your business. Take two minutes today to post on GROW and get back on track.	business_growth	\N	\N	t	\N	\N
a197da97-d7f8-4e72-bc44-c42d17ad3ea1	2025-11-03 20:59:17.413664	2025-11-03 20:59:17.413664	business_growth.tier2_app_opened_first_time.celebrate	Welcome to business growth with GROW!	Great start {name}! 🎉 You've opened GROW for the first time. Growing your business is your second most important goal. This is the beginning of something powerful - a way to reach more customers and grow your sales. With GROW, you can:\n✓ Find new customers for your products\n✓ Advertise your business digitally\n✓ Get customer inquiries directly on your phone\n✓ Expand beyond your local area\n\nTake the next step: Register your account!	business_growth	\N	\N	t	\N	\N
e4cd25e0-8a6d-4c8f-9636-b6298b5ea894	2025-11-03 20:59:17.641584	2025-11-03 20:59:17.641584	business_growth.tier2_app_adopted.celebrate	You're expanding your business reach!	Well done {name}! 🎉 You're now using GROW. You've taken a step toward finding more customers!	business_growth	\N	\N	t	\N	\N
92806dfc-fd68-4bd3-adb6-d8613c37f40a	2025-11-03 20:59:17.86267	2025-11-03 20:59:17.86267	business_growth.tier2_app_registered.celebrate	Your business growth account is ready!	{name} congratulations on registering for GROW! 🎉 This is a step forward! With GROW you can:\n✓ Post your products or services\n✓ Reach more customers\n✓ Track customer interest\n✓ Grow your sales\nAll from your phone!	business_growth	\N	\N	t	\N	\N
ac672c30-2961-4f3b-81d8-353d40e74aa8	2025-11-03 20:59:18.097713	2025-11-03 20:59:18.097713	business_growth.tier2_app_low_activity.how	Quick tips for business growth with GROW	Hi {name}, we noticed you haven't used GROW much. Ready to find more customers? Here's a quick start:\n1. Open GROW and complete your business profile\n2. Post photos and descriptions of your products\n3. Share your contact information\n4. Check for customer inquiries\nStart small until you're comfortable!	business_growth	\N	\N	t	\N	\N
51c7ec2b-e531-49ea-8cc0-1805d15fdebd	2025-11-03 20:59:18.325505	2025-11-03 20:59:18.325505	business_growth.tier2_app_low_activity.incentive	Try GROW to find new customers	{name}, start using GROW and earn a reward of 10 GHC in just three weeks. The sooner you start connecting with buyers, the sooner you'll see more business opportunities.	business_growth	\N	\N	t	\N	\N
ac7ac7a6-221c-40e8-add1-a19a100f4c63	2025-11-03 20:59:18.550556	2025-11-03 20:59:18.550556	business_growth.tier2_app_low_activity.support	Need help with GROW?	Hi {name}, need help using GROW? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	business_growth	\N	\N	t	\N	\N
babbe7d6-5bb0-4689-ace8-22688950d1bb	2025-11-03 20:59:18.78461	2025-11-03 20:59:18.78461	business_growth.tier2_app_low_activity.why	GROW helps your business reach more customers	{name}, GROW offers real benefits:\n• Reach customers beyond your local area\n• Show your products to interested buyers\n• Get inquiries directly on your phone\nGive it a try - many in your community already use it to grow their businesses!	business_growth	\N	\N	t	\N	\N
ef289602-f006-44df-905f-312e13f84a11	2025-11-03 20:59:19.024057	2025-11-03 20:59:19.024057	business_growth.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used GROW for 3 weeks to grow your business. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	business_growth	\N	\N	t	\N	\N
8e96894e-f28d-493e-8f2f-f231e97250e7	2025-11-03 20:59:19.270407	2025-11-03 20:59:19.270407	business_growth.tier2_app_engaged.celebrate	You're using GROW to find customers!	Great job {name}! 🎉 As an active GROW user, you're reaching more customers and creating more business opportunities. You're building good business growth habits!	business_growth	\N	\N	t	\N	\N
215eb7ed-199e-41db-b220-6255d01aacd8	2025-11-03 20:59:19.489482	2025-11-03 20:59:19.489482	business_growth.tier2_app_engaged.incentive	Keep going with GROW	{name}, you're doing well! Keep using GROW to find customers and earn 10 GHC in a few weeks. Every customer connection counts!	business_growth	\N	\N	t	\N	\N
7fc9edee-9d93-4429-ab79-28fca3809eda	2025-11-03 20:59:19.712439	2025-11-03 20:59:19.712439	business_growth.tier2_app_engagement_dropoff.how	Quick GROW reminder	Hi {name}, we noticed you stopped using GROW lately. Quick reminders:\n• To post products: Open GROW → Your profile → Add product → Photo and description\n• To check inquiries: Open GROW → Inquiries section → Reply to buyers\n• To grow reach: Keep your product listings current\n\nWatch the video for a refresher.	business_growth	\N	\N	t	\N	\N
bf25b023-ac87-48e0-94aa-593de459add8	2025-11-03 20:59:19.989539	2025-11-03 20:59:19.989539	business_growth.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to GROW and earn 10 GHC in a few weeks. It helps you find more customers and grow your sales.	business_growth	\N	\N	t	\N	\N
930a3ab0-9349-4870-894b-53837a094b4a	2025-11-03 20:59:20.189454	2025-11-03 20:59:20.189454	business_growth.tier2_app_engagement_dropoff.reactivation	Try GROW again to grow your business?	{name}, you started building good business habits with GROW. Take 2 minutes today to post a product and reconnect with potential buyers!	business_growth	\N	\N	t	\N	\N
bc1d30a6-35b5-4ef8-922c-d9b7648db141	2025-11-03 20:59:20.390729	2025-11-03 20:59:20.390729	business_growth.tier2_app_engagement_dropoff.why	GROW expands your customer reach	{name}, GROW offers growth opportunities:\n• More customers can find you\n• Buyers can see what you sell\n• Direct inquiries lead to more sales\nYou already know how to use it - try it again!	business_growth	\N	\N	t	\N	\N
1f741966-90e0-4a86-a9bb-15a625e4b363	2025-11-03 20:59:20.617362	2025-11-03 20:59:20.617362	business_growth.tier2_app_engagement_sustained.celebrate	6 weeks of business growth!	Well done {name}! 🎉 You've used GROW consistently for 6 weeks. You're expanding your customer base and creating more business opportunities!	business_growth	\N	\N	t	\N	\N
b5865278-ff68-49cb-a47b-73bd603e7438	2025-11-03 20:59:20.821682	2025-11-03 20:59:20.821682	business_growth.first_tier2_app_retained.reward	You've earned 10 GHC for consistent business growth!	Excellent {name}! 🎉 You've used GROW for 9 consecutive weeks to grow your business. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	business_growth	\N	\N	t	\N	\N
904ad055-ead8-4e03-be97-01cb2b4e5341	2025-11-03 20:59:21.04042	2025-11-03 20:59:21.04042	business_growth.tier2_app_retained.celebrate	You're a GROW user!	Impressive {name}! 🎉 You've been using GROW consistently to find customers. You're expanding your business reach and building strong growth habits. Well done!	business_growth	\N	\N	t	\N	\N
7a0b2218-2901-4c8a-a96c-0424752a234c	2025-11-03 20:59:21.250732	2025-11-03 20:59:21.250732	business_growth.tier2_app_retained.incentive	Keep your business growth habit going	{name}, your consistent GROW use is turning into valuable business growth. You're reaching more customers and creating more sales opportunities. Keep it up!	business_growth	\N	\N	t	\N	\N
51a126a9-882d-4521-b143-fb6c9de3e742	2025-11-03 20:59:21.460541	2025-11-03 20:59:21.460541	business_growth.tier2_app_retention_dropoff.how	Quick GROW reminder	Hi {name}, we noticed you stopped using GROW lately. Quick reminders:\n• To post products: Open GROW → Profile → Add product → Photo and details\n• To check inquiries: Open GROW → Inquiries → Reply to buyers\n• To stay visible: Keep listings updated\n\nWatch the video for a refresher.	business_growth	\N	\N	t	\N	\N
31ccc16e-6f84-4d29-8c23-2a8efa0b73e8	2025-11-03 20:59:21.69644	2025-11-03 20:59:21.69644	business_growth.tier2_app_retention_dropoff.incentive	Your GROW presence is waiting	{name}, you built great customer outreach habits. Come back and keep growing your business reach.	business_growth	\N	\N	t	\N	\N
a4ccccc2-f8a5-403d-8404-9841a30ae414	2025-11-03 20:59:21.899542	2025-11-03 20:59:21.899542	business_growth.tier2_app_retention_dropoff.reactivation	Come back to GROW	{name}, you were doing great with GROW! Use it again today and keep finding new customers for your business.	business_growth	\N	\N	t	\N	\N
59366a3c-176c-4fa2-a68c-d5ee23b19b04	2025-11-03 20:59:22.136614	2025-11-03 20:59:22.136614	business_inventory.tier1_app_opened_first_time.celebrate	Welcome to business tracking!	Great start {name}! 🎉 You've opened your business tracking app for the first time. Work is your most important goal. This is the beginning of something powerful - a smarter way to manage your business. With Oze, you can: \n✓ Track all your income and expenses \n✓ See your real profit clearly \n✓ Build records for business loans \n✓ Know exactly where your money goes \n\nTake the next step: Register your business!	business_inventory	\N	\N	t	\N	\N
ce364270-093e-453b-a114-49bf6cdf76be	2025-11-03 20:59:22.345523	2025-11-03 20:59:22.345523	business_inventory.tier1_app_adopted.celebrate	You're taking control of your business!	Well done {name}! 🎉 You're now using business tracking. You've taken control of your business finances! By keeping records on your phone instead of paper or memory, you're: \n✓ Seeing your real profit and losses \n✓ Making better business decisions \n✓ Building records that qualify you for loans \nKeep going!	business_inventory	\N	\N	t	\N	\N
ec443159-4a29-4a1b-b48f-70492e8e906a	2025-11-03 20:59:22.568509	2025-11-03 20:59:22.568509	business_inventory.tier1_app_registered.celebrate	Your business tracker is ready!	{name} congratulations on registering with Oze! 🎉 This is a major step forward! With your business tracker you can: \n✓ Record all income and expenses\n✓ See your profit clearly \n✓ Track what's selling well \n✓ Build records for business loans \nAll from your phone!	business_inventory	\N	\N	t	\N	\N
00887367-055c-4146-830e-13826ebd48b5	2025-11-03 20:59:22.788816	2025-11-03 20:59:22.788816	business_inventory.tier1_app_low_activity.how	Get the most from your business tracker	Hi {name}, we noticed you haven't used your business tracking app much. Here's how to record your daily transactions: \n1. Open the Oze app\n2. Choose 'Add Income' or 'Add Expense'\n3. Enter the amount\n4. Add a description\n5. Select the category\n6. Save transaction\n\nStart with today's sales - even small amounts matter!	business_inventory	\N	\N	t	\N	\N
4e9e5e59-d2dd-401c-a00e-9889531c772d	2025-11-03 20:59:22.997392	2025-11-03 20:59:22.997392	business_inventory.tier1_app_low_activity.incentive	Your reward is waiting - start tracking your business!	{name}, start using your business tracking app and earn a reward of 10 GHC in just three weeks! Every transaction you record gives you clearer profit visibility, helps you make better decisions and builds records for loans. \nThe sooner you start, the sooner you'll see exactly where your money goes. Record one transaction today!	business_inventory	\N	\N	t	\N	\N
5fa35058-a2b1-420d-a37c-655611980380	2025-11-03 20:59:23.204544	2025-11-03 20:59:23.204544	business_inventory.tier1_app_low_activity.support	Need help with business tracking?	Hi {name}, need help using your business tracker? We're here for you! Common questions: \n• How to record income? Open Oze → 'Add Income' → Enter amount → Add description → Select category → Save. \n• How to record expenses? Open Oze → 'Add Expense' → Enter amount → Add description → Select category → Save. \n• How to check profit? Open Oze → View your dashboard to see total profit.\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	business_inventory	\N	\N	t	\N	\N
b34934f9-1594-45c0-b60f-27f8d6574c33	2025-11-03 20:59:23.413648	2025-11-03 20:59:23.413648	business_inventory.tier1_app_low_activity.why	Why business tracking matters for your success	{name}, we know keeping records can feel like extra work. But running your business without tracking has real risks: \n• You don't know your real profit - money disappears \n• You can't see what's wasting money \n• You can't plan for growth \n• Banks won't lend without records \nBusiness tracking solves these problems. You see exactly where every cedi goes, identify money drains, and build records for loans. Smart business owners track everything. Take the first step today - you'll be glad you did!	business_inventory	\N	\N	t	\N	\N
d8580a57-13e5-49b0-932e-c41677de0f0a	2025-11-03 20:59:23.621568	2025-11-03 20:59:23.621568	business_inventory.first_tier1_app_engaged.reward	3 weeks of smart business tracking! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively tracking your business for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - professional business management. Congratulations!	business_inventory	\N	\N	t	\N	\N
d08f580a-3bc7-40c2-9810-5c423de1621d	2025-11-03 20:59:23.833348	2025-11-03 20:59:23.833348	business_inventory.tier1_app_engaged.celebrate	You're mastering business tracking!	Excellent work {name}! 🎉 Now that you are actively tracking your business you're: \n✓ Seeing your real profit clearly\n✓ Making data-driven business decisions \n✓ Building records that help you qualify for loans \n✓ Knowing exactly where your money goes \nYou're not just running a business - you're managing it like a professional. Keep it up!	business_inventory	\N	\N	t	\N	\N
7dff2aba-23e4-4d15-b488-6792d6deed8e	2025-11-03 20:59:24.042471	2025-11-03 20:59:24.042471	business_inventory.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with business tracking! Keep recording your transactions actively and earn 10 GHC in a few weeks. The more you track, the more clearly you see your profits and opportunities to grow. Keep it up!	business_inventory	\N	\N	t	\N	\N
99c6eac7-78da-40ce-bbc5-0fc539c2a9dc	2025-11-03 20:59:24.260792	2025-11-03 20:59:24.260792	business_inventory.tier1_app_engagement_dropoff.how	Come back to business tracking - we can help!	Hi {name}, we noticed you stopped tracking your business recently. Let's get you back on track! Quick reminders: \n• To record income: Open Oze → 'Add Income' → Enter amount → Add description → Select category → Save\n• To record expense: Open Oze → 'Add Expense' → Enter amount → Add description → Select category → Save\n• To check profit: View your dashboard\n\nWatch the video to learn how to make the most of your business tracker.	business_inventory	\N	\N	t	\N	\N
fddeb2e3-134e-41e0-b6bd-3de7522f28ea	2025-11-03 20:59:24.490532	2025-11-03 20:59:24.490532	business_inventory.tier1_app_engagement_dropoff.incentive	Don't lose your business tracking momentum!	{name}, you were doing so well with business tracking! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of seeing your real profit, making better decisions, and building records for loans.	business_inventory	\N	\N	t	\N	\N
311a1782-523a-4bac-86b9-3142c4ba55db	2025-11-03 20:59:24.709494	2025-11-03 20:59:24.709494	business_inventory.tier1_app_engagement_dropoff.reactivation	Your business tracker misses you - come back today!	{name}, we miss you! You were building something important with business tracking: clear profit visibility + records for loans + better decisions. Take 2 minutes today to record your transactions again and get back on track!	business_inventory	\N	\N	t	\N	\N
a370fe65-b318-4ced-aadc-c291617db83c	2025-11-03 20:59:24.921431	2025-11-03 20:59:24.921431	business_inventory.tier1_app_engagement_dropoff.why	Remember why you started business tracking	{name}, going back to memory or paper means going back to old problems: \n• No clarity: You don't know your real profit \n• Wasted money: You can't see what's draining cash \n• No proof: Can't qualify for loans without records \nBusiness tracking automatically shows you exactly where every cedi goes. You already learned how to use it. Don't give up the clarity and control you worked for. Your business success depends on it!	business_inventory	\N	\N	t	\N	\N
9cfceec6-3546-4c51-9e12-102a03d3614e	2025-11-03 20:59:25.1376	2025-11-03 20:59:25.1376	business_inventory.tier1_app_engagement_sustained.celebrate	You're a consistent business tracker!	Fantastic {name}! 🎉 You've maintained active business tracking for 6 weeks. This isn't luck - this is YOU taking professional control of your business! You've proven that: \n✓ You can manage your business with data \n✓ You have clear visibility into your finances \n✓ You're ready for business loans and growth \n✓ You make smart, informed decisions \nYou're thriving as a modern business owner. Congratulations!	business_inventory	\N	\N	t	\N	\N
08fb1bd3-77c4-4300-8101-ec0bc396b99f	2025-11-03 20:59:25.345319	2025-11-03 20:59:25.345319	business_inventory.first_tier1_app_retained.reward	9 weeks of professional business tracking! Collect your reward.	Exceptional achievement {name}! 🎉 You've tracked your business actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced professional business management. Amazing!	business_inventory	\N	\N	t	\N	\N
7ff06744-7c92-4a53-83ed-2675c0c0504f	2025-11-03 20:59:25.548458	2025-11-03 20:59:25.548458	business_inventory.tier1_app_retained.celebrate	You're a business management expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term business tracker. Look at what you've achieved: \n✓ 9+ weeks of consistent tracking \n✓ Complete visibility into your business finances \n✓ Strong records that open doors to loans \n✓ Professional management skills \nCongratulations!	business_inventory	\N	\N	t	\N	\N
55e11b72-987a-4b37-8107-c23f2b9dca48	2025-11-03 20:59:25.753565	2025-11-03 20:59:25.753565	business_inventory.tier1_app_retained.incentive	You're building real business power	{name}, you've proven you can manage your business professionally for 9+ weeks. This consistency is opening doors: lenders can see your strong business records and you're making better decisions every day. The longer you keep going, the more opportunities become available to you. Your business future is in your hands!	business_inventory	\N	\N	t	\N	\N
7a4b4385-bc14-4718-b1d5-63f015146a70	2025-11-03 20:59:25.979533	2025-11-03 20:59:25.979533	business_inventory.tier1_app_retention_dropoff.how	Let's solve your business tracking issue	Hi {name}, you were such a consistent business tracker! We noticed you haven't been active lately. Let's fix any issues: \n• To record income: Open Oze → 'Add Income' → Enter amount → Add description → Select category → Save\n• To record expense: Open Oze → 'Add Expense' → Enter amount → Add description → Select category → Save\n• To view reports: Open Oze → View dashboard for profit analysis\n\nWatch the video to learn how to make the most of your business tracker.	business_inventory	\N	\N	t	\N	\N
19ef2a22-0ae7-4f61-a5c2-538aef4d0599	2025-11-03 20:59:26.189493	2025-11-03 20:59:26.189493	business_inventory.tier1_app_retention_dropoff.incentive	Your business records are too valuable to lose	{name}, every week of business tracking you've built adds to your professional credibility. By stopping now, you're losing the complete financial picture you worked hard to build. Track your transactions this week and keep your business knowledge strong!	business_inventory	\N	\N	t	\N	\N
7130a06d-893b-449f-8ea1-3bd0f6970a97	2025-11-03 20:59:26.420302	2025-11-03 20:59:26.420302	business_inventory.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a business tracking champion	{name}, we miss you! Your consistent business tracking provided clear profit visibility + records for loans + better decisions. Make sure you don't let this slip away. Take 2 minutes today to record your transactions again and get back on track!	business_inventory	\N	\N	t	\N	\N
d548c9c4-b12c-4da4-8389-a2616529588e	2025-11-03 20:59:26.769563	2025-11-03 20:59:26.769563	business_inventory.tier1_app_retention_dropoff.why	Why your business tracking record matters	{name}, you spent many weeks building professional business habits. Here's what you lose by stopping: \n• No loan access: Banks need complete records to lend \n• Lost profits: Can't see what's draining your money \n• Poor decisions: Operating blind without data \n\nYou worked hard to become a professional business manager. Make sure that you continue to use this expertise to grow your business. Take two minutes today to track your transactions and get back on track.	business_inventory	\N	\N	t	\N	\N
6f86e824-9f94-4263-acf8-a4db4a723512	2025-11-03 20:59:26.978613	2025-11-03 20:59:26.978613	business_inventory.tier2_app_opened_first_time.celebrate	Welcome to business tracking!	Great start {name}! 🎉 You've opened your business tracking app for the first time. Work is your second most important goal. This is the beginning of something powerful - a smarter way to manage your business. With Oze, you can: \n✓ Track all your income and expenses \n✓ See your real profit clearly \n✓ Know exactly where your money goes \n✓ Build records for business loans \n\nTake the next step: Register your business!	business_inventory	\N	\N	t	\N	\N
919ea44f-4948-4c3d-9261-4473a40a7987	2025-11-03 20:59:27.189661	2025-11-03 20:59:27.189661	business_inventory.tier2_app_adopted.celebrate	You're taking control of your business!	Well done {name}! 🎉 You're now using business tracking. You've taken control of your business finances!	business_inventory	\N	\N	t	\N	\N
defd0dae-5b37-4594-b7d3-61e0be00bb71	2025-11-03 20:59:27.418537	2025-11-03 20:59:27.418537	business_inventory.tier2_app_registered.celebrate	Your business tracker is ready!	{name} congratulations on registering with Oze! 🎉 This is a major step forward! With your business tracker you can: \n✓ Record income and expenses\n✓ See your profit \n✓ Track sales \n✓ Build loan records \nAll from your phone!	business_inventory	\N	\N	t	\N	\N
9af04265-bc10-4e15-8533-37085b572c29	2025-11-03 20:59:27.629627	2025-11-03 20:59:27.629627	business_inventory.tier2_app_low_activity.how	Quick tips for business tracking	Hi {name}, we noticed you haven't used your business tracker much. Ready to try it? Here's a quick start: \n1. Open Oze app\n2. Record today's income or expenses\n3. View your profit dashboard \nStart small until you're comfortable!	business_inventory	\N	\N	t	\N	\N
46030925-fbc1-4a40-baeb-18d55f83d7ce	2025-11-03 20:59:27.840544	2025-11-03 20:59:27.840544	business_inventory.tier2_app_low_activity.incentive	Try business tracking	{name}, start using your business tracking app and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll see exactly where your money goes.	business_inventory	\N	\N	t	\N	\N
2f59b642-34cb-43b0-8702-9182910293bf	2025-11-03 20:59:28.080425	2025-11-03 20:59:28.080425	business_inventory.tier2_app_low_activity.support	Need help with business tracking?	Hi {name}, need help using your business tracker? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	business_inventory	\N	\N	t	\N	\N
625a0517-0d92-4b7f-a039-ae3cfebfa83a	2025-11-03 20:59:28.3019	2025-11-03 20:59:28.3019	business_inventory.tier2_app_low_activity.why	Business tracking makes business easier	{name}, business tracking offers real benefits: \n• See your real profit clearly \n• Know where money is wasted\n• Build records that help you qualify for loans\nGive it a try - many successful business owners already use it!	business_inventory	\N	\N	t	\N	\N
93ce8651-237d-4c78-8410-98dd48524090	2025-11-03 20:59:28.51063	2025-11-03 20:59:28.51063	business_inventory.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've tracked your business for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	business_inventory	\N	\N	t	\N	\N
9f3ca345-631c-4ab0-937b-3cfd3dd84020	2025-11-03 20:59:28.709579	2025-11-03 20:59:28.709579	business_inventory.tier2_app_engaged.celebrate	You're tracking your business!	Great job {name}! 🎉 As an active business tracker, you're seeing your real profit and making better decisions. You're building good business habits!	business_inventory	\N	\N	t	\N	\N
8a12435e-212e-45a2-bb5a-49b7d42e482a	2025-11-03 20:59:28.938447	2025-11-03 20:59:28.938447	business_inventory.tier2_app_engaged.incentive	Keep going with business tracking	{name}, you're doing well! Keep tracking your business and earn 10 GHC in a few weeks. Every transaction recorded counts!	business_inventory	\N	\N	t	\N	\N
f472438d-8403-4ea3-8474-1b03f956deea	2025-11-03 20:59:29.150468	2025-11-03 20:59:29.150468	business_inventory.tier2_app_engagement_dropoff.how	Quick business tracking reminder	Hi {name}, we noticed that you stopped tracking lately. Quick reminders: \n• To record income: Oze app → 'Add Income' → Enter amount → Save\n• To record expense: Oze app → 'Add Expense' → Enter amount → Save\n• To check profit: View your dashboard\n\nWatch the video for a refresher.	business_inventory	\N	\N	t	\N	\N
1931b2fe-8049-4a49-80b6-287280bdf340	2025-11-03 20:59:29.40759	2025-11-03 20:59:29.40759	business_inventory.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to business tracking and earn 10 GHC in a few weeks. It shows you real profits, prevents waste and helps you build records for loans.	business_inventory	\N	\N	t	\N	\N
a2e2d832-2177-4b36-bd23-a551d78235ec	2025-11-03 20:59:29.628432	2025-11-03 20:59:29.628432	business_inventory.tier2_app_engagement_dropoff.reactivation	Try business tracking again?	{name}, you started building good business habits with tracking. Take 2 minutes today to record your transactions again!	business_inventory	\N	\N	t	\N	\N
d3f5c3c7-2359-40c9-86c7-494259e6d17c	2025-11-03 20:59:29.860435	2025-11-03 20:59:29.860435	business_inventory.tier2_app_engagement_dropoff.why	Business tracking is clear and helpful	{name}, business tracking offers clarity and growth: \n• See exactly where money goes \n• Make better business decisions \n• Automatic records for loans \nYou already know how to use it - try it again!	business_inventory	\N	\N	t	\N	\N
31546a5a-cd11-4ec8-be8b-588a1a4e43f4	2025-11-03 20:59:30.082478	2025-11-03 20:59:30.082478	business_inventory.tier2_app_engagement_sustained.celebrate	6 weeks of business tracking!	Well done {name}! 🎉 You've tracked your business consistently for 6 weeks. You're managing your finances well and building good business records!	business_inventory	\N	\N	t	\N	\N
ba7cb321-928f-4aea-ac16-b3e2667fb36c	2025-11-03 20:59:30.337337	2025-11-03 20:59:30.337337	business_inventory.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency with business tracking!	Excellent {name}! 🎉 You've tracked your business for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	business_inventory	\N	\N	t	\N	\N
2ff9984f-88ac-4771-825d-7da3674ab714	2025-11-03 20:59:30.540577	2025-11-03 20:59:30.540577	business_inventory.tier2_app_retained.celebrate	You're a business tracker!	Impressive {name}! 🎉 You've been tracking your business consistently. You're managing money well and building solid business records. Well done!	business_inventory	\N	\N	t	\N	\N
ac8316fe-f679-4d8a-b24f-6a1a2efc7dad	2025-11-03 20:59:31.690442	2025-11-03 20:59:31.690442	business_inventory.tier2_app_retained.incentive	Keep your business tracking habit going	{name}, your consistent business tracking is turning into valuable professional habits. You see your profits clearly and make better decisions. Keep it up!	business_inventory	\N	\N	t	\N	\N
5fc9116b-9d2b-4d40-8fbc-249f19ca5806	2025-11-03 20:59:31.902582	2025-11-03 20:59:31.902582	business_inventory.tier2_app_retention_dropoff.how	Quick business tracking reminder	Hi {name}, we noticed that you stopped tracking lately. Quick reminders: \n• To record income: Oze app → 'Add Income' → Enter amount → Save\n• To record expense: Oze app → 'Add Expense' → Enter amount → Save\n• To check profit: View your dashboard\n\nWatch the video for a refresher.	business_inventory	\N	\N	t	\N	\N
ac105479-a212-4e3a-b064-44735046a4c8	2025-11-03 20:59:32.115437	2025-11-03 20:59:32.115437	business_inventory.tier2_app_retention_dropoff.incentive	Your business tracking is waiting	{name}, you built great business tracking habits. Come back and keep strengthening your business knowledge.	business_inventory	\N	\N	t	\N	\N
ebf6920f-e7f7-4c3d-ad23-59d819b6d310	2025-11-03 20:59:32.342691	2025-11-03 20:59:32.342691	business_inventory.tier2_app_retention_dropoff.reactivation	Come back to business tracking	{name}, you were doing great with business tracking! Use it again today and keep your business habits strong.	business_inventory	\N	\N	t	\N	\N
0e055ae3-d9c3-47e1-86bc-2455f2ef1f49	2025-11-03 20:59:32.588462	2025-11-03 20:59:32.588462	business_inventory.tier2_app_retention_dropoff.why	Keep your business progress	{name}, you built weeks of good business habits. Keep going to maintain: \n• Clear profit visibility \n• Better business decisions \n• Records for loans \nTrack today to stay on track!	business_inventory	\N	\N	t	\N	\N
fcf73747-ec3d-4ba7-9caf-58385f039b89	2025-11-03 20:59:32.831733	2025-11-03 20:59:32.831733	business_loan.tier1_app_opened_first_time.celebrate	Welcome to Fido!	Great start {name}! 🎉 You've opened your Fido app for the first time. Work is your most important goal. This is the beginning of something powerful - access to funds when you need them most. With Fido, you can: \n✓ Get quick loans for business needs \n✓ Access emergency funds instantly \n✓ Build a credit history for your future \n\nTake the next step: Register your account!	business_loan	\N	\N	t	\N	\N
48de9a09-36f5-4e63-90ed-105f4d5ba004	2025-11-03 20:59:33.069475	2025-11-03 20:59:33.069475	business_loan.tier1_app_adopted.celebrate	You're taking control of your finances!	Well done {name}! 🎉 You're now using Fido. You've taken control of your financial opportunities! By having access to instant credit, you're: \n✓ Prepared for business opportunities \n✓ Ready for unexpected expenses \n✓ Building a credit history \nKeep going!	business_loan	\N	\N	t	\N	\N
31f60b9d-075b-4324-8c37-26a0f04948b5	2025-11-03 20:59:33.286522	2025-11-03 20:59:33.286522	business_loan.tier1_app_registered.celebrate	Your Fido account is ready!	{name} congratulations on registering for Fido! 🎉 This is a major step forward! With your Fido account you can: \n✓ Access quick loans \n✓ Get funds for business stock \n✓ Handle emergency expenses \n✓ Build your credit history \nAll from your phone!	business_loan	\N	\N	t	\N	\N
d1f02ecc-103b-4f55-8a9c-2badfe9d7d5c	2025-11-03 20:59:33.499444	2025-11-03 20:59:33.499444	business_loan.tier1_app_low_activity.how	Get the most from your Fido account	Hi {name}, we noticed you haven't used your Fido account much. Here's how to access a loan: \n1. Open the Fido app\n2. Click on 'Borrow Money'\n3. Choose your loan amount (start small - 20-50 cedis)\n4. Select your repayment period\n5. Review the terms and confirm\nThe money will arrive in your mobile money within minutes!	business_loan	\N	\N	t	\N	\N
a0a09b42-9eb2-4c06-82b0-ec725b74decd	2025-11-03 20:59:33.710471	2025-11-03 20:59:33.710471	business_loan.tier1_app_low_activity.incentive	Your loan opportunity is waiting - start using Fido!	{name}, start using your Fido account and earn a reward of 10 GHC in just three weeks! Every loan you take and repay on time builds your credit record and opens doors to larger amounts. \nThe sooner you start, the sooner you'll have financial flexibility for opportunities. Try one loan today!	business_loan	\N	\N	t	\N	\N
c0046c06-4c51-4a8b-9a2d-0048e865fe00	2025-11-03 20:59:33.932428	2025-11-03 20:59:33.932428	business_loan.tier1_app_low_activity.support	Need help with Fido?	Hi {name}, need help using your Fido account? We're here for you! Common questions: \n• How to apply for a loan? Open Fido app → Click 'Borrow Money' → Choose amount → Select repayment period → Review terms → Confirm\n• How much can I borrow? Most people start with 50-500 cedis. Your limit grows as you repay on time\n• When do I get the money? Money arrives in your mobile wallet within minutes\n• Forgot your PIN? Click on 'Forgot PIN' in the app to reset it\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	business_loan	\N	\N	t	\N	\N
b00a4813-0e1c-4f0a-b920-632350907728	2025-11-03 20:59:34.138401	2025-11-03 20:59:34.138401	business_loan.tier1_app_low_activity.why	Why Fido matters for your opportunities	{name}, we know borrowing can feel uncertain. But life brings opportunities and emergencies that need quick action: \n• Business stock opportunities - don't miss out because of cash shortage \n• Equipment repairs - get back to work quickly \n• School fees - handle education costs on time \n• Emergency expenses - access funds when family needs help \n\nFido solves these problems. Your money is available quickly, terms are transparent, and timely repayment builds a credit history. Others in your community already trust it. Take the first step today - you'll be glad you did!	business_loan	\N	\N	t	\N	\N
9cb6af86-7c85-4ec4-a360-8a0fd4b81da7	2025-11-03 20:59:34.350419	2025-11-03 20:59:34.350419	business_loan.first_tier1_app_engaged.reward	3 weeks of smart borrowing! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using Fido for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - a credit history that opens doors to larger opportunities. Congratulations!	business_loan	\N	\N	t	\N	\N
13596df2-45da-4406-bdb6-976017c9cc5b	2025-11-03 20:59:34.589518	2025-11-03 20:59:34.589518	business_loan.tier1_app_engaged.celebrate	You're mastering smart borrowing!	Excellent work {name}! 🎉 As an active Fido user you're: \n✓ Accessing funds when opportunities arise\n✓ Building a strong credit history \n✓ Creating financial flexibility that helps you qualify for larger loans \n✓ Always having backup for business needs or emergencies \nYou're not just borrowing - you're building your financial future. Keep it up!	business_loan	\N	\N	t	\N	\N
c7de79fb-7710-4d5b-9cef-9032e45396a3	2025-11-03 20:59:34.806373	2025-11-03 20:59:34.806373	business_loan.tier1_app_engaged.incentive	Keep going - bigger loans ahead!	{name}, you're doing great with Fido! Keep using it actively and repaying on time to earn 10 GHC in a few weeks. The more you build your credit history, the more opportunities open up for you. Keep it up!	business_loan	\N	\N	t	\N	\N
98d4e122-c488-402a-b908-263dce479838	2025-11-03 20:59:35.027606	2025-11-03 20:59:35.027606	business_loan.tier1_app_engagement_dropoff.how	Come back to Fido - access funds when you need them!	Hi {name}, we noticed you stopped using Fido recently. Remember, you have instant access to loans when you need them! Quick reminders: \n• To borrow: Open Fido app → Click 'Borrow Money' → Choose amount → Select repayment period → Review terms → Confirm\n• To check your limit: Open Fido app → View your available loan amount\n• To see repayment: Open Fido app → Check your active loans and due dates\n\nYour credit limit is ready and waiting for when opportunities arise!	business_loan	\N	\N	t	\N	\N
882fefaf-2a43-416a-89ac-225aed38bc9f	2025-11-03 20:59:35.287141	2025-11-03 20:59:35.287141	business_loan.tier1_app_engagement_dropoff.incentive	Don't lose your Fido access!	{name}, you were building such great credit history with Fido! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of having instant access to funds for opportunities and emergencies.	business_loan	\N	\N	t	\N	\N
c3daa10e-7b8d-402b-ab97-d634f0c4f416	2025-11-03 20:59:35.499195	2025-11-03 20:59:35.499195	business_loan.tier1_app_engagement_dropoff.reactivation	Your loan access is waiting - come back today!	{name}, we miss you! You were building something important with Fido: a credit history that opens doors to larger loans and better opportunities. Take 2 minutes today to access a loan again and get back on track!	business_loan	\N	\N	t	\N	\N
3a980d0a-bb1d-4934-ac04-37ce503e0e07	2025-11-03 20:59:35.714113	2025-11-03 20:59:35.714113	business_loan.tier1_app_engagement_dropoff.why	Remember why you started using Fido	{name}, not having access to quick loans means missing opportunities: \n• Business opportunities: Can't buy stock when prices are good - competitors do \n• Emergency expenses: Back to borrowing from friends or high-interest lenders \n• No credit record: Can't prove creditworthiness for larger opportunities\n\nYou already learned how to use Fido and started building your credit. Don't give up the financial flexibility you worked for. Your future self will thank you!	business_loan	\N	\N	t	\N	\N
63b00dd5-dfdc-4130-9e6b-abf117d93ddd	2025-11-03 20:59:35.979074	2025-11-03 20:59:35.979074	business_loan.tier1_app_engagement_sustained.celebrate	You're a consistent Fido user!	Fantastic {name}! 🎉 You've maintained active Fido use for 6 weeks. This isn't luck - this is YOU taking control of your financial opportunities! You've proven that: \n✓ You can manage credit responsibly \n✓ You handle finances smartly \n✓ You're ready for larger loan opportunities \n✓ You're securing your business's future \nYou're thriving and you're an example to others. Congratulations!	business_loan	\N	\N	t	\N	\N
f82b6f7f-0eaa-41b8-88d3-01091884f225	2025-11-03 20:59:36.190383	2025-11-03 20:59:36.190383	business_loan.first_tier1_app_retained.reward	9 weeks of smart borrowing! Collect your reward.	Exceptional achievement {name}! 🎉 You've used Fido actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced smart credit management. Amazing!	business_loan	\N	\N	t	\N	\N
b46fea2b-5634-41ea-be38-9f96766d2339	2025-11-03 20:59:36.395559	2025-11-03 20:59:36.395559	business_loan.tier1_app_retained.celebrate	You're a Fido expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term Fido user. Look at what you've achieved: \n✓ 9+ weeks of consistent smart borrowing \n✓ Financial flexibility for opportunities \n✓ A strong credit record that opens doors \n✓ Confidence managing credit \nCongratulations!	business_loan	\N	\N	t	\N	\N
62619890-3bc8-42c7-99fb-29ad630dcb2d	2025-11-03 20:59:36.599291	2025-11-03 20:59:36.599291	business_loan.tier1_app_retained.incentive	You're building real financial power	{name}, you've proven you can manage credit responsibly for 9+ weeks. This consistency is opening doors: lenders can see your excellent repayment record and you're ready for larger loan opportunities. The longer you keep going, the more opportunities become available to you. Your financial future is in your hands!	business_loan	\N	\N	t	\N	\N
8b9e3c6d-a005-401c-9007-caad6942956f	2025-11-03 21:01:04.929278	2025-11-03 21:01:04.929278	women_child_health.tier2_app_engagement_dropoff.how	Quick Bebbo reminder	Hi {name}, we noticed that you stopped using Bebbo lately. Quick reminders: \n• Open the Bebbo app \n• Click on topics that interest you \n• Read articles and watch videos about child health and development \n• Try suggested activities with your child \n\nCome back today to continue your parenting journey!	women_child_health	\N	\N	t	["https://drive.google.com/file/d/1Ik6as0gK9Q4v8Rtc9eVaFOSSAb_Cgw2M/view?usp=drive_link"]	\N
cc36e82e-e217-4aa0-8b83-1b65f7f0a9e2	2025-11-03 20:59:36.807156	2025-11-03 20:59:36.807156	business_loan.tier1_app_retention_dropoff.how	Let's solve your Fido issue	Hi {name}, you were such a consistent Fido user! We noticed you haven't been active lately. Let's fix any issues: \n• To borrow again: Open Fido app → Click 'Borrow Money' → Choose amount → Select repayment period → Review terms → Confirm\n• Check your limit: Open app → View available amount\n• Review repayment: Open app → Check active loans and due dates\n• Need to repay? Open app → Select loan → Choose payment method → Complete payment\n\nDon't let your excellent credit history go to waste!	business_loan	\N	\N	t	\N	\N
6909a1b1-8f70-40f0-9a1f-005bdd7c8ee9	2025-11-03 20:59:37.020505	2025-11-03 20:59:37.020505	business_loan.tier1_app_retention_dropoff.incentive	Your credit history is too valuable to lose	{name}, every week of Fido use you've built adds to your credit credibility. By stopping now, you risk losing momentum on your excellent borrowing record. Use Fido this week and keep your financial options open!	business_loan	\N	\N	t	\N	\N
057da1f3-f0e3-4510-9dce-ed2d424c8e47	2025-11-03 20:59:37.229281	2025-11-03 20:59:37.229281	business_loan.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a Fido champion	{name}, we miss you! Your consistent use of Fido built a credit history that qualifies you for larger loans and better opportunities. Don't let this slip away. Take 2 minutes today to access a loan again and get back on track!	business_loan	\N	\N	t	\N	\N
707cd630-b24c-4242-8591-801bdc682c27	2025-11-03 20:59:37.459285	2025-11-03 20:59:37.459285	business_loan.tier1_app_retention_dropoff.why	Why your Fido track record matters	{name}, you spent many weeks building excellent credit habits. Here's what you lose by stopping: \n• Credit history: No active borrowing record means lenders can't see your reliability\n• Lost opportunities: Back to missing business chances due to cash shortages \n• Higher costs: Back to informal lenders with high interest rates \n\nYou worked hard to become a trusted Fido user. Make sure that you continue to use this access to improve your business goals. Take two minutes today to borrow again and get back on track.	business_loan	\N	\N	t	\N	\N
8a38a669-8892-4892-bd8c-d711707ba943	2025-11-03 20:59:37.672421	2025-11-03 20:59:37.672421	business_loan.tier2_app_opened_first_time.celebrate	Welcome to Fido!	Great start {name}! 🎉 You've opened your Fido app for the first time. Work is your second most important goal. This is the beginning of something powerful - access to funds when you need them most. With Fido, you can: \n✓ Get quick loans for business needs \n✓ Access emergency funds instantly \n✓ Pay for unexpected expenses \n✓ Build a credit history for your future \n\nTake the next step: Register your account!	business_loan	\N	\N	t	\N	\N
8e2a40f4-ec6e-446e-9b2f-26488d12a1e6	2025-11-03 20:59:37.900035	2025-11-03 20:59:37.900035	business_loan.tier2_app_adopted.celebrate	You're taking control of your finances!	Well done {name}! 🎉 You're now using Fido. You've taken control of your financial opportunities!	business_loan	\N	\N	t	\N	\N
221693cc-476a-4201-ab58-f169f5f4f0b1	2025-11-03 20:59:38.113175	2025-11-03 20:59:38.113175	business_loan.tier2_app_registered.celebrate	Your Fido account is ready!	{name} congratulations on registering for Fido! 🎉 This is a major step forward! With your Fido account you can: \n✓ Access quick loans \n✓ Get funds for business needs \n✓ Handle emergency expenses \n✓ Build your credit history \nAll from your phone!	business_loan	\N	\N	t	\N	\N
f0525641-8668-4573-a1fe-5d042def14a4	2025-11-03 20:59:38.419181	2025-11-03 20:59:38.419181	business_loan.tier2_app_low_activity.how	Quick tips for Fido	Hi {name}, we noticed you haven't used your Fido account much. Ready to access loans? Here's a quick start: \n1. Open the Fido app\n2. Click on 'Borrow Money'\n3. Choose a small amount to start (20-50 cedis)\n4. Select repayment period\n5. Review and confirm \nStart small until you're comfortable!	business_loan	\N	\N	t	\N	\N
e396237f-f900-4a98-a1e9-2a0094b72fda	2025-11-03 20:59:38.638245	2025-11-03 20:59:38.638245	business_loan.tier2_app_low_activity.incentive	Try Fido	{name}, start using your Fido account and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll have financial flexibility for opportunities.	business_loan	\N	\N	t	\N	\N
76de4bfe-f3ba-4fc5-97fd-dafd5f43fa67	2025-11-03 20:59:38.862224	2025-11-03 20:59:38.862224	business_loan.tier2_app_low_activity.support	Need help with Fido?	Hi {name}, need help using your Fido account? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	business_loan	\N	\N	t	\N	\N
cf2a3083-79bf-4487-ae90-9d1112258b83	2025-11-03 20:59:39.090212	2025-11-03 20:59:39.090212	business_loan.tier2_app_low_activity.why	Fido makes life easier	{name}, Fido offers real benefits: \n• Access funds quickly for business opportunities \n• Handle emergencies without borrowing from friends\n• Build a credit record that qualifies you for larger loans\nGive it a try - many in your community already use it!	business_loan	\N	\N	t	\N	\N
4e77e9c7-65f3-4778-9468-1903271eb606	2025-11-03 20:59:39.300516	2025-11-03 20:59:39.300516	business_loan.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used Fido for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	business_loan	\N	\N	t	\N	\N
1b59c844-7ece-4ee0-acc3-a0c79dc8ec81	2025-11-03 20:59:39.521338	2025-11-03 20:59:39.521338	business_loan.tier2_app_engaged.celebrate	You're using Fido!	Great job {name}! 🎉 As an active Fido user, you're accessing funds quickly and building good credit habits!	business_loan	\N	\N	t	\N	\N
fa4ba1f6-4a5a-4edb-a985-78fb064dac5a	2025-11-03 20:59:39.736074	2025-11-03 20:59:39.736074	business_loan.tier2_app_engaged.incentive	Keep going with Fido	{name}, you're doing well! Keep using Fido and earn 10 GHC in a few weeks. Every loan repaid on time counts!	business_loan	\N	\N	t	\N	\N
81ea86a1-edc9-402b-b35d-097fe91689b5	2025-11-03 20:59:39.944323	2025-11-03 20:59:39.944323	business_loan.tier2_app_engagement_dropoff.how	Quick Fido reminder	Hi {name}, we noticed that you stopped using Fido lately. Quick reminders: \n• To borrow: Open Fido app → Click 'Borrow Money' → Choose amount → Select repayment period → Confirm\n• To check limit: Open app → View available amount\n• To repay: Open app → Select loan → Complete payment\n\nCome back and use your loan access!	business_loan	\N	\N	t	\N	\N
f72af378-bed1-4ee6-b816-0afb1e2dbd3b	2025-11-03 20:59:40.178204	2025-11-03 20:59:40.178204	business_loan.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Fido and earn 10 GHC in a few weeks. It gives you instant access to funds and helps you build a credit record.	business_loan	\N	\N	t	\N	\N
fbe639ec-e6cf-421e-9426-f66e4371cf28	2025-11-03 20:59:40.405272	2025-11-03 20:59:40.405272	business_loan.tier2_app_engagement_dropoff.reactivation	Try Fido again?	{name}, you started building good financial habits with Fido. Take 2 minutes today to use it again!	business_loan	\N	\N	t	\N	\N
676d172a-f636-4dc5-b21c-fb95a3593a6a	2025-11-03 20:59:40.620135	2025-11-03 20:59:40.620135	business_loan.tier2_app_engagement_dropoff.why	Fido is quick and reliable	{name}, Fido offers quick access and builds your credit: \n• Get loans instantly vs. waiting or asking friends \n• Build credit history for future opportunities \n• Transparent terms and rates \nYou already know how to use it - try it again!	business_loan	\N	\N	t	\N	\N
4fdaecab-1589-43af-85f3-6edeed2cd3f4	2025-11-03 20:59:40.829183	2025-11-03 20:59:40.829183	business_loan.tier2_app_engagement_sustained.celebrate	6 weeks of smart borrowing!	Well done {name}! 🎉 You've used Fido consistently for 6 weeks. You're managing credit well and building a good credit record!	business_loan	\N	\N	t	\N	\N
540805c6-b5f5-477e-8fdd-11a0690ef33d	2025-11-03 20:59:41.040579	2025-11-03 20:59:41.040579	business_loan.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency with Fido!	Excellent {name}! 🎉 You've used Fido for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	business_loan	\N	\N	t	\N	\N
b796a678-ce79-46c2-bd9c-ca1b1ab3e56f	2025-11-03 20:59:41.280207	2025-11-03 20:59:41.280207	business_loan.tier2_app_retained.celebrate	You're a Fido user!	Impressive {name}! 🎉 You've been using Fido consistently. You're managing credit responsibly and building a solid credit record. Well done!	business_loan	\N	\N	t	\N	\N
596de8b3-f48f-4359-b3f1-acae99d5e4bd	2025-11-03 20:59:41.494103	2025-11-03 20:59:41.494103	business_loan.tier2_app_retained.incentive	Keep your Fido habit going	{name}, your consistent Fido use is building valuable credit habits. Your credit record is growing and you have financial flexibility. Keep it up!	business_loan	\N	\N	t	\N	\N
d491c9ea-1407-4a42-a2cd-c21cc914d3d1	2025-11-03 20:59:41.701174	2025-11-03 20:59:41.701174	business_loan.tier2_app_retention_dropoff.how	Quick Fido reminder	Hi {name}, we noticed that you stopped using Fido lately. Quick reminders: \n• To borrow: Open Fido app → Click 'Borrow Money' → Choose amount → Select repayment period → Confirm\n• To check limit: Open app → View available amount\n• To repay: Open app → Select loan → Complete payment\n\nCome back and keep your credit record active!	business_loan	\N	\N	t	\N	\N
e0caeeaf-d58c-45bb-80db-e98dc612d5ff	2025-11-03 20:59:41.902228	2025-11-03 20:59:41.902228	business_loan.tier2_app_retention_dropoff.incentive	Your Fido access is waiting	{name}, you built great credit habits with Fido. Come back and keep strengthening your credit record.	business_loan	\N	\N	t	\N	\N
210221d4-9dec-438c-a389-507ba50240d9	2025-11-03 20:59:42.210205	2025-11-03 20:59:42.210205	business_loan.tier2_app_retention_dropoff.reactivation	Come back to Fido	{name}, you were doing great with Fido! Use it again today and keep your financial habits strong.	business_loan	\N	\N	t	\N	\N
62e06fe2-009f-453b-b624-7c7d10aeb0a7	2025-11-03 20:59:42.421254	2025-11-03 20:59:42.421254	business_loan.tier2_app_retention_dropoff.why	Keep your financial progress	{name}, you built weeks of good credit habits. Keep going to maintain: \n• Your credit record \n• Quick access to funds \n• Financial flexibility for opportunities \nUse it today to stay on track!	business_loan	\N	\N	t	\N	\N
86c2d174-88d5-4104-a86f-3a48b6d9251d	2025-11-03 20:59:42.632387	2025-11-03 20:59:42.632387	farmer_education.tier1_app_opened_first_time.celebrate	Welcome to farming education!	Great start {name}! 🎉 You've opened the Access Agriculture app for the first time. Work is your most important goal. This is the beginning of something powerful - expert farming advice at your fingertips. With Access Agriculture, you can:\n✓ Learn farming techniques from experienced farmers\n✓ Watch easy-to-follow videos in your language\n✓ Improve your harvest and increase your income\n✓ Access advice anytime, anywhere\n\nTake the next step: Register your account!	farmer_education	\N	\N	t	\N	\N
a023c0ed-e8c9-409d-a94a-40b1350a5389	2025-11-03 20:59:42.884264	2025-11-03 20:59:42.884264	farmer_education.tier1_app_adopted.celebrate	You're on the path to better farming!	Well done {name}! 🎉 You're now using Access Agriculture. You've taken an important step toward farming success! By learning from expert farmers, you're:\n✓ Gaining knowledge that increases yields\n✓ Learning techniques that reduce losses\n✓ Building skills that boost your income\n✓ Accessing free farming advice whenever you need it\nKeep going!	farmer_education	\N	\N	t	\N	\N
072de6d6-88b6-40da-866d-59a0e54c8f47	2025-11-03 20:59:43.211167	2025-11-03 20:59:43.211167	farmer_education.tier1_app_registered.celebrate	Your farming education journey begins!	{name}, congratulations on registering for Access Agriculture! 🎉 This is a major step forward! With your account you can:\n✓ Watch farming videos in your language\n✓ Learn from experienced farmers\n✓ Discover techniques for better crops\n✓ Save your favorite videos for later\n✓ Build the knowledge that transforms your harvest\nAll from your phone!	farmer_education	\N	\N	t	\N	\N
3be39dee-5865-41a2-9c69-0f528ef6de20	2025-11-03 20:59:43.426378	2025-11-03 20:59:43.426378	farmer_education.tier1_app_low_activity.how	Learn from expert farmers - here's how	Hi {name}, we noticed you haven't used Access Agriculture much. Here's how to find farming advice:\n1. Open the Access Agriculture app\n2. Click on Video Library\n3. Click on Category to see topics like vegetables, livestock, or soil\n4. Pick a topic that interests you\n5. Select the language for the video\n6. Click on a video to start learning\n\nWatch the video to learn how to make the most of Access Agriculture.	farmer_education	\N	\N	t	["https://drive.google.com/file/d/1vDLE9lAlBZg-J8du4nHl0ZE1bcPiIIDE/view?usp=drive_link"]	\N
5309445f-b373-4bf7-9216-b3b0efe8a0bd	2025-11-03 20:59:43.650336	2025-11-03 20:59:43.650336	farmer_education.tier1_app_low_activity.incentive	Your farming knowledge reward is waiting!	{name}, start learning from Access Agriculture and earn a reward of 10 GHC in just three weeks! Every farming technique you learn can help you increase your harvest and earn more. Knowledge from expert farmers is the difference between struggling and succeeding. The sooner you start, the sooner you'll see better results on your farm. Watch one video today!	farmer_education	\N	\N	t	\N	\N
ddb76452-2725-4092-9153-339f69511e31	2025-11-03 20:59:43.874268	2025-11-03 20:59:43.874268	farmer_education.tier1_app_low_activity.support	Need help learning from expert farmers?	Hi {name}, need help using Access Agriculture? We're here for you! Common questions:\n• How to find farming videos? Open the app, click Video Library, select a category (like vegetables or livestock), then pick your language\n• How to save videos? Click the 'favorite' button to save videos you want to watch again\n• No internet? Download videos to watch offline anytime\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	farmer_education	\N	\N	t	\N	\N
31b3a8f9-9172-4769-b0b4-8bb02cd05abc	2025-11-03 20:59:44.090398	2025-11-03 20:59:44.090398	farmer_education.tier1_app_low_activity.why	Why farming education matters for your success	{name}, we know trying new learning methods can feel uncertain. But traditional farming alone has challenges:\n• Lower yields without modern techniques\n• Losses from pests and diseases\n• Missing out on better farming methods\n• No access to expert advice when you need it\n\nAccess Agriculture solves these problems. You get free expert advice in your language that helps you grow more and earn more. Thousands of farmers are already learning. Take the first step today - your harvest will thank you!	farmer_education	\N	\N	t	\N	\N
c5099f71-2b12-4b3c-8849-1f5e376eaf5e	2025-11-03 20:59:44.302157	2025-11-03 20:59:44.302157	farmer_education.first_tier1_app_engaged.reward	3 weeks of farming education! Collect your reward.	Incredible achievement {name}! 🎉 You've been learning from Access Agriculture for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're building farming knowledge that increases your income. Congratulations!	farmer_education	\N	\N	t	\N	\N
ba390b62-fb01-4db6-bd30-34104d914817	2025-11-03 20:59:44.525402	2025-11-03 20:59:44.525402	farmer_education.tier1_app_engaged.celebrate	You're becoming a smarter farmer!	Excellent work {name}! 🎉 Now that you're actively learning from Access Agriculture, you're:\n✓ Gaining expert farming knowledge\n✓ Learning techniques that improve your harvest\n✓ Building skills that reduce losses\n✓ Accessing advice that increases your income\n✓ Joining thousands of successful farmers\n\nYou're not just farming - you're farming smarter. Keep it up!	farmer_education	\N	\N	t	\N	\N
eda56215-1afd-4a8c-9f95-120eb9f12443	2025-11-03 20:59:44.749243	2025-11-03 20:59:44.749243	farmer_education.tier1_app_engaged.incentive	Keep learning - bigger harvests ahead!	{name}, you're doing great with farming education! Keep watching and learning to earn 10 GHC in a few weeks. The more farming techniques you learn, the better your harvests become. Every video brings you closer to farming success. Keep it up!	farmer_education	\N	\N	t	\N	\N
b5af1b77-bb80-4b84-a1b3-995b03b23ce6	2025-11-03 21:01:05.149212	2025-11-03 21:01:05.149212	women_child_health.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Bebbo and earn 10 GHC in a few weeks. It helps you understand your child's development and gives you expert health guidance.	women_child_health	\N	\N	t	\N	\N
032fe3bf-937b-441e-8afd-46ace848199d	2025-11-03 20:59:44.95434	2025-11-03 20:59:44.95434	farmer_education.tier1_app_engagement_dropoff.how	Come back to farming education - we can help!	Hi {name}, we noticed you stopped using Access Agriculture recently. Let's get you back to learning! Quick reminders:\n• To find videos: Open app → Video Library → Select category (vegetables, livestock, soil) → Pick your language → Watch\n• To save videos: Click the 'favorite' button on any video you want to watch again\n• To download: Click 'Download' to save videos and watch offline\n\nWatch the video below to learn how to make the most of your farming education.	farmer_education	\N	\N	t	["https://drive.google.com/file/d/1vDLE9lAlBZg-J8du4nHl0ZE1bcPiIIDE/view?usp=drive_link"]	\N
c9da1ba3-6822-476f-9ebd-9e62e0874c95	2025-11-03 20:59:45.17907	2025-11-03 20:59:45.17907	farmer_education.tier1_app_engagement_dropoff.incentive	Don't lose your farming learning momentum!	{name}, you were learning so well from expert farmers! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits - better farming techniques, higher yields, and increased income. Every video you watch makes you a better farmer!	farmer_education	\N	\N	t	\N	\N
0a316cca-6019-4264-a455-1a59e8bc83a6	2025-11-03 20:59:45.392293	2025-11-03 20:59:45.392293	farmer_education.tier1_app_engagement_dropoff.reactivation	Your farming knowledge is waiting - come back today!	{name}, we miss you! You were building important farming skills that increase your harvest and income. Take 5 minutes today to watch one farming video and get back on track to farming success!	farmer_education	\N	\N	t	\N	\N
2e64e7c1-dc17-4c79-9188-18a234ce0b3c	2025-11-03 20:59:45.699326	2025-11-03 20:59:45.699326	farmer_education.tier1_app_engagement_dropoff.why	Remember why you started learning better farming	{name}, going back to farming without expert advice means:\n• Missing out on techniques that increase yields\n• Losing crops to preventable pests and diseases\n• Working harder without earning more\n• No access to knowledge that transforms farms\n\nYou already started learning from expert farmers. Don't give up the knowledge that leads to better harvests. Your future harvest will thank you!	farmer_education	\N	\N	t	\N	\N
c0de0321-bea5-4125-94c5-e9bf4ca5eeab	2025-11-03 21:01:05.365121	2025-11-03 21:01:05.365121	women_child_health.tier2_app_engagement_dropoff.reactivation	Try Bebbo again?	{name}, you started learning good parenting habits with Bebbo. Take 2 minutes today to use it again!	women_child_health	\N	\N	t	\N	\N
5cd81a8b-f709-42d4-94b2-797c01aba258	2025-11-03 21:01:05.579395	2025-11-03 21:01:05.579395	women_child_health.tier2_app_engagement_dropoff.why	Bebbo gives you parenting confidence	{name}, Bebbo offers guidance and peace of mind: \n• Trusted health information at your fingertips \n• Learn what to expect as your child grows \n• Activities that help your child develop \nYou already know how to use it - try it again!	women_child_health	\N	\N	t	\N	\N
a99b5fbd-8694-455f-b352-f283c50c4631	2025-11-03 21:01:05.789172	2025-11-03 21:01:05.789172	women_child_health.tier2_app_engagement_sustained.celebrate	6 weeks of Bebbo!	Well done {name}! 🎉 You've used Bebbo consistently for 6 weeks. You're learning and growing as a parent, building knowledge that helps your child thrive!	women_child_health	\N	\N	t	\N	\N
e9b01ff6-df4c-4b2f-b1a7-8df9457fae88	2025-11-03 21:01:06.04323	2025-11-03 21:01:06.04323	women_child_health.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency with Bebbo!	Excellent {name}! 🎉 You've used Bebbo for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	women_child_health	\N	\N	t	\N	\N
f0f41981-b3b6-4174-9efb-663d5bc9614d	2025-11-03 21:01:06.243355	2025-11-03 21:01:06.243355	women_child_health.tier2_app_retained.celebrate	You're a committed parent!	Impressive {name}! 🎉 You've been using Bebbo consistently. You're raising your child with expert guidance and building a healthier future. Well done!	women_child_health	\N	\N	t	\N	\N
e17483a8-8ac9-4c1e-8e2b-1104190dc0af	2025-11-03 21:01:06.459187	2025-11-03 21:01:06.459187	women_child_health.tier2_app_retained.incentive	Keep your Bebbo habit going	{name}, your consistent Bebbo use is building valuable parenting knowledge. Your child benefits from everything you learn. Keep it up!	women_child_health	\N	\N	t	\N	\N
763b91ef-b36a-4133-9be4-a964c1dbb0c4	2025-11-03 21:01:07.138126	2025-11-03 21:01:07.138126	women_child_health.tier2_app_retention_dropoff.how	Quick Bebbo reminder	Hi {name}, we noticed that you stopped using Bebbo lately. Quick reminders: \n• Open the Bebbo app \n• Click on topics that interest you \n• Read articles and watch videos \n• Try activities with your child \n\nCome back today to continue learning!	women_child_health	\N	\N	t	["https://drive.google.com/file/d/1Ik6as0gK9Q4v8Rtc9eVaFOSSAb_Cgw2M/view?usp=drive_link"]	\N
d7a3aede-4825-4317-8dea-eb12848e029e	2025-11-03 21:01:07.380137	2025-11-03 21:01:07.380137	women_child_health.tier2_app_retention_dropoff.incentive	Your parenting knowledge is waiting	{name}, you built great habits with Bebbo. Come back and keep learning and growing as a parent.	women_child_health	\N	\N	t	\N	\N
48955d06-b0de-4dda-89b2-a8355c26c487	2025-11-03 21:01:07.619348	2025-11-03 21:01:07.619348	women_child_health.tier2_app_retention_dropoff.reactivation	Come back to Bebbo	{name}, you were doing great with Bebbo! Use it again today and keep your parenting knowledge growing.	women_child_health	\N	\N	t	\N	\N
993b4b2e-48d7-43c8-85f0-0a5ce7f48df2	2025-11-03 21:01:07.833233	2025-11-03 21:01:07.833233	women_child_health.tier2_app_retention_dropoff.why	Keep your parenting progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	women_child_health	\N	\N	t	\N	\N
56e99010-a8bd-4188-b15b-136c4430b431	2025-11-03 21:00:47.059299	2025-11-03 21:00:47.059299	uniti.uniti_registration_complete.reward	40 GHC + 1GB earned! Welcome to your digital future	Incredible achievement {name}! 🎉 You've completed your full Uniti onboarding and earned 40 GHC + 1GB. \nThe cash and data will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're no longer just getting started - you're READY. Now it's time to register in your apps and start your journey. The future is in your hands!	uniti_messages	\N	\N	t	\N	\N
8007a8e5-9b6b-45f9-8ed9-0ef8f757ba28	2025-11-03 21:00:44.579185	2025-11-03 21:00:44.579185	uniti.goals_setting_started_abandoned.how	Quick help: Finish setting your goals	Hi {name}, we noticed you started setting your goals but didn't finish. It's easy! Here's how: \n1. Open the Uniti app.\n2. Choose up to 3 goals for each category.\n3. Choose the 2 most important categories for you (Health, Finance, Work or Education).\nIt takes 2 minutes and it helps us recommend the right apps for YOU.\n\nWatch the video below for step by step guidance:\n<How to set your goals>	uniti_messages	\N	\N	t	\N	\N
87080320-42ff-4513-b3c0-a4031d0221b8	2025-11-03 21:00:44.376051	2025-11-03 21:00:44.376051	uniti.phone_verification_complete.celebrate	Welcome to Uniti! Your phone is verified	Congratulations {name}! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	uniti_messages	\N	\N	t	\N	\N
a32631cb-08df-4ade-ba1a-de892abdd523	2025-11-03 21:00:45.230557	2025-11-03 21:00:45.230557	uniti.goals_setting_started_abandoned.why	Why your goals matter	{name}, choosing your goals helps us give you the RIGHT apps for YOUR life. Without goals, you might miss apps that could:\n• Help you save for your children's education\n• Connect you to doctors from home\n• Give you loans when you need them\n2 minutes of goal setting = months of personalized recommendations. That's the power of telling us what matters to you!	uniti_messages	\N	\N	t	\N	\N
6cba3065-1d88-4f27-a636-267eb30c15eb	2025-11-03 20:59:45.909337	2025-11-03 20:59:45.909337	farmer_education.tier1_app_engagement_sustained.celebrate	You're a committed farming learner!	Fantastic {name}! 🎉 You've been actively learning from Access Agriculture for 6 weeks. This isn't luck - this is YOU investing in farming knowledge! You've proven that:\n✓ You're serious about improving your farm\n✓ You value expert farming advice\n✓ You're ready for better harvests\n✓ You're building the skills that increase income\n\nYou're becoming an expert farmer. Congratulations!	farmer_education	\N	\N	t	\N	\N
8416c8ea-bfea-479e-a3b9-7fd16611638e	2025-11-03 20:59:46.119317	2025-11-03 20:59:46.119317	farmer_education.first_tier1_app_retained.reward	9 weeks of farming education! Collect your reward.	Exceptional achievement {name}! 🎉 You've been learning from Access Agriculture for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nThis is remarkable. You've built lasting farming knowledge. Amazing!	farmer_education	\N	\N	t	\N	\N
cf45064f-9a06-48de-afc0-4f95b9bf0505	2025-11-03 20:59:46.344331	2025-11-03 20:59:46.344331	farmer_education.tier1_app_retained.celebrate	You're a farming education champion now. Congratulations!	Incredible {name}! 🎉 You're now a long-term farming learner. Look at what you've achieved:\n✓ 9+ weeks of consistent learning from expert farmers\n✓ Knowledge that improves every harvest\n✓ Skills that reduce losses and increase income\n✓ Confidence to try new farming techniques\n\nCongratulations!	farmer_education	\N	\N	t	\N	\N
7478bada-7d79-492e-8bc0-d2f04fd4f448	2025-11-03 20:59:46.575203	2025-11-03 20:59:46.575203	farmer_education.tier1_app_retained.incentive	You're building real farming expertise	{name}, you've proven you can commit to learning for 9+ weeks. This dedication is transforming your farm. The farming knowledge you're gaining improves your yields, reduces losses, and increases your income every season. The longer you keep learning, the more successful your farm becomes. Your farming future is in your hands!	farmer_education	\N	\N	t	\N	\N
e92023d9-973a-4056-9d76-d2e953fb9a90	2025-11-03 20:59:46.794201	2025-11-03 20:59:46.794201	farmer_education.tier1_app_retention_dropoff.how	Let's solve your farming education issue	Hi {name}, you were such a consistent learner from Access Agriculture! We noticed you haven't been active lately. Let's fix any issues:\n• To find videos: Open app → Video Library → Select category (like vegetables) → Pick language → Watch\n• To save videos: Click 'favorite' on videos you want to watch again\n• To download: Click 'Download' to save videos for offline viewing\n• Having trouble? Check that your app is updated\n\nWatch the video below to learn how to make the most of your farming education.	farmer_education	\N	\N	t	["https://drive.google.com/file/d/1vDLE9lAlBZg-J8du4nHl0ZE1bcPiIIDE/view?usp=drive_link"]	\N
f97dcc05-9137-46d8-ade6-19e641855cee	2025-11-03 20:59:47.021235	2025-11-03 20:59:47.021235	farmer_education.tier1_app_retention_dropoff.incentive	Your farming knowledge is too valuable to lose	{name}, every week of learning you've built adds to your farming expertise. By stopping now, you're missing new techniques that could improve your next harvest. Use Access Agriculture this week and keep building the knowledge that transforms farms!	farmer_education	\N	\N	t	\N	\N
ffc1928e-3e77-4ab7-9f8b-12b5fac7fef8	2025-11-03 20:59:47.23234	2025-11-03 20:59:47.23234	farmer_education.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a farming education champion	{name}, we miss you! Your consistent learning from expert farmers was building the knowledge that leads to better harvests and higher income. Don't let this slip away. Take 5 minutes today to watch one farming video and get back on track!	farmer_education	\N	\N	t	\N	\N
efd4b16f-f032-4ee0-bed6-c729576c06ac	2025-11-03 20:59:47.460338	2025-11-03 20:59:47.460338	farmer_education.tier1_app_retention_dropoff.why	Why your farming education journey matters	{name}, you spent many weeks building farming knowledge from experts. Here's what you lose by stopping:\n• New techniques: Missing advice that improves harvests\n• Skills loss: Forgetting what you learned without practice\n• Income opportunity: Lower yields without applying knowledge\n\nYou worked hard to become a knowledgeable farmer. Keep using this expertise to improve your farm. Take two minutes today to watch a farming video and get back on track.	farmer_education	\N	\N	t	\N	\N
f6d2b8d3-5c7b-4047-806a-070368489d44	2025-11-03 20:59:47.67139	2025-11-03 20:59:47.67139	farmer_education.tier2_app_opened_first_time.celebrate	Welcome to farming education!	Great start {name}! 🎉 You've opened the Access Agriculture app for the first time. Work is your second most important goal. This is the beginning of something powerful - expert farming advice at your fingertips. With Access Agriculture, you can:\n✓ Learn farming techniques from experienced farmers\n✓ Watch easy-to-follow videos in your language\n✓ Improve your harvest and increase your income\n✓ Access advice anytime, anywhere\n\nTake the next step: Register your account!	farmer_education	\N	\N	t	\N	\N
2e5b6b5d-92f1-4730-b6f0-e9e1b704df42	2025-11-03 20:59:47.905177	2025-11-03 20:59:47.905177	farmer_education.tier2_app_adopted.celebrate	You're on the path to better farming!	Well done {name}! 🎉 You're now using Access Agriculture. You've taken an important step toward farming success!	farmer_education	\N	\N	t	\N	\N
386126ee-efc6-4922-bc0c-328f119c175a	2025-11-03 20:59:48.118189	2025-11-03 20:59:48.118189	farmer_education.tier2_app_registered.celebrate	Your farming education journey begins!	{name}, congratulations on registering for Access Agriculture! 🎉 This is a major step forward! With your account you can:\n✓ Watch farming videos in your language\n✓ Learn from experienced farmers\n✓ Discover techniques for better crops\n✓ Save your favorite videos\nAll from your phone!	farmer_education	\N	\N	t	\N	\N
1d90c096-469d-410c-9334-55f0b35c03f6	2025-11-03 20:59:48.359203	2025-11-03 20:59:48.359203	farmer_education.tier2_app_low_activity.how	Quick tips for farming education	Hi {name}, we noticed you haven't used Access Agriculture much. Ready to learn from expert farmers? Here's a quick start:\n1. Open the app and click Video Library\n2. Pick a farming topic\n3. Select your language\n4. Watch and learn from expert farmers\nStart with one video today!	farmer_education	\N	\N	t	\N	\N
9b4e8058-bf8a-4322-a3bd-148717cd7e22	2025-11-03 20:59:48.571254	2025-11-03 20:59:48.571254	farmer_education.tier2_app_low_activity.incentive	Try farming education	{name}, start learning from Access Agriculture and earn a reward of 10 GHC in just three weeks. Every farming technique you learn can improve your harvest. The sooner you start, the sooner you'll see better results on your farm!	farmer_education	\N	\N	t	\N	\N
bf73348f-eaa2-4ddd-9dfb-25e218d9c969	2025-11-03 20:59:48.799244	2025-11-03 20:59:48.799244	farmer_education.tier2_app_low_activity.support	Need help with farming education?	Hi {name}, need help using Access Agriculture? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	farmer_education	\N	\N	t	\N	\N
ce456106-935f-4ac7-a181-3f6e3097c0e3	2025-11-03 20:59:49.00723	2025-11-03 20:59:49.00723	farmer_education.tier2_app_low_activity.why	Farming education helps your farm succeed	{name}, Access Agriculture offers real benefits:\n• Learn techniques that increase yields\n• Get expert advice in your language\n• Improve your harvest and income\nGive it a try - thousands of farmers already use it!	farmer_education	\N	\N	t	\N	\N
c7eac562-6c7c-434d-b441-6d46bf0c898a	2025-11-03 20:59:49.256154	2025-11-03 20:59:49.256154	farmer_education.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've been learning from Access Agriculture for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	farmer_education	\N	\N	t	\N	\N
c69c23ff-d514-4f82-97d2-87b1906519ed	2025-11-03 20:59:49.561211	2025-11-03 20:59:49.561211	farmer_education.tier2_app_engaged.celebrate	You're learning from expert farmers!	Great job {name}! 🎉 As an active learner from Access Agriculture, you're gaining farming knowledge that improves your harvest. You're building good farming skills!	farmer_education	\N	\N	t	\N	\N
033971a2-a785-4c2c-aa0b-8387373923d5	2025-11-03 20:59:49.760338	2025-11-03 20:59:49.760338	farmer_education.tier2_app_engaged.incentive	Keep learning from expert farmers	{name}, you're doing well! Keep watching farming videos and earn 10 GHC in a few weeks. Every technique you learn can improve your farm!	farmer_education	\N	\N	t	\N	\N
49de3b5d-ebf3-465a-b4b2-dea17543a4f5	2025-11-03 20:59:49.989219	2025-11-03 20:59:49.989219	farmer_education.tier2_app_engagement_dropoff.how	Quick farming education reminder	Hi {name}, we noticed you stopped using Access Agriculture lately. Quick reminders:\n• Open app → Video Library → Select topic → Pick language → Watch\n• Click 'favorite' to save good videos\n• Download videos to watch offline\n\nWatch the video for a refresher.	farmer_education	\N	\N	t	["https://drive.google.com/file/d/1vDLE9lAlBZg-J8du4nHl0ZE1bcPiIIDE/view?usp=drive_link"]	\N
c7a71440-d485-46bd-9bdf-c955f7d1e556	2025-11-03 20:59:50.223156	2025-11-03 20:59:50.223156	farmer_education.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Access Agriculture and earn 10 GHC in a few weeks. Expert farming advice helps you get better harvests and higher income.	farmer_education	\N	\N	t	\N	\N
14b53204-d1b4-498f-aaa1-1735213ec123	2025-11-03 20:59:50.469336	2025-11-03 20:59:50.469336	farmer_education.tier2_app_engagement_dropoff.reactivation	Try farming education again?	{name}, you started learning good farming techniques. Take 5 minutes today to watch one video and continue improving your farming skills!	farmer_education	\N	\N	t	\N	\N
4846679d-e421-43b4-8aa2-7d5a0ce54404	2025-11-03 20:59:50.712326	2025-11-03 20:59:50.712326	farmer_education.tier2_app_engagement_dropoff.why	Farming education brings success	{name}, learning from expert farmers offers:\n• Techniques that increase yields\n• Knowledge that reduces losses\n• Skills that boost income\n\nYou already know how to use it - try it again!	farmer_education	\N	\N	t	\N	\N
a36e2dfa-938d-4e39-97f4-dd589a5c294d	2025-11-03 20:59:50.928494	2025-11-03 20:59:50.928494	farmer_education.tier2_app_engagement_sustained.celebrate	6 weeks of farming education!	Well done {name}! 🎉 You've been learning from Access Agriculture consistently for 6 weeks. You're building farming knowledge that improves your harvest!	farmer_education	\N	\N	t	\N	\N
131c694d-06ad-4b21-b8fc-7982e2dd4986	2025-11-03 20:59:51.180262	2025-11-03 20:59:51.180262	farmer_education.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency!	Excellent {name}! 🎉 You've been learning from Access Agriculture for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	farmer_education	\N	\N	t	\N	\N
0e1c5305-acdf-4f99-8525-5d0e56b3c532	2025-11-03 20:59:51.487255	2025-11-03 20:59:51.487255	farmer_education.tier2_app_retained.celebrate	You're a committed farming learner!	Impressive {name}! 🎉 You've been learning from expert farmers consistently. You're gaining farming knowledge that leads to better harvests. Well done!	farmer_education	\N	\N	t	\N	\N
56f91551-a080-4c2d-a606-4b6396f8cd01	2025-11-03 20:59:51.698126	2025-11-03 20:59:51.698126	farmer_education.tier2_app_retained.incentive	Keep your farming education going	{name}, your consistent learning from Access Agriculture is building valuable farming skills. Your knowledge is improving your farm. Keep it up!	farmer_education	\N	\N	t	\N	\N
e80e27f5-626f-4125-911b-096db52f46d6	2025-11-03 20:59:51.916236	2025-11-03 20:59:51.916236	farmer_education.tier2_app_retention_dropoff.how	Quick farming education reminder	Hi {name}, we noticed you stopped using Access Agriculture lately. Quick reminders:\n• Open app → Video Library → Select topic → Pick language → Watch\n• Click 'favorite' to save videos\n• Download videos to watch offline\n\nWatch the video for a refresher.	farmer_education	\N	\N	t	["https://drive.google.com/file/d/1vDLE9lAlBZg-J8du4nHl0ZE1bcPiIIDE/view?usp=drive_link"]	\N
9d91b186-0787-4946-90fc-726eb2471443	2025-11-03 20:59:52.141328	2025-11-03 20:59:52.141328	farmer_education.tier2_app_retention_dropoff.incentive	Your farming knowledge is waiting	{name}, you built good farming learning habits. Come back and keep building your farming knowledge.	farmer_education	\N	\N	t	\N	\N
fe78100d-d6c1-4021-ba39-8e46ba8ed8c9	2025-11-03 20:59:52.378222	2025-11-03 20:59:52.378222	farmer_education.tier2_app_retention_dropoff.reactivation	Come back to farming education	{name}, you were learning great farming techniques! Use Access Agriculture again today and keep your farming skills growing.	farmer_education	\N	\N	t	\N	\N
61411c7f-c611-4371-97e5-51f0abadb5cc	2025-11-03 20:59:52.64933	2025-11-03 20:59:52.64933	farmer_education.tier2_app_retention_dropoff.why	Keep your farming progress	{name}, you built weeks of farming knowledge. Keep learning to maintain:\n• Your farming skills\n• Knowledge from expert farmers\n• Techniques that improve harvests\n\nWatch a video today to stay on track!	farmer_education	\N	\N	t	\N	\N
43b71d96-f63a-45e8-ad78-3ff59bcf7a44	2025-11-03 20:59:52.899354	2025-11-03 20:59:52.899354	lending.tier1_app_opened_first_time.celebrate	Welcome to Fido - access credit when you need it!	Great start {name}! 🎉 You've opened Fido for the first time. Finance is your most important goal. This is the beginning of something powerful - quick access to money when you need it most. With Fido, you can:\n✓ Borrow money without collateral or paperwork\n✓ Get instant approval and funds in your mobile wallet\n✓ Build a credit history for bigger loans later\n✓ Access business capital when opportunities arise\n\nTake the next step: Register your account and complete the Fido Score assessment!	lending	\N	\N	t	\N	\N
4fe9b17d-ac3d-4229-821e-d85f1ce7ed46	2025-11-03 20:59:53.110335	2025-11-03 20:59:53.110335	lending.tier1_app_adopted.celebrate	You're taking control of your financial needs!	Well done {name}! 🎉 You're now using Fido. You've taken control of your access to credit! By having Fido ready when you need money, you're:\n✓ Prepared for emergencies without depending on others\n✓ Able to invest in your business when opportunities come\n✓ Building a financial record that opens doors\n✓ Getting help fast when you need it most\nKeep going!	lending	\N	\N	t	\N	\N
805a0327-e08c-4c22-9f43-bba0d7931d1b	2025-11-03 20:59:53.312453	2025-11-03 20:59:53.312453	lending.tier1_app_registered.celebrate	Your Fido account is ready!	{name} congratulations on registering for Fido! 🎉 This is a major step forward! With your Fido account you can:\n✓ Apply for loans anytime, anywhere\n✓ Get instant approval based on your Fido Score\n✓ Receive money directly to your mobile wallet\n✓ Build your credit history with every repayment\n✓ Access larger loans as you build trust\nAll from your phone!	lending	\N	\N	t	\N	\N
0d9a735a-e145-4582-830f-166579d2adb1	2025-11-03 20:59:53.539331	2025-11-03 20:59:53.539331	lending.tier1_app_low_activity.how	Ready to access your first loan? Here's how	Hi {name}, we noticed you haven't applied for a loan yet. Here's how Fido works:\n1. Open the Fido app\n2. Check your Fido Score and available loan amount\n3. Select the amount you need\n4. Choose your repayment period\n5. Confirm and receive money in your mobile wallet instantly\n\nYour Fido Score improves as you borrow and repay on time. Start small until you're comfortable - even a small loan helps build your credit history!	lending	\N	\N	t	\N	\N
f7c4f68d-cf3d-4cf2-b24b-dc618ca18cf7	2025-11-03 20:59:53.748239	2025-11-03 20:59:53.748239	lending.tier1_app_low_activity.incentive	Build your credit history now - earn 10 GHC in 3 weeks!	{name}, take your first Fido loan and use it responsibly for 3 weeks to earn 10 GHC! Every responsible loan you take:\n✓ Builds your credit history\n✓ Increases your loan limit\n✓ Improves your Fido Score\n✓ Opens doors to bigger opportunities\n\nWhether you need money for an emergency, your business, or school fees - Fido is ready when you are. Build your financial record today!	lending	\N	\N	t	\N	\N
1ab165a7-1555-42d6-80e0-18b383b9143f	2025-11-03 20:59:53.992451	2025-11-03 20:59:53.992451	lending.tier1_app_low_activity.support	Need help getting started with Fido?	Hi {name}, need help with your first Fido loan? We're here for you! Common questions:\n• How to check my loan limit? Open Fido → View your Fido Score and available amount\n• How to apply? Select amount → Choose repayment period → Confirm\n• How to repay? You'll receive reminders. Repay through mobile money or at an agent\n• What if I can't repay on time? Contact Fido support immediately - they can help adjust your schedule\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	lending	\N	\N	t	\N	\N
d76e6b42-02a4-4672-bb2e-ac4646e7034e	2025-11-03 20:59:54.239304	2025-11-03 20:59:54.239304	lending.tier1_app_low_activity.why	Why Fido matters for your financial security	{name}, having access to credit changes everything. Here's why:\n• Emergencies: When you need money fast - medical bills, school fees, transport repairs - Fido is there\n• Opportunities: When business opportunities come, you have capital ready\n• Independence: No need to borrow from friends or high-interest lenders\n• Credit history: Every loan you repay builds a record that helps you qualify for bigger loans, business financing, even bank loans later\n• Trust: Fido's terms are clear - no hidden fees or surprises\n\nMany in your community already use Fido. It's fast, transparent, and designed for people like you. Take your first step today!	lending	\N	\N	t	\N	\N
1b178cb1-ace9-408a-8c45-8d0b9cf6aba1	2025-11-03 20:59:54.461268	2025-11-03 20:59:54.461268	lending.first_tier1_app_engaged.reward	3 weeks of responsible borrowing! Collect your 10 GHC.	Incredible achievement {name}! 🎉 You've used Fido responsibly for 3 weeks - borrowing when needed and repaying on time. You've earned 10 GHC for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\n\nYou're not just borrowing - you're building a credit history that will help you access bigger loans and better terms. This is how financial success starts!	lending	\N	\N	t	\N	\N
081c9775-a0fa-4675-893b-f17f915a16ca	2025-11-03 20:59:54.66924	2025-11-03 20:59:54.66924	lending.tier1_app_engaged.celebrate	You're mastering smart borrowing!	Excellent work {name}! 🎉 As an active Fido user, you're:\n✓ Building a strong credit history\n✓ Accessing money when you need it most\n✓ Repaying responsibly to improve your Fido Score\n✓ Qualifying for higher loan amounts\n✓ Creating opportunities that others can't access\n\nYou're not just using credit - you're building financial power. Every loan you repay on time increases your credibility with lenders. Keep it up!	lending	\N	\N	t	\N	\N
86adf747-73a8-4120-824e-7e97560f04a7	2025-11-03 20:59:54.901356	2025-11-03 20:59:54.901356	lending.tier1_app_engaged.incentive	Keep going - bigger loan limits are coming!	{name}, you're doing great with Fido! Keep using it responsibly and earn 10 GHC in a few weeks. The more you borrow and repay on time:\n✓ Higher loan limits become available\n✓ Better interest rates\n✓ Faster approval\n✓ Access to business loans\n\nYour responsible borrowing is building real financial power. Keep it up!	lending	\N	\N	t	\N	\N
dbe309cf-2003-45c6-9f2f-b56715c1f2b4	2025-11-03 20:59:55.109327	2025-11-03 20:59:55.109327	lending.tier1_app_engagement_dropoff.how	Come back to Fido - we can help!	Hi {name}, we noticed you stopped using Fido recently. If you had any issues, let's solve them! Quick reminders:\n• To check your loan limit: Open Fido → View Dashboard\n• To apply for a loan: Select amount → Choose repayment period → Confirm\n• To repay: Use mobile money or visit an agent\n• Missed a payment? Contact Fido support immediately - they can help\n\nDon't let credit issues stop you from accessing money when you need it. Every missed payment hurts your Fido Score, making future loans harder. Get back on track today!	lending	\N	\N	t	\N	\N
d12e64dd-5e94-4a9f-bf4d-88bae18b921b	2025-11-03 20:59:55.322152	2025-11-03 20:59:55.322152	lending.tier1_app_engagement_dropoff.incentive	Don't lose your credit progress!	{name}, you were building a great credit history with Fido! Come back now and keep earning. Use Fido responsibly for a few weeks and earn 10 GHC.\n\nEvery week you don't borrow and repay, you miss chances to:\n✓ Build your credit history\n✓ Increase your loan limits\n✓ Improve your Fido Score\n✓ Access bigger opportunities\n\nYour financial goals are waiting!	lending	\N	\N	t	\N	\N
acde89b8-b445-42bf-8e3f-ddd003a51c51	2025-11-03 20:59:55.541171	2025-11-03 20:59:55.541171	lending.tier1_app_engagement_dropoff.reactivation	Your Fido account misses you - come back today!	{name}, we miss you! You were building something important with Fido: a credit history that helps you access money when you need it most. Whether it's an emergency, business opportunity, or important expense - Fido is ready to help. Come back today!	lending	\N	\N	t	\N	\N
6950f4e3-5a4b-4622-823c-f236de806749	2025-11-03 20:59:55.753358	2025-11-03 20:59:55.753358	lending.tier1_app_engagement_dropoff.why	Remember why you started with Fido	{name}, without access to credit, you face real challenges:\n• Emergencies become crises when you can't get money fast\n• Business opportunities pass you by when you lack capital\n• You depend on expensive informal lenders or burdening family\n• No record of your financial responsibility\n\nFido solves these problems. You already learned how to use it. Don't give up the financial security and independence you worked for. Your future opportunities depend on the credit history you build today!	lending	\N	\N	t	\N	\N
46611fbe-3b3d-4cdf-98e2-4ce2d27ec6f4	2025-11-03 20:59:55.996289	2025-11-03 20:59:55.996289	lending.tier1_app_engagement_sustained.celebrate	You're a consistent Fido user - well done!	Fantastic {name}! 🎉 You've maintained responsible Fido use for 6 weeks. This isn't luck - this is YOU building real financial credibility! You've proven that:\n✓ You can borrow responsibly\n✓ You repay on time\n✓ You understand how credit works\n✓ Lenders can trust you\n\nYour Fido Score has improved, your loan limits have increased, and you've built a financial record that opens doors. You're thriving!	lending	\N	\N	t	\N	\N
d990e804-22d1-45f5-9a76-270b25ee668e	2025-11-03 20:59:56.285241	2025-11-03 20:59:56.285241	lending.first_tier1_app_retained.reward	9 weeks of credit excellence! Collect your 10 GHC.	Exceptional achievement {name}! 🎉 You've used Fido responsibly for 9 weeks straight - borrowing wisely and repaying on time! You've earned 10 GHC for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\n\nThis is remarkable. You've built a credit history that many lenders will see as proof of your financial responsibility. Amazing!	lending	\N	\N	t	\N	\N
23350dcd-09c2-403a-80bc-8098ffae1cd4	2025-11-03 20:59:56.499362	2025-11-03 20:59:56.499362	lending.tier1_app_retained.celebrate	You're a credit expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term responsible Fido user. Look at what you've achieved:\n✓ 9+ weeks of smart borrowing and repayment\n✓ A strong credit history that lenders trust\n✓ Higher loan limits and better terms\n✓ Access to business financing opportunities\n✓ Financial independence from expensive informal lenders\n\nYou've mastered credit management. Congratulations!	lending	\N	\N	t	\N	\N
b9c1427c-c73e-47b7-afa6-aeef33e210f0	2025-11-03 20:59:56.710354	2025-11-03 20:59:56.710354	lending.tier1_app_retained.incentive	You're building real financial credibility	{name}, you've proven you can borrow and repay responsibly for 9+ weeks. This consistency is opening major doors:\n✓ Banks can see your repayment record\n✓ You qualify for larger business loans\n✓ You get better interest rates\n✓ You have financial options others don't\n\nThe longer you maintain this responsibility, the more opportunities become available. Your financial future is in your hands!	lending	\N	\N	t	\N	\N
90b0f5de-394e-45e0-b8fd-214f1227e7ec	2025-11-03 20:59:56.939217	2025-11-03 20:59:56.939217	lending.tier1_app_retention_dropoff.how	Let's solve your Fido issue	Hi {name}, you were such a consistent Fido user! We noticed you haven't been active lately. Let's fix any issues:\n• To check loan status: Open Fido → View Dashboard\n• To repay outstanding loans: Use mobile money or visit agent\n• Struggling with repayment? Contact Fido support NOW - they can adjust schedules\n• To apply for new loan: Clear any outstanding balance first\n\nIgnoring loan obligations damages your credit score permanently. But acting now can protect everything you've built. Contact support today!	lending	\N	\N	t	\N	\N
818b6318-818f-4516-9b3b-c112f8477c3e	2025-11-03 20:59:57.159245	2025-11-03 20:59:57.159245	lending.tier1_app_retention_dropoff.incentive	Your credit history is too valuable to lose	{name}, every week of responsible Fido use you built adds to your financial credibility. By stopping now, you risk:\n✓ Losing access to credit when emergencies come\n✓ Damaging your credit score\n✓ Missing out on business opportunities\n✓ Losing the trust you built with lenders\n\nIf you have outstanding loans, contact Fido support immediately. Use Fido responsibly this week and protect your financial future!	lending	\N	\N	t	\N	\N
6a85776e-d349-4bf2-959d-e3730d11b58d	2025-11-03 20:59:57.369298	2025-11-03 20:59:57.369298	lending.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a Fido champion	{name}, we miss you! Your consistent responsible borrowing built a credit history that helps you access money when you need it most. Don't let this valuable asset disappear.\n\nIf you have any issues or questions, contact Fido support. They can help you get back on track. Your financial security depends on maintaining your good credit record!	lending	\N	\N	t	\N	\N
5318a169-592c-4895-80af-89b504323cb7	2025-11-03 20:59:57.59238	2025-11-03 20:59:57.59238	lending.tier1_app_retention_dropoff.why	Why your credit record matters	{name}, you spent many weeks building financial credibility. Here's what you lose by stopping:\n• No credit access: When emergencies come, you have nowhere to turn\n• Damaged score: Outstanding loans hurt your ability to borrow anywhere\n• Lost opportunities: Business chances pass you by without capital access\n• Back to informal lenders: Expensive, unclear terms, no legal protection\n\nYou worked hard to build a solid credit history. Protect it now! If you have issues, contact Fido support immediately. Every day you wait makes recovery harder.	lending	\N	\N	t	\N	\N
f9cc5671-f374-4ad1-87ac-63c4c96fed8b	2025-11-03 20:59:57.816332	2025-11-03 20:59:57.816332	lending.tier2_app_opened_first_time.celebrate	Welcome to Fido - access credit when you need it!	Great start {name}! 🎉 You've opened Fido for the first time. Finance is your second most important goal. This is the beginning of something powerful - quick access to money when you need it most. With Fido, you can:\n✓ Borrow money without collateral or paperwork\n✓ Get instant approval and funds in your mobile wallet\n✓ Build a credit history for bigger loans later\n✓ Access capital for business or emergencies\n\nTake the next step: Register your account!	lending	\N	\N	t	\N	\N
5ee761e5-9e9a-4eec-a806-1a226359876d	2025-11-03 20:59:58.021632	2025-11-03 20:59:58.021632	lending.tier2_app_adopted.celebrate	You have access to credit now!	Well done {name}! 🎉 You're now using Fido. You've given yourself financial security - quick access to money when you need it most!	lending	\N	\N	t	\N	\N
33f2d5bd-5db8-4e8d-afeb-8c77a6423b06	2025-11-03 20:59:58.262385	2025-11-03 20:59:58.262385	lending.tier2_app_registered.celebrate	Your Fido account is ready!	{name} congratulations on registering for Fido! 🎉 This is a smart move! With your Fido account you can:\n✓ Apply for loans instantly\n✓ Receive money directly to your mobile wallet\n✓ Build your credit history\n✓ Access larger loans over time\nAll from your phone!	lending	\N	\N	t	\N	\N
b6f223f1-6c5b-4ef8-999e-d4c171a3e1f5	2025-11-03 20:59:58.513314	2025-11-03 20:59:58.513314	lending.tier2_app_low_activity.how	Quick guide to your first Fido loan	Hi {name}, ready to try Fido? Here's how it works:\n1. Open the Fido app\n2. Check your available loan amount\n3. Select how much you need\n4. Choose repayment period\n5. Confirm and get money instantly\n\nStart small to build your credit history. Every loan you repay on time increases your future loan limit!	lending	\N	\N	t	\N	\N
95f154cb-a125-4ccc-a672-f4528293258a	2025-11-03 20:59:58.738359	2025-11-03 20:59:58.738359	lending.tier2_app_low_activity.incentive	Try Fido and earn 10 GHC	{name}, take a Fido loan and use it responsibly for 3 weeks to earn 10 GHC! Whether you need money for your business or an emergency, Fido gives you quick access. The sooner you start building credit history, the better!	lending	\N	\N	t	\N	\N
03e1357c-23f2-40ba-84be-9996c39b0635	2025-11-03 20:59:58.960386	2025-11-03 20:59:58.960386	lending.tier2_app_low_activity.support	Need help with Fido?	Hi {name}, need help using Fido? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through applying for your first loan!	lending	\N	\N	t	\N	\N
68c30f98-ee4c-4dfc-a536-a05bcb076516	2025-11-03 20:59:59.186271	2025-11-03 20:59:59.186271	lending.tier2_app_low_activity.why	Why Fido is useful	{name}, Fido offers real benefits:\n• Quick access to money for emergencies or opportunities\n• No collateral or complicated paperwork needed\n• Build credit history for bigger loans later\n• Clear repayment terms - no surprises\n\nMany in your community use Fido. Give it a try when you need it!	lending	\N	\N	t	\N	\N
edcda070-8f39-4506-9c00-8f31b297bedd	2025-11-03 20:59:59.416105	2025-11-03 20:59:59.416105	lending.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used Fido responsibly for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep borrowing responsibly!	lending	\N	\N	t	\N	\N
70b74409-bb1a-465a-9f61-61bf81cf0eeb	2025-11-03 20:59:59.629187	2025-11-03 20:59:59.629187	lending.tier2_app_engaged.celebrate	You're using Fido responsibly!	Great job {name}! 🎉 As a responsible Fido user, you're building credit history and accessing money when you need it. You're creating financial opportunities for yourself!	lending	\N	\N	t	\N	\N
2b383cd6-0c12-4af3-8de5-acdf43e7d817	2025-11-03 20:59:59.83925	2025-11-03 20:59:59.83925	lending.tier2_app_engaged.incentive	Keep going with Fido	{name}, you're doing well! Keep using Fido responsibly and earn 10 GHC in a few weeks. Every loan you repay on time builds your credit!	lending	\N	\N	t	\N	\N
cce871ec-1609-4a36-969d-0fc6179bea3e	2025-11-03 21:00:00.04444	2025-11-03 21:00:00.04444	lending.tier2_app_engagement_dropoff.how	Quick Fido reminder	Hi {name}, we noticed you stopped using Fido. Quick reminders:\n• To check loan limit: Open Fido → View Dashboard\n• To apply: Select amount → Choose period → Confirm\n• To repay: Use mobile money or visit agent\n\nIf you have any issues, contact Fido support. They can help!	lending	\N	\N	t	\N	\N
20db3f68-c78f-4cd0-b70b-72ed4bf0f7c8	2025-11-03 21:00:00.273221	2025-11-03 21:00:00.273221	lending.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Fido and earn 10 GHC in a few weeks. Having access to credit helps you handle emergencies and opportunities. Keep building your credit history!	lending	\N	\N	t	\N	\N
d7e6a337-0ca7-4965-a916-05ffb441cb89	2025-11-03 21:00:00.482168	2025-11-03 21:00:00.482168	lending.tier2_app_engagement_dropoff.reactivation	Try Fido again?	{name}, you started building good credit habits with Fido. Come back when you need money - whether for business, emergencies, or opportunities!	lending	\N	\N	t	\N	\N
2d9aa46e-e24a-43f4-857a-57159f9a445f	2025-11-03 21:00:00.690433	2025-11-03 21:00:00.690433	lending.tier2_app_engagement_dropoff.why	Fido gives you financial flexibility	{name}, Fido offers useful benefits:\n• Quick money access for emergencies\n• Clear repayment terms\n• Build credit history for future needs\n• Better than expensive informal lenders\n\nUse it responsibly when you need it!	lending	\N	\N	t	\N	\N
e68a7833-230b-4dfe-bf4a-7cd5f3849cbe	2025-11-03 21:00:00.912417	2025-11-03 21:00:00.912417	lending.tier2_app_engagement_sustained.celebrate	6 weeks of responsible borrowing!	Well done {name}! 🎉 You've used Fido responsibly for 6 weeks. You're building a solid credit history and managing credit well!	lending	\N	\N	t	\N	\N
cc361272-3b79-4ef2-84f2-3297007e466b	2025-11-03 21:00:01.131421	2025-11-03 21:00:01.131421	lending.first_tier2_app_retained.reward	You've earned 10 GHC for consistent Fido use!	Excellent {name}! 🎉 You've used Fido responsibly for 9 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great credit management!	lending	\N	\N	t	\N	\N
d53610c7-557f-48a8-9520-57fe79984510	2025-11-03 21:00:01.361494	2025-11-03 21:00:01.361494	lending.tier2_app_retained.celebrate	You're a responsible Fido user!	Impressive {name}! 🎉 You've been using Fido consistently and responsibly. You've built a solid credit history that gives you financial options when you need them. Well done!	lending	\N	\N	t	\N	\N
848f5496-08b6-4aff-b666-958d04ad7d94	2025-11-03 21:00:01.561599	2025-11-03 21:00:01.561599	lending.tier2_app_retained.incentive	Keep your good credit habits	{name}, your responsible Fido use is building valuable credit history. You have access to money when you need it, and your credit score keeps improving. Keep it up!	lending	\N	\N	t	\N	\N
1ab34df2-54c6-4e89-928a-0268e1e19bfc	2025-11-03 21:00:01.805003	2025-11-03 21:00:01.805003	lending.tier2_app_retention_dropoff.how	Quick Fido reminder	Hi {name}, we noticed you stopped using Fido. Quick reminders:\n• To check status: Open Fido → View Dashboard\n• To repay: Use mobile money or visit agent\n• Have issues? Contact Fido support immediately\n\nThey can help you resolve any problems!	lending	\N	\N	t	\N	\N
b0173eb4-33c3-490d-8f68-a45abfcd72f2	2025-11-03 21:00:02.081416	2025-11-03 21:00:02.081416	lending.tier2_app_retention_dropoff.incentive	Your credit history is waiting	{name}, you built good credit habits with Fido. Come back and keep your credit score strong for when you need it!	lending	\N	\N	t	\N	\N
e0f81a7a-3753-446f-87de-43c4748c522c	2025-11-03 21:00:02.291121	2025-11-03 21:00:02.291121	lending.tier2_app_retention_dropoff.reactivation	Come back to Fido	{name}, you were building great credit history! Use Fido again when you need money and keep your financial options open.	lending	\N	\N	t	\N	\N
64dc9dc1-b028-4925-9d77-d8e595f99a43	2025-11-03 21:00:02.504157	2025-11-03 21:00:02.504157	lending.tier2_app_retention_dropoff.why	Keep your financial access	{name}, you built weeks of good credit history. Keep using Fido responsibly to maintain:\n• Your credit score\n• Quick access to money when needed\n• Financial security for emergencies\n\nUse it when you need it to stay on track!	lending	\N	\N	t	\N	\N
36f520ac-c786-410d-b328-4f5b2b16f37c	2025-11-03 21:00:02.739254	2025-11-03 21:00:02.739254	life_insurance.tier1_app_opened_first_time.celebrate	Welcome to life insurance!	Great start {name}! 🎉 You've opened your life insurance app for the first time. Finance is your most important goal. This is the beginning of something powerful - a way to protect your loved ones when they need it most. With life insurance, you can: \n✓ Protect your family from financial hardship \n✓ Ensure your loved ones can pay for household needs \n✓ Give yourself peace of mind \n✓ Show you care for your family's future \n\nTake the next step: Register your account!	life_insurance	\N	\N	t	\N	\N
59720c2a-8a40-4132-8e8b-eef6fe367d88	2025-11-03 21:00:02.946303	2025-11-03 21:00:02.946303	life_insurance.tier1_app_adopted.celebrate	You're protecting your family's future!	Well done {name}! 🎉 You're now using life insurance. You've taken control of your family's security! By protecting your loved ones, you're: \n✓ Ensuring they won't struggle if something happens to you \n✓ Showing responsibility and care \n✓ Building a safety net for unexpected events \nKeep going!	life_insurance	\N	\N	t	\N	\N
5bbdd239-0266-4a64-a33c-5eeef368e794	2025-11-03 21:00:03.15938	2025-11-03 21:00:03.15938	life_insurance.tier1_app_registered.celebrate	Your family protection is active!	{name} congratulations on registering for life insurance! 🎉 This is a major step forward! With your Petra account you can: \n✓ Protect your family's future \n✓ Pay small amounts regularly \n✓ Have peace of mind \n✓ Ensure your loved ones are cared for \nAll from your phone!	life_insurance	\N	\N	t	\N	\N
fe75f539-c6be-438d-b5d1-cb1677e4c5a7	2025-11-03 21:00:03.377393	2025-11-03 21:00:03.377393	life_insurance.tier1_app_low_activity.how	Make the most of your life insurance	Hi {name}, we noticed you haven't used your life insurance account much. Here's how to check your coverage: \n1. Open the Petra app\n2. Click on My Policy\n3. Review your coverage details\n4. Check your payment history and next payment date\n\nMake sure your payments are up to date to keep your family protected!	life_insurance	\N	\N	t	\N	\N
6fc8eadc-7493-449d-9ee2-0987da9a43cc	2025-11-03 21:00:03.600211	2025-11-03 21:00:03.600211	life_insurance.tier1_app_low_activity.incentive	Your family's protection is waiting - start using life insurance!	{name}, keep your life insurance active and maintain protection for your family! Regular small payments ensure your loved ones are protected if something unexpected happens. The sooner you make it a habit, the more secure your family becomes. Make your payment today!	life_insurance	\N	\N	t	\N	\N
3887e1c2-b5c3-4cd0-9eca-1e8b21eb446d	2025-11-03 21:00:03.819237	2025-11-03 21:00:03.819237	life_insurance.tier1_app_low_activity.support	Need help with life insurance?	Hi {name}, need help using your life insurance account? We're here for you! Common questions: \n• How to make payments? Open Petra app, click on Make Payment, select your payment method (mobile money is easiest), enter the amount and confirm. \n• How to add beneficiaries? Go to My Policy, click on Beneficiaries, and add your family members' details. \n• How to check coverage? Open app, go to My Policy, and view your coverage amount and benefits.\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	life_insurance	\N	\N	t	\N	\N
5366b840-9b06-4bba-b986-6328e00f9d74	2025-11-03 21:00:04.020617	2025-11-03 21:00:04.020617	life_insurance.tier1_app_low_activity.why	Why life insurance matters for your family	{name}, we know thinking about the future can be difficult. But without protection, your family faces real risks: \n• Funeral costs could burden your relatives \n• Your children's school fees might not be paid \n• Household needs could become impossible to meet \n• Your family could struggle when they're already grieving \n\nLife insurance solves these problems. Your family stays secure, even if something happens to you. Small payments today mean your loved ones won't be left alone. Take action now - your family is counting on you!	life_insurance	\N	\N	t	\N	\N
8373042a-de34-48f6-a62b-e5e90dfeb268	2025-11-03 21:00:04.229832	2025-11-03 21:00:04.229832	life_insurance.first_tier1_app_engaged.reward	3 weeks of life insurance! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively maintaining your life insurance for 3 weeks straight. You've earned 10 GHC for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - protection for those you love. Congratulations!	life_insurance	\N	\N	t	\N	\N
ed5918fd-a48a-478b-b5bc-441259576909	2025-11-03 21:00:04.461438	2025-11-03 21:00:04.461438	life_insurance.tier1_app_engaged.celebrate	You're securing your family's future!	Excellent work {name}! 🎉 As an active life insurance user you're: \n✓ Protecting your loved ones from hardship\n✓ Showing responsibility and care \n✓ Building peace of mind for yourself \n✓ Ensuring your family has support when needed \nYou're not just using an app - you're building your family's safety net. Keep it up!	life_insurance	\N	\N	t	\N	\N
414bf3ff-b960-4ccf-9b1f-0f31634a1df8	2025-11-03 21:00:04.670477	2025-11-03 21:00:04.670477	life_insurance.tier1_app_engaged.incentive	Keep going - your family depends on it!	{name}, you're doing great with life insurance! Keep making regular payments and earn 10 GHC in a few weeks. The more consistently you pay, the stronger your family's protection becomes. Your loved ones are counting on you!	life_insurance	\N	\N	t	\N	\N
4ab5e955-5cd5-4d86-b0ce-39088d5e39e7	2025-11-03 21:00:04.899285	2025-11-03 21:00:04.899285	life_insurance.all_tier1_app_engaged.reward	You're protecting your entire family! Collect your reward.	Outstanding {name}! 🎉 You're actively maintaining all your priority financial protections. You've earned 500MB. The data will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're a champion for your family. Keep it up!	life_insurance	\N	\N	t	\N	\N
6b314fc4-5916-4761-b8cd-e52d6b8b39ae	2025-11-03 21:00:05.108237	2025-11-03 21:00:05.108237	life_insurance.tier1_app_engagement_dropoff.how	Keep your family protected - we can help!	Hi {name}, we noticed you missed your recent life insurance payment. Let's get you back on track! Quick reminders: \n• To make a payment: Open Petra app → Click Make Payment → Select mobile money → Enter amount → Enter PIN → Confirm \n• To check payment status: Open app → My Policy → Payment History \n• To update payment method: My Policy → Payment Settings\n\nKeep your protection active - your family needs it!	life_insurance	\N	\N	t	\N	\N
1751fbe3-fa2f-4b4e-9e13-2214b824cbdb	2025-11-03 21:00:05.339485	2025-11-03 21:00:05.339485	life_insurance.tier1_app_engagement_dropoff.incentive	Don't lose your family's protection!	{name}, you were doing so well with life insurance! Resume your payments now and earn 10 GHC in just a few weeks. Every payment keeps your family protected. Don't let your hard work go to waste!	life_insurance	\N	\N	t	\N	\N
3ba9c3c1-583c-4d6a-b0e2-3b4e6b0f1c65	2025-11-03 21:00:05.540355	2025-11-03 21:00:05.540355	life_insurance.tier1_app_engagement_dropoff.reactivation	Your family needs you - resume protection today!	{name}, we miss you! You were building something important: financial security for your loved ones. Make your payment today and restore your family's protection!	life_insurance	\N	\N	t	\N	\N
9c55e930-1b0a-45b0-a500-319ad0428e47	2025-11-03 21:00:05.760293	2025-11-03 21:00:05.760293	life_insurance.tier1_app_engagement_dropoff.why	Remember why you started life insurance	{name}, stopping your payments means your family loses protection: \n• Coverage ends: Your loved ones won't receive support if something happens \n• Peace of mind disappears: Back to worrying about your family's future \n• Wasted effort: All your previous payments lose their value \n\nYou already learned how important this protection is. Don't give up on your family's security. Your loved ones need you to stay protected. Resume payments today!	life_insurance	\N	\N	t	\N	\N
32c51068-721a-4317-8da4-b47979597e70	2025-11-03 21:00:05.98028	2025-11-03 21:00:05.98028	life_insurance.tier1_app_engagement_sustained.celebrate	You're a consistent protector!	Fantastic {name}! 🎉 You've maintained active life insurance payments for 6 weeks. This isn't luck - this is YOU taking responsibility for your family's future! You've proven that: \n✓ You can keep commitments \n✓ You prioritize your family's security \n✓ You're ready for life's uncertainties \n✓ You're building lasting peace of mind \nYou're a role model. Congratulations!	life_insurance	\N	\N	t	\N	\N
9267d7b3-0f1f-44ec-ab1c-de773b77e4e4	2025-11-03 21:00:06.199209	2025-11-03 21:00:06.199209	life_insurance.first_tier1_app_retained.reward	9 weeks of family protection! Collect your reward.	Exceptional achievement {name}! 🎉 You've maintained life insurance actively for 9 weeks straight! You've earned 10 GHC for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced protecting your family. Amazing!	life_insurance	\N	\N	t	\N	\N
661879e4-963f-4495-9f2d-73e1b7e80e75	2025-11-03 21:00:06.413069	2025-11-03 21:00:06.413069	life_insurance.tier1_app_retained.celebrate	You're a life insurance champion now!	Incredible {name}! 🎉 You're now a long-term life insurance holder. Look at what you've achieved: \n✓ 9+ weeks of consistent payments \n✓ Strong family protection in place \n✓ Peace of mind for yourself \n✓ Confidence in managing your family's future \nCongratulations!	life_insurance	\N	\N	t	\N	\N
8373f807-9d93-4808-874b-f3922004947e	2025-11-03 21:00:06.619193	2025-11-03 21:00:06.619193	life_insurance.tier1_app_retained.incentive	You're building real family security	{name}, you've proven you can protect your family consistently for 9+ weeks. This dedication is giving your loved ones real security. The longer you continue, the stronger your family's safety net becomes. Your family's future is in your hands!	life_insurance	\N	\N	t	\N	\N
a0627484-f4fb-4468-a3a4-ad5960b1d6ea	2025-11-03 21:00:06.859404	2025-11-03 21:00:06.859404	life_insurance.tier1_app_retention_dropoff.how	Let's solve your life insurance issue	Hi {name}, you were such a consistent life insurance holder! We noticed you haven't made payments lately. Let's fix any issues: \n• To resume payments: Open Petra app → Make Payment → Select mobile money → Enter amount → Confirm \n• To adjust payment amount: My Policy → Payment Settings → Change amount \n• To update beneficiaries: My Policy → Beneficiaries → Edit details \n• To check coverage: My Policy → View Coverage\n\nDon't let your family's protection lapse!	life_insurance	\N	\N	t	\N	\N
9fea977e-0627-492b-a3d4-499dd6fb23d0	2025-11-03 21:00:07.087566	2025-11-03 21:00:07.087566	life_insurance.tier1_app_retention_dropoff.incentive	Your family's protection is too valuable to lose	{name}, every week of life insurance you maintained protected your family. By stopping now, you're leaving them vulnerable. Resume payments this week and keep your loved ones secure!	life_insurance	\N	\N	t	\N	\N
43dea24c-e102-425a-b083-425cb1146909	2025-11-03 21:00:07.309242	2025-11-03 21:00:07.309242	life_insurance.tier1_app_retention_dropoff.reactivation	Your family needs you! Resume protection now	{name}, we miss you! Your consistent payments provided financial security for your loved ones. Don't let this protection slip away. Make your payment today and restore your family's safety net!	life_insurance	\N	\N	t	\N	\N
e24dd016-3aa2-4b24-84ca-ed3e60250fe5	2025-11-03 21:00:07.522401	2025-11-03 21:00:07.522401	life_insurance.tier1_app_retention_dropoff.why	Why your family protection matters	{name}, you spent many weeks building financial security for your family. Here's what you lose by stopping: \n• No protection: If something happens, your family receives nothing \n• Lost peace of mind: Back to worrying about their future \n• Wasted commitment: Your previous payments lose value if you stop now \n\nYou worked hard to become a responsible protector. Make sure you continue using this protection to secure your family's future. Make your payment today and get back on track!	life_insurance	\N	\N	t	\N	\N
819cec94-173c-46f4-a994-5566c8d4a265	2025-11-03 21:00:07.754333	2025-11-03 21:00:07.754333	life_insurance.tier2_app_opened_first_time.celebrate	Welcome to life insurance!	Great start {name}! 🎉 You've opened your life insurance app for the first time. Finance is your second most important goal. This is the beginning of something meaningful - a way to protect your loved ones when they need it most. With life insurance, you can: \n✓ Protect your family from financial hardship \n✓ Ensure your loved ones can pay for household needs \n✓ Give yourself peace of mind \n✓ Show you care for your family's future \n\nTake the next step: Register your account!	life_insurance	\N	\N	t	\N	\N
1982328f-7cff-4de1-8a1f-1025a3ea18b9	2025-11-03 21:00:08.000168	2025-11-03 21:00:08.000168	life_insurance.tier2_app_adopted.celebrate	You're protecting your family!	Well done {name}! 🎉 You're now using life insurance. You've taken a step toward securing your family's future!	life_insurance	\N	\N	t	\N	\N
0c38891a-2ea1-4d0c-a861-6336a0913ff3	2025-11-03 21:00:08.221106	2025-11-03 21:00:08.221106	life_insurance.tier2_app_registered.celebrate	Your family protection is ready!	{name} congratulations on registering for life insurance! 🎉 This is a meaningful step! With your Petra account you can: \n✓ Protect your family \n✓ Pay small amounts regularly \n✓ Build peace of mind \nAll from your phone!	life_insurance	\N	\N	t	\N	\N
63c80ec9-cd4c-4f10-865b-c8babbe6eb84	2025-11-03 21:00:08.429313	2025-11-03 21:00:08.429313	life_insurance.tier2_app_low_activity.how	Quick tips for life insurance	Hi {name}, we noticed you haven't used your life insurance much. Ready to activate protection? Here's a quick start: \n1. Open your Petra app and review your policy\n2. Make your first payment \n3. Check your coverage details \nStart small until you're comfortable!	life_insurance	\N	\N	t	\N	\N
1f863880-ca83-467b-87b0-4b8c527fc9b0	2025-11-03 21:00:08.678398	2025-11-03 21:00:08.678398	life_insurance.tier2_app_low_activity.incentive	Try life insurance	{name}, keep your life insurance active and earn 10 GHC in just three weeks. The sooner you start protecting your family, the better.	life_insurance	\N	\N	t	\N	\N
14950fdf-540e-4012-97a9-9af37da75747	2025-11-03 21:00:08.906437	2025-11-03 21:00:08.906437	life_insurance.tier2_app_low_activity.support	Need help with life insurance?	Hi {name}, need help using your life insurance? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	life_insurance	\N	\N	t	\N	\N
297f8ec2-5ced-4e2e-b64e-72b847e8b6be	2025-11-03 21:00:09.128173	2025-11-03 21:00:09.128173	life_insurance.tier2_app_low_activity.why	Life insurance protects your family	{name}, life insurance offers real benefits: \n• Protects your loved ones from financial hardship \n• Gives you peace of mind \n• Requires only small regular payments \nGive it a try - many in your community already use it!	life_insurance	\N	\N	t	\N	\N
ab149dec-95a6-4f38-bcab-d9bcbfb0dc69	2025-11-03 21:00:09.340103	2025-11-03 21:00:09.340103	life_insurance.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've maintained life insurance for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep protecting your family!	life_insurance	\N	\N	t	\N	\N
db1411ea-4997-44eb-861d-f8081844463c	2025-11-03 21:00:09.546312	2025-11-03 21:00:09.546312	life_insurance.tier2_app_engaged.celebrate	You're protecting your family!	Great job {name}! 🎉 As an active life insurance user, you're keeping your family secure. You're building good financial protection habits!	life_insurance	\N	\N	t	\N	\N
078a2561-6861-43f8-898d-7108a6383851	2025-11-03 21:00:09.75802	2025-11-03 21:00:09.75802	life_insurance.tier2_app_engaged.incentive	Keep going with life insurance	{name}, you're doing well! Keep maintaining your life insurance and earn 10 GHC in a few weeks. Every payment counts!	life_insurance	\N	\N	t	\N	\N
1b069383-c053-472b-934e-96cab004f47c	2025-11-03 21:00:09.97825	2025-11-03 21:00:09.97825	life_insurance.all_tier2_app_engaged.reward	You're protecting your entire family! Collect your reward.	Outstanding {name}! 🎉 You're actively maintaining multiple financial protections. You've earned 500MB. The data will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're a champion for your family!	life_insurance	\N	\N	t	\N	\N
b22aaee9-59ea-4d18-8b26-5e9ca43518b8	2025-11-03 21:00:10.191419	2025-11-03 21:00:10.191419	life_insurance.all_tier1_tier2_app_engaged.celebrate	You're a complete financial protector!	Amazing {name}! 🎉 You're actively using ALL your financial protection apps. You've mastered life insurance and more. Your family is truly secure because of your commitment. This is outstanding - you're protecting everything that matters. Keep it up!	life_insurance	\N	\N	t	\N	\N
2336a536-ac36-4a25-844b-5dad1bf204d8	2025-11-03 21:00:10.422295	2025-11-03 21:00:10.422295	life_insurance.tier2_app_engagement_dropoff.how	Quick life insurance reminder	Hi {name}, we noticed you stopped making life insurance payments lately. Quick reminders: \n• To make payment: Petra app → Make Payment → Select mobile money → Enter amount → Confirm \n• To check status: My Policy → Payment History\n\nKeep your family protected!	life_insurance	\N	\N	t	["https://drive.google.com/file/d/1LF02vrW8hvO9guXJkqIinl4iaeYkMUIA/view?usp=drive_link"]	\N
d538afe2-8f78-433c-a0c1-3a6cbb4842a0	2025-11-03 21:00:10.675097	2025-11-03 21:00:10.675097	life_insurance.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, resume your life insurance and earn 10 GHC in a few weeks. It protects your family and gives you peace of mind.	life_insurance	\N	\N	t	\N	\N
47d67c9e-0de9-4f94-b7db-41ae110ad8ed	2025-11-03 21:00:10.878281	2025-11-03 21:00:10.878281	life_insurance.tier2_app_engagement_dropoff.reactivation	Try life insurance again?	{name}, you started building family protection with life insurance. Make your payment today and resume!	life_insurance	\N	\N	t	\N	\N
d1574bdb-2fe5-4f23-94dc-8ffdd7c72c5b	2025-11-03 21:00:11.086208	2025-11-03 21:00:11.086208	life_insurance.tier2_app_engagement_dropoff.why	Life insurance gives peace of mind	{name}, life insurance protects your family: \n• Ensures they can manage if something happens \n• Small regular payments \n• Peace of mind for you \nYou already know how to use it - try it again!	life_insurance	\N	\N	t	\N	\N
90c7b0b5-3f18-4eb2-905d-71184fd0f96c	2025-11-03 21:00:11.32118	2025-11-03 21:00:11.32118	life_insurance.tier2_app_engagement_sustained.celebrate	6 weeks of family protection!	Well done {name}! 🎉 You've maintained life insurance consistently for 6 weeks. You're protecting your family well and building good financial habits!	life_insurance	\N	\N	t	\N	\N
c613b32d-8f5d-422b-9a24-0f7be364c865	2025-11-03 21:00:11.545274	2025-11-03 21:00:11.545274	life_insurance.first_tier2_app_retained.reward	You've earned 10 GHC for consistent protection!	Excellent {name}! 🎉 You've maintained life insurance for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	life_insurance	\N	\N	t	\N	\N
a1466bbe-cc22-43d7-ab97-bc04b8810f70	2025-11-03 21:00:11.797151	2025-11-03 21:00:11.797151	life_insurance.tier2_app_retained.celebrate	You're a responsible family protector!	Impressive {name}! 🎉 You've been maintaining life insurance consistently. You're protecting your family well. Well done!	life_insurance	\N	\N	t	\N	\N
d1480707-dd80-4dad-b965-feb1b2f2d89b	2025-11-03 21:00:12.007997	2025-11-03 21:00:12.007997	life_insurance.tier2_app_retained.incentive	Keep your protection going	{name}, your consistent life insurance payments are building valuable family protection. Your loved ones are more secure because of you. Keep it up!	life_insurance	\N	\N	t	\N	\N
f7319e99-6ae1-4f12-8eb8-5253295e6f47	2025-11-03 21:00:12.613387	2025-11-03 21:00:12.613387	life_insurance.tier2_app_retention_dropoff.how	Quick life insurance reminder	Hi {name}, we noticed you stopped making life insurance payments. Quick reminders: \n• To make payment: Petra app → Make Payment → Select mobile money → Enter amount → Confirm \n• To check status: My Policy → Payment History\n\nResume protecting your family today!	life_insurance	\N	\N	t	\N	\N
1d5760c6-e900-451b-a38f-04e814a7cbc5	2025-11-03 21:00:12.828293	2025-11-03 21:00:12.828293	life_insurance.tier2_app_retention_dropoff.incentive	Your protection is waiting	{name}, you built consistent life insurance habits. Come back and keep protecting your family.	life_insurance	\N	\N	t	\N	\N
907c6d05-44b4-4406-83a5-f11f9925aec2	2025-11-03 21:00:13.059159	2025-11-03 21:00:13.059159	life_insurance.tier2_app_retention_dropoff.reactivation	Come back to life insurance	{name}, you were doing great with life insurance! Make your payment today and keep your family protected.	life_insurance	\N	\N	t	\N	\N
0215ee9f-5b6f-4e2d-8978-f7e9cf36f164	2025-11-03 21:00:13.737228	2025-11-03 21:00:13.737228	life_insurance.tier2_app_retention_dropoff.why	Keep your family secure	{name}, you built weeks of family protection. Keep going to maintain: \n• Your family's security \n• Peace of mind \n• Financial safety \nMake your payment today to stay protected!	life_insurance	\N	\N	t	\N	\N
74949939-049b-4f18-bf92-d3143ae55f41	2025-11-03 21:00:13.945222	2025-11-03 21:00:13.945222	life_insurance.all_tier1_tier2_app_retained.celebrate	You're a complete financial master!	Incredible {name}! 🎉 You've maintained ALL your financial protections for 9+ weeks. You're protecting your family in every way possible. This level of commitment is exceptional. You're not just managing money - you're securing your family's entire future. Outstanding achievement!	life_insurance	\N	\N	t	\N	\N
8adbc70e-e46c-462c-a182-907c13e85ecf	2025-11-03 21:00:14.186428	2025-11-03 21:00:14.186428	market_access.tier1_app_opened_first_time.celebrate	Welcome to GROW!	Great start {name}! 🎉 You've opened GROW for the first time. Work is your most important goal. This is the beginning of something powerful - connecting directly with buyers and getting better prices for your crops. With GROW, you can: \n✓ See current market prices before you sell \n✓ Connect with trusted buyers \n✓ Sell your crops for fairer prices \n\nTake the next step: Register your account!	market_access	\N	\N	t	\N	\N
b789a228-ee17-4cf0-a354-d9781bb2aee6	2025-11-03 21:00:14.399263	2025-11-03 21:00:14.399263	market_access.tier1_app_adopted.celebrate	You're taking control of your sales!	Well done {name}! 🎉 You're now using GROW to access markets. You've taken control of your farming business! By connecting with buyers through your phone, you're: \n✓ Getting fairer prices for your produce \n✓ Reducing dependence on middlemen \n✓ Finding new selling opportunities \nKeep going!	market_access	\N	\N	t	\N	\N
3758a5b2-6f47-402c-b809-437d981a47fa	2025-11-03 21:00:14.622391	2025-11-03 21:00:14.622391	market_access.tier1_app_registered.celebrate	Your market access is ready!	{name} congratulations on registering with GROW! 🎉 This is a major step forward! With your GROW account you can: \n✓ Check current crop prices \n✓ Connect with buyers \n✓ Sell your produce for better prices \n✓ Find market opportunities \nAll from your phone!	market_access	\N	\N	t	\N	\N
e6734b7e-dd9d-46a4-9372-06d85b8b09da	2025-11-03 21:00:14.855145	2025-11-03 21:00:14.855145	market_access.tier1_app_low_activity.how	Get the most from GROW	Hi {name}, we noticed you haven't used GROW much. Here's how to check market prices and find buyers: \n1. Open the GROW app\n2. Click on 'Sell Crops'\n3. Browse current market prices for your crops\n4. Post what you have available to sell\n5. Connect with interested buyers	market_access	\N	\N	t	\N	\N
c0a4e8ef-01da-489f-bfbf-3e58d9b633b8	2025-11-03 21:00:15.063241	2025-11-03 21:00:15.063241	market_access.tier1_app_low_activity.incentive	Your reward is waiting - start using GROW!	{name}, start using GROW and earn a reward of 10 GHC in just three weeks! Every time you check prices or connect with buyers, you're protecting yourself from unfair prices and building better business relationships. \nThe sooner you start, the sooner you'll see the difference. Check market prices today!	market_access	\N	\N	t	\N	\N
a6dc4569-639a-4847-89c7-5369583b1850	2025-11-03 21:00:15.278191	2025-11-03 21:00:15.278191	market_access.tier1_app_low_activity.support	Need help with GROW?	Hi {name}, need help using GROW? We're here for you! Common questions: \n• How to check prices? Open GROW → Click 'Sell Crops' → Browse current prices for your crops.\n• How to post crops for sale? Open GROW → 'Sell Crops' → Add what you're selling → Include quantity and location.\n• How to contact buyers? When a buyer shows interest, you'll receive their contact details through the app.\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	market_access	\N	\N	t	\N	\N
5b446839-35fe-4a82-9c92-0df80df3d51b	2025-11-03 21:00:15.524464	2025-11-03 21:00:15.524464	market_access.tier1_app_low_activity.why	Why market access matters for your income	{name}, we know trying new ways can feel uncertain. But selling only to local middlemen has real risks: \n• You accept whatever price they offer - often unfairly low \n• No way to compare prices across different markets \n• Miss opportunities when prices are higher elsewhere \n• Buyers know you have limited options \nGROW solves these problems. You can see fair prices, connect with multiple buyers, and negotiate from strength. Other farmers in your area already trust it. Take the first step today - you'll be glad you did!	market_access	\N	\N	t	\N	\N
026075ed-e4ae-4736-abcf-26b67c329b6a	2025-11-03 21:00:15.739211	2025-11-03 21:00:15.739211	market_access.first_tier1_app_engaged.reward	3 weeks of smart selling! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using GROW for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - a modern farming business with fair market access. Congratulations!	market_access	\N	\N	t	\N	\N
0bed48c5-44aa-4971-8e62-903981ec6fc3	2025-11-03 21:00:15.949328	2025-11-03 21:00:15.949328	market_access.tier1_app_engaged.celebrate	You're mastering market access!	Excellent work {name}! 🎉 Now that you are an active GROW user you're: \n✓ Getting better prices for your crops \n✓ Connecting with reliable buyers \n✓ Making informed decisions about when to sell \n✓ Building a reputation as a smart, modern farmer \nYou're not just selling crops - you're building your farming business's future. Keep it up!	market_access	\N	\N	t	\N	\N
330d191f-1f31-4872-bfe1-4aefd0c0093e	2025-11-03 21:00:16.168129	2025-11-03 21:00:16.168129	market_access.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with GROW! Keep using it actively and earn 10 GHC in a few weeks. The more you use market access, the more opportunities open up for you. Keep it up!	market_access	\N	\N	t	\N	\N
8cc02b11-146a-4b0f-894d-2d464445d7c0	2025-11-03 21:00:16.384353	2025-11-03 21:00:16.384353	market_access.tier1_app_engagement_dropoff.how	Come back to GROW - we can help!	Hi {name}, we noticed you stopped using GROW recently. Let's get you back on track! Quick reminders: \n• To check prices: Open GROW → 'Sell Crops' → Browse current prices for your crops\n• To post crops for sale: Click 'Sell Crops' → Expression of Interest → Select Crop → Input quantity and price → Submit\n• To contact buyers: Check your notifications for buyer interest → Follow up through the app\n\nWatch the video to learn how to make the most of market access.	market_access	\N	\N	t	["https://drive.google.com/file/d/1Z_zkXfjdfsHD2_VIyZhBYryjncFL4o3Q/view?usp=drive_link"]	\N
ea42790c-7160-4dfb-930e-b59c566262b6	2025-11-03 21:00:16.603143	2025-11-03 21:00:16.603143	market_access.tier1_app_engagement_dropoff.incentive	Don't lose your market access momentum!	{name}, you were doing so well with GROW! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of getting fair prices and connecting directly with buyers who value your produce.	market_access	\N	\N	t	\N	\N
49575f88-2e0c-4fb2-bd50-a15807601856	2025-11-03 21:00:16.825194	2025-11-03 21:00:16.825194	market_access.tier1_app_engagement_dropoff.reactivation	GROW misses you - come back today!	{name}, we miss you! You were building something important with GROW: direct access to fair markets and better prices for your hard work. Take 2 minutes today to use GROW again and get back on track!	market_access	\N	\N	t	\N	\N
add2ae8b-e730-4d0e-9a4d-e00df549cecc	2025-11-03 21:00:17.045344	2025-11-03 21:00:17.045344	market_access.tier1_app_engagement_dropoff.why	Remember why you started using GROW	{name}, going back to selling only to middlemen means going back to old problems: \n• Accepting unfair prices - GROW shows you what fair prices look like \n• Missing opportunities - GROW connects you to buyers actively looking for your crops \n• No negotiating power - GROW gives you options and information \nYou already learned how to use market access. Don't give up the fair prices and opportunities you worked for. Your future harvests will thank you!	market_access	\N	\N	t	\N	\N
0f2131c5-b6fe-4d39-80f3-51e5bb62d337	2025-11-03 21:00:17.259226	2025-11-03 21:00:17.259226	market_access.tier1_app_engagement_sustained.celebrate	You're a consistent GROW user!	Fantastic {name}! 🎉 You've maintained active market access use for 6 weeks. This isn't luck - this is YOU taking control of your farming business! You've proven that: \n✓ You can negotiate better prices \n✓ You can connect with reliable buyers \n✓ You're ready for bigger market opportunities \n✓ You're building your farming success \nYou're thriving and you're an example to other farmers. Congratulations!	market_access	\N	\N	t	\N	\N
54ad7dd0-9745-4374-af7d-a6eccd73ecb5	2025-11-03 21:00:17.469889	2025-11-03 21:00:17.469889	market_access.first_tier1_app_retained.reward	9 weeks of market success! Collect your reward.	Exceptional achievement {name}! 🎉 You've used GROW actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced modern farming with fair market access. Amazing!	market_access	\N	\N	t	\N	\N
c3cd29ea-e17c-4e1c-8b27-84fa5340c8b0	2025-11-03 21:00:17.70122	2025-11-03 21:00:17.70122	market_access.tier1_app_retained.celebrate	You're a market access expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term GROW user. Look at what you've achieved: \n✓ 9+ weeks of consistent market access use \n✓ Better prices than ever before \n✓ Strong relationships with reliable buyers \n✓ Confidence using digital tools for farming business \nCongratulations!	market_access	\N	\N	t	\N	\N
a2c3e9d0-6002-4f2c-84b3-fc0859dee338	2025-11-03 21:00:17.912577	2025-11-03 21:00:17.912577	market_access.tier1_app_retained.incentive	You're building real farming power	{name}, you've proven you can manage market access digitally for 9+ weeks. This consistency is opening doors: buyers see you as reliable, you're getting better prices, and you're protecting your hard work. The longer you keep going, the more opportunities become available to you. Your farming future is in your hands!	market_access	\N	\N	t	\N	\N
1400d85a-42d4-4f62-ac9c-b2986f4db9d6	2025-11-03 21:00:18.123314	2025-11-03 21:00:18.123314	market_access.tier1_app_retention_dropoff.how	Let's solve your GROW issue	Hi {name}, you were such a consistent GROW user! We noticed you haven't been active lately. Let's fix any issues: \n• To check prices: Open GROW → 'Sell Crops' → Browse current market prices\n• To post crops for sale: Click 'Sell Crops' → Expression of Interest → Select Crop → Input quantity and price → Submit\n• To connect with buyers: Check app notifications → Follow up on buyer interest\n• To update listings: Open your active listings → Edit details or mark as sold\n\nWatch the video to learn how to make the most of market access.	market_access	\N	\N	t	["https://drive.google.com/file/d/1Z_zkXfjdfsHD2_VIyZhBYryjncFL4o3Q/view?usp=drive_link"]	\N
de061de4-8984-43a9-a143-0b05cfe773ab	2025-11-03 21:00:18.338102	2025-11-03 21:00:18.338102	market_access.tier1_app_retention_dropoff.incentive	Your market connections are too valuable to lose	{name}, every week of GROW use you've built adds to your reputation with buyers and your knowledge of fair prices. By stopping now, you lose those connections and go back to accepting whatever local middlemen offer. Use GROW this week and keep your options open!	market_access	\N	\N	t	\N	\N
f01c7286-66e2-4ce4-b04c-57003af26ad0	2025-11-03 21:00:18.548388	2025-11-03 21:00:18.548388	market_access.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a market access champion	{name}, we miss you! Your consistent use of GROW provided fair prices and reliable buyer connections. Make sure you don't let this slip away. Take 2 minutes today to use GROW again and get back on track!	market_access	\N	\N	t	\N	\N
4d0b2313-150a-4dc4-82cf-0a8b18e1e09c	2025-11-03 21:00:18.782393	2025-11-03 21:00:18.782393	market_access.tier1_app_retention_dropoff.why	Why your market access track record matters	{name}, you spent many weeks building smart selling habits. Here's what you lose by stopping: \n• Fair prices: Back to accepting whatever middlemen offer \n• Buyer relationships: Lose connections with reliable buyers who know you \n• Market knowledge: Back to guessing when and where to sell \n\nYou worked hard to become a market-savvy farmer. Make sure that you continue to use this knowledge to improve your income. Take two minutes today to use GROW and get back on track.	market_access	\N	\N	t	\N	\N
ba5c4e37-3e82-4113-bfdc-600a257318c1	2025-11-03 21:00:18.99334	2025-11-03 21:00:18.99334	market_access.tier2_app_opened_first_time.celebrate	Welcome to GROW!	Great start {name}! 🎉 You've opened GROW for the first time. Work is your second most important goal. This is the beginning of something powerful - connecting directly with buyers and getting better prices for your crops. With GROW, you can: \n✓ See current market prices before you sell \n✓ Connect with trusted buyers \n✓ Sell your crops for fairer prices \n✓ Build a reputation as a reliable seller \n\nTake the next step: Register your account!	market_access	\N	\N	t	\N	\N
21211b17-807d-449c-a79a-3e1758b1ea9d	2025-11-03 21:00:19.224223	2025-11-03 21:00:19.224223	market_access.tier2_app_adopted.celebrate	You're taking control of your sales!	Well done {name}! 🎉 You're now using GROW to access markets. You've taken control of your selling!	market_access	\N	\N	t	\N	\N
f65e13aa-8594-4642-8741-7f7bc56c5227	2025-11-03 21:00:19.457127	2025-11-03 21:00:19.457127	market_access.tier2_app_registered.celebrate	Your market access is ready!	{name} congratulations on registering with GROW! 🎉 This is a major step forward! With your GROW account you can: \n✓ Check current crop prices \n✓ Connect with buyers \n✓ Sell your produce for better prices \n✓ Find market opportunities \nAll from your phone!	market_access	\N	\N	t	\N	\N
6fce2288-0fb7-4e3c-8b2e-5b3965a694e3	2025-11-03 21:00:19.659289	2025-11-03 21:00:19.659289	market_access.tier2_app_low_activity.how	Quick tips for GROW	Hi {name}, we noticed you haven't used GROW much. Ready to try market access? Here's a quick start: \n1. Open GROW and check current crop prices\n2. Try posting one of your crops for sale\n3. See how buyers respond \nStart small until you're comfortable!	market_access	\N	\N	t	\N	\N
a0767646-93ab-4596-ac0b-70e05141248c	2025-11-03 21:00:19.899141	2025-11-03 21:00:19.899141	market_access.tier2_app_low_activity.incentive	Try GROW	{name}, start using GROW and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll see better prices for your crops.	market_access	\N	\N	t	\N	\N
78126d4e-ad80-4743-a079-dadba97405be	2025-11-03 21:00:20.150337	2025-11-03 21:00:20.150337	market_access.tier2_app_low_activity.support	Need help with GROW?	Hi {name}, need help using GROW? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	market_access	\N	\N	t	\N	\N
0a966503-04ae-47d5-8d12-7101d736d921	2025-11-03 21:00:20.368206	2025-11-03 21:00:20.368206	market_access.tier2_app_low_activity.why	Market access makes farming better	{name}, GROW offers real benefits: \n• Get fairer prices than local middlemen offer \n• Connect with buyers actively looking for your crops \n• Know when prices are good for selling \nGive it a try - many farmers in your area already use it!	market_access	\N	\N	t	\N	\N
9deba21a-392d-40df-85b0-dfab7fe7e41f	2025-11-03 21:00:20.59933	2025-11-03 21:00:20.59933	market_access.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used GROW for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	market_access	\N	\N	t	\N	\N
8cc87a56-d5f4-443b-b76f-43f2a61989c2	2025-11-03 21:00:20.830186	2025-11-03 21:00:20.830186	market_access.tier2_app_engaged.celebrate	You're using market access!	Great job {name}! 🎉 As an active GROW user, you're getting better prices and finding new buyers. You're building good farming business habits!	market_access	\N	\N	t	\N	\N
621f0f40-75c6-4cf7-8348-b3a5769d95aa	2025-11-03 21:00:21.084193	2025-11-03 21:00:21.084193	market_access.tier2_app_engaged.incentive	Keep going with GROW	{name}, you're doing well! Keep using market access and earn 10 GHC in a few weeks. Every connection counts!	market_access	\N	\N	t	\N	\N
85271b02-7a1d-4f3d-8eef-cd5242c1685c	2025-11-03 21:00:21.333105	2025-11-03 21:00:21.333105	market_access.tier2_app_engagement_dropoff.how	Quick GROW reminder	Hi {name}, we noticed that you stopped using GROW lately. Quick reminders: \n• To check prices: Open GROW → 'Sell Crops' → Browse current prices\n• To post crops for sale: Click 'Sell Crops' → Expression of Interest → Select Crop → Input quantity and price → Submit\n• To contact buyers: Check your app notifications\n\nWatch the video for a refresher.	market_access	\N	\N	t	["https://drive.google.com/file/d/1Z_zkXfjdfsHD2_VIyZhBYryjncFL4o3Q/view?usp=drive_link"]	\N
6de9da63-2a27-4973-a291-d9e7281f1be7	2025-11-03 21:00:21.580459	2025-11-03 21:00:21.580459	market_access.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to GROW and earn 10 GHC in a few weeks. It connects you with fair buyers, helps you get better prices, and builds your farming business.	market_access	\N	\N	t	\N	\N
95938457-b33c-43d5-8ce3-0296dc70119d	2025-11-03 21:00:21.822278	2025-11-03 21:00:21.822278	market_access.tier2_app_engagement_dropoff.reactivation	Try GROW again?	{name}, you started building good selling habits with GROW. Take 2 minutes today to use it again!	market_access	\N	\N	t	\N	\N
0fb01be4-f12d-4646-a964-40cc2ed2d424	2025-11-03 21:00:22.05935	2025-11-03 21:00:22.05935	market_access.tier2_app_engagement_dropoff.why	Market access is empowering and profitable	{name}, GROW offers better opportunities: \n• Fair prices vs. whatever middlemen offer \n• Connect with multiple buyers \n• Know market conditions before selling \nYou already know how to use it - try it again!	market_access	\N	\N	t	\N	\N
4af6af90-05d6-4143-8eaa-b9d03cdd9821	2025-11-03 21:00:22.281554	2025-11-03 21:00:22.281554	market_access.tier2_app_engagement_sustained.celebrate	6 weeks of market access!	Well done {name}! 🎉 You've used GROW consistently for 6 weeks. You're managing your sales well and building strong buyer relationships!	market_access	\N	\N	t	\N	\N
e9c74d2f-c303-440b-bd50-ab92b29dde25	2025-11-03 21:00:22.492021	2025-11-03 21:00:22.492021	market_access.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency with GROW!	Excellent {name}! 🎉 You've used GROW for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	market_access	\N	\N	t	\N	\N
8edf12de-423d-4af8-bebc-e0cbe9d8ba51	2025-11-03 21:00:22.704292	2025-11-03 21:00:22.704292	market_access.tier2_app_retained.celebrate	You're a GROW user!	Impressive {name}! 🎉 You've been using market access consistently. You're getting fair prices and building reliable buyer connections. Well done!	market_access	\N	\N	t	\N	\N
67e78152-d68f-4862-9a74-13fc0a0a4bb0	2025-11-03 21:00:22.943282	2025-11-03 21:00:22.943282	market_access.tier2_app_retained.incentive	Keep your market access habit going	{name}, your consistent GROW use is turning into valuable business habits. You're getting better prices and building your reputation with buyers. Keep it up!	market_access	\N	\N	t	\N	\N
5142bd76-23f0-4644-a021-1bb168fced63	2025-11-03 21:00:23.206368	2025-11-03 21:00:23.206368	market_access.tier2_app_retention_dropoff.how	Quick GROW reminder	Hi {name}, we noticed that you stopped using GROW lately. Quick reminders: \n• To check prices: Open GROW → 'Sell Crops' → Browse current prices\n• To post crops for sale: Click 'Sell Crops' → Expression of Interest → Select Crop → Input quantity and price → Submit\n• To contact buyers: Check your app notifications\n\nWatch the video for a refresher.	market_access	\N	\N	t	["https://drive.google.com/file/d/1Z_zkXfjdfsHD2_VIyZhBYryjncFL4o3Q/view?usp=drive_link"]	\N
566ed428-f3cc-4913-b92a-e115480070f4	2025-11-03 21:00:23.422073	2025-11-03 21:00:23.422073	market_access.tier2_app_retention_dropoff.incentive	Your market connections are waiting	{name}, you built great market access habits. Come back and keep strengthening your buyer relationships and getting fair prices.	market_access	\N	\N	t	\N	\N
14777797-79be-4fec-9e59-dd2f2b46325f	2025-11-03 21:00:23.669175	2025-11-03 21:00:23.669175	market_access.tier2_app_retention_dropoff.reactivation	Come back to GROW	{name}, you were doing great with market access! Use it again today and keep your selling habits strong.	market_access	\N	\N	t	\N	\N
3ed6ee59-7ebe-4b44-8f0d-444d06196dd4	2025-11-03 21:00:23.885192	2025-11-03 21:00:23.885192	market_access.tier2_app_retention_dropoff.why	Keep your market progress	{name}, you built weeks of good selling habits. Keep going to maintain: \n• Your buyer connections \n• Fair price knowledge \n• Better income opportunities \nUse it today to stay on track!	market_access	\N	\N	t	\N	\N
cd30f959-6fb6-404a-b362-8dce057b7583	2025-11-03 21:00:24.095223	2025-11-03 21:00:24.095223	medicine_access.tier1_app_opened_first_time.celebrate	Welcome to easy medicine access!	Great start {name}! 🎉 You've opened your medicine access app for the first time. Health is your most important goal. This is the beginning of something powerful - a safer, easier way to get the medicines you need. With this app, you can: \n✓ Order medicines from verified pharmacies \n✓ Get medicines delivered to your home \n✓ Find the best prices for your medications \n✓ Access medicines without long trips \n\nTake the next step: Register your account!	medicine_access	\N	\N	t	\N	\N
9fcc2374-7405-46ce-ae5b-f5cce41184fa	2025-11-03 21:00:24.302251	2025-11-03 21:00:24.302251	medicine_access.tier1_app_adopted.celebrate	You're taking control of your health needs!	Well done {name}! 🎉 You're now using the medicine access app. You've taken control of your healthcare! By ordering medicines through your phone, you're: \n✓ Saving time and transport costs \n✓ Getting verified, quality medicines \n✓ Accessing better prices \n✓ Keeping your family healthy \nKeep going!	medicine_access	\N	\N	t	\N	\N
dbd40ab7-8fb9-4e81-af9c-ca98e44bea65	2025-11-03 21:00:24.524252	2025-11-03 21:00:24.524252	medicine_access.tier1_app_registered.celebrate	Your medicine access account is ready!	{name} congratulations on registering for medicine access! 🎉 This is a major step forward! With your account you can: \n✓ Search for any medicine you need \n✓ Compare prices from different pharmacies \n✓ Order with home delivery or pickup \n✓ Track your order status \nAll from your phone!	medicine_access	\N	\N	t	\N	\N
0fc9505b-6fb0-4f01-b66d-cc0e81200040	2025-11-03 21:00:24.784983	2025-11-03 21:00:24.784983	medicine_access.tier1_app_low_activity.how	Get the medicines you need - here's how	Hi {name}, we noticed you haven't used your medicine access app much. It's easy to get started! Here's how: \n1. Open your medicine access app \n2. Click 'Find Pharmacy' to see pharmacies near you \n3. Click 'Buy Medicine' and search for the medicine name \n4. Select the amount you need and add to cart \n5. Choose pickup or delivery \n6. Confirm your order \nStart with a medicine you use regularly. Once you try it, you'll see how much time and effort it saves!	medicine_access	\N	\N	t	\N	\N
86bff28e-1c7e-4e5a-b020-152527acdff1	2025-11-03 21:00:25.073318	2025-11-03 21:00:25.073318	medicine_access.tier1_app_low_activity.incentive	Your reward is waiting - start using your medicine access app!	{name}, start using your medicine access app and earn a reward of 10 GHC in just three weeks! Every time you order medicine through the app, you save time, avoid long trips to the pharmacy, and get verified quality medicines. \nThe sooner you start, the sooner you'll wonder how you managed without it. Order one medicine today!	medicine_access	\N	\N	t	\N	\N
cd185b55-c13c-4fc7-be6f-543f0d608ddd	2025-11-03 21:00:25.319271	2025-11-03 21:00:25.319271	medicine_access.tier1_app_low_activity.support	Need help accessing medicines?	Hi {name}, need help using your medicine access app? We're here for you! Common questions: \n• How to find a pharmacy? Click 'Find Pharmacy' to see options near you with distances shown \n• How to order medicine? Click 'Buy Medicine', search the medicine name, select amount, and add to cart \n• Need a prescription? Click 'Add prescription' to upload your doctor's note \n• Delivery or pickup? Choose what works best - delivery may have additional costs \n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	medicine_access	\N	\N	t	\N	\N
a5fa1902-b1b5-47bd-a7b2-6ff237de30cd	2025-11-03 21:00:25.528307	2025-11-03 21:00:25.528307	medicine_access.tier1_app_low_activity.why	Why medicine access matters for your health	{name}, we know going to the pharmacy takes time and money. But ordering medicines through your phone solves these problems: \n• No more long trips to multiple pharmacies searching for medicines \n• No transport costs just to pick up medicine \n• No waiting in long queues when you're already not feeling well \n• See prices before ordering so you can find the best deal \n• Get medicines delivered to your home \nYour health shouldn't wait. Others in your community already trust this service. Order your first medicine today - you'll be glad you did!	medicine_access	\N	\N	t	\N	\N
27e62cb7-0dc3-4bb2-b382-97de90548fc0	2025-11-03 21:00:25.762274	2025-11-03 21:00:25.762274	medicine_access.first_tier1_app_engaged.reward	3 weeks of using medicine access! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively using medicine access for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're making healthcare easier for yourself and your family. Congratulations!	medicine_access	\N	\N	t	\N	\N
1201d224-0280-4b5d-9db4-49c7f2052ffa	2025-11-03 21:00:25.984592	2025-11-03 21:00:25.984592	medicine_access.tier1_app_engaged.celebrate	You're mastering medicine access!	Excellent work {name}! 🎉 Now that you are an active medicine access user you're: \n✓ Saving time on every medicine purchase\n✓ Getting verified quality medicines \n✓ Avoiding long pharmacy trips and queues\n✓ Finding better prices for your medications \n✓ Always having convenient access to medicines \nYou're not just using an app - you're building better health habits for your family. Keep it up!	medicine_access	\N	\N	t	\N	\N
3707c2a0-86fe-460a-8278-3c8a01d5d278	2025-11-03 21:00:26.220315	2025-11-03 21:00:26.220315	medicine_access.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with medicine access! Keep using it actively and earn 10 GHC in a few weeks. The more you use the app, the more convenient healthcare becomes. Keep it up!	medicine_access	\N	\N	t	\N	\N
70d72f84-f9e3-40fc-8905-d1774d9f8189	2025-11-03 21:00:26.499218	2025-11-03 21:00:26.499218	medicine_access.tier1_app_engagement_dropoff.how	Come back to medicine access - we can help!	Hi {name}, we noticed you stopped using medicine access recently. Let's get you back on track! Quick reminders: \n• To find pharmacy: Click 'Find Pharmacy' to see options near you \n• To order medicine: Click 'Buy Medicine' → Search medicine name → Select amount → Add to cart → Choose pickup or delivery \n• To add prescription: Click 'Add prescription' to upload doctor's note \n• To track order: Click on your order to see status \n\nWatch the video below to learn how to make the most of medicine access.\n<video>	medicine_access	\N	\N	t	\N	\N
e5d35a1f-2c22-4a2c-8198-96e588538ac2	2025-11-03 21:00:26.721406	2025-11-03 21:00:26.721406	medicine_access.tier1_app_engagement_dropoff.incentive	Don't lose your medicine access momentum!	{name}, you were doing so well with medicine access! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of convenient medicine ordering and avoiding long pharmacy trips.	medicine_access	\N	\N	t	\N	\N
eec6a2c1-7890-48cc-840f-8c8c29c698b1	2025-11-03 21:00:26.958061	2025-11-03 21:00:26.958061	medicine_access.tier1_app_engagement_dropoff.reactivation	Your medicine access app misses you - come back today!	{name}, we miss you! You were building something important with medicine access: convenient healthcare and time saved. Take 2 minutes today to order a medicine you need and get back on track!	medicine_access	\N	\N	t	\N	\N
fd91880b-5434-42d1-a290-2660eeccc4fd	2025-11-03 21:00:27.156332	2025-11-03 21:00:27.156332	medicine_access.tier1_app_engagement_dropoff.why	Remember why you started medicine access	{name}, going back to pharmacy trips means going back to old problems: \n• Time wasted: Long trips and queues just to get medicine \n• Extra costs: Transport money adds up quickly \n• Inconvenience: Searching multiple pharmacies when they're out of stock \n• When you're sick: The last thing you want is a long trip \nYou already learned how to use medicine access. Don't give up the convenience you worked for. Your health deserves better. Come back today!	medicine_access	\N	\N	t	\N	\N
105b0380-a0bb-4842-906a-537e63fc04e1	2025-11-03 21:00:27.379245	2025-11-03 21:00:27.379245	medicine_access.tier1_app_engagement_sustained.celebrate	You're a consistent medicine access user!	Fantastic {name}! 🎉 You've maintained active medicine access use for 6 weeks. This isn't luck - this is YOU taking control of your family's healthcare! You've proven that: \n✓ You can trust digital medicine ordering \n✓ You can manage health needs conveniently \n✓ You're ready for better healthcare access \n✓ You're saving time and money consistently \nYou're thriving and you're an example to others. Congratulations!	medicine_access	\N	\N	t	\N	\N
00e06d74-6f6d-4217-b181-2bf81fa57cc8	2025-11-03 21:00:27.619232	2025-11-03 21:00:27.619232	medicine_access.first_tier1_app_retained.reward	9 weeks of medicine access! Collect your reward.	Exceptional achievement {name}! 🎉 You've used medicine access actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced convenient healthcare. Amazing!	medicine_access	\N	\N	t	\N	\N
7b127850-cde4-42ce-abc9-e8a1535e922d	2025-11-03 21:00:27.841471	2025-11-03 21:00:27.841471	medicine_access.tier1_app_retained.celebrate	You're a medicine access expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term medicine access user. Look at what you've achieved: \n✓ 9+ weeks of consistent medicine access use \n✓ Convenient healthcare management for your family \n✓ Time and money saved on every order \n✓ Confidence using digital health services \nCongratulations!	medicine_access	\N	\N	t	\N	\N
40ff2bd0-d61b-4919-9e1e-00244509b7ec	2025-11-03 21:00:28.049407	2025-11-03 21:00:28.049407	medicine_access.tier1_app_retained.incentive	You're building real healthcare convenience	{name}, you've proven you can manage your family's medicine needs digitally for 9+ weeks. This consistency means you're always ready when health needs arise. The longer you keep going, the more benefits you unlock. Your family's health is in good hands!	medicine_access	\N	\N	t	\N	\N
a4335742-51bf-4958-b6d4-7d2553e8ba0f	2025-11-03 21:00:28.249251	2025-11-03 21:00:28.249251	medicine_access.tier1_app_retention_dropoff.how	Let's solve your medicine access issue	Hi {name}, you were such a consistent medicine access user! We noticed you haven't been active lately. Let's fix any issues: \n• To find pharmacy: Click 'Find Pharmacy' to see pharmacies near you \n• To order medicine: Open app → Click 'Buy Medicine' → Search medicine name → Select amount → Add to cart \n• To add prescription: Click 'Add prescription' to upload your doctor's note \n• To track order: Click on your order to see delivery status \n\nWatch the video below to learn how to make the most of medicine access.\n<video>	medicine_access	\N	\N	t	\N	\N
ab086bc3-7bea-469d-9a92-3449823465fc	2025-11-03 21:00:28.45925	2025-11-03 21:00:28.45925	medicine_access.tier1_app_retention_dropoff.incentive	Your healthcare convenience is too valuable to lose	{name}, every week of medicine access use you've built adds to your family's healthcare convenience. By stopping now, you lose the time savings and convenience. Use medicine access this week and keep your healthcare organized!	medicine_access	\N	\N	t	\N	\N
dccc423f-6eaf-4eeb-b168-f3e5c3164ec1	2025-11-03 21:00:28.683091	2025-11-03 21:00:28.683091	medicine_access.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a medicine access champion	{name}, we miss you! Your consistent use of medicine access provided convenient healthcare and time saved. Make sure you don't let this slip away. Take 2 minutes today to order a medicine and get back on track!	medicine_access	\N	\N	t	\N	\N
7ef06473-e945-41e0-a7c7-6130c8b959a9	2025-11-03 21:00:28.904274	2025-11-03 21:00:28.904274	medicine_access.tier1_app_retention_dropoff.why	Why your medicine access habits matter	{name}, you spent many weeks building convenient healthcare habits. Here's what you lose by stopping: \n• Convenience: Back to long pharmacy trips and queues \n• Time wasted: Hours spent traveling and waiting \n• Money lost: Transport costs add up \n• When sick: No easy way to get medicines quickly \n\nYou worked hard to become a medicine access expert. Make sure that you continue to use this service to improve your family's healthcare. Take two minutes today to order a medicine and get back on track.	medicine_access	\N	\N	t	\N	\N
be5d8383-664e-4409-b9fa-cc39fc991f42	2025-11-03 21:00:29.122121	2025-11-03 21:00:29.122121	medicine_access.tier2_app_opened_first_time.celebrate	Welcome to easy medicine access!	Great start {name}! 🎉 You've opened your medicine access app for the first time. Health is your second most important goal. This is the beginning of something powerful - a safer, easier way to get the medicines you need. With this app, you can: \n✓ Order medicines from verified pharmacies \n✓ Get medicines delivered to your home \n✓ Find the best prices for your medications \n✓ Access medicines without long trips \n\nTake the next step: Register your account!	medicine_access	\N	\N	t	\N	\N
9a280435-7170-49a4-85c6-35b4512a0815	2025-11-03 21:00:29.329346	2025-11-03 21:00:29.329346	medicine_access.tier2_app_adopted.celebrate	You're taking control of your health needs!	Well done {name}! 🎉 You're now using the medicine access app. You've taken control of your healthcare!	medicine_access	\N	\N	t	\N	\N
6596e10b-8afe-4fb4-8e26-2908c8eabce5	2025-11-03 21:00:29.551274	2025-11-03 21:00:29.551274	medicine_access.tier2_app_registered.celebrate	Your medicine access account is ready!	{name} congratulations on registering for medicine access! 🎉 This is a major step forward! With your account you can: \n✓ Search for medicines \n✓ Compare prices \n✓ Order with delivery or pickup \n✓ Track your orders \nAll from your phone!	medicine_access	\N	\N	t	\N	\N
4e05aa5c-3ece-4a67-a030-629b876ac7c8	2025-11-03 21:00:29.79022	2025-11-03 21:00:29.79022	medicine_access.tier2_app_low_activity.how	Quick tips for medicine access	Hi {name}, we noticed you haven't used your medicine access app much. Ready to try it? Here's a quick start: \n1. Open your app and find a pharmacy \n2. Search for a medicine you need \n3. Add to cart and choose pickup or delivery \nStart small until you're comfortable!	medicine_access	\N	\N	t	\N	\N
67671d1d-70d2-4e32-9730-23015ec33a07	2025-11-03 21:00:30.005223	2025-11-03 21:00:30.005223	medicine_access.tier2_app_low_activity.incentive	Try medicine access	{name}, start using your medicine access app and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll see how convenient it is.	medicine_access	\N	\N	t	\N	\N
5b907d5c-1c64-4569-9eed-299c44301bc4	2025-11-03 21:00:30.259196	2025-11-03 21:00:30.259196	medicine_access.tier2_app_low_activity.support	Need help with medicine access?	Hi {name}, need help using your medicine access app? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	medicine_access	\N	\N	t	\N	\N
a45dc101-942c-4bf1-a8a5-7f03e4f87f40	2025-11-03 21:00:30.479446	2025-11-03 21:00:30.479446	medicine_access.tier2_app_low_activity.why	Medicine access makes healthcare easier	{name}, medicine access offers real benefits: \n• Order medicines from home \n• No long pharmacy trips \n• Get better prices \n• Convenient delivery or pickup \nGive it a try - many in your community already use it!	medicine_access	\N	\N	t	\N	\N
170c3f21-9c2c-4082-9c4d-606fcacc2444	2025-11-03 21:00:30.689201	2025-11-03 21:00:30.689201	medicine_access.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used medicine access for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	medicine_access	\N	\N	t	\N	\N
2f27b8e4-1b65-4280-96f8-759412b5e988	2025-11-03 21:00:30.910039	2025-11-03 21:00:30.910039	medicine_access.tier2_app_engaged.celebrate	You're using medicine access!	Great job {name}! 🎉 As an active medicine access user, you're making healthcare more convenient and saving time. You're building good health habits!	medicine_access	\N	\N	t	\N	\N
d2848073-1530-4330-993e-96100b571f1a	2025-11-03 21:00:31.147136	2025-11-03 21:00:31.147136	medicine_access.tier2_app_engaged.incentive	Keep going with medicine access	{name}, you're doing well! Keep using medicine access and earn 10 GHC in a few weeks. Every order counts!	medicine_access	\N	\N	t	\N	\N
85336a5f-05e0-4469-bf54-5a76593df436	2025-11-03 21:00:31.380138	2025-11-03 21:00:31.380138	medicine_access.tier2_app_engagement_dropoff.how	Quick medicine access reminder	Hi {name}, we noticed that you stopped medicine access lately. Quick reminders: \n• To find pharmacy: Click 'Find Pharmacy' \n• To order: Click 'Buy Medicine' → Search → Add to cart → Choose delivery or pickup \n• To track: Click on your order \n\nWatch the video for a refresher: <video>	medicine_access	\N	\N	t	\N	\N
3f72d667-32d7-4009-ab65-dc77e7ea2bc1	2025-11-03 21:00:31.605228	2025-11-03 21:00:31.605228	medicine_access.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to medicine access and earn 10 GHC in a few weeks. It saves time and makes healthcare convenient.	medicine_access	\N	\N	t	\N	\N
a4b83de7-ee48-41c2-93e3-a1f06a37f8aa	2025-11-03 21:00:31.823205	2025-11-03 21:00:31.823205	medicine_access.tier2_app_engagement_dropoff.reactivation	Try medicine access again?	{name}, you started building good healthcare habits with medicine access. Take 2 minutes today to order a medicine!	medicine_access	\N	\N	t	\N	\N
fd076396-7a8f-49a0-a95e-9098bdddbe0e	2025-11-03 21:00:32.081194	2025-11-03 21:00:32.081194	medicine_access.tier2_app_engagement_dropoff.why	Medicine access is convenient	{name}, medicine access offers convenience: \n• Order from home \n• Save time and transport costs \n• Get verified medicines \nYou already know how to use it - try it again!	medicine_access	\N	\N	t	\N	\N
02d54a3d-128f-4b6a-9af2-1bb798264d51	2025-11-03 21:00:32.299262	2025-11-03 21:00:32.299262	medicine_access.tier2_app_engagement_sustained.celebrate	6 weeks of medicine access!	Well done {name}! 🎉 You've used medicine access consistently for 6 weeks. You're managing healthcare well and building convenience!	medicine_access	\N	\N	t	\N	\N
2075b1ae-326b-416b-8e43-8ee342aa4a40	2025-11-03 21:00:32.513084	2025-11-03 21:00:32.513084	medicine_access.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency with medicine access!	Excellent {name}! 🎉 You've used medicine access for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	medicine_access	\N	\N	t	\N	\N
ff990b29-f055-4b78-b7b4-da9dc515fc94	2025-11-03 21:00:32.752618	2025-11-03 21:00:32.752618	medicine_access.tier2_app_retained.celebrate	You're a medicine access user!	Impressive {name}! 🎉 You've been using medicine access consistently. You're managing healthcare conveniently and saving time. Well done!	medicine_access	\N	\N	t	\N	\N
2c7a0c5c-3c0c-484a-875f-91d2702c678b	2025-11-03 21:00:32.965341	2025-11-03 21:00:32.965341	medicine_access.tier2_app_retained.incentive	Keep your medicine access habit going	{name}, your consistent medicine access use is creating valuable healthcare habits. Healthcare is more convenient and you're saving time. Keep it up!	medicine_access	\N	\N	t	\N	\N
bd12e1d1-3db9-4f2e-a012-3da49537bc46	2025-11-03 21:00:33.179299	2025-11-03 21:00:33.179299	medicine_access.tier2_app_retention_dropoff.how	Quick medicine access reminder	Hi {name}, we noticed that you stopped medicine access lately. Quick reminders: \n• To find pharmacy: Click 'Find Pharmacy' \n• To order: Click 'Buy Medicine' → Search → Add to cart → Choose delivery or pickup \n• To track: Click on your order \n\nWatch the video for a refresher: <video>	medicine_access	\N	\N	t	\N	\N
b3a40bb2-4488-4df4-a651-db8619f12500	2025-11-03 21:00:33.387153	2025-11-03 21:00:33.387153	medicine_access.tier2_app_retention_dropoff.incentive	Your medicine access is waiting	{name}, you built great medicine access habits. Come back and keep the convenience going.	medicine_access	\N	\N	t	\N	\N
d4ae200b-f740-4493-94ff-5f19ca20da9b	2025-11-03 21:00:33.621312	2025-11-03 21:00:33.621312	medicine_access.tier2_app_retention_dropoff.reactivation	Come back to medicine access	{name}, you were doing great with medicine access! Use it again today and keep your healthcare habits strong.	medicine_access	\N	\N	t	\N	\N
ef78dccd-e9b4-41e1-8c7b-322fb1b3a170	2025-11-03 21:00:33.855734	2025-11-03 21:00:33.855734	medicine_access.tier2_app_retention_dropoff.why	Keep your healthcare convenience	{name}, you built weeks of good healthcare habits. Keep going to maintain: \n• Convenient medicine ordering \n• Time savings \n• Easy access when you need it \nUse it today to stay on track!	medicine_access	\N	\N	t	\N	\N
a6b23947-5aad-4c96-b0b6-b9c202c9fbaf	2025-11-03 21:00:34.122259	2025-11-03 21:00:34.122259	mobile_money.tier1_app_opened_first_time.celebrate	Welcome to mobile money!	Great start {name}! 🎉 You’ve opened your mobile money app for the first time. Finance is your most important goal. This is the beginning of something powerful - a safer, easier way to manage your money. With mobile money, you can: \n✓ Keep your money safe on your phone \n✓ Send and receive money instantly \n✓ Build a financial record for your future \n\nTake the next step: Register your account!	mobile_money	\N	\N	t	\N	\N
d6b199ab-4561-44cb-bf20-6096b3c581e2	2025-11-03 21:00:34.340161	2025-11-03 21:00:34.340161	mobile_money.tier1_app_adopted.celebrate	You’re taking control of your money!	Well done {name}! 🎉 You’re now using mobile money. You’ve taken control of your finances! By keeping your money on your phone instead of cash at home, you’re: \n✓ Protecting your money from theft or loss \n✓ Making transactions faster and easier \n✓ Building a financial history \nKeep going!	mobile_money	\N	\N	t	\N	\N
7a8f181a-4821-4ee3-9ac2-dc5a46062261	2025-11-03 21:00:34.549266	2025-11-03 21:00:34.549266	mobile_money.tier1_app_registered.celebrate	Your mobile wallet is ready!	{name} congratulations on registering for mobile money! 🎉 This is a major step forward! With your Momo account you can: \n✓ Send money\n✓ Topup airtime \n✓ Keep a track of expenses \n✓ Build your credit history \nAll from your phone!	mobile_money	\N	\N	t	\N	\N
cb731041-0b9d-4abb-8d42-22e66e2d75ed	2025-11-03 21:00:34.772167	2025-11-03 21:00:34.772167	mobile_money.tier1_app_low_activity.how	Get the most from your mobile wallet	Hi {name}, we noticed you haven’t used your mobile money account much. Here’s how to check your transaction history: \n1. Open the myMTN app\n2. Click on MoMo\n4. Click on Statement\n5. Enter your MoMo PIN to see your MoMo History	mobile_money	\N	\N	t	\N	\N
78864c00-3b49-4b65-ab35-931313e84721	2025-11-03 21:00:34.984341	2025-11-03 21:00:34.984341	mobile_money.tier1_app_low_activity.incentive	Your reward is waiting - start using your mobile money app!	{name}, start using your mobile money app and earn a reward of 10 GCH in just three weeks! Every transaction you make saves you time, protects your cash from theft and builds your financial record. \nThe sooner you start, the sooner you’ll wonder how you managed without it. Try one transaction today!	mobile_money	\N	\N	t	\N	\N
edd49786-9e8b-4410-b852-83fb6211b3b1	2025-11-03 21:00:35.229309	2025-11-03 21:00:35.229309	mobile_money.tier1_app_low_activity.support	Need help with mobile money?	Hi {name}, need help using your mobile money account? We’re here for you! Common questions: \n• How to deposit money? If you have linked your bank account to your mobile money app, click on bank services and type your PIN. Select the bank, transfer type, enter the amount and reference. Review and pay to complete the transfer. Otherwise, visit an MTN momo agent. \n• How to send money? Open myMTN, select Momo and add the phone number, amount and reference. \n• Forgot your PIN? You can reset the pin yourself by dialing *170# or visit an MTN Customer care center or MTN agent.\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We’ll walk you through every step!	mobile_money	\N	\N	t	\N	\N
c36f99e7-fc38-4e20-ba4e-47c78373e83d	2025-11-03 21:00:35.460351	2025-11-03 21:00:35.460351	mobile_money.tier1_app_low_activity.why	Why mobile money matters for your safety	{name}, we know change can feel uncertain. But keeping cash at home has real risks: \n• Cash can be stolen or lost - gone forever \n• No record of what you spent or saved \n• Long trips just to send money \n• No way to access money in emergencies \nMobile money solves these problems. Your money is safer, always accessible, and leaves a record. Others in your community already trust it. Take the first step today - you’ll be glad you did!	mobile_money	\N	\N	t	\N	\N
aaf6beaa-0d6a-4c63-a65d-0bfab23c9cb4	2025-11-03 21:00:35.662265	2025-11-03 21:00:35.662265	mobile_money.first_tier1_app_engaged.reward	3 weeks of mobile money success! Collect your reward.	Incredible achievement {name}! 🎉 You’ve been actively using mobile money for 3 weeks straight. You’ve earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou’re building something powerful - a digital financial life. Congratulations!	mobile_money	\N	\N	t	\N	\N
e68d6949-d0ca-4bc4-a6c8-4188dd916613	2025-11-03 21:00:35.874368	2025-11-03 21:00:35.874368	mobile_money.tier1_app_engaged.celebrate	You’re mastering mobile money!	Excellent work {name}! 🎉 Now that you are an active mobile money user you’re: \n✓ Keeping your money safe\n✓ Saving time on every transaction \n✓ Creating a financial record that helps you qualify for loans \n✓ Always having access to your money, day or night \nYou’re not just using an app - you’re building your digital future. Keep it up!	mobile_money	\N	\N	t	\N	\N
b162b5e0-1d9f-4398-ac74-49a90974053b	2025-11-03 21:00:36.131203	2025-11-03 21:00:36.131203	mobile_money.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you’re doing great with mobile money! Keep using it actively and earn 10 GHC in a few weeks. The more you use mobile money, the more opportunities open up for you. Keep it up!	mobile_money	\N	\N	t	\N	\N
0b566f6a-8b32-4a0d-9df2-123203c4648c	2025-11-03 21:00:36.344314	2025-11-03 21:00:36.344314	mobile_money.tier1_app_engagement_dropoff.how	Come back to mobile money - we can help!	Hi {name}, we noticed you stopped using mobile money recently. Let’s get you back on track! Quick reminders: \n• To deposit: If you have linked your bank account, click on bank services and type your PIN. Select the bank, transfer type, enter the amount and reference. Review and pay. Otherwise, visit an MTN momo agent. \n• To send money: Open myMTN app → Click on Momo → Send Money → Enter phone number, amount and reference → Enter PIN \n• To check balance: Click on Momo balance and enter your PIN\n\nWatch the video to learn how to make the most of your mobile money.	mobile_money	\N	\N	t	\N	\N
250c8388-038a-4a94-9955-e0c8f45d9ea9	2025-11-03 21:00:36.561239	2025-11-03 21:00:36.561239	mobile_money.tier1_app_engagement_dropoff.incentive	Don’t lose your mobile money momentum!	{name}, you were doing so well with mobile money! Come back now and earn 10 GHC in just a few weeks. You’ll quickly remember the benefits of building a financial record that helps you qualify for loans and keeping your money safe.	mobile_money	\N	\N	t	\N	\N
c7f58a22-520a-4cea-9439-ac635771a887	2025-11-03 21:00:36.812112	2025-11-03 21:00:36.812112	mobile_money.tier1_app_engagement_dropoff.reactivation	Your mobile wallet misses you - come back today!	{name}, we miss you! You were building something important with mobile money: a financial record that helps you qualify for loans + financial safety. Take 2 minutes today to use mobile money again and get back on track!	mobile_money	\N	\N	t	\N	\N
7f462edd-a90e-4c91-a1b7-54f4da79fb09	2025-11-03 21:00:37.026647	2025-11-03 21:00:37.026647	mobile_money.tier1_app_engagement_dropoff.why	Remember why you started mobile money	{name}, going back to cash-only means going back to old problems: \n• Risk: Cash at home can be stolen - mobile money is protected by PIN \n• Inconvenience: Long trips to send money - mobile money works instantly \n• No record: Can’t prove transactions - mobile money automatically builds a financial record\nYou already learned how to use mobile money. Don’t give up the safety and convenience you worked for. Your future self will thank you!	mobile_money	\N	\N	t	\N	\N
9d2e410a-64a9-4c4d-98d7-1235af359e41	2025-11-03 21:00:37.235256	2025-11-03 21:00:37.235256	mobile_money.tier1_app_engagement_sustained.celebrate	You’re a consistent mobile money user!	Fantastic {name}! 🎉 You’ve maintained active mobile money use for 6 weeks. This isn’t luck - this is YOU taking control of your financial life! You’ve proven that: \n✓ You can trust digital money \n✓ You can manage finances on your phone \n✓ You’re ready for more financial opportunities \n✓ You’re securing your money’s future \nYou’re thriving and you’re an example to others. Congratulations!	mobile_money	\N	\N	t	\N	\N
5b901732-90ec-40d8-96ec-f36295f1b069	2025-11-03 21:00:37.440073	2025-11-03 21:00:37.440073	mobile_money.first_tier1_app_retained.reward	9 weeks of mobile money! Collect your reward.	Exceptional achievement {name}! 🎉 You’ve used mobile money actively for 9 weeks straight! You’ve earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You’ve fully embraced the digital financial life. Amazing!	mobile_money	\N	\N	t	\N	\N
993a563f-b00e-4179-a1a1-a4620d335728	2025-11-03 21:00:37.666321	2025-11-03 21:00:37.666321	mobile_money.tier1_app_retained.celebrate	You’re a mobile money expert now. Congratulations!	Incredible {name}! 🎉 You’re now a long-term mobile money user. Look at what you’ve achieved: \n✓ 9+ weeks of consistent mobile money use \n✓ Safer money management than ever before \n✓ A strong financial record that opens doors \n✓ Confidence using digital services \nCongratulations!	mobile_money	\N	\N	t	\N	\N
070f4ae0-446c-43de-a4d9-8ee38a053249	2025-11-03 21:00:37.913223	2025-11-03 21:00:37.913223	mobile_money.tier1_app_retained.incentive	You're building real financial power	{name}, you've proven you can manage money digitally for 9+ weeks. This consistency is opening doors: lenders will be able to see your financial record  and you're protecting what you've worked hard for. The longer you keep going, the more opportunities become available to you. Your financial future is in your hands!	mobile_money	\N	\N	t	\N	\N
de410265-3c8a-4e72-a03e-4629f1f03bd1	2025-11-03 21:00:38.143559	2025-11-03 21:00:38.143559	mobile_money.tier1_app_retention_dropoff.how	Let’s solve your mobile money issue	Hi {name}, you were such a consistent mobile money user! We noticed you haven’t been active lately. Let’s fix any issues: \n• To deposit: If you have linked your bank account, click on bank services and type your PIN. Select the bank, transfer type, enter the amount and reference. Review and pay. Otherwise, visit an MTN momo agent. \n• To send money: Open app → Send Money → Enter phone number → Enter amount → Enter PIN \n• To pay bills: Open app → Pay Bills → Select service → Enter account number → Enter amount \n• To check balance: Dial your mobile money short code \n\nWatch the video to learn how to make the most of your mobile money.	mobile_money	\N	\N	t	\N	\N
c80258fa-6d5f-43f7-81a4-9aed161c74ec	2025-11-03 21:00:38.404115	2025-11-03 21:00:38.404115	mobile_money.tier1_app_retention_dropoff.incentive	Your financial record is too valuable to lose	{name}, every week of mobile money use you've built adds to your financial credibility. By stopping now, you will also discontinue the effort of building your financial record. Use mobile money this week and keep your options open!	mobile_money	\N	\N	t	\N	\N
21a27cdf-02c3-4cb9-887e-96314be6e02c	2025-11-03 21:00:38.613366	2025-11-03 21:00:38.613366	mobile_money.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a mobile money champion	{name}, we miss you! Your consistent use of mobile money provided a financial record that helps you qualify for loans + financial safety. Make sure you don’t let this slip away. Take 2 minutes today to use mobile money again and get back on track!	mobile_money	\N	\N	t	\N	\N
ac7a921e-ce78-422e-9f58-2a82c29dfa2c	2025-11-03 21:00:38.836291	2025-11-03 21:00:38.836291	mobile_money.tier1_app_retention_dropoff.why	Why your mobile money track record matters	{name}, you spent many weeks building digital financial habits. Here’s what you lose by stopping: \n• Trust from lenders: no recorded transactions means that it may be harder to access loans and services\n• Safety: Back to risky cash at home \n• Convenience: Back to long trips for transactions \n\nYou worked hard to become a mobile money expert. Make sure that you continue to use this expertise to improve your financial goals. Take two minutes today to use mobile money and get back on track.	mobile_money	\N	\N	t	\N	\N
353f2d7c-b8dd-4757-aa0d-51d895908f06	2025-11-03 21:00:39.097135	2025-11-03 21:00:39.097135	mobile_money.tier2_app_opened_first_time.celebrate	Welcome to mobile money!	Great start {name}! 🎉 You’ve opened your mobile money app for the first time. Finance is your second most important goal. This is the beginning of something powerful - a safer, easier way to manage your money. With mobile money, you can: \n✓ Keep your money safe on your phone \n✓ Send and receive money instantly \n✓ Pay bills without traveling \n✓ Build a financial record for your future \n\nTake the next step: Register your account!	mobile_money	\N	\N	t	\N	\N
bbda74be-eb5d-4bca-b4cd-905852d6ea78	2025-11-03 21:00:39.314321	2025-11-03 21:00:39.314321	mobile_money.tier2_app_adopted.celebrate	You’re taking control of your money!	Well done {name}! 🎉 You’re now using mobile money. You’ve taken control of your finances!	mobile_money	\N	\N	t	\N	\N
3ce4e1d2-61e8-46bc-b064-c1dda8f3e52e	2025-11-03 21:00:39.523236	2025-11-03 21:00:39.523236	mobile_money.tier2_app_registered.celebrate	Your mobile wallet is ready!	{name} congratulations on registering for mobile money! 🎉 This is a major step forward! With you momo account you can: \n✓ Send money\n✓ Topup airtime \n✓ Keep a track of expenses \n✓ Build your credit history \nAll from your phone!	mobile_money	\N	\N	t	\N	\N
262fe4fe-fd6f-42e2-ad0e-3d3cb80e74ab	2025-11-03 21:00:39.731056	2025-11-03 21:00:39.731056	mobile_money.tier2_app_low_activity.how	Quick tips for mobile money	Hi {name}, we noticed you haven’t used your mobile money account much. Ready to try mobile money? Here's a quick start: \n1. Open your app and deposit money\n2. Try sending money  \n3. Check your transaction history \nStart small until you're comfortable!	mobile_money	\N	\N	t	\N	\N
f8234c69-e86b-4ca8-8b21-da2ecedf7757	2025-11-03 21:00:39.963233	2025-11-03 21:00:39.963233	mobile_money.tier2_app_low_activity.incentive	Try mobile money	{name}, start using your mobile money app and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you’ll wonder how you managed without it.	mobile_money	\N	\N	t	\N	\N
9b79df2d-c7ba-4ddb-b925-39e82f2b2926	2025-11-03 21:00:40.199152	2025-11-03 21:00:40.199152	mobile_money.tier2_app_low_activity.support	Need help with mobile money?	Hi {name}, need help using your mobile money account? Click the blue [HELP] button and then click on [Call] to speak with our support team. We’ll walk you through every step!	mobile_money	\N	\N	t	\N	\N
46200e0e-d374-489e-a117-86a9536bf5dc	2025-11-03 21:00:40.412449	2025-11-03 21:00:40.412449	mobile_money.tier2_app_low_activity.why	Mobile money makes life easier	{name}, mobile money offers real benefits: \n• Keep money safer than cash at home \n• Send money without traveling to a bank\n• Create a financial record that helps you qualify for loans\nGive it a try - many in your community already use it!	mobile_money	\N	\N	t	\N	\N
c48550fd-ee02-4c7c-94bc-ea5ae03276ca	2025-11-03 21:00:40.628272	2025-11-03 21:00:40.628272	mobile_money.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've used mobile money for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	mobile_money	\N	\N	t	\N	\N
7c0eb12d-2582-43c6-8e52-35e9cf93caba	2025-11-03 21:00:40.839242	2025-11-03 21:00:40.839242	mobile_money.tier2_app_engaged.celebrate	You're using mobile money!	Great job {name}! 🎉 As an active mobile money user, you're keeping your money safer and saving time. You're building good financial habits!	mobile_money	\N	\N	t	\N	\N
bda25fd8-2f34-42cb-a68b-c49bee7dcd09	2025-11-03 21:00:41.049279	2025-11-03 21:00:41.049279	mobile_money.tier2_app_engaged.incentive	Keep going with mobile money	{name}, you're doing well! Keep using mobile money and earn 10 GHC in a few weeks. Every transaction counts!	mobile_money	\N	\N	t	\N	\N
b61bb079-050a-42f0-9337-3bd8bead7eaf	2025-11-03 21:00:41.280278	2025-11-03 21:00:41.280278	mobile_money.tier2_app_engagement_dropoff.how	Quick mobile money reminder	Hi {name}, we noticed that you stopped mobile money lately. Quick reminders: \n• To deposit: If you have linked your bank account, click on bank services and type your PIN. Select the bank, transfer type, enter the amount and reference. Review and pay. Otherwise, visit an MTN momo agent. \n• To send money: myMTN app→ Momo → Send Money → Enter phone number, amount and reference → Enter PIN \n• To check balance: Click Momo balance and enter your PIN\n\nWatch the video for a refresher.	mobile_money	\N	\N	t	\N	\N
fff5ec13-535e-4159-9bf7-fbf9b8e3bade	2025-11-03 21:00:41.497193	2025-11-03 21:00:41.497193	mobile_money.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to mobile money and earn 10 GHC in a few weeks. It keeps your money safe, saves time and helps you build a financial record.	mobile_money	\N	\N	t	\N	\N
37d77153-b40e-46fc-965b-71e36c9b866c	2025-11-03 21:00:41.710003	2025-11-03 21:00:41.710003	mobile_money.tier2_app_engagement_dropoff.reactivation	Try mobile money again?	{name}, you started building good financial habits with mobile money. Take 2 minutes today to use it again!	mobile_money	\N	\N	t	\N	\N
02bc95b0-c29c-4d0f-ab4a-56d27543e2ee	2025-11-03 21:00:41.938209	2025-11-03 21:00:41.938209	mobile_money.tier2_app_engagement_dropoff.why	Mobile money is convenient and safe	{name}, mobile money offers convenience and safety \n• Protected by PIN vs. cash at home \n• Send money instantly \n• Automatic transaction records \nYou already know how to use it - try it again!	mobile_money	\N	\N	t	\N	\N
153e28fe-3070-4944-b906-255c80851f66	2025-11-03 21:00:42.14219	2025-11-03 21:00:42.14219	mobile_money.tier2_app_engagement_sustained.celebrate	6 weeks of mobile money!	Well done {name}! 🎉 You've used mobile money consistently for 6 weeks. You're managing your finances well and building a good financial record!	mobile_money	\N	\N	t	\N	\N
03d51fb9-5939-49a0-abbc-7061a5e31c2f	2025-11-03 21:00:42.34922	2025-11-03 21:00:42.34922	mobile_money.first_tier2_app_retained.reward	You’ve earned 10 GHC for your consistency with mobile money!	Excellent {name}! 🎉 You've used mobile money for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	mobile_money	\N	\N	t	\N	\N
c7575436-85c7-4efd-9878-d1c1ebadea17	2025-11-03 21:00:42.559368	2025-11-03 21:00:42.559368	mobile_money.tier2_app_retained.celebrate	You're a mobile money user!	Impressive {name}! 🎉 You've been using mobile money consistently. You're managing money safely and building a solid financial record. Well done!	mobile_money	\N	\N	t	\N	\N
600af3b4-59c0-4f1c-8c64-7c3653976c46	2025-11-03 21:00:43.216315	2025-11-03 21:00:43.216315	mobile_money.tier2_app_retained.incentive	Keep your mobile money habit going	{name}, your consistent mobile money is turning into valuable financial habits. Your money is safer and you are building your financial record. Keep it up!	mobile_money	\N	\N	t	\N	\N
ad149d3f-5eda-4083-be0c-23237cdac241	2025-11-03 21:00:43.447348	2025-11-03 21:00:43.447348	mobile_money.tier2_app_retention_dropoff.how	Quick mobile money reminder	Hi {name}, we noticed that you stopped mobile money lately. Quick reminders: \n• To deposit: If you have linked your bank account, click on bank services and type your PIN. Select the bank, transfer type, enter the amount and reference. Review and pay. Otherwise, visit an MTN momo agent. \n• To send money: myMTN app→ Momo → Send Money → Enter phone number, amount and reference → Enter PIN \n• To check balance: Click Momo balance and enter your PIN\n\nWatch the video for a refresher.	mobile_money	\N	\N	t	\N	\N
af6852bc-99b2-49f0-abda-6f3a9a7ef267	2025-11-03 21:00:43.711178	2025-11-03 21:00:43.711178	mobile_money.tier2_app_retention_dropoff.incentive	Your mobile money is waiting	{name}, you built great mobile money habits. Come back and keep strengthening your financial record.	mobile_money	\N	\N	t	\N	\N
86d4208f-93e9-49e3-9c81-810b2b6ec516	2025-11-03 21:00:43.962271	2025-11-03 21:00:43.962271	mobile_money.tier2_app_retention_dropoff.reactivation	Come back to mobile money	{name}, you were doing great with mobile money! Use it again today and keep your financial habits strong.	mobile_money	\N	\N	t	\N	\N
f410695f-cd33-4d2c-86a6-72b638d37455	2025-11-03 21:00:44.163303	2025-11-03 21:00:44.163303	mobile_money.tier2_app_retention_dropoff.why	Keep your financial progress	{name}, you built weeks of good financial habits. Keep going to maintain: \n• Your financial record \n• Safe money storage \n• Quick, easy payments \nUse it today to stay on track!	mobile_money	\N	\N	t	\N	\N
575a0b1b-09aa-43ec-b761-01dd6d0becde	2025-11-03 21:00:45.720162	2025-11-03 21:00:45.720162	uniti.tier1_tier2_apps_downloaded.celebrate	Your digital toolkit is complete!	Amazing {name}! 🎉 You've downloaded all your priority apps. Your personalized digital toolkit is ready. The journey from goals to achievements starts now. \nNext step: Complete Uniti’s onboarding.	uniti_messages	\N	\N	t	\N	\N
09eee5a9-66f7-45bb-afa8-64d3e4075171	2025-11-03 21:00:45.459033	2025-11-03 21:00:45.459033	uniti.goal_setting_complete.celebrate	Your personalized journey begins!	Excellent work {name}! 🎉 You've completed your goals. \nWe've identified the perfect apps for you. These aren't random apps - they're specifically chosen to help YOU achieve what matters most. Your personalized digital toolkit is ready to help you succeed. \nNext step: Download your apps and start your journey!	uniti_messages	\N	\N	t	\N	\N
3a041fef-64fa-4e42-a084-8d17c0bdf307	2025-11-03 21:00:45.010274	2025-11-03 21:00:45.010274	uniti.goals_setting_started_abandoned.support	Need help with your goals?	Hi {name}, having trouble completing your goal setup? We're here to help! \nClick the blue [HELP] button and then click on [Call] to connect with our support team. We’ll guide you through every step.	uniti_messages	\N	\N	t	\N	\N
c7884e28-b525-437c-b94e-90324203c0a4	2025-11-03 21:00:45.931242	2025-11-03 21:00:45.931242	uniti.kyc_started_abandoned.how	Complete your verification - here's how	Hi {name}, you started your ID + selfie verification but didn't finish. Let's complete it!\nHere's what you need: \n1. Your Ghana Card (physical or digital) \n2. Good lighting for photos \n3. 2 minutes of your time \nSteps: \n• Take photo of Ghana Card front \n• Take photo of Ghana Card back \n• Take a selfie without a scarf, glasses, or anything covering your face\n• Confirm your details \nThat's it!	uniti_messages	\N	\N	t	\N	\N
a4dcad5c-03cd-4432-b6bd-28bbba06daf5	2025-11-03 21:00:46.209234	2025-11-03 21:00:46.209234	uniti.kyc_started_abandoned.incentive	40 GHC waiting! Complete verification in 48 hours	{name}, you're SO close to earning 40 GHC! Complete your Ghana Card verification + selfie within 48 hours and claim your reward. Why verify? \n✓ Earn 40 GHC + 1GB  immediately \n✓ Verify and secure your account\n✓ Access ALL app features  \nYou've already started - it takes just 2 more minutes to finish and earn your reward!	uniti_messages	\N	\N	t	\N	\N
a1498a3f-6213-4202-af65-6ab2a250f790	2025-11-03 21:00:46.421169	2025-11-03 21:00:46.421169	uniti.kyc_started_abandoned.support	Having trouble with verification?	Hi {name}, stuck on verification? Here are solutions to common problems: \n• Photo too dark? Use natural light or turn on more lights \n• Card not clear? Place it flat on a dark surface \n• Selfie rejected? Remove glasses, face the camera directly \nStill need help? Click the blue [HELP] button and then click on [Call] to connect with our support team. We’ll guide you through every step.	uniti_messages	\N	\N	t	\N	\N
37f47edf-cbff-41d7-918a-2727ddad0964	2025-11-03 21:00:46.629194	2025-11-03 21:00:46.629194	uniti.kyc_started_abandoned.why	Why verification keeps you safe	{name}, we know selfie and ID verification seem like extra steps. But here's why it matters: \n• Protects YOUR account: Only you can access your account and rewards \n• Stops fraud: Prevents others from using your identity \n• Unlocks everything: Full access to all app features  \n2 minutes of verification = lifetime of value.	uniti_messages	\N	\N	t	\N	\N
61bdf1d8-8706-4c21-a4c7-83c9ab4590c7	2025-11-03 21:00:46.840068	2025-11-03 21:00:46.840068	uniti.kyc_completed.celebrate	Your account is fully secure!	Congratulations {name}! 🎉 Your identity verification is complete. Your account is now: \n✓ Fully verified and secure  \n✓ Ready for all app features \nNow it’s time to discover your personalized apps.	uniti_messages	\N	\N	t	\N	\N
cec76991-d46c-4a74-9db3-dcad23a440ce	2025-11-03 21:00:47.260286	2025-11-03 21:00:47.260286	uniti.all_tier1_app_engaged.reward	You’re a digital champion! Collect your reward.	Outstanding {name}! 🎉 You’re actively using ALL your top priority apps. You’ve earned 500MB. The data will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nKeep it up. This is just the beginning!	uniti_messages	\N	\N	t	\N	\N
5aec68a3-3c29-4011-9406-e10aae52e3ec	2025-11-03 21:00:47.460483	2025-11-03 21:00:47.460483	uniti.all_tier1_tier2_app_engaged.celebrate	You're mastering your digital toolkit!	Incredible work {name}! 🎉 You're actively using ALL your apps - both your top priorities AND your secondary goals. This is remarkable dedication. You're not just using digital tools - you're building a complete digital life that supports every part of your journey. Keep this momentum going!	uniti_messages	\N	\N	t	\N	\N
7d2fc0ff-31b9-4c10-80d8-fbfdd37d97a6	2025-11-03 21:00:47.669987	2025-11-03 21:00:47.669987	uniti.all_tier2_app_engaged.reward	Secondary goals unlocked! Collect your reward	Well done {name}! 🎉 You're actively using ALL your secondary priority apps. You've earned 500MB. The data will be transferred to you shortly. Keep an eye open for it in your myMTN account! You're proving that you can balance multiple goals at once. That's the power of commitment!	uniti_messages	\N	\N	t	\N	\N
42083552-19de-4433-b712-315ea13de765	2025-11-03 21:00:47.896068	2025-11-03 21:00:47.896068	uniti.all_tier1_tier2_app_retained.celebrate	You're a digital champion!	Outstanding {name}! 🎉 You've consistently used ALL your apps over time - both tier 1 AND tier 2. This consistency is what turns digital tools into real life transformation. You're building habits that will serve you for years to come. Congratulations!	uniti_messages	\N	\N	t	\N	\N
6de4ebad-2881-4cc6-8520-ddbc4046b276	2025-11-03 21:00:48.110423	2025-11-03 21:00:48.110423	weather.tier1_app_opened_first_time.celebrate	Welcome to smart farming with weather!	Great start {name}! 🎉 You've opened Just Farm for the first time. Work is your most important goal. This is the beginning of something powerful - a smarter way to farm and protect your harvest. With Just Farm weather updates, you can:\n✓ Get alerts about rain and storms before they come\n✓ Know the best days to plant and harvest\n✓ Protect your crops from bad weather\n✓ Plan your farm work around the weather\n\nTake the next step: Register your account!	weather	\N	\N	t	\N	\N
4770e6e5-3275-4a4e-be0d-9e1501bffdad	2025-11-03 21:00:48.367072	2025-11-03 21:00:48.367072	weather.tier1_app_adopted.celebrate	You're farming smarter with weather!	Well done {name}! 🎉 You're now using Just Farm's weather updates. You're protecting your farm and your harvest! By knowing the weather ahead of time, you're:\n✓ Reducing risk of crop loss\n✓ Planning your work for the best days\n✓ Protecting your investment\n✓ Farming with confidence\nKeep going!	weather	\N	\N	t	\N	\N
53ebeadf-f694-44b3-8754-871c7c423d7a	2025-11-03 21:00:48.579234	2025-11-03 21:00:48.579234	weather.tier1_app_registered.celebrate	Your farming weather guide is ready!	{name} congratulations on registering for Just Farm! 🎉 This is a major step forward! With your account you can:\n✓ Get weather forecasts for your location\n✓ Receive alerts for rain, storms, and dry periods\n✓ Learn the best planting and harvesting times\n✓ Plan your farm work around the weather\nAll from your phone!	weather	\N	\N	t	\N	\N
960e215e-d773-4f1f-9ac5-85dd6ba0ec2a	2025-11-03 21:00:48.803124	2025-11-03 21:00:48.803124	weather.tier1_app_low_activity.how	Get the most from Just Farm weather updates	Hi {name}, we noticed you haven't used Just Farm's weather features much. Here's how to check the weather forecast:\n1. Open the Just Farm app\n2. Look for the weather section on the main screen\n3. Check today's forecast and the week ahead\n4. Set up notifications so you get alerts for rain and storms\nThe weather changes quickly - check it regularly to protect your crops!	weather	\N	\N	t	\N	\N
4d376fc7-b725-4506-9ef0-cf431663def1	2025-11-03 21:00:49.026325	2025-11-03 21:00:49.026325	weather.tier1_app_low_activity.incentive	Your reward is waiting - start checking weather updates!	{name}, start using Just Farm's weather updates regularly and earn a reward of 10 GHC in just three weeks! Every time you check the forecast, you're protecting your harvest from surprise weather. You can plan when to plant, when to apply fertilizer, and when to harvest.\nThe sooner you start, the sooner you'll wonder how you farmed without it. Check the weather today!	weather	\N	\N	t	\N	\N
16ca2b8f-8579-457c-aaa7-8567c9ba4a0d	2025-11-03 21:00:49.281291	2025-11-03 21:00:49.281291	weather.tier1_app_low_activity.support	Need help with weather updates?	Hi {name}, need help using Just Farm's weather features? We're here for you! Common questions:\n• Where do I find weather? Open Just Farm and look for the weather section on the main screen.\n• How do I set alerts? Go to settings and turn on weather notifications.\n• What do the forecasts mean? Rain symbols show coming rain, sun symbols show dry days.\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	weather	\N	\N	t	\N	\N
ebce45fa-d9ea-461e-8a6c-a074267f7435	2025-11-03 21:00:49.501281	2025-11-03 21:00:49.501281	weather.tier1_app_low_activity.why	Why weather updates matter for your farm	{name}, we know checking weather on a phone may feel new. But surprise weather has real risks:\n• Planting before heavy rain can wash away seeds\n• Working during storms is dangerous\n• Harvesting in rain can damage crops\n• Missing dry days means delayed work\n\nJust Farm's weather updates solve these problems. You know what's coming, you plan ahead, and you protect what you've worked so hard to grow. Others in your farming community already trust it. Check the weather today - you'll be glad you did!	weather	\N	\N	t	\N	\N
d19668c1-3660-462a-99bc-76356dbb664c	2025-11-03 21:00:49.721246	2025-11-03 21:00:49.721246	weather.first_tier1_app_engaged.reward	3 weeks of smart weather farming! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively checking weather updates on Just Farm for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're building something powerful - a weather-smart farming life. Congratulations!	weather	\N	\N	t	\N	\N
ceea0f5b-5bfc-420a-973d-a10c3850370f	2025-11-03 21:00:49.942262	2025-11-03 21:00:49.942262	weather.tier1_app_engaged.celebrate	You're mastering weather-smart farming!	Excellent work {name}! 🎉 Now that you regularly check weather updates you're:\n✓ Planning work for the best days\n✓ Protecting your crops from bad weather\n✓ Reducing risk of crop loss\n✓ Farming with confidence, not guessing\n\nYou're not just using an app - you're building your farming future. Keep it up!	weather	\N	\N	t	\N	\N
86cd37df-add3-4654-b038-89f739a0bbcc	2025-11-03 21:00:50.18124	2025-11-03 21:00:50.18124	weather.tier1_app_engaged.incentive	Keep going - bigger benefits ahead!	{name}, you're doing great with Just Farm weather! Keep checking updates regularly and earn 10 GHC in a few weeks. The more you use weather forecasts, the more you protect your harvest and increase your income. Keep it up!	weather	\N	\N	t	\N	\N
75bffba9-b5ff-49c5-9044-1f34868ebc7f	2025-11-03 21:00:50.3891	2025-11-03 21:00:50.3891	weather.tier1_app_engagement_dropoff.how	Come back to weather updates - we can help!	Hi {name}, we noticed you stopped checking weather on Just Farm recently. Let's get you back on track! Quick reminders:\n• To check today's weather: Open Just Farm → Look for weather section → See today's forecast\n• To check the week ahead: Scroll down to see 7-day forecast\n• To set up alerts: Go to settings → Turn on weather notifications\n\nWatch the video to learn how to make the most of Just Farm weather.	weather	\N	\N	t	\N	\N
c5cf8162-408b-4068-bab2-c52221c0db7d	2025-11-03 21:00:50.590563	2025-11-03 21:00:50.590563	weather.tier1_app_engagement_dropoff.incentive	Don't lose your weather-smart farming momentum!	{name}, you were doing so well with weather updates! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of planning your farm work around the weather and protecting your crops from surprises.	weather	\N	\N	t	\N	\N
fcbe672e-4fc2-44b1-834c-3a3926433740	2025-11-03 21:00:50.802101	2025-11-03 21:00:50.802101	weather.tier1_app_engagement_dropoff.reactivation	Your farm needs weather updates - come back today!	{name}, we miss you! You were building something important with weather updates: protecting your crops and planning smart. Take 2 minutes today to check Just Farm weather again and get back on track!	weather	\N	\N	t	\N	\N
68869572-bdce-47e7-a8be-403443c09e3f	2025-11-03 21:00:51.017871	2025-11-03 21:00:51.017871	weather.tier1_app_engagement_dropoff.why	Remember why weather updates matter	{name}, going back to guessing about weather means going back to old problems:\n• Risk: Surprise rain can destroy crops - weather alerts give you time to prepare\n• Wasted work: Planting on wrong days wastes seeds and effort - forecasts help you choose the best days\n• Lost income: Bad weather can reduce your harvest - knowing ahead protects what you've worked for\n\nYou already learned how to use weather updates. Don't give up the protection and planning you worked for. Your farm will thank you!	weather	\N	\N	t	\N	\N
80f41aa4-0cb7-49bf-b0f4-94c4d6c42235	2025-11-03 21:00:51.229302	2025-11-03 21:00:51.229302	weather.tier1_app_engagement_sustained.celebrate	You're a consistent weather-smart farmer!	Fantastic {name}! 🎉 You've maintained active use of Just Farm weather for 6 weeks. This isn't luck - this is YOU protecting your farm and your income! You've proven that:\n✓ You can plan ahead using weather\n✓ You can protect your crops from surprises\n✓ You're ready for bigger farming opportunities\n✓ You're securing your harvest's future\n\nYou're thriving and you're an example to other farmers. Congratulations!	weather	\N	\N	t	\N	\N
d2cfc515-bc36-427c-b638-9b04e2a15f3e	2025-11-03 21:00:51.430161	2025-11-03 21:00:51.430161	weather.first_tier1_app_retained.reward	9 weeks of weather-smart farming! Collect your reward.	Exceptional achievement {name}! 🎉 You've checked weather updates on Just Farm actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nThis is remarkable. You've fully embraced weather-smart farming. Amazing!	weather	\N	\N	t	\N	\N
d20a4b27-2f15-4770-acf2-aa0ad55eb015	2025-11-03 21:00:51.65516	2025-11-03 21:00:51.65516	weather.tier1_app_retained.celebrate	You're a weather-smart farming expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term weather-smart farmer. Look at what you've achieved:\n✓ 9+ weeks of consistent weather checking\n✓ Better protected farm than ever before\n✓ Stronger planning that increases harvest\n✓ Confidence using digital farming tools\n\nCongratulations!	weather	\N	\N	t	\N	\N
ee7bb00c-d557-4d60-a963-f1f9db0d9378	2025-11-03 21:00:51.858225	2025-11-03 21:00:51.858225	weather.tier1_app_retained.incentive	You're building real farming power	{name}, you've proven you can farm with weather awareness for 9+ weeks. This consistency is protecting your harvest and income. The longer you keep going, the more secure your farming becomes. Your farm's future is in your hands!	weather	\N	\N	t	\N	\N
1b4ed147-fd4d-4ad7-940e-6165659fe1ed	2025-11-03 21:00:52.081252	2025-11-03 21:00:52.081252	weather.tier1_app_retention_dropoff.how	Let's solve your weather update issue	Hi {name}, you were such a consistent weather-smart farmer! We noticed you haven't been checking weather lately. Let's fix any issues:\n• To check weather: Open Just Farm → Weather section → See forecast\n• To set alerts: Settings → Turn on weather notifications\n• To plan ahead: Check 7-day forecast each Sunday\n\nWatch the video to learn how to make the most of Just Farm weather.	weather	\N	\N	t	\N	\N
d536b3a3-ca18-46c3-a7f2-14c1b0294be6	2025-11-03 21:00:52.286289	2025-11-03 21:00:52.286289	weather.tier1_app_retention_dropoff.incentive	Your weather-smart farming is too valuable to lose	{name}, every week of weather updates you've used has helped protect your crops and income. By stopping now, you're going back to guessing about weather. Check weather this week and keep your farm protected!	weather	\N	\N	t	\N	\N
e7a07246-2062-4906-bed4-b1c9dd057b7a	2025-11-03 21:00:52.499225	2025-11-03 21:00:52.499225	weather.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a weather-smart champion	{name}, we miss you! Your consistent use of weather updates protected your crops and income. Make sure you don't let this slip away. Take 2 minutes today to check Just Farm weather again and get back on track!	weather	\N	\N	t	\N	\N
81686700-7ccc-4cc0-ab03-851ba2e17fe8	2025-11-03 21:00:52.710454	2025-11-03 21:00:52.710454	weather.tier1_app_retention_dropoff.why	Why your weather-smart track record matters	{name}, you spent many weeks building weather-smart farming habits. Here's what you lose by stopping:\n• Protection: No weather alerts means surprise storms can destroy crops\n• Planning: Back to guessing when to plant and harvest\n• Income: Bad weather decisions reduce your harvest\n\nYou worked hard to become a weather-smart farmer. Make sure that you continue to use this knowledge to improve your farm and income. Take two minutes today to check weather and get back on track.	weather	\N	\N	t	\N	\N
9ea26022-92ad-43e7-93af-5de097047aef	2025-11-03 21:00:52.935322	2025-11-03 21:00:52.935322	weather.tier2_app_opened_first_time.celebrate	Welcome to smart farming with weather!	Great start {name}! 🎉 You've opened Just Farm for the first time. Work is your second most important goal. This is the beginning of something powerful - a smarter way to farm and protect your harvest. With Just Farm weather updates, you can:\n✓ Get alerts about rain and storms before they come\n✓ Know the best days to plant and harvest\n✓ Protect your crops from bad weather\n✓ Plan your farm work around the weather\n\nTake the next step: Register your account!	weather	\N	\N	t	\N	\N
8f5f5c42-d68b-480a-964b-7e8836db98d1	2025-11-03 21:00:53.139275	2025-11-03 21:00:53.139275	weather.tier2_app_adopted.celebrate	You're farming smarter with weather!	Well done {name}! 🎉 You're now using Just Farm's weather updates. You're protecting your farm and planning smart!	weather	\N	\N	t	\N	\N
e3683742-810a-496f-80f9-5a2adfed86dc	2025-11-03 21:00:53.344233	2025-11-03 21:00:53.344233	weather.tier2_app_registered.celebrate	Your farming weather guide is ready!	{name} congratulations on registering for Just Farm! 🎉 This is a major step forward! With your account you can:\n✓ Get weather forecasts\n✓ Receive rain and storm alerts\n✓ Learn best planting times\n✓ Plan farm work\nAll from your phone!	weather	\N	\N	t	\N	\N
91ca578e-4301-4eb1-8285-5d49249684c4	2025-11-03 21:00:53.561333	2025-11-03 21:00:53.561333	weather.tier2_app_low_activity.how	Quick tips for weather updates	Hi {name}, we noticed you haven't used Just Farm's weather features much. Ready to try weather updates? Here's a quick start:\n1. Open Just Farm and find the weather section\n2. Check today's forecast\n3. Look at the week ahead\nStart checking regularly to protect your farm!	weather	\N	\N	t	\N	\N
88c61fb5-8753-46f8-916a-3ffaaf702ea3	2025-11-03 21:00:53.770027	2025-11-03 21:00:53.770027	weather.tier2_app_low_activity.incentive	Try weather updates	{name}, start checking Just Farm's weather updates regularly and earn a reward of 10 GHC in just three weeks. The sooner you start, the sooner you'll wonder how you farmed without it.	weather	\N	\N	t	\N	\N
88d9fb05-fbc6-4f48-b99a-7b41cfe5800c	2025-11-03 21:00:53.988181	2025-11-03 21:00:53.988181	weather.tier2_app_low_activity.support	Need help with weather updates?	Hi {name}, need help using Just Farm's weather features? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	weather	\N	\N	t	\N	\N
f215b25a-f8f0-4dd6-94f4-690625ba2228	2025-11-03 21:00:54.19242	2025-11-03 21:00:54.19242	weather.tier2_app_low_activity.why	Weather updates make farming easier	{name}, weather updates offer real benefits:\n• Know when rain is coming before it arrives\n• Plan farm work for the best days\n• Protect crops from bad weather\nGive it a try - many farmers in your area already use it!	weather	\N	\N	t	\N	\N
2964b656-68bb-4b75-891c-7e7b39dec0c0	2025-11-03 21:00:54.401495	2025-11-03 21:00:54.401495	weather.first_tier2_app_engaged.reward	You've earned 10 GHC!	Nice work {name}! 🎉 You've checked weather updates on Just Farm for 3 weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Keep it up!	weather	\N	\N	t	\N	\N
9f9c9e69-d10e-4181-bdee-dbf12b4f5111	2025-11-03 21:00:54.628393	2025-11-03 21:00:54.628393	weather.tier2_app_engaged.celebrate	You're using weather updates!	Great job {name}! 🎉 As someone who regularly checks weather updates, you're protecting your farm and planning smarter. You're building good farming habits!	weather	\N	\N	t	\N	\N
d7b54800-08a6-4b70-9739-82de3c1dddde	2025-11-03 21:00:54.860003	2025-11-03 21:00:54.860003	weather.tier2_app_engaged.incentive	Keep going with weather updates	{name}, you're doing well! Keep checking weather regularly and earn 10 GHC in a few weeks. Every forecast you check counts!	weather	\N	\N	t	\N	\N
9a434abb-78c4-43b8-8ecd-0279cf179dd0	2025-11-03 21:00:55.065003	2025-11-03 21:00:55.065003	weather.tier2_app_engagement_dropoff.how	Quick weather reminder	Hi {name}, we noticed that you stopped checking weather on Just Farm lately. Quick reminders:\n• To check weather: Open Just Farm → Weather section → See forecast\n• To set alerts: Settings → Weather notifications\n• To plan ahead: Check 7-day forecast\n\nWatch the video for a refresher.	weather	\N	\N	t	\N	\N
d6bf7f35-5e05-4267-9f21-2c4e8dfd8d9b	2025-11-03 21:00:55.266378	2025-11-03 21:00:55.266378	weather.tier2_app_engagement_dropoff.incentive	Come back and earn 10 GHC	{name}, come back to Just Farm weather and earn 10 GHC in a few weeks. It helps you plan your farm work and protect your crops.	weather	\N	\N	t	\N	\N
a5ca2d69-c75f-46ff-acee-c812cbc57d1d	2025-11-03 21:00:55.468252	2025-11-03 21:00:55.468252	weather.tier2_app_engagement_dropoff.reactivation	Try weather updates again?	{name}, you started building good farming habits with weather updates. Take 2 minutes today to check it again!	weather	\N	\N	t	\N	\N
28f88dc0-c499-4a45-b0eb-4ff9a9796e17	2025-11-03 21:00:55.680336	2025-11-03 21:00:55.680336	weather.tier2_app_engagement_dropoff.why	Weather updates are convenient and helpful	{name}, weather updates offer convenience and protection:\n• Know what's coming vs. guessing\n• Plan work for best days\n• Automatic weather alerts\nYou already know how to use it - try it again!	weather	\N	\N	t	\N	\N
3fa2393f-37bc-4cfb-9bba-c7e655bd0497	2025-11-03 21:00:55.90801	2025-11-03 21:00:55.90801	weather.tier2_app_engagement_sustained.celebrate	6 weeks of weather-smart farming!	Well done {name}! 🎉 You've checked weather updates consistently for 6 weeks. You're farming smarter and protecting your harvest!	weather	\N	\N	t	\N	\N
16864b69-531e-4d03-ad47-da29fd949180	2025-11-03 21:00:56.109139	2025-11-03 21:00:56.109139	weather.first_tier2_app_retained.reward	You've earned 10 GHC for your consistency with weather updates!	Excellent {name}! 🎉 You've checked weather updates on Just Farm for 9 consecutive weeks. Your 10 GHC reward will be transferred to you shortly. Keep an eye open for it in your myMTN account. Great consistency!	weather	\N	\N	t	\N	\N
cfce3661-8213-4e2f-987e-f0d9bd2777a1	2025-11-03 21:00:56.327994	2025-11-03 21:00:56.327994	weather.tier2_app_retained.celebrate	You're a weather-smart farmer!	Impressive {name}! 🎉 You've been checking weather updates consistently. You're farming smarter and protecting your crops. Well done!	weather	\N	\N	t	\N	\N
246ed280-8ae1-4854-bf52-ce1173dd4e51	2025-11-03 21:00:56.546188	2025-11-03 21:00:56.546188	weather.tier2_app_retained.incentive	Keep your weather-smart habit going	{name}, your consistent weather checking is turning into valuable farming habits. Your crops are better protected and you're planning smarter. Keep it up!	weather	\N	\N	t	\N	\N
46bd14f8-c518-41e3-aef4-a9241e41cbe5	2025-11-03 21:00:56.78625	2025-11-03 21:00:56.78625	weather.tier2_app_retention_dropoff.how	Quick weather reminder	Hi {name}, we noticed that you stopped checking weather on Just Farm lately. Quick reminders:\n• To check weather: Open Just Farm → Weather section → See forecast\n• To set alerts: Settings → Weather notifications\n• To plan ahead: Check 7-day forecast\n\nWatch the video for a refresher.	weather	\N	\N	t	\N	\N
b363393b-d446-4a3e-943e-ccfb61719c31	2025-11-03 21:00:57.159227	2025-11-03 21:00:57.159227	weather.tier2_app_retention_dropoff.incentive	Your weather updates are waiting	{name}, you built great weather-smart habits. Come back and keep protecting your farm.	weather	\N	\N	t	\N	\N
b0f5a159-625a-4966-8e3a-ae52cf4f8502	2025-11-03 21:00:57.380077	2025-11-03 21:00:57.380077	weather.tier2_app_retention_dropoff.reactivation	Come back to weather updates	{name}, you were doing great with weather updates! Check it again today and keep your farming habits strong.	weather	\N	\N	t	\N	\N
cda71efd-7c4a-49f4-9453-49bb43f1d051	2025-11-03 21:00:57.591236	2025-11-03 21:00:57.591236	weather.tier2_app_retention_dropoff.why	Keep your farming progress	{name}, you built weeks of good weather-smart habits. Keep going to maintain:\n• Protection from bad weather\n• Smart planning for farm work\n• Better harvests\nCheck weather today to stay on track!	weather	\N	\N	t	\N	\N
f0abbc31-ec14-4a98-b7e3-874683464479	2025-11-03 20:56:39.244559	2025-11-03 20:56:39.244559	business_advice.tier1_app_opened_first_time.celebrate	Welcome to business advice with Oze!	Great start {name}! 🎉 You've opened Oze for the first time. Work is your most important goal. This is the beginning of something powerful - expert business guidance right on your phone. With Oze, you can: \n✓ Get practical tips on growing your business \n✓ Learn to sell more and attract customers \n✓ Improve your pricing and profits \n✓ Access expert advice anytime \n\nTake the next step: Register your account!	business_advice	\N	\N	t	\N	\N
0a7b66a4-309f-44a0-845e-0200879bda21	2025-11-03 20:56:39.459526	2025-11-03 20:56:39.459526	business_advice.tier1_app_adopted.celebrate	You're growing as a business owner!	Well done {name}! 🎉 You're now using Oze for business advice. You've taken control of your business growth! By learning from experts instead of just guessing, you're: \n✓ Making smarter business decisions \n✓ Finding new ways to increase sales \n✓ Building professional business skills \nKeep going!	business_advice	\N	\N	t	\N	\N
79d04eda-f39f-40fb-bfc3-976c2e21582d	2025-11-03 20:56:39.676401	2025-11-03 20:56:39.676401	business_advice.tier1_app_registered.celebrate	Your business advisor is ready!	{name} congratulations on registering with Oze! 🎉 This is a major step forward! With Oze you can: \n✓ Learn sales strategies \n✓ Get pricing advice \n✓ Track your profits \n✓ Grow your customer base \nAll from your phone!	business_advice	\N	\N	t	\N	\N
ba8c0180-7756-4f82-aad6-2369784826f1	2025-11-03 20:56:39.911463	2025-11-03 20:56:39.911463	business_advice.tier1_app_low_activity.how	Get the most from your business advisor	Hi {name}, we noticed you haven't used Oze much. Here's how to get business advice: \n1. Open the Oze app\n2. Go to the Tips or Advice section\n3. Read or listen to business lessons\n4. Apply one tip to your business today\n5. Watch your sales improve!	business_advice	\N	\N	t	\N	\N
1235e676-6a5f-47e4-9d7b-2854bd3eae89	2025-11-03 20:56:40.139656	2025-11-03 20:56:40.139656	business_advice.tier1_app_low_activity.incentive	Your reward is waiting - start using Oze!	{name}, start using Oze for business advice and earn 10 GHC in just three weeks! Every tip you learn helps you sell more, attract customers, and grow your business. \nThe sooner you start, the sooner you'll see your sales improve. Try one lesson today!	business_advice	\N	\N	t	\N	\N
16098f0d-0624-4690-ad5f-002e574a5caa	2025-11-03 20:56:40.406553	2025-11-03 20:56:40.406553	business_advice.tier1_app_low_activity.support	Need help with Oze?	Hi {name}, need help using Oze for business advice? We're here for you! Common questions: \n• How to find lessons? Open Oze → Look for Tips or Business Advice section → Select a topic\n• What lessons to start with? Begin with 'How to attract customers' or 'Pricing your products'\n• How to apply advice? Read one tip, try it in your business today, and see results\n\nStill stuck? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	business_advice	\N	\N	t	\N	\N
d5e28214-8ed8-4dca-8c12-87186ae677c7	2025-11-03 20:56:40.612507	2025-11-03 20:56:40.612507	business_advice.tier1_app_low_activity.why	Why business advice matters for your success	{name}, we know running a business is hard work. But trying to figure everything out alone has real challenges: \n• You might miss opportunities to sell more \n• Your prices might be too low or too high \n• You don't know what successful businesses do differently \n• No guidance when facing business problems \n\nOze solves these problems. You get expert advice that helps you make more profit, attract more customers, and grow confidently. Other business owners in your community already trust it. Take the first step today - you'll be glad you did!	business_advice	\N	\N	t	\N	\N
e451f0b8-8f52-4e61-9809-5faf00c83e13	2025-11-03 20:56:40.948603	2025-11-03 20:56:40.948603	business_advice.first_tier1_app_engaged.reward	3 weeks of business learning! Collect your reward.	Incredible achievement {name}! 🎉 You've been actively learning business advice for 3 weeks straight. You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nYou're building something powerful - becoming a smarter business owner. Congratulations!	business_advice	\N	\N	t	\N	\N
04616404-816d-4b5b-9b55-0314e931f447	2025-11-03 20:56:41.169707	2025-11-03 20:56:41.169707	business_advice.tier1_app_engaged.celebrate	You're becoming a business expert!	Excellent work {name}! 🎉 Now that you're actively learning from Oze, you're: \n✓ Making better business decisions \n✓ Learning what successful businesses do \n✓ Finding new ways to attract customers \n✓ Growing your business knowledge every day \n\nYou're not just running a business - you're mastering it. Keep it up!	business_advice	\N	\N	t	\N	\N
6692ddb2-db48-4894-bf61-07dba134b114	2025-11-03 20:56:41.386611	2025-11-03 20:56:41.386611	business_advice.tier1_app_engaged.incentive	Keep learning - bigger rewards ahead!	{name}, you're doing great with Oze! Keep learning actively and earn 10 GHC in a few weeks. The more business advice you learn and apply, the more your sales will grow. Keep it up!	business_advice	\N	\N	t	\N	\N
34ce73bf-6f0a-4f1b-9341-d8944dda9f24	2025-11-03 20:56:41.599604	2025-11-03 20:56:41.599604	business_advice.tier1_app_engagement_dropoff.how	Come back to Oze - we can help!	Hi {name}, we noticed you stopped using Oze recently. Let's get you back on track! Quick reminders: \n• To get advice: Open Oze → Go to Tips section → Select a business topic\n• To learn about customers: Look for 'Marketing' or 'Customer Service' lessons\n• To improve pricing: Find 'Pricing Strategies' in the advice section\n• To track what you learned: Make notes or try one tip each day\n\nCome back today and discover advice that can help your business grow!	business_advice	\N	\N	t	\N	\N
aafd9abb-d82d-45ea-908a-3429a7d47e0e	2025-11-03 20:56:41.819521	2025-11-03 20:56:41.819521	business_advice.tier1_app_engagement_dropoff.incentive	Don't lose your business growth momentum!	{name}, you were learning so much about growing your business! Come back now and earn 10 GHC in just a few weeks. You'll quickly remember the benefits of expert advice that helps you sell more and earn more.	business_advice	\N	\N	t	\N	\N
e465ca02-66d3-4e9f-b564-da1d4df63964	2025-11-03 20:56:42.049468	2025-11-03 20:56:42.049468	business_advice.tier1_app_engagement_dropoff.reactivation	Your business advisor misses you - come back today!	{name}, we miss you! You were building important business skills: learning to attract customers, price correctly, and grow sales. Take 2 minutes today to use Oze again and get back on track!	business_advice	\N	\N	t	\N	\N
11ce1347-6fdb-4410-bc62-3b4a48b9fa1a	2025-11-03 20:56:42.261409	2025-11-03 20:56:42.261409	business_advice.tier1_app_engagement_dropoff.why	Remember why you started learning business advice	{name}, going back to guessing means going back to old problems: \n• Trial and error: Wasting time and money on things that don't work \n• Low sales: Missing opportunities because you don't know better strategies \n• No guidance: Facing business challenges alone without help \n\nYou already learned how valuable expert advice is. Don't give up the knowledge that can make your business more profitable. Your future self will thank you!	business_advice	\N	\N	t	\N	\N
dfd18041-f27c-46a5-8cb1-68be5df15144	2025-11-03 20:56:42.482737	2025-11-03 20:56:42.482737	business_advice.tier1_app_engagement_sustained.celebrate	You're a consistent business learner!	Fantastic {name}! 🎉 You've been actively learning business advice for 6 weeks. This isn't luck - this is YOU taking control of your business success! You've proven that: \n✓ You're serious about growing your business \n✓ You value expert guidance over guesswork \n✓ You're ready to compete with the best businesses \n✓ You're investing in your own success \n\nYou're thriving and you're an example to others. Congratulations!	business_advice	\N	\N	t	\N	\N
30975fbe-ff67-4f35-a114-4f3c7e1f851a	2025-11-03 20:56:42.699597	2025-11-03 20:56:42.699597	business_advice.first_tier1_app_retained.reward	9 weeks of business learning! Collect your reward.	Exceptional achievement {name}! 🎉 You've used Oze for business advice actively for 9 weeks straight! You've earned a 10 GHC reward for your commitment. The cash will be transferred to you shortly. Keep an eye open for it in your myMTN account! \nThis is remarkable. You've fully embraced professional business learning. Amazing!	business_advice	\N	\N	t	\N	\N
412ad635-4fa9-4262-85eb-7649c65c2de6	2025-11-03 20:56:42.901703	2025-11-03 20:56:42.901703	business_advice.tier1_app_retained.celebrate	You're a business expert now. Congratulations!	Incredible {name}! 🎉 You're now a long-term Oze user. Look at what you've achieved: \n✓ 9+ weeks of consistent business learning \n✓ Professional business knowledge that sets you apart \n✓ Skills that help you compete with successful businesses \n✓ Confidence in making smart business decisions \nCongratulations!	business_advice	\N	\N	t	\N	\N
868f12fd-d773-454f-9a45-27626bc8b81e	2025-11-03 20:56:43.127996	2025-11-03 20:56:43.127996	business_advice.tier1_app_retained.incentive	You're building real business expertise	{name}, you've proven you can learn and apply business advice for 9+ weeks. This consistency is transforming your business: you know strategies that other businesses don't, you make better decisions, and you're positioned for growth. The longer you keep learning, the more successful your business becomes. Your business future is in your hands!	business_advice	\N	\N	t	\N	\N
d3d18771-4544-40e6-b976-9439f20765b5	2025-11-03 20:56:43.341648	2025-11-03 20:56:43.341648	business_advice.tier1_app_retention_dropoff.how	Let's solve your Oze issue	Hi {name}, you were such a consistent Oze user! We noticed you haven't been active lately. Let's fix any issues: \n• To get new advice: Open Oze → Browse Tips section → Select a new topic\n• To review lessons: Go to your saved tips or history\n• To find specific help: Use the search feature for topics like 'sales' or 'customers'\n• To try something new: Explore advanced business topics\n\nCome back today and continue your business learning journey!	business_advice	\N	\N	t	\N	\N
55f519aa-7413-4832-acca-42c4b3a50e21	2025-11-03 20:56:43.541959	2025-11-03 20:56:43.541959	business_advice.tier1_app_retention_dropoff.incentive	Your business knowledge is too valuable to lose	{name}, every week you spend learning business advice adds to your expertise and competitive advantage. By stopping now, you're missing new strategies that could help you grow. Use Oze this week and keep building your business knowledge!	business_advice	\N	\N	t	\N	\N
47c5fb80-74e1-4598-833b-2726f06e99bd	2025-11-03 20:56:43.754462	2025-11-03 20:56:43.754462	business_advice.tier1_app_retention_dropoff.reactivation	We miss you! Come back as a business learning champion	{name}, we miss you! Your consistent learning gave you knowledge and skills that help you run a better business. Don't let this slip away. Take 2 minutes today to use Oze again and get back on track!	business_advice	\N	\N	t	\N	\N
108faff8-51c5-4fd6-beab-7aca83550b1f	2025-11-03 20:56:44.001572	2025-11-03 20:56:44.001572	business_advice.tier1_app_retention_dropoff.why	Why your business learning track record matters	{name}, you spent many weeks building business expertise. Here's what you lose by stopping: \n• Competitive edge: You stop learning while other businesses improve\n• Growth opportunities: New strategies you'll never hear about\n• Business confidence: Back to uncertainty instead of knowledge\n\nYou worked hard to become a business expert. Make sure you continue using this expertise to achieve your business goals. Take two minutes today to use Oze and get back on track.	business_advice	\N	\N	t	\N	\N
9c8c1ac6-6c53-4838-87a3-a698ee267808	2025-11-03 20:56:44.208569	2025-11-03 20:56:44.208569	business_advice.tier2_app_opened_first_time.celebrate	Welcome to business advice with Oze!	Great start {name}! 🎉 You've opened Oze for the first time. Work is your second most important goal. This is the beginning of something powerful - expert business guidance right on your phone. With Oze, you can: \n✓ Get practical tips on growing your business \n✓ Learn to sell more and attract customers \n✓ Improve your pricing and profits \n✓ Access expert advice anytime \n\nTake the next step: Register your account!	business_advice	\N	\N	t	\N	\N
7e7ce468-09d6-4fc0-a81d-cb619f6a8028	2025-11-03 20:56:44.436353	2025-11-03 20:56:44.436353	business_advice.tier2_app_adopted.celebrate	You're growing as a business owner!	Well done {name}! 🎉 You're now using Oze for business advice. You're taking control of your business growth!	business_advice	\N	\N	t	\N	\N
70b6c3ac-7cdc-42de-819b-c4a0bc36533d	2025-11-03 20:56:44.664068	2025-11-03 20:56:44.664068	business_advice.tier2_app_registered.celebrate	Your business advisor is ready!	{name} congratulations on registering with Oze! 🎉 This is a major step forward! With Oze you can: \n✓ Learn sales strategies \n✓ Get pricing advice \n✓ Track your profits \n✓ Grow your customer base \nAll from your phone!	business_advice	\N	\N	t	\N	\N
7e1b3718-a5bb-4bfc-8238-358faec15229	2025-11-03 20:56:44.911381	2025-11-03 20:56:44.911381	business_advice.tier2_app_low_activity.how	Quick tips for business advice with Oze	Hi {name}, we noticed you haven't used Oze much. Ready to get business advice? Here's a quick start: \n1. Open Oze and explore the Tips section\n2. Try one lesson about attracting customers\n3. Apply the advice to your business today\nStart small until you're comfortable!	business_advice	\N	\N	t	\N	\N
42a4311e-1fee-48ba-a781-aebec1908cf1	2025-11-03 20:56:45.12133	2025-11-03 20:56:45.12133	business_advice.tier2_app_low_activity.incentive	Try Oze for business advice	{name}, start using Oze for business advice and earn 10 GHC in just three weeks. The sooner you start, the sooner you'll see how expert guidance helps your business grow.	business_advice	\N	\N	t	\N	\N
62b9c94e-55e6-42aa-8987-421a75869551	2025-11-03 20:56:45.330503	2025-11-03 20:56:45.330503	business_advice.tier2_app_low_activity.support	Need help with Oze?	Hi {name}, need help using Oze for business advice? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	business_advice	\N	\N	t	\N	\N
105fc20e-7ca5-4e3b-bbbd-5fc574a6d3d7	2025-11-03 20:56:45.544557	2025-11-03 20:56:45.544557	business_advice.tier2_app_low_activity.why	Business advice makes business easier	{name}, Oze offers real benefits: \n• Learn what successful businesses do \n• Get expert advice without paying consultants\n• Discover strategies to sell more and earn more\nGive it a try - many business owners in your community already use it!	business_advice	\N	\N	t	\N	\N
64ac4fe2-2fe0-48a9-a0ec-3f730332c10c	2025-11-03 21:00:57.80013	2025-11-03 21:00:57.80013	women_child_health.tier1_app_opened_first_time.celebrate	Welcome to Bebbo!	Great start {name}! 🎉 You've opened your Bebbo app for the first time. Health is your most important goal. This is the beginning of something wonderful - expert guidance for you and your child. With Bebbo, you can: \n✓ Get trusted advice on pregnancy and child development \n✓ Track your child's growth milestones \n✓ Learn activities to help your child thrive \n✓ Find answers to your health questions \n\nTake the next step: Register your account!	women_child_health	\N	\N	t	\N	\N
a20918fa-aa07-43b2-b6ec-0bb4b7ebb747	2025-11-03 21:00:58.024568	2025-11-03 21:00:58.024568	women_child_health.tier1_app_adopted.celebrate	You're taking charge of your family's health!	Well done {name}! 🎉 You're now using Bebbo to care for your family. By using expert health guidance on your phone, you're: \n✓ Making informed decisions about your child's health \n✓ Learning what to expect at each stage \n✓ Building confidence as a parent \nKeep going!	women_child_health	\N	\N	t	\N	\N
91ad2636-b4bf-46d5-943e-a7734e92ebef	2025-11-03 21:00:58.241394	2025-11-03 21:00:58.241394	women_child_health.tier1_app_registered.celebrate	Your health companion is ready!	{name} congratulations on registering for Bebbo! 🎉 This is a major step forward! With your Bebbo account you can: \n✓ Track your child's development \n✓ Get age-appropriate activity suggestions \n✓ Learn about nutrition and health \nAll from your phone!	women_child_health	\N	\N	t	\N	\N
\.


--
-- Data for Name: messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.messages (id, "createdAt", "updatedAt", subject, text, "from", type, "videoUrl", "audioUrl", "coachId", "userIds", status) FROM stdin;
1cfd1141-2051-4a9e-a278-a7e5d3eb7cce	2025-10-08 12:44:22.818652	2025-10-08 12:44:22.818652	Welcome to Uniti, JOJO QUANSAH	You are welcome to Uniti. Enjoy.	System	system	https://www.youtube.com/watch?v=MCWGERsqy4w	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	0fbdc046-243e-45f4-88a5-e79014c042cc	published
22e6d564-3f5d-49f0-83c4-0c438393a427	2025-10-13 09:53:46.716821	2025-10-13 09:53:46.716821	Welcome to Uniti, Kamiar Majid	You are welcome to Uniti. Enjoy.	System	system	https://www.youtube.com/watch?v=MCWGERsqy4w	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	9edb0f91-cb09-47ec-90fc-fb222cbd82e0	published
0b606074-897f-45d2-9edc-fc812d51c3d9	2025-10-14 14:38:29.530264	2025-10-14 14:38:29.530264	Welcome to Uniti, RITA QUANSAH	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	effe032f-bb25-47f0-be7d-2499cf3e84cf	published
268b97eb-12a4-45a6-bd52-71a05ddca984	2025-10-14 17:16:11.846397	2025-10-14 17:16:11.846397	Welcome to Uniti, RITA QUANSAH	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	909e55e2-a4a2-4b03-bf22-2d978e26c763	published
d8307e72-6875-4e68-bcac-34e7096d834f	2025-10-15 07:42:48.763357	2025-10-15 07:42:48.763357	Welcome to Uniti, RITA QUANSAH	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	75ae46d1-e482-4baf-a2c7-572c41de8aff	published
f57fed8e-f7ec-4ec7-b123-34daafad070c	2025-10-15 08:49:17.812786	2025-10-15 08:49:17.812786	Welcome to Uniti, RITA GUANSAH	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	c99c3f5b-e7ef-4695-ace9-89326973345b	published
e97b60e1-2e68-4422-b021-42202c8c0c8f	2025-10-15 09:03:24.537507	2025-10-15 09:03:24.537507	Welcome to Uniti, RITA QUANSAH	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	446456f7-8e76-45a9-a219-11dbaec41d0f	published
75d6a421-8e80-4578-abab-72f81c263eba	2025-10-15 10:06:32.100774	2025-10-15 10:06:32.100774	Welcome to Uniti, ANNA REVERTE	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	c54a59ea-014a-4dc9-8576-3c655c835d02	published
b2b81d49-ce1e-428c-a0b1-c4b72413323e	2025-09-23 14:11:05.951795	2025-09-23 14:11:05.951795	Welcome to Uniti, SALIFU MUTARU	You are welcome to Uniti. Enjoy.	System	system	https://www.youtube.com/watch?v=MCWGERsqy4w	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	0301ca26-e2e1-470a-9aa3-9616cfee45e5	published
cca3008a-5a3d-458a-8947-357d558d0d3a	2025-09-24 12:22:50.186696	2025-09-24 12:22:50.186696	Welcome to Uniti, RITA QUANSAH	You are welcome to Uniti. Enjoy.	System	system	https://www.youtube.com/watch?v=MCWGERsqy4w	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	4fe1222a-94d9-45fd-b0f2-6856fcb1cb20	published
2495659b-84fd-45c6-bf45-84f7c8df3949	2025-09-25 09:33:22.340993	2025-09-25 09:33:22.340993	Welcome to Uniti, DAR Kamiar Majid	You are welcome to Uniti. Enjoy.	System	system	https://www.youtube.com/watch?v=MCWGERsqy4w	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	03dc138a-04da-4a0c-bd19-e9efbf238407	published
7196c101-68c8-454e-a6f9-520fc4eb98f4	2025-09-30 20:40:16.440702	2025-09-30 20:40:16.440702	Welcome to Uniti, RITA QUANSAH	You are welcome to Uniti. Enjoy.	System	system	https://www.youtube.com/watch?v=MCWGERsqy4w	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	9ff1c29b-7745-4e99-9ea6-5fd6a4e1e44e	published
495af95a-0bfa-4c89-8172-64b1b3681d59	2025-10-01 15:21:08.59214	2025-10-01 15:21:08.59214	Welcome to Uniti, SALIFU MUTARU	You are welcome to Uniti. Enjoy.	System	system	https://www.youtube.com/watch?v=MCWGERsqy4w	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/30ada95e-4589-400e-b842-c3772a2fe8b4-sign%20or%20register.mp3	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0	published
50145043-310d-44b6-8b60-2724846904a1	2025-10-15 14:34:04.013187	2025-10-15 14:34:04.013187	Welcome to Uniti, RITA QUANSAH	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/8bebf6e7-20f1-4f9a-842c-16aefc1f4d72-Welcome.mp3	\N	61916640-bdae-4e6b-9fe9-e91a48b29c71	published
497d8245-1a1f-4770-be1c-985b3d8e63b7	2025-10-16 08:54:58.543389	2025-10-16 08:54:58.543389	Welcome to Uniti, RITA QUANSAH	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/8bebf6e7-20f1-4f9a-842c-16aefc1f4d72-Welcome.mp3	\N	7d3dde3e-3ee4-4224-ab2e-ea78045e5457	published
433dca08-98a5-4c85-800c-f6e49051add3	2025-10-16 09:10:30.309003	2025-10-16 09:10:30.309003	Welcome to Uniti, AUGUSTINA AHEDOR	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/8bebf6e7-20f1-4f9a-842c-16aefc1f4d72-Welcome.mp3	\N	533f6786-0f97-4267-8977-6541522033b6	published
e85fca4a-13c5-48ad-be85-05fb152feb8d	2025-10-16 10:09:43.805894	2025-10-16 10:09:43.805894	Welcome to Uniti, JANET LARTEY	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/8bebf6e7-20f1-4f9a-842c-16aefc1f4d72-Welcome.mp3	\N	57cecea5-da12-43dd-ae7c-66cd38408047	published
96ee9674-d8fa-4340-9122-4e569106e591	2025-10-20 09:15:22.534501	2025-10-20 09:15:22.534501	Welcome to Uniti, ANNA MONTANES	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/8bebf6e7-20f1-4f9a-842c-16aefc1f4d72-Welcome.mp3	\N	2bf56a47-a901-41d8-8f4d-d5a8b9609328	published
9c40d0fe-5b06-4e0a-8915-f0ac9408d923	2025-10-20 16:54:59.929965	2025-10-20 16:54:59.929965	Welcome to Uniti, RITA QUANSAH	We’re thrilled to have you on board. Your new phone, together with the Uniti app, is more than just a phone - it’s your personal guide to a new, digital life.\nWith Uniti, you’ll discover tools to grow your business, stay healthy, manage your money wisely, and learn new skills. All from your phone!\nAnd the best part? You’ll earn rewards like free data and cashback as you explore and use these services!\nCheck out this quick video to learn how Uniti helps you earn, learn, and grow.\nWe’re excited to join you on this path, helping you, your family, and your community thrive.\nWelcome to Uniti – your partner for progress.	System	system	\N	https://uniti-sounds.s3.eu-west-3.amazonaws.com/audio/8bebf6e7-20f1-4f9a-842c-16aefc1f4d72-Welcome.mp3	\N	b86f2b40-4403-4679-a554-00e2e094372f	published
8815079e-6919-4b06-82a3-c188759e9262	2025-11-10 09:23:23.38607	2025-11-10 09:23:23.38607	Your farming weather guide is ready!	{name} congratulations on registering for Just Farm! 🎉 This is a major step forward! With your account you can:\n✓ Get weather forecasts\n✓ Receive rain and storm alerts\n✓ Learn best planting times\n✓ Plan farm work\nAll from your phone!	System	system	\N	\N	\N	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2	published
779bc3e8-4349-4fd1-a1bf-52de64e09a2a	2025-11-13 13:11:04.935744	2025-11-13 13:11:04.935744	Keep your parenting progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
716ed627-60f1-4538-8b69-9146d2af6df7	2025-11-13 13:15:03.97303	2025-11-13 13:15:03.97303	Keep your parenting progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
3f7d6e62-1ca5-4a1b-9648-793725133bce	2025-11-13 13:15:59.241408	2025-11-13 13:15:59.241408	Keep your parenting progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
82150b4e-e29e-4250-9d44-f10e696c31b7	2025-11-13 13:17:20.964349	2025-11-13 13:17:20.964349	Keep your parenting progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
c67639bd-3489-4722-a6f1-4e2a2de894b6	2025-11-17 15:52:05.994838	2025-11-17 15:52:05.994838	Keep your parenting progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
14c76931-8b72-4856-be74-258a46fbbb22	2025-11-17 15:53:44.122988	2025-11-17 15:53:44.122988	Keep your parenting progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
f84ee3c2-e1e6-419c-aa91-7169026b122d	2025-11-17 16:35:43.509726	2025-11-17 16:35:43.509726	Keep your parenting progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
5c575b2f-2700-442c-aa03-909d318934af	2025-11-19 17:19:10.776559	2025-11-19 17:19:10.776559	Keep your parenting progress	{name}, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
f48765fd-1e77-4233-839b-d66d924e17c0	2025-11-19 17:21:30.79282	2025-11-19 17:21:30.79282	Come back to weather updates	{name}, you were doing great with weather updates! Check it again today and keep your farming habits strong.	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
b925cdb0-a4a2-4d06-b21d-fa8af281f809	2025-11-19 17:29:50.897466	2025-11-19 17:29:50.897466	Quick weather reminder	Hi SALIFU MUTARU, we noticed that you stopped checking weather on Just Farm lately. Quick reminders:\n• To check weather: Open Just Farm → Weather section → See forecast\n• To set alerts: Settings → Weather notifications\n• To plan ahead: Check 7-day forecast\n\nWatch the video for a refresher.	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
37b7b2e9-8e72-49a5-b14a-1fff8eb5f6aa	2025-11-19 17:32:40.889156	2025-11-19 17:32:40.889156	Quick weather reminder	Hi SALIFU MUTARU, we noticed that you stopped checking weather on Just Farm lately. Quick reminders:\n• To check weather: Open Just Farm → Weather section → See forecast\n• To set alerts: Settings → Weather notifications\n• To plan ahead: Check 7-day forecast\n\nWatch the video for a refresher.	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
a099aab9-fa1c-47ab-9c88-26e3358f6b9f	2025-11-19 17:37:51.463702	2025-11-19 17:37:51.463702	Quick weather reminder	Hi SALIFU MUTARU, we noticed that you stopped checking weather on Just Farm lately. Quick reminders:\n• To check weather: Open Just Farm → Weather section → See forecast\n• To set alerts: Settings → Weather notifications\n• To plan ahead: Check 7-day forecast\n\nWatch the video for a refresher.	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
02af428e-f819-4c9f-88c0-fa53146396a7	2025-11-19 17:39:10.859654	2025-11-19 17:39:10.859654	Quick weather reminder	Hi SALIFU MUTARU, we noticed that you stopped checking weather on Just Farm lately. Quick reminders:\n• To check weather: Open Just Farm → Weather section → See forecast\n• To set alerts: Settings → Weather notifications\n• To plan ahead: Check 7-day forecast\n\nWatch the video for a refresher.	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
7c491085-5fb6-4c11-bc71-e47d53291015	2025-11-19 17:39:12.52367	2025-11-19 17:39:12.52367	Quick weather reminder	Hi RITA GUANSAH, we noticed that you stopped checking weather on Just Farm lately. Quick reminders:\n• To check weather: Open Just Farm → Weather section → See forecast\n• To set alerts: Settings → Weather notifications\n• To plan ahead: Check 7-day forecast\n\nWatch the video for a refresher.	System	system	\N	\N	\N	c99c3f5b-e7ef-4695-ace9-89326973345b	published
2f9585b4-cbc8-46fb-b966-94395b428517	2025-11-19 17:39:14.176075	2025-11-19 17:39:14.176075	Quick weather reminder	Hi SAMUEL ALOMENU, we noticed that you stopped checking weather on Just Farm lately. Quick reminders:\n• To check weather: Open Just Farm → Weather section → See forecast\n• To set alerts: Settings → Weather notifications\n• To plan ahead: Check 7-day forecast\n\nWatch the video for a refresher.	System	system	\N	\N	\N	a7295cab-0299-493d-9870-3ed59a04cfaa	published
d4380b5f-a808-4263-830b-a838bd07c690	2025-11-19 18:12:30.868462	2025-11-19 18:12:30.868462	Keep your parenting progress	SALIFU MUTARU, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
b2d4f232-f538-4959-bb87-cdc118c3b510	2025-11-19 19:43:40.023478	2025-11-19 19:43:40.023478	Need help with weather updates?	Hi SALIFU MUTARU, need help using Just Farm's weather features? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
1df8cd9a-56db-47ba-b2d1-226b657d2dbe	2025-11-19 19:43:40.240781	2025-11-19 19:43:40.240781	Need help with weather updates?	Hi SAMUEL ALOMENU, need help using Just Farm's weather features? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	System	system	\N	\N	\N	a7295cab-0299-493d-9870-3ed59a04cfaa	published
81a663df-030d-4d32-8ef0-9989e39b8135	2025-11-19 19:43:40.404268	2025-11-19 19:43:40.404268	You're farming smarter with weather!	Well done SALIFU MUTARU! 🎉 You're now using Just Farm's weather updates. You're protecting your farm and planning smart!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
0adc6ee4-f21b-4678-97cb-be9dda5efcaa	2025-11-19 19:43:40.545962	2025-11-19 19:43:40.545962	You're farming smarter with weather!	Well done SAMUEL ALOMENU! 🎉 You're now using Just Farm's weather updates. You're protecting your farm and planning smart!	System	system	\N	\N	\N	a7295cab-0299-493d-9870-3ed59a04cfaa	published
d54a5cd7-dbd3-439a-b864-254e6344bbcc	2025-11-19 19:43:40.641913	2025-11-19 19:43:40.641913	You're farming smarter with weather!	Well done SALIFU MUTARU! 🎉 You're now using Just Farm's weather updates. You're protecting your farm and planning smart!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
dd9d85e5-03f2-42f4-8f89-2a95f6a07809	2025-11-19 19:43:42.958038	2025-11-19 19:43:42.958038	You're farming smarter with weather!	Well done SAMUEL ALOMENU! 🎉 You're now using Just Farm's weather updates. You're protecting your farm and planning smart!	System	system	\N	\N	\N	a7295cab-0299-493d-9870-3ed59a04cfaa	published
8e71c052-f30f-4e6e-b8e4-5ca56d719510	2025-11-19 21:55:10.036552	2025-11-19 21:55:10.036552	Need help with weather updates?	Hi SALIFU MUTARU, need help using Just Farm's weather features? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
6635403d-7a66-4489-8149-9e1dd505e906	2025-11-19 21:55:10.21902	2025-11-19 21:55:10.21902	Need help with weather updates?	Hi SAMUEL ALOMENU, need help using Just Farm's weather features? Click the blue [HELP] button and then click on [Call] to speak with our support team. We'll walk you through every step!	System	system	\N	\N	\N	a7295cab-0299-493d-9870-3ed59a04cfaa	published
b8bdfed5-ce38-4a44-b1f5-299bb09e1d85	2025-11-19 21:55:10.38188	2025-11-19 21:55:10.38188	You're farming smarter with weather!	Well done SALIFU MUTARU! 🎉 You're now using Just Farm's weather updates. You're protecting your farm and planning smart!	System	system	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739	published
beae5038-4181-4847-a88f-7b5f838a77a1	2025-11-19 21:55:10.536648	2025-11-19 21:55:10.536648	You're farming smarter with weather!	Well done SAMUEL ALOMENU! 🎉 You're now using Just Farm's weather updates. You're protecting your farm and planning smart!	System	system	\N	\N	\N	a7295cab-0299-493d-9870-3ed59a04cfaa	published
32e27c1d-acfb-44f4-9e8e-e28691f332d6	2025-11-19 21:56:00.0298	2025-11-19 21:56:00.0298	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	dce40658-353e-467f-bafe-920524125e12	published
b8784d1f-e626-4901-84cd-c14a406bb736	2025-11-19 22:37:50.033573	2025-11-19 22:37:50.033573	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	dce40658-353e-467f-bafe-920524125e12	published
c077396d-95a8-47d4-b540-bf5e71086450	2025-11-19 22:38:00.034188	2025-11-19 22:38:00.034188	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	ade67080-652a-45ba-80a9-9b48c06215e6	published
87063285-7d36-4a96-8b67-b0c26c92a5d2	2025-11-19 22:38:20.034996	2025-11-19 22:38:20.034996	40 GHC + 1GB earned! Welcome to your digital future	Incredible achievement SALIFU MUTARU! 🎉 You've completed your full Uniti onboarding and earned 40 GHC + 1GB. \nThe cash and data will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're no longer just getting started - you're READY. Now it's time to register in your apps and start your journey. The future is in your hands!	System	system	\N	\N	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0	published
0513a0c6-bd04-4f0e-a6b6-435d23e8fb99	2025-11-19 22:38:20.189962	2025-11-19 22:38:20.189962	Your digital toolkit is complete!	Amazing SALIFU MUTARU! 🎉 You've downloaded all your priority apps. Your personalized digital toolkit is ready. The journey from goals to achievements starts now. \nNext step: Complete Uniti’s onboarding.	System	system	\N	\N	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0	published
768396f6-1d87-404a-aeca-07f35783fa42	2025-11-19 22:45:40.026199	2025-11-19 22:45:40.026199	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	dce40658-353e-467f-bafe-920524125e12	published
72081349-8a8f-44c6-9fb7-7ed9a6bf6369	2025-11-19 22:46:20.027609	2025-11-19 22:46:20.027609	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	ade67080-652a-45ba-80a9-9b48c06215e6	published
e017f571-faf5-4b60-a110-03485a3a80a4	2025-11-19 22:48:10.022869	2025-11-19 22:48:10.022869	40 GHC waiting for you!	User, you're so close! Selecting your goals brings you one step closer to earning 40 GHC + 1GB data. You started choosing what matters most to you - healthcare, education, finance, or work. Finish selecting your goals in the next 24 hours and claim your reward! Don't miss out on apps that can truly help you achieve your dreams.	System	system	\N	\N	\N	dce40658-353e-467f-bafe-920524125e12	published
5aa1a6ac-a7c3-43dd-9afb-891d2f77318c	2025-11-19 22:48:40.031132	2025-11-19 22:48:40.031132	Quick help: Finish setting your goals	Hi User, we noticed you started setting your goals but didn't finish. It's easy! Here's how: \n1. Open the Uniti app.\n2. Choose up to 3 goals for each category.\n3. Choose the 2 most important categories for you (Health, Finance, Work or Education).\nIt takes 2 minutes and it helps us recommend the right apps for YOU.\n\nWatch the video below for step by step guidance:\n<How to set your goals>	System	system	\N	\N	\N	ade67080-652a-45ba-80a9-9b48c06215e6	published
4b1c74fd-19a6-4da5-bef4-23b1ab00209d	2025-11-19 22:49:30.028202	2025-11-19 22:49:30.028202	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	dce40658-353e-467f-bafe-920524125e12	published
ccbcb11d-9ffc-422f-9b29-80291e1dac43	2025-11-19 22:52:10.033405	2025-11-19 22:52:10.033405	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	dce40658-353e-467f-bafe-920524125e12	published
767eab77-b156-4932-b4ac-92ab84443c39	2025-11-19 22:52:30.036758	2025-11-19 22:52:30.036758	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	ade67080-652a-45ba-80a9-9b48c06215e6	published
cd10dc8d-9aad-4212-97d5-211279b35f94	2025-11-19 22:52:40.030279	2025-11-19 22:52:40.030279	40 GHC + 1GB earned! Welcome to your digital future	Incredible achievement SALIFU MUTARU! 🎉 You've completed your full Uniti onboarding and earned 40 GHC + 1GB. \nThe cash and data will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're no longer just getting started - you're READY. Now it's time to register in your apps and start your journey. The future is in your hands!	System	system	\N	\N	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0	published
21b8065c-e22c-4e69-a5e8-f6a1f682f362	2025-11-19 22:52:40.186628	2025-11-19 22:52:40.186628	Your account is fully secure!	Congratulations SALIFU MUTARU! 🎉 Your identity verification is complete. Your account is now: \n✓ Fully verified and secure  \n✓ Ready for all app features \nNow it’s time to discover your personalized apps.	System	system	\N	\N	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0	published
f9f3fce3-fecf-45b6-aad8-680ef2bdd904	2025-11-19 22:53:00.037295	2025-11-19 22:53:00.037295	Keep your weather-smart habit going	SALIFU MUTARU, your consistent weather checking is turning into valuable farming habits. Your crops are better protected and you're planning smarter. Keep it up!	System	system	\N	\N	\N	b7637e6b-e023-4347-9cce-d51e7aacaab4	published
18988d7f-0dbc-4127-a89e-87d8a8b24c8c	2025-11-19 22:53:20.03029	2025-11-19 22:53:20.03029	Quick help: Finish setting your goals	Hi BARCELONA BARCELONA, we noticed you started setting your goals but didn't finish. It's easy! Here's how: \n1. Open the Uniti app.\n2. Choose up to 3 goals for each category.\n3. Choose the 2 most important categories for you (Health, Finance, Work or Education).\nIt takes 2 minutes and it helps us recommend the right apps for YOU.\n\nWatch the video below for step by step guidance:\n<How to set your goals>	System	system	\N	\N	\N	ac26d78c-33db-4bbd-a387-bf38ff39ca23	published
68b561a4-3602-4996-877d-cd6cf7a0e050	2025-11-19 22:53:40.028598	2025-11-19 22:53:40.028598	Quick help: Finish setting your goals	Hi User, we noticed you started setting your goals but didn't finish. It's easy! Here's how: \n1. Open the Uniti app.\n2. Choose up to 3 goals for each category.\n3. Choose the 2 most important categories for you (Health, Finance, Work or Education).\nIt takes 2 minutes and it helps us recommend the right apps for YOU.\n\nWatch the video below for step by step guidance:\n<How to set your goals>	System	system	\N	\N	\N	4ffb4e82-e20c-457d-b46b-562c7017c8b1	published
c5efcaf0-e93a-4171-adc0-af78e3d76550	2025-11-19 22:56:00.036618	2025-11-19 22:56:00.036618	Welcome to business advice with Oze!	Great start SALIFU MUTARU! 🎉 You've opened Oze for the first time. Work is your second most important goal. This is the beginning of something powerful - expert business guidance right on your phone. With Oze, you can: \n✓ Get practical tips on growing your business \n✓ Learn to sell more and attract customers \n✓ Improve your pricing and profits \n✓ Access expert advice anytime \n\nTake the next step: Register your account!	System	system	\N	\N	\N	b7637e6b-e023-4347-9cce-d51e7aacaab4	published
5ad60f56-7bb8-4c0b-a91c-162263a31f78	2025-11-19 22:56:00.183796	2025-11-19 22:56:00.183796	Welcome to business advice with Oze!	Great start SALIFU MUTARU! 🎉 You've opened Oze for the first time. Work is your most important goal. This is the beginning of something powerful - expert business guidance right on your phone. With Oze, you can: \n✓ Get practical tips on growing your business \n✓ Learn to sell more and attract customers \n✓ Improve your pricing and profits \n✓ Access expert advice anytime \n\nTake the next step: Register your account!	System	system	\N	\N	\N	b7637e6b-e023-4347-9cce-d51e7aacaab4	published
91caf40f-ed26-4812-84bb-a3652557a419	2025-11-19 22:56:00.330478	2025-11-19 22:56:00.330478	Keep your business learning habit going	SALIFU MUTARU, your consistent business learning is building valuable skills. You're becoming a smarter business owner. Keep it up!	System	system	\N	\N	\N	b7637e6b-e023-4347-9cce-d51e7aacaab4	published
c3b8ecc9-d5c4-433e-a17c-da6156ff807a	2025-11-19 22:56:00.77468	2025-11-19 22:56:00.77468	Keep your business learning habit going	SALIFU MUTARU, your consistent business learning is building valuable skills. You're becoming a smarter business owner. Keep it up!	System	system	\N	\N	\N	b7637e6b-e023-4347-9cce-d51e7aacaab4	published
e7e4679e-f689-48c0-b3e4-557bebbae319	2025-11-19 22:59:50.039512	2025-11-19 22:59:50.039512	Why quality farming inputs matter for your harvest	SALIFU MUTARU, we know changing where you buy inputs can feel uncertain. But buying from local shops has real risks: \n• Fake or expired seeds that won't grow properly \n• Wrong fertilizer that wastes your money \n• No guarantee of product quality \n• Limited selection and higher prices \nGROW solves these problems. You get certified products, better prices, and delivery to your location. Other farmers in your area already trust it. Order quality inputs today - your harvest will thank you!	System	system	\N	\N	\N	b7637e6b-e023-4347-9cce-d51e7aacaab4	published
28865974-f2dd-4f4f-8d4b-30f37aefcedb	2025-11-19 23:18:20.029379	2025-11-19 23:18:20.029379	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	dce40658-353e-467f-bafe-920524125e12	published
c350fc78-7612-4b7e-b398-4b9c1ee698f1	2025-11-19 23:18:50.025622	2025-11-19 23:18:50.025622	Quick help: Finish setting your goals	Hi User, we noticed you started setting your goals but didn't finish. It's easy! Here's how: \n1. Open the Uniti app.\n2. Choose up to 3 goals for each category.\n3. Choose the 2 most important categories for you (Health, Finance, Work or Education).\nIt takes 2 minutes and it helps us recommend the right apps for YOU.\n\nWatch the video below for step by step guidance:\n<How to set your goals>	System	system	\N	\N	\N	ade67080-652a-45ba-80a9-9b48c06215e6	published
1f2abdc3-a764-4625-b76c-38772f362adf	2025-11-19 23:23:40.024251	2025-11-19 23:23:40.024251	40 GHC waiting for you!	User, you're so close! Selecting your goals brings you one step closer to earning 40 GHC + 1GB data. You started choosing what matters most to you - healthcare, education, finance, or work. Finish selecting your goals in the next 24 hours and claim your reward! Don't miss out on apps that can truly help you achieve your dreams.	System	system	\N	\N	\N	dce40658-353e-467f-bafe-920524125e12	published
84245b67-0be9-433c-9f18-44e40fc4389e	2025-11-19 23:24:10.030736	2025-11-19 23:24:10.030736	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	ade67080-652a-45ba-80a9-9b48c06215e6	published
507b8072-c9f3-47a7-8c59-378e435ddbee	2025-11-19 23:24:30.829991	2025-11-19 23:24:30.829991	40 GHC + 1GB earned! Welcome to your digital future	Incredible achievement SALIFU MUTARU! 🎉 You've completed your full Uniti onboarding and earned 40 GHC + 1GB. \nThe cash and data will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're no longer just getting started - you're READY. Now it's time to register in your apps and start your journey. The future is in your hands!	System	system	\N	\N	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0	published
fa2de157-6107-4abc-bf9a-78395105f08d	2025-11-19 23:24:32.857194	2025-11-19 23:24:32.857194	Your account is fully secure!	Congratulations SALIFU MUTARU! 🎉 Your identity verification is complete. Your account is now: \n✓ Fully verified and secure  \n✓ Ready for all app features \nNow it’s time to discover your personalized apps.	System	system	\N	\N	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0	published
4e7e9bca-210d-45b8-b39e-3a151256a092	2025-11-19 23:24:50.029704	2025-11-19 23:24:50.029704	Your account is fully secure!	Congratulations BARCELONA BARCELONA! 🎉 Your identity verification is complete. Your account is now: \n✓ Fully verified and secure  \n✓ Ready for all app features \nNow it’s time to discover your personalized apps.	System	system	\N	\N	\N	ac26d78c-33db-4bbd-a387-bf38ff39ca23	published
a8ef902e-aa7f-456f-be5e-f536baaec1c6	2025-11-19 23:25:00.028661	2025-11-19 23:25:00.028661	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	4ffb4e82-e20c-457d-b46b-562c7017c8b1	published
9d6b0152-a4cc-434d-9bdf-b19c9d33b5e3	2025-11-19 23:25:20.028883	2025-11-19 23:25:20.028883	40 GHC + 1GB earned! Welcome to your digital future	Incredible achievement DAR Kamiar Majid! 🎉 You've completed your full Uniti onboarding and earned 40 GHC + 1GB. \nThe cash and data will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're no longer just getting started - you're READY. Now it's time to register in your apps and start your journey. The future is in your hands!	System	system	\N	\N	\N	03dc138a-04da-4a0c-bd19-e9efbf238407	published
4e265752-9d3c-4b65-9540-5b3b3a1741c1	2025-11-19 23:25:20.177298	2025-11-19 23:25:20.177298	Welcome to business tracking!	Great start DAR Kamiar Majid! 🎉 You've opened your business tracking app for the first time. Work is your second most important goal. This is the beginning of something powerful - a smarter way to manage your business. With Oze, you can: \n✓ Track all your income and expenses \n✓ See your real profit clearly \n✓ Know exactly where your money goes \n✓ Build records for business loans \n\nTake the next step: Register your business!	System	system	\N	\N	\N	03dc138a-04da-4a0c-bd19-e9efbf238407	published
13a42624-2d79-480f-ab1c-bb42ed9e1730	2025-11-19 23:25:30.030588	2025-11-19 23:25:30.030588	Your account is fully secure!	Congratulations SALIFU MUTARU! 🎉 Your identity verification is complete. Your account is now: \n✓ Fully verified and secure  \n✓ Ready for all app features \nNow it’s time to discover your personalized apps.	System	system	\N	\N	\N	c74b2ec1-5e33-420f-aaa7-adac48e5221c	published
b060f367-8d0c-43cc-83c0-e7102d075e23	2025-11-19 23:25:50.028303	2025-11-19 23:25:50.028303	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	38b3b5c5-ce46-439d-984f-be1dab002a57	published
6ccd2a04-0c9c-4768-94a4-863e07f6144f	2025-11-19 23:26:00.029242	2025-11-19 23:26:00.029242	Welcome to Uniti! Your phone is verified	Congratulations User! 🎉 Your phone verification is complete. You've taken the first step into a world of possibilities. With Uniti, you can:\n✓ Save money for your future\n✓ Access healthcare from home\n✓ Grow your farm or business\nReady to discover what's possible? Let's set up your personalized experience!\n\nWatch the video below to learn how to setup your goals.\n<How to set your goals>	System	system	\N	\N	\N	2c4db685-0707-4809-989d-6168e505cf43	published
5601cae4-6bf4-44c6-9d75-cf39f223c80f	2025-11-19 23:26:20.035646	2025-11-19 23:26:20.035646	40 GHC + 1GB earned! Welcome to your digital future	Incredible achievement SALIFU MUTARU! 🎉 You've completed your full Uniti onboarding and earned 40 GHC + 1GB. \nThe cash and data will be transferred to you shortly. Keep an eye open for it in your myMTN account!\nYou're no longer just getting started - you're READY. Now it's time to register in your apps and start your journey. The future is in your hands!	System	system	\N	\N	\N	0301ca26-e2e1-470a-9aa3-9616cfee45e5	published
086a322e-0963-4eff-acec-64789d4f1172	2025-11-19 23:26:20.200293	2025-11-19 23:26:20.200293	Your account is fully secure!	Congratulations SALIFU MUTARU! 🎉 Your identity verification is complete. Your account is now: \n✓ Fully verified and secure  \n✓ Ready for all app features \nNow it’s time to discover your personalized apps.	System	system	\N	\N	\N	0301ca26-e2e1-470a-9aa3-9616cfee45e5	published
403de9d9-5d36-41a4-b88a-980eb8263cc2	2025-11-19 23:26:30.195144	2025-11-19 23:26:30.195144	Your account is fully secure!	Congratulations MAJE NORTH NIGER I SULEJA! 🎉 Your identity verification is complete. Your account is now: \n✓ Fully verified and secure  \n✓ Ready for all app features \nNow it’s time to discover your personalized apps.	System	system	\N	\N	\N	2f9a73de-22e5-45c4-90c5-ab909821d182	published
303d0cf3-8b08-420d-a9a2-7348c812d545	2025-11-19 23:26:50.033286	2025-11-19 23:26:50.033286	Your account is fully secure!	Congratulations DAR Majid! 🎉 Your identity verification is complete. Your account is now: \n✓ Fully verified and secure  \n✓ Ready for all app features \nNow it’s time to discover your personalized apps.	System	system	\N	\N	\N	aa8c967f-24be-49f1-be7e-d449e9d17246	published
f746247d-75a4-4736-8fd7-5ae4017ec479	2025-11-25 08:50:49.977533	2025-11-25 08:50:49.977533	Keep your parenting progress	SALIFU MUTARU, you built weeks of good learning habits. Keep going to maintain: \n• Your parenting knowledge \n• Confidence in health decisions \n• Activities that help your child develop \nUse it today to stay on track!	System	system	\N	\N	\N	5b26671d-5d53-4373-a113-c0339a4bbed3	published
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.migrations (id, "timestamp", name) FROM stdin;
\.


--
-- Data for Name: milestone_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.milestone_logs (id, user_id, milestone_id, created_at, app_id, service_category, is_checked) FROM stdin;
0b432772-b03c-40bd-bf3f-1bcb167bbbdc	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_verification_complete	2025-11-26 06:04:10.459	\N	\N	f
5121213b-c199-45c5-b04e-f2b9ab96f623	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:00:12.816	\N	\N	f
676216cb-48f8-4203-9f09-b2dddb44cbd6	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_verification_complete	2025-11-26 11:22:09.999	\N	\N	f
67560918-78d8-483c-87b3-a383a48509ec	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_verification_complete	2025-11-26 06:05:14.453	\N	\N	f
b00e7b59-ddc7-4339-b328-e7dc15f6fb2a	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:00:57.775	\N	\N	f
ac661b50-2281-4c40-a835-c34d94a6c74d	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:01:02.403	\N	\N	f
3c99f397-5465-4880-8633-79641544bdac	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_verification_complete	2025-11-26 11:22:40.978	\N	\N	f
911d4155-6bdd-44ec-b068-7ef09430c725	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_verification_complete	2025-11-26 06:07:50.894	\N	\N	f
f6ea43d8-b103-4f02-b19c-3965b512d8fe	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:02:11.818	\N	\N	f
b27c9ddb-dcbf-4fe5-9081-82ba2c6b84db	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_verification_complete	2025-11-26 11:23:18.338	\N	\N	f
d6074bfb-4115-488e-8f9f-061c97df47bc	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_verification_complete	2025-11-26 06:08:11.83	\N	\N	f
4ab134db-c279-4a9c-a1f9-60f8195e8496	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:02:32.675	\N	\N	f
46b96307-680d-40ba-a027-56b3c4d9850e	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_verification_complete	2025-11-26 11:26:24.157	\N	\N	f
9276a7ac-cd32-4478-93bb-7fa0ba733b3d	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_verification_complete	2025-11-26 06:10:18.851	\N	\N	f
85319827-b691-4b5c-b1a8-fc1af6cb1edc	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:03:19.676	\N	\N	f
e0857972-f81b-46a3-acf0-4275a0e83a10	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_verification_complete	2025-11-26 11:27:49.193	\N	\N	f
fdd3dd47-fbd9-4e50-9176-f14ebc42ae54	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_verification_complete	2025-11-26 11:27:53.78	\N	\N	f
45557428-cd3d-4991-8eac-4f1ecfc2d9ea	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_verification_complete	2025-11-26 06:11:52.186	\N	\N	f
80c2fb62-a427-4557-859d-74c2663cd2db	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:03:54.694	\N	\N	f
5ca3b478-622c-4b82-9f79-ccfd3d085a18	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_verification_complete	2025-11-26 11:28:27.075	\N	\N	f
5b3413f7-d72b-44e0-98ff-3293c34d7837	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_verification_complete	2025-11-26 11:28:33.772	\N	\N	f
cfe65a3a-d411-497b-8963-62f1f99b6500	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_verification_complete	2025-11-26 06:12:09.168	\N	\N	f
4ba49515-721d-4046-8d6e-c9405e538a78	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:04:15.734	\N	\N	f
66939a01-5348-429d-ba90-ce81503ae741	cfa00b58-0379-459e-99d9-57658bbf9572	phone_verification_complete	2025-11-26 12:37:28.721	\N	\N	f
ee52f766-2308-4c43-978c-3f6c9f34c235	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:03:41.285	\N	\N	f
bc088439-931d-471f-b999-8c493ceff42b	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:03:41.285	\N	\N	f
a42df599-f459-4ad2-bfd3-d6a1cfcfddc0	b5947c92-85b6-4b2c-a196-994d9c3b4739	tier1_app_opened_first_time	2025-11-25 13:03:46.669	org.iggymedia.periodtracker	womens_health	f
30a81353-a505-49b9-b2eb-b3aa69fa018b	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:03:50.332	\N	\N	f
b909cf11-2887-4f47-8e2e-4276356edd94	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:03:50.332	\N	\N	f
7f5ba181-c563-42ab-a9c5-7b2413e4c3cd	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:03:50.332	\N	\N	f
36272c20-3040-4cb5-8460-eaa95ea9b1d1	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:03:50.332	\N	\N	f
5f44f2bd-f93b-4bcd-91fc-84813418550b	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:03:54.007	\N	\N	f
d0b4c92a-a68e-4e1a-86d3-baa58f166be5	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:03:54.007	\N	\N	f
39611edc-1c76-435f-90fb-b306786de54f	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:03:54.007	\N	\N	f
71b5d235-d07d-40b4-b896-cd54362e7809	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:03:54.007	\N	\N	f
ff3ca68b-7cb1-485d-8ac9-3a707119e82c	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:03:57.681	\N	\N	f
efb2e5e0-f8ad-47ef-913e-d773b3cbeb04	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:03:57.681	\N	\N	f
476f9dd9-bfea-44b3-8fad-5981b80837f3	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:03:57.681	\N	\N	f
6a104dd2-b60e-4032-a538-8bd04388dd91	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:03:57.681	\N	\N	f
c6e58ed1-d891-4bfc-a874-d004ae2069a0	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:04:01.359	\N	\N	f
ad8ec72f-bbab-4a9f-a501-0cfded7927e2	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:04:01.359	\N	\N	f
b2b3e3a4-d2b9-42d7-95bf-a001750d709f	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:04:01.359	\N	\N	f
0434e160-3288-4fd8-9ccf-814610e9b58c	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:04:01.359	\N	\N	f
e604e1b1-f629-4b81-8e3e-34e3d9fd6ad7	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:04:05.021	\N	\N	f
f584795c-f4d7-499c-8dca-7062932c94b0	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:04:05.021	\N	\N	f
011c2c26-d469-40b3-961b-48a64f9197bd	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:04:05.021	\N	\N	f
4bf176a4-0bfa-4648-b368-d0d0533b0989	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:04:05.021	\N	\N	f
7f0fda66-523e-4691-ae98-6c64f39e8ec7	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:04:08.685	\N	\N	f
d21f18b0-ec24-40bd-9ba2-e383438bebdb	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:04:08.685	\N	\N	f
021e74ac-6712-415b-8e31-6c75f51e3b15	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:04:08.685	\N	\N	f
3bcb0f79-d7a9-4622-a2d7-f695b3f40ebe	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:04:08.685	\N	\N	f
66f8a845-d02d-4295-a61b-da2b668973c1	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:04:12.355	\N	\N	f
ea8e685e-46b2-49f9-b6d8-f510054dbb95	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:04:12.355	\N	\N	f
07a842e5-37aa-4982-b707-3187f0c04a6c	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:04:12.355	\N	\N	f
c40c819d-8b7e-47d8-af23-f8e68a50cbb3	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:04:12.355	\N	\N	f
b13a1eaa-046b-4de8-8614-a91ec2f78164	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:04:19.77	\N	\N	f
b942488d-6a28-416b-b35b-874f3509bb3e	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:04:19.77	\N	\N	f
879331fe-c11b-4b99-bc0e-9fa480f21e76	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:04:19.77	\N	\N	f
00e58e71-c897-453e-8f4c-7c4e763308b4	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:04:19.77	\N	\N	f
c911d2f7-5bbb-4101-a9c2-9c6423fbeeb2	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:04:23.426	\N	\N	f
12e77224-aec2-4ea9-a949-20344eaeb8af	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:04:23.426	\N	\N	f
0884c97c-0080-44c9-ba1c-e385dcafb674	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:04:23.426	\N	\N	f
d33ad2f6-db34-484e-9e82-30ae4af5d9c1	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:04:23.426	\N	\N	f
8fee3d02-d5c7-49d8-af36-54ff939e8017	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:04:27.097	\N	\N	f
0a70a4e5-d9a8-494d-81b3-4d7523326178	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:04:27.097	\N	\N	f
9fa675f5-1a92-4b4b-964a-eee46e021f83	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:04:27.097	\N	\N	f
6338e777-7638-4e0c-8be6-882df9638902	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:04:27.097	\N	\N	f
4e10835c-6e58-41d3-8dcd-de4380f7119d	b5947c92-85b6-4b2c-a196-994d9c3b4739	phone_verification_complete	2025-11-25 13:04:30.75	\N	\N	f
ce01349b-bd2b-459d-83b8-206bd33d735e	b5947c92-85b6-4b2c-a196-994d9c3b4739	goal_setting_complete	2025-11-25 13:04:30.75	\N	\N	f
78a84701-3596-4365-a949-494c429356bf	b5947c92-85b6-4b2c-a196-994d9c3b4739	kyc_completed	2025-11-25 13:04:30.75	\N	\N	f
52fdf9b7-65db-4abd-82a1-37a0dd8fc046	b5947c92-85b6-4b2c-a196-994d9c3b4739	uniti_registration_complete	2025-11-25 13:04:30.75	\N	\N	f
027380c7-70c0-472f-95d6-5b3d125996ed	b7637e6b-e023-4347-9cce-d51e7aacaab4	phone_verification_complete	2025-11-25 13:05:06.262	\N	\N	f
18bf3c33-1d04-452e-82c9-03cd0350bf1c	b7637e6b-e023-4347-9cce-d51e7aacaab4	goal_setting_complete	2025-11-25 13:05:06.262	\N	\N	f
e1e4bd33-8fc6-4a0f-a377-fc330a6f9ba9	b7637e6b-e023-4347-9cce-d51e7aacaab4	kyc_completed	2025-11-25 13:05:06.262	\N	\N	f
4fcbdbb6-75f2-4d2e-ac73-ce0f17e0998f	b7637e6b-e023-4347-9cce-d51e7aacaab4	uniti_registration_complete	2025-11-25 13:05:06.262	\N	\N	f
aa6f85f4-230e-45d2-b204-32ee34d3f1ef	b7637e6b-e023-4347-9cce-d51e7aacaab4	phone_verification_complete	2025-11-25 13:05:22.039	\N	\N	f
bc11ab13-5958-452d-860e-15abf338eb4d	b7637e6b-e023-4347-9cce-d51e7aacaab4	goal_setting_complete	2025-11-25 13:05:22.039	\N	\N	f
57a0ab24-5eb5-476b-bc74-c513f653cdc6	b7637e6b-e023-4347-9cce-d51e7aacaab4	kyc_completed	2025-11-25 13:05:22.039	\N	\N	f
913881d0-f279-4828-96f2-804591fdbb00	b7637e6b-e023-4347-9cce-d51e7aacaab4	uniti_registration_complete	2025-11-25 13:05:22.039	\N	\N	f
a509b87e-eb52-438e-96e2-7a40d240df71	b7637e6b-e023-4347-9cce-d51e7aacaab4	phone_verification_complete	2025-11-25 13:05:54.44	\N	\N	f
b85d2109-dfcf-4db0-883a-e8d18d3dee13	b7637e6b-e023-4347-9cce-d51e7aacaab4	goal_setting_complete	2025-11-25 13:05:54.44	\N	\N	f
a8d25d62-65b2-4e12-9313-d3116eb4e03d	b7637e6b-e023-4347-9cce-d51e7aacaab4	kyc_completed	2025-11-25 13:05:54.44	\N	\N	f
3047896c-6443-4322-91b2-6fa9e8eb183f	b7637e6b-e023-4347-9cce-d51e7aacaab4	uniti_registration_complete	2025-11-25 13:05:54.44	\N	\N	f
e0930d61-6a2d-4295-a380-1d912e23d41c	b7637e6b-e023-4347-9cce-d51e7aacaab4	phone_verification_complete	2025-11-25 13:06:50.867	\N	\N	f
56fde216-e73b-4bb7-985c-f959ec4d7559	b7637e6b-e023-4347-9cce-d51e7aacaab4	goal_setting_complete	2025-11-25 13:06:50.867	\N	\N	f
daf1e1e6-7c74-4be0-a092-746a4bd3edab	b7637e6b-e023-4347-9cce-d51e7aacaab4	kyc_completed	2025-11-25 13:06:50.867	\N	\N	f
829d0fe5-0313-4ccb-a599-df3e7e70cd0a	b7637e6b-e023-4347-9cce-d51e7aacaab4	uniti_registration_complete	2025-11-25 13:06:50.867	\N	\N	f
17a88521-aa6e-4995-b62c-d9106322a890	b7637e6b-e023-4347-9cce-d51e7aacaab4	phone_verification_complete	2025-11-25 13:07:10.63	\N	\N	f
7ea44268-41b3-4768-9991-79458571e2b5	b7637e6b-e023-4347-9cce-d51e7aacaab4	goal_setting_complete	2025-11-25 13:07:10.63	\N	\N	f
ff2a0e8d-7992-4068-b487-0798e0ddef00	b7637e6b-e023-4347-9cce-d51e7aacaab4	kyc_completed	2025-11-25 13:07:10.63	\N	\N	f
835a01ab-d723-4faf-90c8-8eb841d11466	b7637e6b-e023-4347-9cce-d51e7aacaab4	uniti_registration_complete	2025-11-25 13:07:10.63	\N	\N	f
5de84a3c-accd-4fec-ac89-c979b29393c9	b7637e6b-e023-4347-9cce-d51e7aacaab4	phone_verification_complete	2025-11-25 13:07:46.934	\N	\N	f
738a74aa-c2b5-4e26-90fa-369cad6d283f	b7637e6b-e023-4347-9cce-d51e7aacaab4	goal_setting_complete	2025-11-25 13:07:46.934	\N	\N	f
a66569c4-b7b4-4360-8e11-07e0f2166920	b7637e6b-e023-4347-9cce-d51e7aacaab4	kyc_completed	2025-11-25 13:07:46.934	\N	\N	f
8706be0b-1c58-4ad5-9633-b116f33161bd	b7637e6b-e023-4347-9cce-d51e7aacaab4	uniti_registration_complete	2025-11-25 13:07:46.934	\N	\N	f
369699b2-d248-4077-814c-9ca444661f5d	ba3b21ba-a89a-4252-90a2-3fcf35633b5d	phone_verification_complete	2025-11-25 13:09:04.283	\N	\N	f
807174f9-bb2b-4cf9-85e8-40fa0ea62b5d	c3ee388c-1170-4fba-a817-a6afa55fd046	phone_verification_complete	2025-11-25 13:09:38.544	\N	\N	f
86ad19a6-5f65-4b47-83ec-36bef7ca11f1	c3ee388c-1170-4fba-a817-a6afa55fd046	goal_setting_complete	2025-11-25 13:09:38.544	\N	\N	f
44b2e75a-b47e-4a47-89fc-5ee90288a79f	c3ee388c-1170-4fba-a817-a6afa55fd046	kyc_completed	2025-11-25 13:09:38.544	\N	\N	f
8b00e022-3ee2-41a5-9559-fa2f081c332b	c3ee388c-1170-4fba-a817-a6afa55fd046	uniti_registration_complete	2025-11-25 13:09:38.544	\N	\N	f
86c9c76b-b874-490e-bd7f-10d06264a962	c3ee388c-1170-4fba-a817-a6afa55fd046	phone_verification_complete	2025-11-25 13:09:42.205	\N	\N	f
be8c43a5-51a5-4737-871d-60cbdec4fde0	c3ee388c-1170-4fba-a817-a6afa55fd046	goal_setting_complete	2025-11-25 13:09:42.205	\N	\N	f
08c9fcd3-a4ae-45b6-a050-ff77bf6a860b	c3ee388c-1170-4fba-a817-a6afa55fd046	kyc_completed	2025-11-25 13:09:42.205	\N	\N	f
9445d21f-d78e-4931-93ca-5f1cb9a8fcb1	c3ee388c-1170-4fba-a817-a6afa55fd046	uniti_registration_complete	2025-11-25 13:09:42.205	\N	\N	f
6bf499a0-1a71-4a6b-a739-298f04e45267	c3ee388c-1170-4fba-a817-a6afa55fd046	phone_verification_complete	2025-11-25 13:09:45.881	\N	\N	f
f69f1260-d07b-4f04-9d14-bff4451589e4	c3ee388c-1170-4fba-a817-a6afa55fd046	goal_setting_complete	2025-11-25 13:09:45.881	\N	\N	f
6a761185-7beb-4d24-97b9-0d017a61c80d	c3ee388c-1170-4fba-a817-a6afa55fd046	kyc_completed	2025-11-25 13:09:45.881	\N	\N	f
df98ba16-4342-4d36-b01b-5c59f94b6a91	c3ee388c-1170-4fba-a817-a6afa55fd046	uniti_registration_complete	2025-11-25 13:09:45.881	\N	\N	f
606bd9cd-f0b1-4342-ad52-0913d7ece0dc	c3ee388c-1170-4fba-a817-a6afa55fd046	phone_verification_complete	2025-11-25 13:09:49.565	\N	\N	f
ccf59e83-4e9f-4a7b-b6a9-0c84ece58689	c3ee388c-1170-4fba-a817-a6afa55fd046	goal_setting_complete	2025-11-25 13:09:49.565	\N	\N	f
28542e36-0ef3-485b-9fdd-09d12020965c	c3ee388c-1170-4fba-a817-a6afa55fd046	kyc_completed	2025-11-25 13:09:49.565	\N	\N	f
a0d657ea-eefe-428b-a191-74f71a04dd4c	c3ee388c-1170-4fba-a817-a6afa55fd046	uniti_registration_complete	2025-11-25 13:09:49.565	\N	\N	f
4ebc7b41-b6a4-4e68-961e-60e2fe15baa0	c3ee388c-1170-4fba-a817-a6afa55fd046	phone_verification_complete	2025-11-25 13:09:53.223	\N	\N	f
4c169d80-ec7f-4cda-b8f9-66d3029dc492	c3ee388c-1170-4fba-a817-a6afa55fd046	goal_setting_complete	2025-11-25 13:09:53.223	\N	\N	f
36b42389-1d38-4684-8cce-0e47d3aa7e3f	c3ee388c-1170-4fba-a817-a6afa55fd046	kyc_completed	2025-11-25 13:09:53.223	\N	\N	f
3b19c897-0c8b-43a7-a424-4e3153593a7b	c3ee388c-1170-4fba-a817-a6afa55fd046	uniti_registration_complete	2025-11-25 13:09:53.223	\N	\N	f
c5cc8e95-845a-409b-8a57-091b6d1be13a	c3ee388c-1170-4fba-a817-a6afa55fd046	phone_verification_complete	2025-11-25 13:09:56.887	\N	\N	f
82f93202-7785-408b-a24a-1d9f9c68c925	c3ee388c-1170-4fba-a817-a6afa55fd046	goal_setting_complete	2025-11-25 13:09:56.887	\N	\N	f
2afc1a7d-d686-4d95-9a84-19356ceb19ad	c3ee388c-1170-4fba-a817-a6afa55fd046	kyc_completed	2025-11-25 13:09:56.887	\N	\N	f
a143b08f-f5bc-4edc-a86e-2bb4e677c14d	c3ee388c-1170-4fba-a817-a6afa55fd046	uniti_registration_complete	2025-11-25 13:09:56.887	\N	\N	f
50e6e8ef-1f18-4309-9f9f-776292e5aa5f	c54a59ea-014a-4dc9-8576-3c655c835d02	phone_verification_complete	2025-11-25 13:10:00.551	\N	\N	f
42a09896-bd0f-4d00-b25b-7c0d921071b5	c54a59ea-014a-4dc9-8576-3c655c835d02	goal_setting_complete	2025-11-25 13:10:00.551	\N	\N	f
fb6da16a-ac64-4589-b176-491fe265823f	c54a59ea-014a-4dc9-8576-3c655c835d02	kyc_completed	2025-11-25 13:10:00.551	\N	\N	f
0b938d3b-52bd-4b74-ba0c-f9d4ba20a840	c54a59ea-014a-4dc9-8576-3c655c835d02	uniti_registration_complete	2025-11-25 13:10:00.551	\N	\N	f
2c0ed2de-9e48-466b-90bd-eaf166126ef1	c54a59ea-014a-4dc9-8576-3c655c835d02	phone_verification_complete	2025-11-25 13:10:04.211	\N	\N	f
1837b4a8-956e-486d-ad8c-0a30e21a0aef	c54a59ea-014a-4dc9-8576-3c655c835d02	goal_setting_complete	2025-11-25 13:10:04.211	\N	\N	f
5045f8b2-2ac3-44b5-9987-7c285fe3f680	c54a59ea-014a-4dc9-8576-3c655c835d02	kyc_completed	2025-11-25 13:10:04.211	\N	\N	f
121d1e2d-f85c-441d-a7f9-13eee52d30e9	c54a59ea-014a-4dc9-8576-3c655c835d02	uniti_registration_complete	2025-11-25 13:10:04.211	\N	\N	f
bc3df653-e7be-455e-b9fb-657231be3400	c54a59ea-014a-4dc9-8576-3c655c835d02	phone_verification_complete	2025-11-25 13:10:07.883	\N	\N	f
313a5ec0-5de8-40e6-87c3-dedf126a04c9	c54a59ea-014a-4dc9-8576-3c655c835d02	goal_setting_complete	2025-11-25 13:10:07.883	\N	\N	f
45e1b989-3f12-4582-b9a5-cee9bd9e2086	c54a59ea-014a-4dc9-8576-3c655c835d02	kyc_completed	2025-11-25 13:10:07.883	\N	\N	f
2e19e784-da40-48df-8697-3b86c2101180	c54a59ea-014a-4dc9-8576-3c655c835d02	uniti_registration_complete	2025-11-25 13:10:07.883	\N	\N	f
e58b1ae2-556c-41b5-9416-fe38307701a7	c54a59ea-014a-4dc9-8576-3c655c835d02	phone_verification_complete	2025-11-25 13:10:11.556	\N	\N	f
a8053fde-a184-43c0-890a-0bb77a8ad4d9	c54a59ea-014a-4dc9-8576-3c655c835d02	goal_setting_complete	2025-11-25 13:10:11.556	\N	\N	f
c855163a-6df7-4298-9433-4e9d59686d85	c54a59ea-014a-4dc9-8576-3c655c835d02	kyc_completed	2025-11-25 13:10:11.556	\N	\N	f
a45c114b-4f7e-44fa-9834-8bfd1b48ef07	c54a59ea-014a-4dc9-8576-3c655c835d02	uniti_registration_complete	2025-11-25 13:10:11.556	\N	\N	f
55faf8c2-a91a-44c2-bc4d-6372eb246577	c54a59ea-014a-4dc9-8576-3c655c835d02	phone_verification_complete	2025-11-25 13:10:15.234	\N	\N	f
60a54485-dc80-4deb-9394-302da5f71d39	c54a59ea-014a-4dc9-8576-3c655c835d02	goal_setting_complete	2025-11-25 13:10:15.234	\N	\N	f
81356aa6-c4d6-43be-b288-522f67bef1d7	c54a59ea-014a-4dc9-8576-3c655c835d02	kyc_completed	2025-11-25 13:10:15.234	\N	\N	f
bd51ebf6-e9ca-4cc1-9245-689d768d5e09	c54a59ea-014a-4dc9-8576-3c655c835d02	uniti_registration_complete	2025-11-25 13:10:15.234	\N	\N	f
26dc12f2-1ae0-42b4-91f0-02c264cfb89e	c54a59ea-014a-4dc9-8576-3c655c835d02	phone_verification_complete	2025-11-25 13:10:18.912	\N	\N	f
cef68425-446c-4452-987d-5488575cfea4	c54a59ea-014a-4dc9-8576-3c655c835d02	goal_setting_complete	2025-11-25 13:10:18.912	\N	\N	f
8271ef9d-3a6b-4fce-9c1a-2d577da414e0	c54a59ea-014a-4dc9-8576-3c655c835d02	kyc_completed	2025-11-25 13:10:18.912	\N	\N	f
ce029efd-513c-4cce-b31b-66d877a05550	c54a59ea-014a-4dc9-8576-3c655c835d02	uniti_registration_complete	2025-11-25 13:10:18.912	\N	\N	f
65653f8b-6e86-421f-9161-05e016966f28	c54a59ea-014a-4dc9-8576-3c655c835d02	phone_verification_complete	2025-11-25 13:10:22.585	\N	\N	f
0087cb00-33a4-440f-9a38-68816cc154ef	c54a59ea-014a-4dc9-8576-3c655c835d02	goal_setting_complete	2025-11-25 13:10:22.585	\N	\N	f
9d7bcdc6-5259-473a-8207-07c5ab8fb725	c54a59ea-014a-4dc9-8576-3c655c835d02	kyc_completed	2025-11-25 13:10:22.585	\N	\N	f
218ced33-d110-41e6-a8ef-458eb431130f	c54a59ea-014a-4dc9-8576-3c655c835d02	uniti_registration_complete	2025-11-25 13:10:22.585	\N	\N	f
7826e02e-b62a-4739-85ac-ce8316c620c1	c54a59ea-014a-4dc9-8576-3c655c835d02	phone_verification_complete	2025-11-25 13:10:26.281	\N	\N	f
de1bf52f-c6ab-495d-a22a-68f9c573a76e	c54a59ea-014a-4dc9-8576-3c655c835d02	goal_setting_complete	2025-11-25 13:10:26.281	\N	\N	f
4a38373b-ec7e-4766-8726-938526f71906	c54a59ea-014a-4dc9-8576-3c655c835d02	kyc_completed	2025-11-25 13:10:26.281	\N	\N	f
a9d3d227-e524-4b0e-98fb-7fcfe88b3448	c54a59ea-014a-4dc9-8576-3c655c835d02	uniti_registration_complete	2025-11-25 13:10:26.281	\N	\N	f
53ac0e12-65cd-476f-9dba-81ecfd27ed64	c99c3f5b-e7ef-4695-ace9-89326973345b	phone_verification_complete	2025-11-25 13:12:44.932	\N	\N	f
2e77976c-df55-4c8a-86bd-aab614846187	c99c3f5b-e7ef-4695-ace9-89326973345b	goal_setting_complete	2025-11-25 13:12:44.932	\N	\N	f
32cb1421-9688-418f-ad4e-14cba7ebdc05	c99c3f5b-e7ef-4695-ace9-89326973345b	kyc_completed	2025-11-25 13:12:44.932	\N	\N	f
12dcaf9d-8549-45a3-867f-6c5e81ebe3e1	c99c3f5b-e7ef-4695-ace9-89326973345b	uniti_registration_complete	2025-11-25 13:12:44.932	\N	\N	f
b179f7e4-6555-4ac5-a4e6-f4e80fa2d47a	c99c3f5b-e7ef-4695-ace9-89326973345b	phone_verification_complete	2025-11-25 13:12:48.602	\N	\N	f
9b48cad5-1357-43da-9c9c-abbfe28e3119	c99c3f5b-e7ef-4695-ace9-89326973345b	goal_setting_complete	2025-11-25 13:12:48.602	\N	\N	f
3d4a8e4d-d7dc-4428-8a22-6103e66c6c9a	c99c3f5b-e7ef-4695-ace9-89326973345b	kyc_completed	2025-11-25 13:12:48.602	\N	\N	f
03131237-73d5-4928-9e20-00a3d100c553	c99c3f5b-e7ef-4695-ace9-89326973345b	uniti_registration_complete	2025-11-25 13:12:48.602	\N	\N	f
24bf11f6-7858-4509-b268-97755581db3f	c99c3f5b-e7ef-4695-ace9-89326973345b	phone_verification_complete	2025-11-25 13:12:52.274	\N	\N	f
4161849f-4fe4-4e62-8bc9-8b85ef8c1ed1	c99c3f5b-e7ef-4695-ace9-89326973345b	goal_setting_complete	2025-11-25 13:12:52.274	\N	\N	f
0c171d7d-293f-42ff-8ed2-0b475f2b5484	c99c3f5b-e7ef-4695-ace9-89326973345b	kyc_completed	2025-11-25 13:12:52.274	\N	\N	f
6b0dd694-5b6c-41ff-aae4-f57e7b40214b	c99c3f5b-e7ef-4695-ace9-89326973345b	uniti_registration_complete	2025-11-25 13:12:52.274	\N	\N	f
35657a3c-90d8-45e8-9c8f-3765f860bb9d	c99c3f5b-e7ef-4695-ace9-89326973345b	phone_verification_complete	2025-11-25 13:12:55.937	\N	\N	f
81854a97-e10c-447e-b0ac-db1def83b3ce	c99c3f5b-e7ef-4695-ace9-89326973345b	goal_setting_complete	2025-11-25 13:12:55.937	\N	\N	f
26314096-f84a-46c5-8aaf-af2f0792d186	c99c3f5b-e7ef-4695-ace9-89326973345b	kyc_completed	2025-11-25 13:12:55.937	\N	\N	f
1ff1033b-85fb-4fb2-b07b-ff384acfec1d	c99c3f5b-e7ef-4695-ace9-89326973345b	uniti_registration_complete	2025-11-25 13:12:55.937	\N	\N	f
b65c2c8e-ee53-4219-a001-5231d1facfb8	c99c3f5b-e7ef-4695-ace9-89326973345b	phone_verification_complete	2025-11-25 13:12:59.607	\N	\N	f
443eef14-be86-4e72-9084-c56e5b7b3414	c99c3f5b-e7ef-4695-ace9-89326973345b	goal_setting_complete	2025-11-25 13:12:59.607	\N	\N	f
6c17aa7d-135c-4bbf-80d7-14e95981ef61	c99c3f5b-e7ef-4695-ace9-89326973345b	kyc_completed	2025-11-25 13:12:59.607	\N	\N	f
9941fa60-c395-4865-85ca-814eaaf5a518	c99c3f5b-e7ef-4695-ace9-89326973345b	uniti_registration_complete	2025-11-25 13:12:59.607	\N	\N	f
b71c48bd-5d95-42da-882c-b2a2b4e7f34f	c99c3f5b-e7ef-4695-ace9-89326973345b	phone_verification_complete	2025-11-25 13:13:03.283	\N	\N	f
d55e49a3-f985-43b5-bdcb-274923bc9dc0	c99c3f5b-e7ef-4695-ace9-89326973345b	goal_setting_complete	2025-11-25 13:13:03.283	\N	\N	f
f0f35fce-9df6-418d-99d1-14e0a4c6c22e	c99c3f5b-e7ef-4695-ace9-89326973345b	kyc_completed	2025-11-25 13:13:03.283	\N	\N	f
945dbee4-a7e2-48f3-858e-05b8f9d9de2a	c99c3f5b-e7ef-4695-ace9-89326973345b	uniti_registration_complete	2025-11-25 13:13:03.283	\N	\N	f
96d9e7e9-fcf1-4e72-a6f7-44ac0a231816	c99c3f5b-e7ef-4695-ace9-89326973345b	phone_verification_complete	2025-11-25 13:13:06.945	\N	\N	f
4e3b8b3f-46a3-427d-a6dd-9e50e5ed7a2a	c99c3f5b-e7ef-4695-ace9-89326973345b	goal_setting_complete	2025-11-25 13:13:06.945	\N	\N	f
345ae1e5-d13a-40af-bbf2-c7b764f3d9ca	c99c3f5b-e7ef-4695-ace9-89326973345b	kyc_completed	2025-11-25 13:13:06.945	\N	\N	f
1591b93c-bc19-4e8f-8332-028eb0d52480	c99c3f5b-e7ef-4695-ace9-89326973345b	uniti_registration_complete	2025-11-25 13:13:06.945	\N	\N	f
fafb7f75-c665-4cf5-96db-a1993a05ac2c	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_verification_complete	2025-11-25 13:13:08.421	\N	\N	f
c66ba8b6-74be-4bfe-8477-a8acf1d0e4f5	d55b1f92-5ba2-45ae-bddc-f8f6605c4d7b	phone_verification_complete	2025-11-25 13:13:29.588	\N	\N	f
dfaae2e8-3aa1-424c-bc41-440b06234721	d55b1f92-5ba2-45ae-bddc-f8f6605c4d7b	phone_verification_complete	2025-11-25 13:13:31.062	\N	\N	f
f98a13a6-cad3-4072-a229-ac64599d4463	d55b1f92-5ba2-45ae-bddc-f8f6605c4d7b	phone_verification_complete	2025-11-25 13:13:32.541	\N	\N	f
ad28a862-7ec4-4b11-8397-94c2d567e17b	d55b1f92-5ba2-45ae-bddc-f8f6605c4d7b	phone_verification_complete	2025-11-25 13:13:34.007	\N	\N	f
c0665279-d610-4043-9ac8-887af0d2f566	fb71b3a9-73f8-4d3f-9649-0d8c11f46295	phone_verification_complete	2025-11-25 13:14:34.781	\N	\N	f
2dbe1c6f-02ad-45c8-bc71-fcea66f40470	fb71b3a9-73f8-4d3f-9649-0d8c11f46295	phone_verification_complete	2025-11-25 13:14:36.285	\N	\N	f
f62af19b-0d42-41ac-8385-5f0b0550b9a8	fb71b3a9-73f8-4d3f-9649-0d8c11f46295	phone_verification_complete	2025-11-25 13:14:37.77	\N	\N	f
1bdaef98-e17b-4ce7-ac52-0817e7955ff5	fb71b3a9-73f8-4d3f-9649-0d8c11f46295	phone_verification_complete	2025-11-25 13:14:39.244	\N	\N	f
fa5e8442-4d66-4955-87ce-7ee50e4423e5	0fbdc046-243e-45f4-88a5-e79014c042cc	phone_verification_complete	2025-11-25 13:15:24	\N	\N	f
3800d1a5-8a96-4d12-9e2a-f3d2c298e7fb	0fbdc046-243e-45f4-88a5-e79014c042cc	goal_setting_complete	2025-11-25 13:15:24	\N	\N	f
91fb2783-187c-4d0c-8d0c-05e1aa2cec92	0fbdc046-243e-45f4-88a5-e79014c042cc	kyc_completed	2025-11-25 13:15:24	\N	\N	f
182a6a33-4cf5-409f-bbf8-825cfccb9618	0fbdc046-243e-45f4-88a5-e79014c042cc	uniti_registration_complete	2025-11-25 13:15:24	\N	\N	f
4ff7744f-1684-4fa7-ad5b-ad854a742cb0	0fbdc046-243e-45f4-88a5-e79014c042cc	phone_verification_complete	2025-11-25 13:15:32.764	\N	\N	f
ced50389-08ee-4718-86a7-ccbe0c5a98f9	0fbdc046-243e-45f4-88a5-e79014c042cc	goal_setting_complete	2025-11-25 13:15:32.764	\N	\N	f
03e3e240-beeb-4e5e-ae49-78542e1fe0f7	0fbdc046-243e-45f4-88a5-e79014c042cc	kyc_completed	2025-11-25 13:15:32.764	\N	\N	f
86664041-0fa3-4a9d-af82-d8ac0bddfeff	0fbdc046-243e-45f4-88a5-e79014c042cc	uniti_registration_complete	2025-11-25 13:15:32.764	\N	\N	f
531f4f90-d5bd-4364-b36e-ccb8ceea3a2b	0fbdc046-243e-45f4-88a5-e79014c042cc	phone_verification_complete	2025-11-25 13:15:36.44	\N	\N	f
bee0479f-7292-45c1-85f7-900fdc623aa4	0fbdc046-243e-45f4-88a5-e79014c042cc	goal_setting_complete	2025-11-25 13:15:36.44	\N	\N	f
7289b06b-5ca6-418a-a5d3-9330574acb6c	0fbdc046-243e-45f4-88a5-e79014c042cc	kyc_completed	2025-11-25 13:15:36.44	\N	\N	f
70095327-7605-4983-9987-73efe0159f3b	0fbdc046-243e-45f4-88a5-e79014c042cc	uniti_registration_complete	2025-11-25 13:15:36.44	\N	\N	f
92de0f28-8897-4d97-92e8-869d9137a6b6	0fbdc046-243e-45f4-88a5-e79014c042cc	phone_verification_complete	2025-11-25 13:15:52.576	\N	\N	f
538018eb-8cf7-4b84-8843-730b210a3708	0fbdc046-243e-45f4-88a5-e79014c042cc	goal_setting_complete	2025-11-25 13:15:52.576	\N	\N	f
af9b280a-893b-4e1b-b10b-3eff79442027	0fbdc046-243e-45f4-88a5-e79014c042cc	kyc_completed	2025-11-25 13:15:52.576	\N	\N	f
6d4780a3-5782-4a25-ba87-2e34f5955635	0fbdc046-243e-45f4-88a5-e79014c042cc	uniti_registration_complete	2025-11-25 13:15:52.576	\N	\N	f
2c911fc7-2751-4db3-8149-a43ee0823048	0fbdc046-243e-45f4-88a5-e79014c042cc	phone_verification_complete	2025-11-25 13:15:59.882	\N	\N	f
b1c59cec-2186-48a2-92ad-3e48b154074c	0fbdc046-243e-45f4-88a5-e79014c042cc	goal_setting_complete	2025-11-25 13:15:59.882	\N	\N	f
93766c7c-a523-4ae7-9fda-782321e419ad	0fbdc046-243e-45f4-88a5-e79014c042cc	kyc_completed	2025-11-25 13:15:59.882	\N	\N	f
bfe59d88-df67-47ad-b49d-fd38a1a78aad	0fbdc046-243e-45f4-88a5-e79014c042cc	uniti_registration_complete	2025-11-25 13:15:59.882	\N	\N	f
56399a01-9a65-43bc-aa3b-b578f3e5585e	0fbdc046-243e-45f4-88a5-e79014c042cc	phone_verification_complete	2025-11-25 13:16:03.551	\N	\N	f
d953a206-2d28-450f-ba92-f54b5f48b87c	0fbdc046-243e-45f4-88a5-e79014c042cc	goal_setting_complete	2025-11-25 13:16:03.551	\N	\N	f
c44eb703-d721-443d-bfa0-beb5d4018c22	0fbdc046-243e-45f4-88a5-e79014c042cc	kyc_completed	2025-11-25 13:16:03.551	\N	\N	f
8f8f5da7-4b48-44ef-8689-bdd32b22b8a5	0fbdc046-243e-45f4-88a5-e79014c042cc	uniti_registration_complete	2025-11-25 13:16:03.551	\N	\N	f
2ee7a870-aa22-4e6d-8c35-e67465c14606	0fbdc046-243e-45f4-88a5-e79014c042cc	phone_verification_complete	2025-11-25 13:16:07.219	\N	\N	f
252c6c9d-4ed5-485d-85af-2cad764a4ebd	0fbdc046-243e-45f4-88a5-e79014c042cc	goal_setting_complete	2025-11-25 13:16:07.219	\N	\N	f
2b0fd2f0-ac41-4608-9753-0bd6635bd33a	0fbdc046-243e-45f4-88a5-e79014c042cc	kyc_completed	2025-11-25 13:16:07.219	\N	\N	f
3ae5f80a-291c-4cb0-9c0c-0e1b9ba197b8	0fbdc046-243e-45f4-88a5-e79014c042cc	uniti_registration_complete	2025-11-25 13:16:07.219	\N	\N	f
8c25c4a9-72b7-4ada-a2e6-312a6de4bdf4	0fbdc046-243e-45f4-88a5-e79014c042cc	phone_verification_complete	2025-11-25 13:16:10.898	\N	\N	f
3c76efa2-7837-4313-9a6f-7ac080d32844	0fbdc046-243e-45f4-88a5-e79014c042cc	goal_setting_complete	2025-11-25 13:16:10.898	\N	\N	f
1d034f2a-5748-46db-9098-7d12dedec433	0fbdc046-243e-45f4-88a5-e79014c042cc	kyc_completed	2025-11-25 13:16:10.898	\N	\N	f
afa27068-a864-4fef-b224-529026d9f1e3	0fbdc046-243e-45f4-88a5-e79014c042cc	uniti_registration_complete	2025-11-25 13:16:10.898	\N	\N	f
5bfd629c-63b9-4632-9ccc-4149e4944d89	0fbdc046-243e-45f4-88a5-e79014c042cc	phone_verification_complete	2025-11-25 13:16:14.563	\N	\N	f
0ac93ab5-8354-41d2-b616-c49b0600420d	0fbdc046-243e-45f4-88a5-e79014c042cc	goal_setting_complete	2025-11-25 13:16:14.563	\N	\N	f
caabf5fa-4a49-4bdc-8f1e-7a52827b8701	0fbdc046-243e-45f4-88a5-e79014c042cc	kyc_completed	2025-11-25 13:16:14.563	\N	\N	f
ba3ec575-fc73-4400-b0a9-e470a1a2002c	0fbdc046-243e-45f4-88a5-e79014c042cc	uniti_registration_complete	2025-11-25 13:16:14.563	\N	\N	f
72b6e4ec-0b69-4800-827e-564cb5d055c6	1f6370da-d18b-4cb6-8850-0a977b23b94e	phone_verification_complete	2025-11-25 13:16:52.764	\N	\N	f
675c8e7c-dd4e-45ed-bba1-214ba31c8abe	1f6370da-d18b-4cb6-8850-0a977b23b94e	phone_verification_complete	2025-11-25 13:16:54.248	\N	\N	f
55d9673b-30c2-4f2b-8772-ae9741bc905a	2bf56a47-a901-41d8-8f4d-d5a8b9609328	phone_verification_complete	2025-11-25 13:17:33.667	\N	\N	f
992adecd-456c-4330-8ab3-2a083831f5f9	2bf56a47-a901-41d8-8f4d-d5a8b9609328	goal_setting_complete	2025-11-25 13:17:33.667	\N	\N	f
60c81f65-d968-4783-8c1b-22975825736d	2bf56a47-a901-41d8-8f4d-d5a8b9609328	kyc_completed	2025-11-25 13:17:33.667	\N	\N	f
d74bd2ab-8f6d-4cf4-8198-cbfe059510fb	2bf56a47-a901-41d8-8f4d-d5a8b9609328	uniti_registration_complete	2025-11-25 13:17:33.667	\N	\N	f
2bf1a5c5-3e32-43f9-99eb-5e756264e4a5	2bf56a47-a901-41d8-8f4d-d5a8b9609328	phone_verification_complete	2025-11-25 13:17:44.08	\N	\N	f
c258426d-f2fe-4ff4-8cc8-415ce2a1fd69	2bf56a47-a901-41d8-8f4d-d5a8b9609328	goal_setting_complete	2025-11-25 13:17:44.08	\N	\N	f
fa66df02-ddc1-418b-a06f-d3f9d8329b61	2bf56a47-a901-41d8-8f4d-d5a8b9609328	kyc_completed	2025-11-25 13:17:44.08	\N	\N	f
50f52805-337f-4900-86cb-e247b1446934	2bf56a47-a901-41d8-8f4d-d5a8b9609328	uniti_registration_complete	2025-11-25 13:17:44.08	\N	\N	f
8b420682-132a-4586-ba27-e48ed5177f07	2bf56a47-a901-41d8-8f4d-d5a8b9609328	phone_verification_complete	2025-11-25 13:17:47.743	\N	\N	f
e1d4c014-5f30-4145-b457-919f8eff83fe	2bf56a47-a901-41d8-8f4d-d5a8b9609328	goal_setting_complete	2025-11-25 13:17:47.743	\N	\N	f
c236cdf8-fcf8-4b72-9e46-ef028c33f695	2bf56a47-a901-41d8-8f4d-d5a8b9609328	kyc_completed	2025-11-25 13:17:47.743	\N	\N	f
bc06ee2f-24fa-4921-b7e4-713df6fae02a	2bf56a47-a901-41d8-8f4d-d5a8b9609328	uniti_registration_complete	2025-11-25 13:17:47.743	\N	\N	f
40018af5-fc1e-4f0c-acc3-9e0a287a7b28	2bf56a47-a901-41d8-8f4d-d5a8b9609328	phone_verification_complete	2025-11-25 13:17:51.404	\N	\N	f
a0269092-8bbc-4b91-908e-a5d57ac7e49c	2bf56a47-a901-41d8-8f4d-d5a8b9609328	goal_setting_complete	2025-11-25 13:17:51.404	\N	\N	f
2b221b40-36aa-4ce3-b2f7-751a091f05ad	2bf56a47-a901-41d8-8f4d-d5a8b9609328	kyc_completed	2025-11-25 13:17:51.404	\N	\N	f
43d6913b-d679-4674-ab8c-041e944e1ae7	2bf56a47-a901-41d8-8f4d-d5a8b9609328	uniti_registration_complete	2025-11-25 13:17:51.404	\N	\N	f
bbb2576e-23aa-419e-96ea-624aa6ca4cb0	2bf56a47-a901-41d8-8f4d-d5a8b9609328	phone_verification_complete	2025-11-25 13:17:55.075	\N	\N	f
75f1150e-6d7a-484b-b45c-18bf5c2d1590	2bf56a47-a901-41d8-8f4d-d5a8b9609328	goal_setting_complete	2025-11-25 13:17:55.075	\N	\N	f
ef4b9267-cd91-4b59-ad86-be9da5724323	2bf56a47-a901-41d8-8f4d-d5a8b9609328	kyc_completed	2025-11-25 13:17:55.075	\N	\N	f
3370539b-7fae-4746-a2c3-4d71f21be971	2bf56a47-a901-41d8-8f4d-d5a8b9609328	uniti_registration_complete	2025-11-25 13:17:55.075	\N	\N	f
38300f5b-5f9b-4c53-87d8-668b115e0e77	2bf56a47-a901-41d8-8f4d-d5a8b9609328	phone_verification_complete	2025-11-25 13:17:58.739	\N	\N	f
55fd062e-fcec-4f60-8845-5cabbf8bf63d	2bf56a47-a901-41d8-8f4d-d5a8b9609328	goal_setting_complete	2025-11-25 13:17:58.739	\N	\N	f
537edab2-c2ec-426b-bb92-497b6a8c2766	2bf56a47-a901-41d8-8f4d-d5a8b9609328	kyc_completed	2025-11-25 13:17:58.739	\N	\N	f
409effeb-4287-4ac1-9101-24d066bc6054	2bf56a47-a901-41d8-8f4d-d5a8b9609328	uniti_registration_complete	2025-11-25 13:17:58.739	\N	\N	f
b91b0a79-b7d7-4c21-b534-6d876638665e	2bf56a47-a901-41d8-8f4d-d5a8b9609328	phone_verification_complete	2025-11-25 13:18:02.392	\N	\N	f
1b928aad-3a4e-41e3-9f44-7c4f58643767	2bf56a47-a901-41d8-8f4d-d5a8b9609328	goal_setting_complete	2025-11-25 13:18:02.392	\N	\N	f
cda7a3bb-fe5b-4609-bb54-e7b7ac278eb2	2bf56a47-a901-41d8-8f4d-d5a8b9609328	kyc_completed	2025-11-25 13:18:02.392	\N	\N	f
3e0601e0-dfb6-49e9-9f8f-18d9f7440d62	2bf56a47-a901-41d8-8f4d-d5a8b9609328	uniti_registration_complete	2025-11-25 13:18:02.392	\N	\N	f
e1a994f5-2ce4-4794-9ed7-29691b3ec589	2bf56a47-a901-41d8-8f4d-d5a8b9609328	phone_verification_complete	2025-11-25 13:18:06.079	\N	\N	f
969c7e45-ab0b-4f27-ae72-dc41db1e8c33	2bf56a47-a901-41d8-8f4d-d5a8b9609328	goal_setting_complete	2025-11-25 13:18:06.079	\N	\N	f
65c6d62c-4dd8-4bda-b0d2-49d3fb4bb45a	2bf56a47-a901-41d8-8f4d-d5a8b9609328	kyc_completed	2025-11-25 13:18:06.079	\N	\N	f
f0af6209-ee7f-4cfd-ac54-f6302fb5574a	2bf56a47-a901-41d8-8f4d-d5a8b9609328	uniti_registration_complete	2025-11-25 13:18:06.079	\N	\N	f
6fdb1d64-bd2b-4a68-84b7-f186a1c5e457	2bf56a47-a901-41d8-8f4d-d5a8b9609328	phone_verification_complete	2025-11-25 13:18:09.739	\N	\N	f
a1c29031-a87f-423b-bc33-6e08dc92b6e0	2bf56a47-a901-41d8-8f4d-d5a8b9609328	goal_setting_complete	2025-11-25 13:18:09.739	\N	\N	f
180127d3-3d8f-4c82-97d2-9d11590eb7e8	2bf56a47-a901-41d8-8f4d-d5a8b9609328	kyc_completed	2025-11-25 13:18:09.739	\N	\N	f
e8fdb3bb-3cc5-4bed-ad02-1a2bf96e0c20	2bf56a47-a901-41d8-8f4d-d5a8b9609328	uniti_registration_complete	2025-11-25 13:18:09.739	\N	\N	f
44a39d1e-f041-42f3-9352-a03126fbe169	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 10:59:25.002	\N	\N	f
c247964d-6334-497a-9eb1-72693136e0dc	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:21:49.899	\N	\N	f
1fb7c812-6504-4dc5-8390-d2274d060993	58ea9c2c-9376-452e-8422-0b4238473195	phone_verification_complete	2025-11-26 11:21:51.371	\N	\N	f
eaaef399-9fe9-4da3-8f13-8168a1eaa7d8	cfa00b58-0379-459e-99d9-57658bbf9572	phone_verification_complete	2025-11-26 12:37:41.481	\N	\N	f
\.


--
-- Data for Name: rewards_issued; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.rewards_issued (id, user_id, reward_id, amount, unit, created_at) FROM stdin;
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.services (id, "createdAt", "updatedAt", title, description, "goalSubCategoryId") FROM stdin;
\.


--
-- Data for Name: signal_logs; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.signal_logs (id, user_id, signal_id, created_at, app_id, service_category) FROM stdin;
73cdbc2e-c999-4932-a3f8-29104e7bde62	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_number_confirmation	2025-11-26 06:08:10.055	\N	\N
5057cf30-0bf1-42a1-bc79-4bb23994fd4a	ce280152-acaa-46cb-8164-16e9bcd455d6	goal_setting_started	2025-11-26 06:08:10.055	\N	\N
5840edea-1888-4260-93cb-7616469e6ef7	58ea9c2c-9376-452e-8422-0b4238473195	phone_number_confirmation	2025-11-26 11:00:11.036	\N	\N
a52aac94-8e6e-4d9d-a06b-0be04aa1f6ba	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:00:11.036	\N	\N
6741555a-2029-443d-959d-a3a152d338dc	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 11:04:48.035	com.mtngh.mymtn	mobile_money
be6655c1-4c7b-478f-a962-c7f9dcc66f86	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 11:04:48.035	com.mtngh.mymtn	mobile_money
b28d4164-545e-49ba-b680-e5972ef9d8be	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 11:04:52.732	promzy.com.teachingsyllabus	basic_education
736b7974-622a-46af-9c92-e9fff135a47a	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_number_confirmation	2025-11-26 11:27:47.375	\N	\N
d5e4bc91-225d-44de-ac15-a1ed2a0bcf1e	cf89e290-f3c0-4a46-a443-b21e3c27b925	goal_setting_started	2025-11-26 11:27:47.375	\N	\N
cc1e051e-d043-4e36-96ef-e1b6bb44987b	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_number_confirmation	2025-11-26 11:27:53.132	\N	\N
8cf5f3c9-46db-4e7a-9910-6b72f1b3263d	cf89e290-f3c0-4a46-a443-b21e3c27b925	goal_setting_started	2025-11-26 11:27:53.132	\N	\N
8bc6d648-4f16-45df-8402-c5e2342f7514	cfa00b58-0379-459e-99d9-57658bbf9572	phone_number_confirmation	2025-11-26 12:37:26.917	\N	\N
378d0d5b-6e82-4ea9-92a7-a92007600c1a	cfa00b58-0379-459e-99d9-57658bbf9572	goal_setting_started	2025-11-26 12:37:26.917	\N	\N
3d8df92c-8c9c-48ab-94c2-a8e2ff23c107	8881c33f-c6a5-4978-81cf-d861e5aec5f6	customer_app_download_complete	2025-11-26 15:37:15.33	\N	\N
2604e5c9-585a-4dc6-9c2d-f0bea94a9655	8881c33f-c6a5-4978-81cf-d861e5aec5f6	customer_app_opened_first_time	2025-11-26 15:37:15.33	\N	\N
8923d0ec-efb8-4d44-8777-716499c60f63	8881c33f-c6a5-4978-81cf-d861e5aec5f6	customer_app_opened	2025-11-26 15:37:15.33	\N	\N
4b71023b-e6a2-4e2c-b729-a4fe42c36530	8881c33f-c6a5-4978-81cf-d861e5aec5f6	customer_app_registration_completed	2025-11-26 15:37:15.33	\N	\N
4fb02f47-be86-4bb0-a9e3-6c34e4a7c55a	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_number_confirmation	2025-11-26 06:10:17.05	\N	\N
005c5b03-5b2f-48c6-ae0d-2ac81702c49d	ce280152-acaa-46cb-8164-16e9bcd455d6	goal_setting_started	2025-11-26 06:10:17.05	\N	\N
050537b0-424f-4c78-bf9d-e574085099a3	58ea9c2c-9376-452e-8422-0b4238473195	phone_number_confirmation	2025-11-26 11:00:55.976	\N	\N
d03d9ccb-f618-4cd1-8d8b-87e68381d1bb	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:00:55.976	\N	\N
7ebe40d3-a48e-448e-b77a-7c46e531ee7d	58ea9c2c-9376-452e-8422-0b4238473195	phone_number_confirmation	2025-11-26 11:01:01.752	\N	\N
d0a69a5e-8d06-41f4-909c-1ffffc5abe41	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:01:01.752	\N	\N
2454c318-9124-4f03-b747-fb3116b93ca8	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 11:19:48.56	com.mtngh.mymtn	mobile_money
e4950eeb-acd8-4895-b82c-c65caf54377c	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 11:19:48.56	com.mtngh.mymtn	mobile_money
2d9cecfb-c179-4293-9e21-68e45793bce4	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 11:19:53.528	promzy.com.teachingsyllabus	basic_education
c4024997-7dd8-4bba-b3b3-40fd5697c266	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_number_confirmation	2025-11-26 11:28:25.281	\N	\N
275d406e-6edd-43a8-be55-80e016b53841	cf89e290-f3c0-4a46-a443-b21e3c27b925	goal_setting_started	2025-11-26 11:28:25.281	\N	\N
307266d6-bbc7-4d4a-89d2-c04095cc0a75	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_number_confirmation	2025-11-26 11:28:33.121	\N	\N
7d75ee02-d6a7-44c1-ab58-8be2d2a1afae	cf89e290-f3c0-4a46-a443-b21e3c27b925	goal_setting_started	2025-11-26 11:28:33.121	\N	\N
cf00e083-fbe5-49ef-908e-1ccf779a355f	cfa00b58-0379-459e-99d9-57658bbf9572	phone_number_confirmation	2025-11-26 12:37:39.7	\N	\N
0aa49438-ae6d-4244-915b-6f6053c18078	cfa00b58-0379-459e-99d9-57658bbf9572	goal_setting_started	2025-11-26 12:37:39.7	\N	\N
dd3c96f3-c53f-4011-ac14-9385db1be932	2f5049e6-c92a-444e-8d45-50ac3b370ecf	customer_app_download_complete	2025-11-25 16:40:44.701	inc.loop.ppt	retirement_savings
90002267-7d61-4e33-9b51-f19f9f9a72d7	2f5049e6-c92a-444e-8d45-50ac3b370ecf	customer_app_opened_first_time	2025-11-25 16:40:44.701	inc.loop.ppt	retirement_savings
db70c0be-9d57-476d-a51e-1a24e17d7bc0	2f5049e6-c92a-444e-8d45-50ac3b370ecf	customer_app_opened	2025-11-25 16:40:44.701	inc.loop.ppt	retirement_savings
38fe8d8a-e67d-444a-b824-48db84390fd9	2f5049e6-c92a-444e-8d45-50ac3b370ecf	customer_app_registration_completed	2025-11-25 16:40:44.701	inc.loop.ppt	retirement_savings
9a163746-cad1-43c2-8b54-7842894d45f7	2f5049e6-c92a-444e-8d45-50ac3b370ecf	customer_app_login_completed	2025-11-25 16:40:44.701	inc.loop.ppt	retirement_savings
9305c143-9d0a-4090-89f0-ce3dbecd17a3	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_number_confirmation	2025-11-26 06:11:50.428	\N	\N
3791becd-119c-4cf3-9127-58ddb157c041	ce280152-acaa-46cb-8164-16e9bcd455d6	goal_setting_started	2025-11-26 06:11:50.428	\N	\N
f75f8875-3e25-4b08-b953-8147781a2099	58ea9c2c-9376-452e-8422-0b4238473195	phone_number_confirmation	2025-11-26 11:02:10.014	\N	\N
7bce71ff-a070-4ff6-a28c-9205ffd5bdf1	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:02:10.014	\N	\N
65c4cc80-db93-4516-a55c-273875d0023d	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:21:48.059	\N	\N
2f1692e4-15b1-4a93-b8fa-aac1f4a7b6a1	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:21:50.723	\N	\N
0dcd3eb0-3645-4beb-bfa0-41ac86690b95	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_download_complete	2025-11-26 11:29:04.136	com.mtngh.mymtn	mobile_money
8b336cb4-9e73-4b2b-893d-1dc5d0b79009	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened_first_time	2025-11-26 11:29:04.136	com.mtngh.mymtn	mobile_money
9923bc88-91ac-4b24-abec-cd7bf12d69a6	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:29:04.136	com.mtngh.mymtn	mobile_money
a077c046-81af-468b-b4d9-412874794400	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_registration_completed	2025-11-26 11:29:04.136	com.mtngh.mymtn	mobile_money
5dabe64a-a670-4d68-a50a-361dbe763de3	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_login_completed	2025-11-26 11:29:04.136	com.mtngh.mymtn	mobile_money
2093480a-5346-41b3-9059-22e3b6cde5de	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_download_complete	2025-11-26 11:29:06.581	promzy.com.teachingsyllabus	basic_education
aab4b6b1-cfc4-4ea4-ab1b-5b471cd841cc	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened_first_time	2025-11-26 11:29:06.581	promzy.com.teachingsyllabus	basic_education
8bb3eb97-ec03-4c0b-abf1-4ec5632f2948	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:29:06.581	promzy.com.teachingsyllabus	basic_education
cee3abed-977a-4288-8f60-593fe1dcafe2	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_registration_completed	2025-11-26 11:29:06.581	promzy.com.teachingsyllabus	basic_education
71eb8b2a-fbaf-4d58-a291-dfec02ff0657	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_download_complete	2025-11-26 12:42:11.922	co.farmerline.sales	market_access
d1408014-9959-4e8b-bda9-4247b0d238c6	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened_first_time	2025-11-26 12:42:11.922	co.farmerline.sales	market_access
c28882ae-efaf-47f8-a4c3-3a02bb794aea	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:42:11.922	co.farmerline.sales	market_access
93c5b1b6-f341-4376-9553-52ecfcea6631	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_registration_completed	2025-11-26 12:42:11.922	co.farmerline.sales	market_access
c8dfc8a5-298e-4cb8-b484-d2cbd6d73644	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:42:16.221	co.farmerline.sales	market_access
f12c9303-b3ad-47bf-8574-cae2dabaf1d0	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:42:20.339	co.farmerline.sales	market_access
f7a13854-2e2e-43e3-a343-2137d2d9bfc9	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:42:23.445	co.farmerline.sales	market_access
38148a17-e560-4e2e-a609-b7d2e9f5138a	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:42:26.201	com.rxhealth.healthker	medicine_access
8217ed68-f33d-43c8-b72b-4c0f6a9c3330	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 12:42:26.201	com.rxhealth.healthker	medicine_access
02e7af1b-64c6-431b-a57c-d19c936322fb	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:42:29.181	co.farmerline.sales	market_access
90d8cf8c-092b-49f9-969a-208d1fe9b82b	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:42:32.685	com.mtngh.mymtn	mobile_money
36a27835-60c4-4cd5-a8bf-14f5b8cd303a	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 12:42:32.685	com.mtngh.mymtn	mobile_money
89e64bcb-b3a7-41b9-9be1-6bfc371f8abc	2f5049e6-c92a-444e-8d45-50ac3b370ecf	customer_app_opened	2025-11-25 16:56:30.399	inc.loop.ppt	retirement_savings
d0664c61-0293-4aa7-ab77-4298838cbb6a	2f5049e6-c92a-444e-8d45-50ac3b370ecf	customer_app_login_completed	2025-11-25 16:56:30.399	inc.loop.ppt	retirement_savings
c6a399cd-401f-4252-ab30-89a2723fdaee	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_number_confirmation	2025-11-26 06:12:07.407	\N	\N
b35aa2e7-0d05-4c55-8984-480c9642b54e	ce280152-acaa-46cb-8164-16e9bcd455d6	goal_setting_started	2025-11-26 06:12:07.407	\N	\N
55d8c73a-4868-4d2d-b255-5c0b1c0987c1	58ea9c2c-9376-452e-8422-0b4238473195	phone_number_confirmation	2025-11-26 11:02:30.895	\N	\N
081451da-73de-4d47-823f-71783a45726b	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:02:30.895	\N	\N
a73b9e2e-334e-4695-a8e8-04a4c3e807ce	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_number_confirmation	2025-11-26 11:22:08.198	\N	\N
4e59bf19-9f5d-4e15-80c2-e7f452c58a01	cf89e290-f3c0-4a46-a443-b21e3c27b925	goal_setting_started	2025-11-26 11:22:08.198	\N	\N
10ef17a0-64bc-40f6-a13d-873c17e99e68	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_download_complete	2025-11-26 11:44:26.145	com.rxhealth.healthker	medicine_access
1f741da5-9977-4bec-9adb-e4ee8dbd8ae5	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened_first_time	2025-11-26 11:44:26.145	com.rxhealth.healthker	medicine_access
bfb4c534-0a42-42bf-b7c9-208f48ae7289	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:26.145	com.rxhealth.healthker	medicine_access
6ff96aef-2073-4664-9b19-50e48d6240ba	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_registration_completed	2025-11-26 11:44:26.145	com.rxhealth.healthker	medicine_access
09499aa4-00d9-4a8f-9ccb-8100702b9566	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:30.218	com.rxhealth.healthker	medicine_access
6686033e-3897-47ae-9aad-2019a710b81a	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_login_completed	2025-11-26 11:44:30.218	com.rxhealth.healthker	medicine_access
18ce0688-a5b9-40d2-b6b5-f69ce63997b5	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:32.819	com.rxhealth.healthker	medicine_access
cd5f4283-6dc6-434a-b675-9891dfdc62b4	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:35.225	com.rxhealth.healthker	medicine_access
052a01a4-750c-42aa-bd54-6f9fcc0289a9	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:37.723	com.rxhealth.healthker	medicine_access
73486587-7719-4af9-91c3-56d630415c95	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:40.201	com.rxhealth.healthker	medicine_access
998423d8-67ed-4361-9885-0746ee08c390	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:42.362	com.rxhealth.healthker	medicine_access
07b5c72e-9bf5-4d92-b1a5-ea2c2fea6dac	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:44.742	com.rxhealth.healthker	medicine_access
a4f569ae-89ce-45b1-8400-5f6ea98397ed	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:46.541	com.rxhealth.healthker	medicine_access
1e5adbd5-10db-4f3c-955f-5aee55115113	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:57:26.529	com.mtngh.mymtn	mobile_money
35e9cdda-5f6c-40c8-9216-e1089595e84a	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 12:57:26.529	com.mtngh.mymtn	mobile_money
de8d07ac-200b-416e-95fc-910b21c61dd6	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:57:33.066	com.rxhealth.healthker	medicine_access
05df1200-8bd2-4932-878e-3571931435f9	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 12:57:33.066	com.rxhealth.healthker	medicine_access
0dfc97f4-1091-403a-b02d-b3fbfed2a572	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:57:37.387	co.farmerline.sales	market_access
d7f2fd04-fa04-47f0-ae53-859fc0eff39d	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_number_confirmation	2025-11-26 06:04:08.197	\N	\N
777e0409-b9ce-4db4-baa0-09e98b42b2ee	ce280152-acaa-46cb-8164-16e9bcd455d6	goal_setting_started	2025-11-26 06:04:08.197	\N	\N
c2739758-9ca3-441a-a62a-24f96d3a1075	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_download_complete	2025-11-26 10:40:04.7	promzy.com.teachingsyllabus	basic_education
2ed67baa-b24a-45ea-b98a-85a9940efd2e	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened_first_time	2025-11-26 10:40:04.7	promzy.com.teachingsyllabus	basic_education
b11d2fc8-4ce2-4a9a-8df6-253244e67742	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:04.7	promzy.com.teachingsyllabus	basic_education
db6e4508-a5b8-470d-952c-022f8ac1a070	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_registration_completed	2025-11-26 10:40:04.7	promzy.com.teachingsyllabus	basic_education
ddba6c89-6db5-4f91-932f-02a77a18cef7	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:09.759	promzy.com.teachingsyllabus	basic_education
6687944e-d89d-49cf-82e6-23d565b9f3bb	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:14.02	promzy.com.teachingsyllabus	basic_education
ebbdac40-b6bd-4e02-9c68-35930bf8e4e8	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:17.32	promzy.com.teachingsyllabus	basic_education
ffdcf2c4-a5fd-4779-9fe8-bcf5c851a513	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:20.305	promzy.com.teachingsyllabus	basic_education
d5e55fb9-7892-4b11-b103-b962dc014633	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_download_complete	2025-11-26 10:40:23.36	org.iggymedia.periodtracker	womens_health
64131d58-0b46-45df-a697-805a70bdaaee	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened_first_time	2025-11-26 10:40:23.36	org.iggymedia.periodtracker	womens_health
5cda8573-8825-4cb1-9952-524085b11236	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:23.36	org.iggymedia.periodtracker	womens_health
8b4a7f2d-f922-4d18-a792-1a182997c97d	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_registration_completed	2025-11-26 10:40:23.36	org.iggymedia.periodtracker	womens_health
ca097676-07e0-4254-b869-91bf9f23252d	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:26.04	promzy.com.teachingsyllabus	basic_education
751cf7f9-6d36-4541-90fa-ec013a2de641	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:29.261	promzy.com.teachingsyllabus	basic_education
44f4fce5-3244-4c51-9147-c37049d21d67	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:31.558	promzy.com.teachingsyllabus	basic_education
504cf49a-9be0-4e46-a9e5-3f063bc7d350	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:33.88	org.iggymedia.periodtracker	womens_health
bb4c29f4-f557-402a-9acb-070af9228b89	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:36.221	promzy.com.teachingsyllabus	basic_education
72e4766d-0c5b-47da-b39f-ffc4b246e5a2	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:40:38.58	promzy.com.teachingsyllabus	basic_education
68b5d58b-9bca-4e4e-9438-a21c53ce9573	58ea9c2c-9376-452e-8422-0b4238473195	phone_number_confirmation	2025-11-26 11:03:17.914	\N	\N
187db451-04ef-44ab-8fd7-efea4ee52a68	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:03:17.914	\N	\N
b13f2fc0-9296-4e2d-9d87-01d9edddffca	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_number_confirmation	2025-11-26 11:22:39.238	\N	\N
26b768b4-ee55-470c-a38f-6c9444b3027c	cf89e290-f3c0-4a46-a443-b21e3c27b925	goal_setting_started	2025-11-26 11:22:39.238	\N	\N
81b19ec4-a6d5-45bc-8270-9050a732921a	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:48.466	com.rxhealth.healthker	medicine_access
74b8b1dc-2811-4982-96ab-fdeaa8655115	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:50.282	com.rxhealth.healthker	medicine_access
590ecea1-0156-43c8-b0c9-21c6558b65c9	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:52.207	com.rxhealth.healthker	medicine_access
0eb007ba-daf5-4e7d-b5eb-02146009ec22	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:54.078	com.mtngh.mymtn	mobile_money
436b53fd-cbcb-47c4-8467-9c70f7b64831	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_login_completed	2025-11-26 11:44:54.078	com.mtngh.mymtn	mobile_money
74b9a7f5-e173-48c7-9033-169b875e4b42	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:55.879	promzy.com.teachingsyllabus	basic_education
22838b11-96ea-47ea-a98e-06f9b213a398	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:57.841	com.rxhealth.healthker	medicine_access
e26c2b23-ed3e-4e3d-9752-09afee9b818e	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:44:59.641	com.rxhealth.healthker	medicine_access
3290a370-69e7-4380-b813-774b2514ea6b	cf89e290-f3c0-4a46-a443-b21e3c27b925	customer_app_opened	2025-11-26 11:45:01.461	com.rxhealth.healthker	medicine_access
c0628dbc-e73b-4f6f-ad9b-b10c566ffe3b	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 13:12:25.592	co.farmerline.sales	market_access
e9d252f2-7430-48ed-9b4a-22baf0c16e00	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 13:12:32.088	com.rxhealth.healthker	medicine_access
6d58343f-f097-4c14-be98-d4ec4bb455b1	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 13:12:32.088	com.rxhealth.healthker	medicine_access
9a1d3d93-f036-4dea-9b18-a567d8267c3a	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 13:12:35.556	com.mtngh.mymtn	mobile_money
a7b335f5-75a0-4d03-873f-6fa69df7b386	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 13:12:35.556	com.mtngh.mymtn	mobile_money
1a2fee72-8cdd-4a7b-afb4-0ff72603f7b6	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_number_confirmation	2025-11-26 06:05:12.64	\N	\N
78e3e6cb-0226-459a-8c07-fd8a5c2d35d7	ce280152-acaa-46cb-8164-16e9bcd455d6	goal_setting_started	2025-11-26 06:05:12.64	\N	\N
fad6166d-b3f9-4d6c-8a0c-e91403e0a36c	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:49:49.665	promzy.com.teachingsyllabus	basic_education
7a31cf8f-bcf4-47b9-aef5-e42adf8c444b	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_download_complete	2025-11-26 10:49:54.439	com.mtngh.mymtn	mobile_money
086eb1d8-25cc-4bae-8f28-c8fd317c6b20	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened_first_time	2025-11-26 10:49:54.439	com.mtngh.mymtn	mobile_money
abb93c31-4f22-4978-85c1-32af57225928	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 10:49:54.439	com.mtngh.mymtn	mobile_money
af08f6e6-a72d-46e4-8dcb-8227ed248c65	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_registration_completed	2025-11-26 10:49:54.439	com.mtngh.mymtn	mobile_money
8bdaa49c-47b9-4086-9427-e76cf4a8eb6d	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 10:49:54.439	com.mtngh.mymtn	mobile_money
ec20be66-a952-407b-952b-69e52e9c44ac	58ea9c2c-9376-452e-8422-0b4238473195	phone_number_confirmation	2025-11-26 11:03:52.915	\N	\N
f6500450-c069-42a8-8b65-f6d0cbf20368	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:03:52.915	\N	\N
1540299f-dc80-4013-a3c3-fef4810e7fe3	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_number_confirmation	2025-11-26 11:23:16.568	\N	\N
662e9218-8da3-42f3-b49c-5cd4d09b62ab	cf89e290-f3c0-4a46-a443-b21e3c27b925	goal_setting_started	2025-11-26 11:23:16.568	\N	\N
410841ec-6687-4451-93d2-e61899b54c35	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:20.322	com.mtngh.mymtn	mobile_money
01a3b413-7ad7-498b-bc70-28d8085251da	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 12:28:20.322	com.mtngh.mymtn	mobile_money
882641e5-32b6-4e85-911d-585f99327879	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:26.44	promzy.com.teachingsyllabus	basic_education
efbea852-d7ef-44fe-856e-a3609e71c09b	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_download_complete	2025-11-26 12:28:30.064	com.rxhealth.healthker	medicine_access
db3b1264-914a-4580-b230-114a2b7dcf02	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened_first_time	2025-11-26 12:28:30.064	com.rxhealth.healthker	medicine_access
a2e378bd-dde4-476e-93e0-e1f7754a94f6	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:30.064	com.rxhealth.healthker	medicine_access
0ecfcdeb-da1d-4589-8258-f645bcdc35d6	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_registration_completed	2025-11-26 12:28:30.064	com.rxhealth.healthker	medicine_access
0890609d-8524-460c-975e-0f63ed203c44	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 12:28:30.064	com.rxhealth.healthker	medicine_access
6a51d3c5-e750-46af-ab20-737c0723c57b	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:32.981	com.rxhealth.healthker	medicine_access
50ee1e1f-897b-441b-bb18-f8f59811d277	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:35.982	org.iggymedia.periodtracker	womens_health
d406b386-8fdc-4966-961d-2a406cceb944	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:39.623	com.mtngh.mymtn	mobile_money
25fb10d3-d027-47df-8cf3-fe052f180bc3	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:42.359	com.mtngh.mymtn	mobile_money
9a2a02ce-9a4f-4a31-8663-940d72b46a1a	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:44.94	promzy.com.teachingsyllabus	basic_education
1e1bd775-2295-4501-9377-cc0f38911c53	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:47.719	com.rxhealth.healthker	medicine_access
2928d14c-7f2b-441b-9f1c-5abd2f75f052	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:51.26	com.mtngh.mymtn	mobile_money
152bb62d-0712-4899-9e35-1a07d5536ae1	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:53.74	com.mtngh.mymtn	mobile_money
3493e9a7-08d1-4488-aa4b-f783cbf05a1c	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:56.32	promzy.com.teachingsyllabus	basic_education
ac30b4fa-8861-47d4-8980-23f48ff7d3b0	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:28:58.863	com.rxhealth.healthker	medicine_access
1bab5fba-cadd-4c3d-bd78-c84a23b17233	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:02.203	com.rxhealth.healthker	medicine_access
5757f259-6055-4702-a3ad-51148b31971b	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:04.72	com.mtngh.mymtn	mobile_money
2b73c627-e81d-48e1-a265-89852ed5675a	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:07.321	com.mtngh.mymtn	mobile_money
59c6b146-ac1b-474b-9a38-c5b077b2507e	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:09.903	com.rxhealth.healthker	medicine_access
c5f5cc77-8e5a-4374-9e99-5f8905ee6b0f	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:13.24	com.rxhealth.healthker	medicine_access
c3fc776d-86d1-4630-973b-ec28ec612222	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:15.723	com.mtngh.mymtn	mobile_money
5942de8e-2cd0-484e-a740-8ce7eaf63b12	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:18.319	com.mtngh.mymtn	mobile_money
2d3be63a-60e2-4f5b-ab29-bf12d8a23ffc	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:20.92	org.iggymedia.periodtracker	womens_health
97c58c7b-ae6d-4dd1-9f36-d901d63744ba	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:24.161	com.mtngh.mymtn	mobile_money
1c28cdb1-f266-4069-980c-4ac9dafd90c9	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:26.72	com.mtngh.mymtn	mobile_money
6f0f0575-2a7b-440e-98e3-2ca3ad5365b1	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:29.281	com.mtngh.mymtn	mobile_money
e013ec49-e5e5-45c3-9dbd-40b078c4f858	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:31.86	com.rxhealth.healthker	medicine_access
6a76db3b-8cef-4b1f-86e7-a579bd1e8534	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:35.199	com.rxhealth.healthker	medicine_access
40256df7-3dd6-48e7-9cc7-f020476c6bdf	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:37.761	promzy.com.teachingsyllabus	basic_education
081f3b36-f052-4fc2-87bc-66f31fbe5d8b	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:40.26	com.mtngh.mymtn	mobile_money
67301006-88db-4d00-80f4-6187b4602f04	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:42.959	promzy.com.teachingsyllabus	basic_education
811908e5-f2f8-4b13-b0ac-06e0935ab172	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:46.177	com.rxhealth.healthker	medicine_access
038da96f-d1e1-4c94-8257-543f69e57f5e	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 12:29:46.177	com.rxhealth.healthker	medicine_access
5849b271-8d05-419e-99fc-b7bbd673abdb	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:48.62	com.mtngh.mymtn	mobile_money
e3ab0b83-22cb-466b-a92b-9311ab5ee086	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:51.16	com.mtngh.mymtn	mobile_money
94ff6e94-feda-414b-a714-90eac4c66278	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:53.66	com.mtngh.mymtn	mobile_money
87414b5b-efcc-40bc-ae5f-f67c5d5dbe09	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:56.816	com.rxhealth.healthker	medicine_access
e0969d02-f10c-4017-9353-df1e79026b6a	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:29:59.4	com.mtngh.mymtn	mobile_money
7db16581-1057-4297-9b05-29cd78e72639	ce280152-acaa-46cb-8164-16e9bcd455d6	phone_number_confirmation	2025-11-26 06:07:49.032	\N	\N
5921ad3c-1f95-4cec-a343-0b61205084ca	ce280152-acaa-46cb-8164-16e9bcd455d6	goal_setting_started	2025-11-26 06:07:49.032	\N	\N
61ead677-a671-4a48-a578-260f8e3c3814	58ea9c2c-9376-452e-8422-0b4238473195	phone_number_confirmation	2025-11-26 10:59:23.139	\N	\N
1e868cf9-df23-400b-a3eb-835bc3d011c9	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 10:59:23.139	\N	\N
57abf422-cbef-4e66-957a-d6ef4d7a0135	58ea9c2c-9376-452e-8422-0b4238473195	phone_number_confirmation	2025-11-26 11:04:13.896	\N	\N
ffd644e9-1348-473c-a068-df09b8cbfd1b	58ea9c2c-9376-452e-8422-0b4238473195	goal_setting_started	2025-11-26 11:04:13.896	\N	\N
89ab8a51-9ca7-4ad1-928c-15ae9e35fa56	cf89e290-f3c0-4a46-a443-b21e3c27b925	phone_number_confirmation	2025-11-26 11:26:22.397	\N	\N
31b33e30-5a3e-40a1-a1f9-df2f385fdb0e	cf89e290-f3c0-4a46-a443-b21e3c27b925	goal_setting_started	2025-11-26 11:26:22.397	\N	\N
608645a8-d1b7-4054-87c6-c98df726ce80	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:01.843	com.mtngh.mymtn	mobile_money
ba0f6ea8-f55d-4ff4-83b0-5a78b2341154	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 12:30:01.843	com.mtngh.mymtn	mobile_money
4e1cf818-4b43-4dbc-93ae-7f2f1845a6ee	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:04.424	com.rxhealth.healthker	medicine_access
249797a4-ef46-4a3d-b563-2e69c7ec8887	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:07.295	promzy.com.teachingsyllabus	basic_education
a5a5f910-a9cd-4c22-8724-2aa31f14519c	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:09.903	com.rxhealth.healthker	medicine_access
78f05ecc-78ae-4e94-b472-c802f79c47d2	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:12.481	com.mtngh.mymtn	mobile_money
b0a9719c-2f5e-4681-99e9-84c64e34b2ce	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:15.122	com.mtngh.mymtn	mobile_money
dcf9f1c5-c156-401b-b4e2-9f5becec271f	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:17.655	com.rxhealth.healthker	medicine_access
d3aa7b21-c3f9-4815-b895-333ed7d2cd75	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:20.601	promzy.com.teachingsyllabus	basic_education
ca6313c1-f790-4e94-a51b-6adaa26c89c0	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:23.161	com.rxhealth.healthker	medicine_access
639618f5-c701-4aee-80a2-362c451fc57c	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 12:30:25.8	com.rxhealth.healthker	medicine_access
13fff5a5-8031-458e-8303-166b0612a536	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 13:27:24.993	co.farmerline.sales	market_access
3d71b8f9-faf0-4afe-9a0a-8725a963c16d	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 13:27:31.487	com.mtngh.mymtn	mobile_money
4c7b0c7e-109d-465e-94c5-0f222815cba6	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 13:27:31.487	com.mtngh.mymtn	mobile_money
93df8758-81d5-4bcf-a711-774199a29e31	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_opened	2025-11-26 13:27:35.012	com.rxhealth.healthker	medicine_access
a96438a6-3efd-4d87-8f34-59ebc44b5a94	5b26671d-5d53-4373-a113-c0339a4bbed3	customer_app_login_completed	2025-11-26 13:27:35.012	com.rxhealth.healthker	medicine_access
\.


--
-- Data for Name: user_apps; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_apps (id, "createdAt", "updatedAt", "appId", "isFavorite", "usageCount", "userId") FROM stdin;
\.


--
-- Data for Name: user_goal_categories; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_goal_categories (id, "createdAt", "updatedAt", "relationshipType", "goalCategoryId", "userId", rank) FROM stdin;
6629e004-56a5-4479-85d2-e4c2e3602409	2025-09-23 14:11:05.872359	2025-09-23 14:11:05.872359	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	0301ca26-e2e1-470a-9aa3-9616cfee45e5	1
ef5d4cce-ba04-4956-be83-37509bc59c7d	2025-09-23 14:11:05.892329	2025-09-23 14:11:05.892329	secondary	1791532c-64ef-4074-a00e-161d1c981330	0301ca26-e2e1-470a-9aa3-9616cfee45e5	2
9e8fb849-0b24-4c5d-aca5-445bd66018a8	2025-09-23 14:11:05.91458	2025-09-23 14:11:05.91458	primary	041295f5-f311-45e1-9133-7e3e4af712b0	0301ca26-e2e1-470a-9aa3-9616cfee45e5	3
f74a17c5-0618-4843-85c5-90e5be7d077a	2025-09-23 14:11:05.932216	2025-09-23 14:11:05.932216	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	0301ca26-e2e1-470a-9aa3-9616cfee45e5	4
0b594545-fbb0-42ff-bd99-7ccc0ce62f84	2025-11-26 11:28:48.55109	2025-11-26 11:28:48.55109	secondary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	cf89e290-f3c0-4a46-a443-b21e3c27b925	1
645c992c-e1f5-4c28-bc34-cc48cc7ee27f	2025-11-26 11:28:49.996252	2025-11-26 11:28:49.996252	secondary	1791532c-64ef-4074-a00e-161d1c981330	cf89e290-f3c0-4a46-a443-b21e3c27b925	2
257c5069-449a-4d6c-88a5-4d7e440e0200	2025-11-26 11:28:51.455175	2025-11-26 11:28:51.455175	primary	041295f5-f311-45e1-9133-7e3e4af712b0	cf89e290-f3c0-4a46-a443-b21e3c27b925	3
9dd67308-b9b9-44a2-a182-9955792fb6b3	2025-11-26 11:28:53.158722	2025-11-26 11:28:53.158722	primary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	cf89e290-f3c0-4a46-a443-b21e3c27b925	4
eeb0348a-f3f8-40a5-9295-cd835a85cd93	2025-09-25 09:33:22.284528	2025-09-25 09:33:22.284528	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	03dc138a-04da-4a0c-bd19-e9efbf238407	1
1b39faf0-18b5-4da6-bf9f-da54f974b893	2025-09-25 09:33:22.298108	2025-09-25 09:33:22.298108	primary	1791532c-64ef-4074-a00e-161d1c981330	03dc138a-04da-4a0c-bd19-e9efbf238407	2
54f0e9bb-b8f0-40d5-b978-968401d47336	2025-09-25 09:33:22.309486	2025-09-25 09:33:22.309486	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	03dc138a-04da-4a0c-bd19-e9efbf238407	3
4a8f7bd4-586c-44b7-9e5a-bd138ad3e535	2025-09-25 09:33:22.320671	2025-09-25 09:33:22.320671	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	03dc138a-04da-4a0c-bd19-e9efbf238407	4
6ba891d2-0142-405a-ae77-8710fc3a53ec	2025-10-01 15:21:08.520066	2025-10-01 15:21:08.520066	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	dc72b8c0-f888-4282-a72b-553dd68ca0b0	1
e6c2df70-1d30-4805-af70-cd286b0d3521	2025-10-01 15:21:08.540259	2025-10-01 15:21:08.540259	secondary	1791532c-64ef-4074-a00e-161d1c981330	dc72b8c0-f888-4282-a72b-553dd68ca0b0	2
0b4c5653-7251-4212-88ee-dcd4840c7533	2025-10-01 15:21:08.558152	2025-10-01 15:21:08.558152	primary	041295f5-f311-45e1-9133-7e3e4af712b0	dc72b8c0-f888-4282-a72b-553dd68ca0b0	3
0b275eb7-af85-4709-b472-7cbae4fcc86e	2025-10-01 15:21:08.569605	2025-10-01 15:21:08.569605	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	dc72b8c0-f888-4282-a72b-553dd68ca0b0	4
21eaa13f-50f4-490f-95af-28e68fe27c0a	2025-10-08 12:44:22.755532	2025-10-08 12:44:22.755532	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	0fbdc046-243e-45f4-88a5-e79014c042cc	1
aed34903-ef5b-4e67-af61-ed8d46e07f07	2025-10-08 12:44:22.77029	2025-10-08 12:44:22.77029	primary	1791532c-64ef-4074-a00e-161d1c981330	0fbdc046-243e-45f4-88a5-e79014c042cc	2
99952262-95a4-45d7-9eeb-4f93297c3ffe	2025-10-08 12:44:22.789774	2025-10-08 12:44:22.789774	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	0fbdc046-243e-45f4-88a5-e79014c042cc	3
2ab0c6c8-d43e-4785-b341-cc614772a99c	2025-10-08 12:44:22.802531	2025-10-08 12:44:22.802531	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	0fbdc046-243e-45f4-88a5-e79014c042cc	4
268091f6-c0ca-43dc-8ecc-b6e88ba6db43	2025-10-13 09:53:46.647197	2025-10-13 09:53:46.647197	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	9edb0f91-cb09-47ec-90fc-fb222cbd82e0	1
48e418a3-08f1-4303-a6b3-f408f1fb265d	2025-10-13 09:53:46.666257	2025-10-13 09:53:46.666257	primary	1791532c-64ef-4074-a00e-161d1c981330	9edb0f91-cb09-47ec-90fc-fb222cbd82e0	2
e3fb06f7-22f6-4915-b620-efbf1792df17	2025-10-13 09:53:46.68238	2025-10-13 09:53:46.68238	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	9edb0f91-cb09-47ec-90fc-fb222cbd82e0	3
231a78cc-c5a5-4191-a569-3eac0d88ee57	2025-10-13 09:53:46.696257	2025-10-13 09:53:46.696257	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	9edb0f91-cb09-47ec-90fc-fb222cbd82e0	4
bdcbd6a6-8276-4b1e-bb3f-406e9f3031a7	2025-10-15 08:49:17.776111	2025-10-15 08:49:17.776111	secondary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	c99c3f5b-e7ef-4695-ace9-89326973345b	1
68999b56-2968-444b-b4be-3ccafe79110a	2025-10-15 08:49:17.784022	2025-10-15 08:49:17.784022	primary	1791532c-64ef-4074-a00e-161d1c981330	c99c3f5b-e7ef-4695-ace9-89326973345b	2
95bb8e28-a70e-421c-9354-63366251b803	2025-10-15 08:49:17.792745	2025-10-15 08:49:17.792745	primary	041295f5-f311-45e1-9133-7e3e4af712b0	c99c3f5b-e7ef-4695-ace9-89326973345b	3
b43a2dd3-35b5-4544-aab1-fb258d970cc8	2025-10-15 08:49:17.799045	2025-10-15 08:49:17.799045	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	c99c3f5b-e7ef-4695-ace9-89326973345b	4
e6413e4d-c2fe-4f68-ac1f-ccf8531d586a	2025-10-15 10:06:32.048154	2025-10-15 10:06:32.048154	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	c54a59ea-014a-4dc9-8576-3c655c835d02	1
b72cb037-7447-44b2-aa9e-dc8ffcdef6ce	2025-10-15 10:06:32.061233	2025-10-15 10:06:32.061233	primary	1791532c-64ef-4074-a00e-161d1c981330	c54a59ea-014a-4dc9-8576-3c655c835d02	2
3f750388-56f7-4cbe-91ca-bf03f0ba802a	2025-10-15 10:06:32.071951	2025-10-15 10:06:32.071951	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	c54a59ea-014a-4dc9-8576-3c655c835d02	3
875bf83a-7377-48ae-9be9-e83b506bb454	2025-10-15 10:06:32.081992	2025-10-15 10:06:32.081992	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	c54a59ea-014a-4dc9-8576-3c655c835d02	4
930a11a5-b560-4307-8162-99f866cbde4d	2025-10-16 09:10:30.262778	2025-10-16 09:10:30.262778	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	533f6786-0f97-4267-8977-6541522033b6	1
4bd196ff-a597-4200-b90e-5e62fab0e539	2025-10-16 09:10:30.276018	2025-10-16 09:10:30.276018	secondary	1791532c-64ef-4074-a00e-161d1c981330	533f6786-0f97-4267-8977-6541522033b6	2
f06a530a-d99f-460a-9d3c-8268dd342007	2025-10-16 09:10:30.28603	2025-10-16 09:10:30.28603	primary	041295f5-f311-45e1-9133-7e3e4af712b0	533f6786-0f97-4267-8977-6541522033b6	3
54e02039-47b1-411e-a288-546befc0dcb2	2025-10-16 09:10:30.294144	2025-10-16 09:10:30.294144	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	533f6786-0f97-4267-8977-6541522033b6	4
444b5348-e6d5-4ecf-ace7-1df26cfc299d	2025-10-16 10:09:43.745519	2025-10-16 10:09:43.745519	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	57cecea5-da12-43dd-ae7c-66cd38408047	1
da568fbe-2b61-48e8-9a91-db53e77f89d3	2025-10-16 10:09:43.760316	2025-10-16 10:09:43.760316	primary	1791532c-64ef-4074-a00e-161d1c981330	57cecea5-da12-43dd-ae7c-66cd38408047	2
a2da57d4-c404-4fe3-b325-a3446372e632	2025-10-16 10:09:43.775558	2025-10-16 10:09:43.775558	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	57cecea5-da12-43dd-ae7c-66cd38408047	3
18e604f7-ad55-49a2-bff0-376ae3933830	2025-10-16 10:09:43.787305	2025-10-16 10:09:43.787305	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	57cecea5-da12-43dd-ae7c-66cd38408047	4
ff448b38-977c-4909-a8fc-4602310d39c4	2025-10-20 09:15:22.46054	2025-10-20 09:15:22.46054	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	2bf56a47-a901-41d8-8f4d-d5a8b9609328	1
8a6c6235-5c6a-4035-a628-36b4e7032351	2025-10-20 09:15:22.48101	2025-10-20 09:15:22.48101	primary	1791532c-64ef-4074-a00e-161d1c981330	2bf56a47-a901-41d8-8f4d-d5a8b9609328	2
64eac1d7-5df1-4368-b153-e9b74627e4fe	2025-10-20 09:15:22.495284	2025-10-20 09:15:22.495284	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	2bf56a47-a901-41d8-8f4d-d5a8b9609328	3
76a1beef-7bc7-4942-9caa-f3f67714e6f2	2025-10-20 09:15:22.509315	2025-10-20 09:15:22.509315	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	2bf56a47-a901-41d8-8f4d-d5a8b9609328	4
6552f4a2-99cf-4884-8897-56e0b8277d34	2025-11-10 08:51:59.660797	2025-11-10 08:51:59.660797	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2	1
f09a32b5-49f6-4141-b038-78e5b6d7b2af	2025-11-10 08:51:59.71403	2025-11-10 09:20:15.2891	primary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2	2
b88a8287-71ee-44c1-838d-7b0fa212d1fc	2025-11-10 08:51:59.700638	2025-11-10 09:20:15.30656	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2	3
2f9e52e8-8b99-46eb-bfe1-2b606e5f28ae	2025-11-10 08:51:59.685355	2025-11-10 09:20:15.330384	secondary	1791532c-64ef-4074-a00e-161d1c981330	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2	4
0530505a-33b5-4715-b028-b1f5f9bd2bdd	2025-11-10 09:33:56.973921	2025-11-10 09:33:56.973921	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	b5947c92-85b6-4b2c-a196-994d9c3b4739	4
eac953ee-98b4-4313-b642-ada4dc440645	2025-11-10 09:33:56.954503	2025-11-10 09:35:13.330385	primary	1791532c-64ef-4074-a00e-161d1c981330	b5947c92-85b6-4b2c-a196-994d9c3b4739	1
0aa84415-dded-4dd0-8e0f-0ecc1ef58db4	2025-11-10 09:33:56.941637	2025-11-10 09:35:13.343919	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	b5947c92-85b6-4b2c-a196-994d9c3b4739	2
0eb1baf9-3e16-4cca-a464-a373c70942c2	2025-11-10 09:33:56.962298	2025-11-10 09:35:13.357347	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	b5947c92-85b6-4b2c-a196-994d9c3b4739	3
1ca8fb8d-c86c-44d9-8e27-056086b1a441	2025-11-10 11:47:23.397324	2025-11-10 11:47:23.397324	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	af98950d-a6a9-4675-ae71-087d4ceff525	1
24ba85fd-45cc-4e6a-92c7-d76c1390ed13	2025-11-10 11:47:23.419677	2025-11-10 11:47:23.419677	primary	1791532c-64ef-4074-a00e-161d1c981330	af98950d-a6a9-4675-ae71-087d4ceff525	2
d4c1862a-5f12-47d1-8fe5-be7327b6dec5	2025-11-10 11:47:23.434922	2025-11-10 11:47:23.434922	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	af98950d-a6a9-4675-ae71-087d4ceff525	3
3cb951b7-fd0e-4442-a75e-ca711429a4c8	2025-11-10 11:47:23.444957	2025-11-10 11:47:23.444957	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	af98950d-a6a9-4675-ae71-087d4ceff525	4
89559b9d-b097-4f0f-bc90-507f24863a65	2025-11-11 11:35:48.952188	2025-11-11 11:35:48.952188	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	c3ee388c-1170-4fba-a817-a6afa55fd046	1
b2e73541-4279-4222-8229-443b4947dc35	2025-11-11 11:35:48.972681	2025-11-11 11:35:48.972681	primary	1791532c-64ef-4074-a00e-161d1c981330	c3ee388c-1170-4fba-a817-a6afa55fd046	2
786ca215-c8e9-466e-865e-2c6b833fad2a	2025-11-11 11:35:48.991487	2025-11-11 11:35:48.991487	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	c3ee388c-1170-4fba-a817-a6afa55fd046	3
26a2f68a-957d-403b-8184-cd3777e42bd8	2025-11-11 11:35:49.006447	2025-11-11 11:35:49.006447	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	c3ee388c-1170-4fba-a817-a6afa55fd046	4
4c6bfd1f-aa4c-4abb-83fc-6f8f06a2273a	2025-11-11 12:13:05.541471	2025-11-11 12:13:05.541471	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	a7295cab-0299-493d-9870-3ed59a04cfaa	1
36cc7313-06cf-40e0-af86-df31c78d26d1	2025-11-11 12:13:05.562987	2025-11-11 12:13:05.562987	primary	1791532c-64ef-4074-a00e-161d1c981330	a7295cab-0299-493d-9870-3ed59a04cfaa	2
1dc8cc26-b529-473a-80f1-42de0caf70db	2025-11-11 12:13:05.578804	2025-11-11 12:13:05.578804	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	a7295cab-0299-493d-9870-3ed59a04cfaa	3
87467c5b-6b9c-4a73-bf75-4590b69832b4	2025-11-11 12:13:05.591628	2025-11-11 12:13:05.591628	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	a7295cab-0299-493d-9870-3ed59a04cfaa	4
b8b95e47-24e8-45f8-9e11-d85216a72286	2025-11-19 22:17:43.268516	2025-11-19 22:17:43.268516	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	b7637e6b-e023-4347-9cce-d51e7aacaab4	1
ba4b7dc6-91b1-4124-b711-f691c52698bb	2025-11-19 22:17:43.352127	2025-11-19 22:18:06.334803	primary	1791532c-64ef-4074-a00e-161d1c981330	b7637e6b-e023-4347-9cce-d51e7aacaab4	2
5c7b997b-87ac-4095-a782-d9d48547bc53	2025-11-19 22:17:43.51419	2025-11-19 22:18:06.378183	secondary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	b7637e6b-e023-4347-9cce-d51e7aacaab4	3
0df0c65d-f825-487b-b1ec-ee1980f2ba79	2025-11-19 22:17:43.433838	2025-11-19 22:18:06.425889	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	b7637e6b-e023-4347-9cce-d51e7aacaab4	4
cbe84600-63b2-420c-83c8-2ff7e789080b	2025-11-20 07:48:34.987723	2025-11-20 07:48:34.987723	primary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	9eec7d5d-740f-49cb-8be4-db3e52ab59d0	1
5e06f435-d554-41e9-adc9-09a6c2d14084	2025-11-20 07:48:35.04858	2025-11-20 07:48:35.04858	secondary	1791532c-64ef-4074-a00e-161d1c981330	9eec7d5d-740f-49cb-8be4-db3e52ab59d0	2
771af220-43cd-45dc-a898-8abb5c2d6756	2025-11-20 07:48:35.103787	2025-11-20 07:48:35.103787	secondary	041295f5-f311-45e1-9133-7e3e4af712b0	9eec7d5d-740f-49cb-8be4-db3e52ab59d0	3
204ff769-38d5-4d5c-8fb9-4a93504429db	2025-11-20 07:48:35.15847	2025-11-20 07:48:35.15847	primary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	9eec7d5d-740f-49cb-8be4-db3e52ab59d0	4
f75f71f6-3dde-4d47-958d-ca047ae735ed	2025-11-20 08:15:57.21092	2025-11-26 16:53:12.622754	primary	8605c351-06d6-4696-bbe0-34fcfb1b47d8	5b26671d-5d53-4373-a113-c0339a4bbed3	1
ba0668f5-8300-41f3-b021-5fd5e004cb55	2025-11-20 08:15:57.154797	2025-11-26 16:53:12.630188	primary	041295f5-f311-45e1-9133-7e3e4af712b0	5b26671d-5d53-4373-a113-c0339a4bbed3	2
bb6e5c2e-dde4-4c1c-a941-216af0fe26c3	2025-11-20 08:15:56.999222	2025-11-26 16:53:12.63663	secondary	87287bfa-b290-4eba-bd7c-a4ddeca406d8	5b26671d-5d53-4373-a113-c0339a4bbed3	3
ad736a75-aea1-4cf5-86f6-2243bbe01498	2025-11-20 08:15:57.079325	2025-11-26 16:53:12.645273	secondary	1791532c-64ef-4074-a00e-161d1c981330	5b26671d-5d53-4373-a113-c0339a4bbed3	4
\.


--
-- Data for Name: user_goal_priorities; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_goal_priorities ("userGoalCategoryId", "goalPriorityId") FROM stdin;
\.


--
-- Data for Name: user_goals; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_goals (id, "createdAt", "updatedAt", "relationshipType", "goalId", "userId") FROM stdin;
e1e4c7f5-47e6-4deb-980c-992af3ec1628	2025-09-23 14:11:05.878699	2025-09-23 14:11:05.878699	primary	358940c1-f3c5-4d57-a97b-8a6d0160c523	0301ca26-e2e1-470a-9aa3-9616cfee45e5
c09d33a6-0640-437f-9426-bc56354af0e6	2025-09-23 14:11:05.883573	2025-09-23 14:11:05.883573	primary	5ab413e1-3900-49f8-b327-804defdf135a	0301ca26-e2e1-470a-9aa3-9616cfee45e5
abf620f4-b9d6-49c3-bec5-a3a0d628c759	2025-09-23 14:11:05.888068	2025-09-23 14:11:05.888068	primary	4c3c4e32-43cc-427a-a6ce-efd3070f039f	0301ca26-e2e1-470a-9aa3-9616cfee45e5
308994be-5ddb-4523-ab3a-fecb3fbf0fea	2025-09-23 14:11:05.897325	2025-09-23 14:11:05.897325	primary	1bee8fe8-9344-4053-a7b2-e6a6a7a8e7b4	0301ca26-e2e1-470a-9aa3-9616cfee45e5
0415a309-805c-4ad2-a0b4-6ca10708b9d8	2025-09-23 14:11:05.901686	2025-09-23 14:11:05.901686	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	0301ca26-e2e1-470a-9aa3-9616cfee45e5
1905c816-b51d-4fc9-8cfa-a1cb4669533a	2025-09-23 14:11:05.907796	2025-09-23 14:11:05.907796	primary	536e2437-49f2-40e6-81a4-82c8fa19f907	0301ca26-e2e1-470a-9aa3-9616cfee45e5
52edcfc2-2e72-4f37-85e2-d76563220610	2025-09-23 14:11:05.919038	2025-09-23 14:11:05.919038	primary	baaa9855-6128-48b6-9104-41ee541d3b81	0301ca26-e2e1-470a-9aa3-9616cfee45e5
ea444613-c4e6-42ce-a147-6257e3520414	2025-09-23 14:11:05.92284	2025-09-23 14:11:05.92284	primary	a08a9fe9-2632-4e33-9d2f-13cd194061d4	0301ca26-e2e1-470a-9aa3-9616cfee45e5
d9a6ee3e-bfcb-49c6-8184-30fe59736efa	2025-09-23 14:11:05.928985	2025-09-23 14:11:05.928985	primary	5b8c870c-a288-4246-a804-0ce87b81cfc0	0301ca26-e2e1-470a-9aa3-9616cfee45e5
687bb38a-586c-4082-8393-8648088f84d6	2025-09-23 14:11:05.936219	2025-09-23 14:11:05.936219	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	0301ca26-e2e1-470a-9aa3-9616cfee45e5
75cfc560-8649-4eaf-8f98-35af262aacb9	2025-09-23 14:11:05.939283	2025-09-23 14:11:05.939283	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	0301ca26-e2e1-470a-9aa3-9616cfee45e5
30b8cfba-b1b1-470f-ad1e-cf7fa388f862	2025-11-26 16:52:09.713986	2025-11-26 16:52:09.713986	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	5b26671d-5d53-4373-a113-c0339a4bbed3
8dee1b10-f293-43cf-893a-1328b4f06fb1	2025-11-26 16:52:09.713986	2025-11-26 16:52:09.713986	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	5b26671d-5d53-4373-a113-c0339a4bbed3
d194e552-d21e-46a5-83c1-a9488fd760e1	2025-11-10 08:51:59.689842	2025-11-10 08:51:59.689842	primary	ef0cfd01-56d6-4f73-abaf-da0ef78c1f22	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
34e6d07b-43ac-4e23-b536-5d1f9dc5b828	2025-11-10 08:51:59.695928	2025-11-10 08:51:59.695928	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
ef5ed9e6-1cdf-42d7-bfe4-4e68e0f4be4a	2025-11-10 08:51:59.705549	2025-11-10 08:51:59.705549	primary	a08a9fe9-2632-4e33-9d2f-13cd194061d4	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
1bf61514-52cb-4c8e-87e2-70330ebbd142	2025-11-10 08:51:59.710116	2025-11-10 08:51:59.710116	primary	5b8c870c-a288-4246-a804-0ce87b81cfc0	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
1c9ded98-b117-49fb-87ea-391ebb927d54	2025-11-10 08:51:59.719298	2025-11-10 08:51:59.719298	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
913cc0cd-6392-4161-aefd-4cefc35e3387	2025-11-10 08:51:59.723206	2025-11-10 08:51:59.723206	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
e2864adc-ea7a-4216-a8cc-558ce50ea4a0	2025-11-10 09:33:56.947105	2025-11-10 09:33:56.947105	primary	3372910c-349f-42e7-8543-94e7eddf8ab1	b5947c92-85b6-4b2c-a196-994d9c3b4739
72d3afeb-e535-4b86-863c-623593e14808	2025-11-10 09:33:56.951007	2025-11-10 09:33:56.951007	primary	5160b41b-d5e8-47ec-897a-5b69f59e9780	b5947c92-85b6-4b2c-a196-994d9c3b4739
9ae3b4ac-83a0-477b-bb75-a948ac8757d7	2025-11-10 09:33:56.958788	2025-11-10 09:33:56.958788	primary	536e2437-49f2-40e6-81a4-82c8fa19f907	b5947c92-85b6-4b2c-a196-994d9c3b4739
51ad8322-b214-49fa-b152-a3c8ebd7dabe	2025-09-25 09:33:22.302228	2025-09-25 09:33:22.302228	primary	536e2437-49f2-40e6-81a4-82c8fa19f907	03dc138a-04da-4a0c-bd19-e9efbf238407
a455221b-1762-42b9-a18a-af0b78c3ba7e	2025-09-25 09:33:22.315656	2025-09-25 09:33:22.315656	primary	baaa9855-6128-48b6-9104-41ee541d3b81	03dc138a-04da-4a0c-bd19-e9efbf238407
b09fc3a8-8eeb-4486-8f8f-5bddad591311	2025-09-25 09:33:22.325386	2025-09-25 09:33:22.325386	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	03dc138a-04da-4a0c-bd19-e9efbf238407
aae7fd6a-f09c-453d-bc16-81bc15472898	2025-09-26 09:25:30.911243	2025-09-26 09:25:30.911243	primary	358940c1-f3c5-4d57-a97b-8a6d0160c523	03dc138a-04da-4a0c-bd19-e9efbf238407
8c98e41e-d2c7-443c-9400-90c8c21a3185	2025-09-26 09:25:30.911243	2025-09-26 09:25:30.911243	primary	5ab413e1-3900-49f8-b327-804defdf135a	03dc138a-04da-4a0c-bd19-e9efbf238407
1adc365e-8719-4d90-aacc-7a6a74ea89ec	2025-11-10 09:33:56.965581	2025-11-10 09:33:56.965581	primary	5b8c870c-a288-4246-a804-0ce87b81cfc0	b5947c92-85b6-4b2c-a196-994d9c3b4739
57704190-96c4-425c-a06d-2ecced16685a	2025-11-10 09:33:56.969198	2025-11-10 09:33:56.969198	primary	a08a9fe9-2632-4e33-9d2f-13cd194061d4	b5947c92-85b6-4b2c-a196-994d9c3b4739
7491bf87-908f-49f8-bbf5-05f9f0535fc3	2025-11-10 09:33:56.977605	2025-11-10 09:33:56.977605	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	b5947c92-85b6-4b2c-a196-994d9c3b4739
d324ea20-d7fb-463c-9993-13f7a59dac87	2025-11-10 09:33:56.981386	2025-11-10 09:33:56.981386	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	b5947c92-85b6-4b2c-a196-994d9c3b4739
e7eb5c49-165f-4977-857f-556252382ca5	2025-11-11 11:35:48.961453	2025-11-11 11:35:48.961453	primary	358940c1-f3c5-4d57-a97b-8a6d0160c523	c3ee388c-1170-4fba-a817-a6afa55fd046
2b895c74-0f9c-49a1-989a-29fd0dcac6b4	2025-11-11 11:35:48.967182	2025-11-11 11:35:48.967182	primary	5ab413e1-3900-49f8-b327-804defdf135a	c3ee388c-1170-4fba-a817-a6afa55fd046
018fddb0-3521-4661-928a-97b0cf894179	2025-11-11 11:35:48.980989	2025-11-11 11:35:48.980989	primary	1bee8fe8-9344-4053-a7b2-e6a6a7a8e7b4	c3ee388c-1170-4fba-a817-a6afa55fd046
c56b3a36-8851-46f1-a7a3-2cd793f3c589	2025-11-11 11:35:48.987151	2025-11-11 11:35:48.987151	primary	299709b5-90a6-41a3-85ea-8fd1d0816f98	c3ee388c-1170-4fba-a817-a6afa55fd046
1de0b176-14fa-45e2-9800-31a59e4ee62c	2025-11-11 11:35:48.995912	2025-11-11 11:35:48.995912	primary	baaa9855-6128-48b6-9104-41ee541d3b81	c3ee388c-1170-4fba-a817-a6afa55fd046
c389441e-a534-488e-8413-4ff1160554ea	2025-11-11 11:35:49.000296	2025-11-11 11:35:49.000296	primary	7fbfd6a6-2690-4f51-8448-c062002de596	c3ee388c-1170-4fba-a817-a6afa55fd046
33c7493e-e19f-42a5-bdac-9059a97005e7	2025-11-11 11:35:49.013267	2025-11-11 11:35:49.013267	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	c3ee388c-1170-4fba-a817-a6afa55fd046
91605d13-09c2-4ae2-a68e-ecf29f7054a3	2025-11-11 11:35:49.018399	2025-11-11 11:35:49.018399	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	c3ee388c-1170-4fba-a817-a6afa55fd046
ed262308-5313-4986-a14f-8742b16739b7	2025-10-01 15:21:08.525213	2025-10-01 15:21:08.525213	primary	5ab413e1-3900-49f8-b327-804defdf135a	dc72b8c0-f888-4282-a72b-553dd68ca0b0
b28b0794-6743-4123-a75e-da2ef43e1868	2025-10-01 15:21:08.52978	2025-10-01 15:21:08.52978	primary	5160b41b-d5e8-47ec-897a-5b69f59e9780	dc72b8c0-f888-4282-a72b-553dd68ca0b0
38ab3ca2-1a26-4c5f-8a06-774e709e04d2	2025-10-01 15:21:08.533988	2025-10-01 15:21:08.533988	primary	3372910c-349f-42e7-8543-94e7eddf8ab1	dc72b8c0-f888-4282-a72b-553dd68ca0b0
2a1a41aa-c7d0-4741-96df-3bf65d42ea40	2025-10-01 15:21:08.544265	2025-10-01 15:21:08.544265	primary	299709b5-90a6-41a3-85ea-8fd1d0816f98	dc72b8c0-f888-4282-a72b-553dd68ca0b0
b6d3a939-d0f4-4580-a3e7-16e16ab65cf1	2025-10-01 15:21:08.547302	2025-10-01 15:21:08.547302	primary	ef0cfd01-56d6-4f73-abaf-da0ef78c1f22	dc72b8c0-f888-4282-a72b-553dd68ca0b0
a775be2c-2931-4021-b756-5dc183f1c314	2025-10-01 15:21:08.554399	2025-10-01 15:21:08.554399	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	dc72b8c0-f888-4282-a72b-553dd68ca0b0
691fb16e-8ec4-45f4-8656-4dc3cb40dc60	2025-10-01 15:21:08.5622	2025-10-01 15:21:08.5622	primary	f8c415f7-0942-48ae-a91a-7e1bcc91bcc8	dc72b8c0-f888-4282-a72b-553dd68ca0b0
d28cc55b-74be-404d-b23f-e0d1ea493894	2025-10-01 15:21:08.565688	2025-10-01 15:21:08.565688	primary	a08a9fe9-2632-4e33-9d2f-13cd194061d4	dc72b8c0-f888-4282-a72b-553dd68ca0b0
cb9653c3-8cb1-45e9-ac8a-ead40f680e6e	2025-10-01 15:21:08.573033	2025-10-01 15:21:08.573033	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	dc72b8c0-f888-4282-a72b-553dd68ca0b0
bedb922d-1a22-4159-a01c-cbd29b5f3f92	2025-10-01 15:21:08.575731	2025-10-01 15:21:08.575731	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	dc72b8c0-f888-4282-a72b-553dd68ca0b0
d952b1d4-bcfb-4208-af9e-60914fde7e66	2025-10-08 12:44:22.759917	2025-10-08 12:44:22.759917	primary	5ab413e1-3900-49f8-b327-804defdf135a	0fbdc046-243e-45f4-88a5-e79014c042cc
465897ef-367b-4b4b-a11d-274cc04f2e25	2025-10-08 12:44:22.763319	2025-10-08 12:44:22.763319	primary	6e024481-3127-4002-a6b0-a70f718097b5	0fbdc046-243e-45f4-88a5-e79014c042cc
235d8b5a-2e61-4737-97a0-7ea32697ec14	2025-10-08 12:44:22.76702	2025-10-08 12:44:22.76702	primary	4c3c4e32-43cc-427a-a6ce-efd3070f039f	0fbdc046-243e-45f4-88a5-e79014c042cc
1c129c21-2f2b-4554-b3d5-d4081b26199d	2025-10-08 12:44:22.780183	2025-10-08 12:44:22.780183	primary	536e2437-49f2-40e6-81a4-82c8fa19f907	0fbdc046-243e-45f4-88a5-e79014c042cc
42567af5-bdfd-42d1-9f06-05b046f26e88	2025-10-08 12:44:22.784528	2025-10-08 12:44:22.784528	primary	ef0cfd01-56d6-4f73-abaf-da0ef78c1f22	0fbdc046-243e-45f4-88a5-e79014c042cc
b68caf61-8efa-4ea0-9dca-09a2a26c7d36	2025-10-08 12:44:22.79408	2025-10-08 12:44:22.79408	primary	baaa9855-6128-48b6-9104-41ee541d3b81	0fbdc046-243e-45f4-88a5-e79014c042cc
d7e1f18f-734f-4d42-a3eb-1f10a8efc655	2025-10-08 12:44:22.79706	2025-10-08 12:44:22.79706	primary	5b8c870c-a288-4246-a804-0ce87b81cfc0	0fbdc046-243e-45f4-88a5-e79014c042cc
74d571d1-40f9-4e16-8699-19a9874152d6	2025-10-08 12:44:22.799993	2025-10-08 12:44:22.799993	primary	a01acb4b-4acc-4428-9bee-dba9b3038ff8	0fbdc046-243e-45f4-88a5-e79014c042cc
aa527878-6f09-4689-a2ef-97f380d15532	2025-10-08 12:44:22.805231	2025-10-08 12:44:22.805231	primary	33a3b170-1a61-48da-add0-3b24678dbb4f	0fbdc046-243e-45f4-88a5-e79014c042cc
0321abc0-bd35-413f-879d-57e03bbcbd6d	2025-10-08 12:44:22.807811	2025-10-08 12:44:22.807811	primary	d23e16b5-b2db-4cf0-9af4-a0c56e7a7db7	0fbdc046-243e-45f4-88a5-e79014c042cc
c1e55ce0-d0af-4928-b603-3f172b945c46	2025-10-13 09:53:46.652808	2025-10-13 09:53:46.652808	primary	6e024481-3127-4002-a6b0-a70f718097b5	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
c43c8c22-3ff0-40fb-8db8-b7d65d0abf69	2025-10-13 09:53:46.657248	2025-10-13 09:53:46.657248	primary	4c3c4e32-43cc-427a-a6ce-efd3070f039f	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
2c2af75c-b31c-4253-ad06-4d4a7ca5b4b3	2025-10-13 09:53:46.661975	2025-10-13 09:53:46.661975	primary	358940c1-f3c5-4d57-a97b-8a6d0160c523	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
172df924-c7ab-4ee6-b6d4-db5701746dff	2025-10-13 09:53:46.671037	2025-10-13 09:53:46.671037	primary	1bee8fe8-9344-4053-a7b2-e6a6a7a8e7b4	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
5d2ce48e-a23c-4d1b-ab22-9e1720cd085b	2025-10-13 09:53:46.674649	2025-10-13 09:53:46.674649	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
0ccd1109-90dc-4f83-b4be-e7de21b43f83	2025-10-13 09:53:46.678792	2025-10-13 09:53:46.678792	primary	536e2437-49f2-40e6-81a4-82c8fa19f907	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
b21ab84a-d915-48d5-95de-df7a837be6c9	2025-10-13 09:53:46.685547	2025-10-13 09:53:46.685547	primary	7fbfd6a6-2690-4f51-8448-c062002de596	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
7376fcdd-6394-4637-8cd2-83e6554a8c75	2025-10-13 09:53:46.68895	2025-10-13 09:53:46.68895	primary	5b8c870c-a288-4246-a804-0ce87b81cfc0	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
3ed67814-142b-421e-a813-d918e1277735	2025-10-13 09:53:46.692942	2025-10-13 09:53:46.692942	primary	f8c415f7-0942-48ae-a91a-7e1bcc91bcc8	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
9528cc33-263c-4829-85f9-33e2ce13aced	2025-10-13 09:53:46.699726	2025-10-13 09:53:46.699726	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
9b3b963a-6e9e-4154-99c8-62fbb5cf9e33	2025-10-13 09:53:46.703371	2025-10-13 09:53:46.703371	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
f8dd2913-d354-4992-bc90-2cfc80a69555	2025-11-26 16:52:09.713986	2025-11-26 16:52:09.713986	primary	33a3b170-1a61-48da-add0-3b24678dbb4f	5b26671d-5d53-4373-a113-c0339a4bbed3
34e32d2b-71fa-4d0b-84ec-0930b804ff9e	2025-11-19 22:17:43.454355	2025-11-19 22:17:43.454355	primary	f8c415f7-0942-48ae-a91a-7e1bcc91bcc8	b7637e6b-e023-4347-9cce-d51e7aacaab4
3ebce382-9176-47d0-92c3-116f951b497f	2025-11-10 09:03:47.428618	2025-11-10 09:03:47.428618	primary	5160b41b-d5e8-47ec-897a-5b69f59e9780	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
f02b8f5e-a439-4b13-9272-75fcc5fc7349	2025-11-10 09:03:47.428618	2025-11-10 09:03:47.428618	primary	df77618d-14e7-4d21-a66e-53f0d5757072	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
1b587efd-c5ac-4858-9d68-590ae493aa07	2025-11-10 09:03:47.428618	2025-11-10 09:03:47.428618	primary	4c3c4e32-43cc-427a-a6ce-efd3070f039f	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
418e5a47-fe40-4372-9cc2-c0db88abe72e	2025-11-10 11:47:23.403472	2025-11-10 11:47:23.403472	primary	358940c1-f3c5-4d57-a97b-8a6d0160c523	af98950d-a6a9-4675-ae71-087d4ceff525
93ccc402-c6bf-416c-8dc9-2b537533b198	2025-11-10 11:47:23.409637	2025-11-10 11:47:23.409637	primary	5ab413e1-3900-49f8-b327-804defdf135a	af98950d-a6a9-4675-ae71-087d4ceff525
a0d9a122-2b43-4e8d-b1e1-9d4c5243884a	2025-11-10 11:47:23.41433	2025-11-10 11:47:23.41433	primary	6e024481-3127-4002-a6b0-a70f718097b5	af98950d-a6a9-4675-ae71-087d4ceff525
93b0fcdd-7662-46ac-907a-6b4bef936b86	2025-11-10 11:47:23.423813	2025-11-10 11:47:23.423813	primary	299709b5-90a6-41a3-85ea-8fd1d0816f98	af98950d-a6a9-4675-ae71-087d4ceff525
e4814e42-690b-4535-9007-41204c6e5ca1	2025-11-10 11:47:23.427774	2025-11-10 11:47:23.427774	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	af98950d-a6a9-4675-ae71-087d4ceff525
bf9a17bf-ee2e-4f14-980f-6bddf420966f	2025-11-10 11:47:23.431392	2025-11-10 11:47:23.431392	primary	1bee8fe8-9344-4053-a7b2-e6a6a7a8e7b4	af98950d-a6a9-4675-ae71-087d4ceff525
8764d550-d0f2-4c43-9c59-5806f3f4f923	2025-11-10 11:47:23.439729	2025-11-10 11:47:23.439729	primary	5b8c870c-a288-4246-a804-0ce87b81cfc0	af98950d-a6a9-4675-ae71-087d4ceff525
7627f6c2-b5eb-4aa4-8b58-0d3b8802676c	2025-11-10 11:47:23.448854	2025-11-10 11:47:23.448854	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	af98950d-a6a9-4675-ae71-087d4ceff525
2f841e23-a77f-4412-910c-f6c05d0631b2	2025-11-10 11:47:23.452871	2025-11-10 11:47:23.452871	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	af98950d-a6a9-4675-ae71-087d4ceff525
0e35461d-1454-46c9-9a92-32959fc34169	2025-11-11 12:13:05.547262	2025-11-11 12:13:05.547262	primary	358940c1-f3c5-4d57-a97b-8a6d0160c523	a7295cab-0299-493d-9870-3ed59a04cfaa
da80ca2c-6853-40ea-9b53-277c7e5fc879	2025-11-11 12:13:05.552327	2025-11-11 12:13:05.552327	primary	5ab413e1-3900-49f8-b327-804defdf135a	a7295cab-0299-493d-9870-3ed59a04cfaa
519ff190-7b85-43a2-b538-d7716f2f27e7	2025-11-11 12:13:05.556587	2025-11-11 12:13:05.556587	primary	3372910c-349f-42e7-8543-94e7eddf8ab1	a7295cab-0299-493d-9870-3ed59a04cfaa
74fa522c-3264-455a-a05d-5eaec5e283cc	2025-11-11 12:13:05.566845	2025-11-11 12:13:05.566845	primary	1bee8fe8-9344-4053-a7b2-e6a6a7a8e7b4	a7295cab-0299-493d-9870-3ed59a04cfaa
14e486a6-9990-4d92-8f40-b81fa1185c55	2025-11-11 12:13:05.570151	2025-11-11 12:13:05.570151	primary	299709b5-90a6-41a3-85ea-8fd1d0816f98	a7295cab-0299-493d-9870-3ed59a04cfaa
ab0974fe-65ed-4252-91ac-38a44b3cfe4f	2025-11-11 12:13:05.574529	2025-11-11 12:13:05.574529	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	a7295cab-0299-493d-9870-3ed59a04cfaa
102a00ad-3b2e-4dca-9d79-2c861b2edf81	2025-11-11 12:13:05.582174	2025-11-11 12:13:05.582174	primary	baaa9855-6128-48b6-9104-41ee541d3b81	a7295cab-0299-493d-9870-3ed59a04cfaa
ec4af0e6-4129-4fb4-ab57-7b39f34bb00f	2025-11-11 12:13:05.585346	2025-11-11 12:13:05.585346	primary	7fbfd6a6-2690-4f51-8448-c062002de596	a7295cab-0299-493d-9870-3ed59a04cfaa
d55c3f97-8b2e-4b77-a148-bad31c3b2e33	2025-11-11 12:13:05.588361	2025-11-11 12:13:05.588361	primary	a08a9fe9-2632-4e33-9d2f-13cd194061d4	a7295cab-0299-493d-9870-3ed59a04cfaa
71e92ccd-5c6a-497a-82aa-df714f67377a	2025-10-15 08:49:17.780716	2025-10-15 08:49:17.780716	primary	5160b41b-d5e8-47ec-897a-5b69f59e9780	c99c3f5b-e7ef-4695-ace9-89326973345b
9aa857c3-f386-4d5e-8c7f-5e6068c9f86e	2025-10-15 08:49:17.787378	2025-10-15 08:49:17.787378	primary	66f343bd-2ffe-45df-af78-1d9667ec0e23	c99c3f5b-e7ef-4695-ace9-89326973345b
56231c0d-536b-4221-9ffe-7c0cc8e065c5	2025-10-15 08:49:17.795895	2025-10-15 08:49:17.795895	primary	a74e23b0-2d96-420d-a954-ee0aadc4e891	c99c3f5b-e7ef-4695-ace9-89326973345b
07ea1628-c8d5-427b-b220-cac8620c4f61	2025-10-15 08:49:17.802397	2025-10-15 08:49:17.802397	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	c99c3f5b-e7ef-4695-ace9-89326973345b
47ee7c68-31f2-4179-9fb6-624963443326	2025-11-11 12:13:05.594824	2025-11-11 12:13:05.594824	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	a7295cab-0299-493d-9870-3ed59a04cfaa
b8127f45-983f-438e-8f74-14a6ab5a8548	2025-11-11 12:13:05.599958	2025-11-11 12:13:05.599958	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	a7295cab-0299-493d-9870-3ed59a04cfaa
e8898b2d-7c66-45b9-a815-75b89ee285df	2025-11-11 12:13:05.60358	2025-11-11 12:13:05.60358	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	a7295cab-0299-493d-9870-3ed59a04cfaa
89ce52e3-4aaa-4259-a794-5b61a20ed664	2025-11-19 22:17:43.474487	2025-11-19 22:17:43.474487	primary	5b8c870c-a288-4246-a804-0ce87b81cfc0	b7637e6b-e023-4347-9cce-d51e7aacaab4
75285e9d-07ed-488d-8476-1539bdd74c6e	2025-10-15 10:06:32.054367	2025-10-15 10:06:32.054367	primary	5ab413e1-3900-49f8-b327-804defdf135a	c54a59ea-014a-4dc9-8576-3c655c835d02
244c1666-42f1-430c-830d-37acd3975a2a	2025-10-15 10:06:32.058145	2025-10-15 10:06:32.058145	primary	358940c1-f3c5-4d57-a97b-8a6d0160c523	c54a59ea-014a-4dc9-8576-3c655c835d02
3d289162-79c5-483e-9616-9039c0e2b814	2025-10-15 10:06:32.065728	2025-10-15 10:06:32.065728	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	c54a59ea-014a-4dc9-8576-3c655c835d02
c0de74d8-0b8d-4606-b25f-d11a0ff900f0	2025-10-15 10:06:32.068881	2025-10-15 10:06:32.068881	primary	299709b5-90a6-41a3-85ea-8fd1d0816f98	c54a59ea-014a-4dc9-8576-3c655c835d02
f96a963b-a3fa-439c-ad54-31b27d1ee7a6	2025-10-15 10:06:32.07595	2025-10-15 10:06:32.07595	primary	a08a9fe9-2632-4e33-9d2f-13cd194061d4	c54a59ea-014a-4dc9-8576-3c655c835d02
1bd1468d-7bc1-4fc6-817c-ab7fabb2b78b	2025-10-15 10:06:32.079222	2025-10-15 10:06:32.079222	primary	7fbfd6a6-2690-4f51-8448-c062002de596	c54a59ea-014a-4dc9-8576-3c655c835d02
79a605c2-d515-4684-bbb9-94186e42cafe	2025-10-15 10:06:32.085175	2025-10-15 10:06:32.085175	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	c54a59ea-014a-4dc9-8576-3c655c835d02
e8fd9d74-e015-42bb-a468-a7ae7dfcd0e0	2025-10-15 10:06:32.088262	2025-10-15 10:06:32.088262	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	c54a59ea-014a-4dc9-8576-3c655c835d02
30ccce2b-a666-491a-976a-bfe65901ae77	2025-11-19 22:17:43.494414	2025-11-19 22:17:43.494414	primary	7fbfd6a6-2690-4f51-8448-c062002de596	b7637e6b-e023-4347-9cce-d51e7aacaab4
3147edf9-45ea-4e04-a22b-7e8b44bba305	2025-11-19 22:17:43.534644	2025-11-19 22:17:43.534644	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	b7637e6b-e023-4347-9cce-d51e7aacaab4
799db6c5-e37b-481c-a4c3-349ed5c00a20	2025-11-19 22:17:43.554591	2025-11-19 22:17:43.554591	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	b7637e6b-e023-4347-9cce-d51e7aacaab4
9c53c128-18b1-47b8-a01b-4653d25bb732	2025-11-19 22:17:43.57461	2025-11-19 22:17:43.57461	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	b7637e6b-e023-4347-9cce-d51e7aacaab4
14cc9c0d-4826-428a-b4d2-43c1f61e6097	2025-11-19 22:18:19.513691	2025-11-19 22:18:19.513691	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	b7637e6b-e023-4347-9cce-d51e7aacaab4
796a715f-d455-450a-b6a7-ec5f41301ea4	2025-11-19 22:18:19.513691	2025-11-19 22:18:19.513691	primary	ef0cfd01-56d6-4f73-abaf-da0ef78c1f22	b7637e6b-e023-4347-9cce-d51e7aacaab4
c6d0e928-482c-4562-96b6-6830e8ce74e8	2025-11-19 22:18:19.513691	2025-11-19 22:18:19.513691	primary	66f343bd-2ffe-45df-af78-1d9667ec0e23	b7637e6b-e023-4347-9cce-d51e7aacaab4
811490bf-0bf2-4dc3-a476-7ffb265119ee	2025-11-19 22:18:34.908009	2025-11-19 22:18:34.908009	primary	5ab413e1-3900-49f8-b327-804defdf135a	b7637e6b-e023-4347-9cce-d51e7aacaab4
464afebb-d514-4f4c-983e-13f12312060e	2025-11-19 22:18:34.908009	2025-11-19 22:18:34.908009	primary	3372910c-349f-42e7-8543-94e7eddf8ab1	b7637e6b-e023-4347-9cce-d51e7aacaab4
c2d6d0b1-96b7-482c-b692-8bc003adc9f4	2025-10-16 09:10:30.271273	2025-10-16 09:10:30.271273	primary	5160b41b-d5e8-47ec-897a-5b69f59e9780	533f6786-0f97-4267-8977-6541522033b6
43e5be26-c4c7-4bcc-82d5-17512da19338	2025-10-16 09:10:30.280274	2025-10-16 09:10:30.280274	primary	66f343bd-2ffe-45df-af78-1d9667ec0e23	533f6786-0f97-4267-8977-6541522033b6
29c51485-a5e5-4154-ad10-ba0b470b503b	2025-10-16 09:10:30.290186	2025-10-16 09:10:30.290186	primary	a08a9fe9-2632-4e33-9d2f-13cd194061d4	533f6786-0f97-4267-8977-6541522033b6
da6f5dd8-a8f7-4120-8df9-fa985ee26181	2025-10-16 09:10:30.297028	2025-10-16 09:10:30.297028	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	533f6786-0f97-4267-8977-6541522033b6
0961e2ac-2c03-497f-94cd-86a090386138	2025-10-16 10:09:43.751525	2025-10-16 10:09:43.751525	primary	5ab413e1-3900-49f8-b327-804defdf135a	57cecea5-da12-43dd-ae7c-66cd38408047
8223383a-8f19-48fd-b21e-3e085d462cd5	2025-10-16 10:09:43.756381	2025-10-16 10:09:43.756381	primary	df77618d-14e7-4d21-a66e-53f0d5757072	57cecea5-da12-43dd-ae7c-66cd38408047
403a05b2-f9ed-4f1e-b562-a1f493a770ad	2025-10-16 10:09:43.764118	2025-10-16 10:09:43.764118	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	57cecea5-da12-43dd-ae7c-66cd38408047
1e4731fc-156c-4f36-a9db-9d1a384e78e5	2025-10-16 10:09:43.770748	2025-10-16 10:09:43.770748	primary	536e2437-49f2-40e6-81a4-82c8fa19f907	57cecea5-da12-43dd-ae7c-66cd38408047
5183c2fa-cfbc-44f2-9c63-82c2d0a3de9d	2025-10-16 10:09:43.78005	2025-10-16 10:09:43.78005	primary	7fbfd6a6-2690-4f51-8448-c062002de596	57cecea5-da12-43dd-ae7c-66cd38408047
dd2be9a6-f01a-4df8-bbbe-4681da4b1465	2025-10-16 10:09:43.783709	2025-10-16 10:09:43.783709	primary	5b8c870c-a288-4246-a804-0ce87b81cfc0	57cecea5-da12-43dd-ae7c-66cd38408047
145d144e-4ad1-4651-bd8e-617bd3e0b468	2025-10-16 10:09:43.791317	2025-10-16 10:09:43.791317	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	57cecea5-da12-43dd-ae7c-66cd38408047
9f0d0035-2665-404d-9107-b8214f30e889	2025-10-16 10:09:43.794504	2025-10-16 10:09:43.794504	primary	33a3b170-1a61-48da-add0-3b24678dbb4f	57cecea5-da12-43dd-ae7c-66cd38408047
c0d6a364-8d43-44ee-b54a-9ae1ab30682d	2025-10-20 09:15:22.469442	2025-10-20 09:15:22.469442	primary	358940c1-f3c5-4d57-a97b-8a6d0160c523	2bf56a47-a901-41d8-8f4d-d5a8b9609328
c237cba6-16b9-4292-85d0-6a4693405927	2025-10-20 09:15:22.473682	2025-10-20 09:15:22.473682	primary	5ab413e1-3900-49f8-b327-804defdf135a	2bf56a47-a901-41d8-8f4d-d5a8b9609328
0210d61c-8b58-42d8-824d-9610d1e2f218	2025-10-20 09:15:22.4777	2025-10-20 09:15:22.4777	primary	3372910c-349f-42e7-8543-94e7eddf8ab1	2bf56a47-a901-41d8-8f4d-d5a8b9609328
b5cc3a9e-8348-4bd6-88e0-3780c7f24047	2025-10-20 09:15:22.484488	2025-10-20 09:15:22.484488	primary	1bee8fe8-9344-4053-a7b2-e6a6a7a8e7b4	2bf56a47-a901-41d8-8f4d-d5a8b9609328
3c425a6f-e5e3-4cc6-8217-a4e056138454	2025-10-20 09:15:22.487716	2025-10-20 09:15:22.487716	primary	299709b5-90a6-41a3-85ea-8fd1d0816f98	2bf56a47-a901-41d8-8f4d-d5a8b9609328
0524d59b-ff9d-4289-8a63-d6a266d4f207	2025-10-20 09:15:22.490869	2025-10-20 09:15:22.490869	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	2bf56a47-a901-41d8-8f4d-d5a8b9609328
ac6f2bbb-7391-4405-a12f-c9876aa9170d	2025-10-20 09:15:22.498849	2025-10-20 09:15:22.498849	primary	baaa9855-6128-48b6-9104-41ee541d3b81	2bf56a47-a901-41d8-8f4d-d5a8b9609328
5c0e4825-7cc9-4043-9bcc-ed3931d10504	2025-10-20 09:15:22.502027	2025-10-20 09:15:22.502027	primary	7fbfd6a6-2690-4f51-8448-c062002de596	2bf56a47-a901-41d8-8f4d-d5a8b9609328
18177041-44d5-4876-b375-68e206ec6937	2025-10-20 09:15:22.505278	2025-10-20 09:15:22.505278	primary	a08a9fe9-2632-4e33-9d2f-13cd194061d4	2bf56a47-a901-41d8-8f4d-d5a8b9609328
52fdd41c-5893-459d-af2a-f8f042992c4e	2025-10-20 09:15:22.51257	2025-10-20 09:15:22.51257	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	2bf56a47-a901-41d8-8f4d-d5a8b9609328
9f703c33-ff2e-4857-a370-1fedf990e3ad	2025-10-20 09:15:22.515907	2025-10-20 09:15:22.515907	primary	4b7af087-dbc5-4294-ad3d-57feaca6f119	2bf56a47-a901-41d8-8f4d-d5a8b9609328
0ebf608a-1f45-45e5-9a2e-5a47e9a28e07	2025-10-20 09:15:22.518906	2025-10-20 09:15:22.518906	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	2bf56a47-a901-41d8-8f4d-d5a8b9609328
e70f100a-98d5-4836-b28f-60f8352f6261	2025-11-19 22:18:34.908009	2025-11-19 22:18:34.908009	primary	df77618d-14e7-4d21-a66e-53f0d5757072	b7637e6b-e023-4347-9cce-d51e7aacaab4
0f590364-980c-43d7-9cff-9b0c01a4fdb0	2025-11-20 07:48:35.007712	2025-11-20 07:48:35.007712	primary	3372910c-349f-42e7-8543-94e7eddf8ab1	9eec7d5d-740f-49cb-8be4-db3e52ab59d0
31fea0f2-9074-41c7-84e2-22e04675eb5d	2025-11-20 07:48:35.03041	2025-11-20 07:48:35.03041	primary	5ab413e1-3900-49f8-b327-804defdf135a	9eec7d5d-740f-49cb-8be4-db3e52ab59d0
46fc43c3-7c8b-494f-aa27-fe14fbe8042f	2025-11-20 07:48:35.066767	2025-11-20 07:48:35.066767	primary	66f343bd-2ffe-45df-af78-1d9667ec0e23	9eec7d5d-740f-49cb-8be4-db3e52ab59d0
ccb897b4-db98-4ce5-a2f9-664d12db99fa	2025-11-20 07:48:35.084924	2025-11-20 07:48:35.084924	primary	ef0cfd01-56d6-4f73-abaf-da0ef78c1f22	9eec7d5d-740f-49cb-8be4-db3e52ab59d0
f234b7a5-a180-49ea-8f49-800c36771a79	2025-11-20 07:48:35.122305	2025-11-20 07:48:35.122305	primary	5b8c870c-a288-4246-a804-0ce87b81cfc0	9eec7d5d-740f-49cb-8be4-db3e52ab59d0
2a72fc38-dc21-437a-8eb0-51777776d365	2025-11-20 07:48:35.140474	2025-11-20 07:48:35.140474	primary	7fbfd6a6-2690-4f51-8448-c062002de596	9eec7d5d-740f-49cb-8be4-db3e52ab59d0
e1eb7b02-8630-403c-967c-e86e50385a2b	2025-11-20 07:48:35.176897	2025-11-20 07:48:35.176897	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	9eec7d5d-740f-49cb-8be4-db3e52ab59d0
5bb0ff6c-d836-44bf-b039-792b2083c52c	2025-11-25 07:52:08.620904	2025-11-25 07:52:08.620904	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	5b26671d-5d53-4373-a113-c0339a4bbed3
40957ef0-6238-4728-bbb3-e2c80dfc358a	2025-11-25 07:52:08.620904	2025-11-25 07:52:08.620904	primary	ef0cfd01-56d6-4f73-abaf-da0ef78c1f22	5b26671d-5d53-4373-a113-c0339a4bbed3
a72377a6-b260-418d-b50c-fa5ff58c3b71	2025-11-25 07:52:08.620904	2025-11-25 07:52:08.620904	primary	66f343bd-2ffe-45df-af78-1d9667ec0e23	5b26671d-5d53-4373-a113-c0339a4bbed3
5c1deacf-5116-4fdf-9f41-faa83a07991f	2025-11-26 11:28:48.912466	2025-11-26 11:28:48.912466	primary	3372910c-349f-42e7-8543-94e7eddf8ab1	cf89e290-f3c0-4a46-a443-b21e3c27b925
4a4fccdf-d4d6-42d3-bcf4-e89a379739e4	2025-11-26 11:28:49.270785	2025-11-26 11:28:49.270785	primary	5ab413e1-3900-49f8-b327-804defdf135a	cf89e290-f3c0-4a46-a443-b21e3c27b925
8431a800-1a5b-4b85-b214-4373f0c4c00b	2025-11-26 11:28:49.634817	2025-11-26 11:28:49.634817	primary	358940c1-f3c5-4d57-a97b-8a6d0160c523	cf89e290-f3c0-4a46-a443-b21e3c27b925
2f22f6aa-cc02-4d9b-b847-aad3c7e48260	2025-11-26 11:28:50.364255	2025-11-26 11:28:50.364255	primary	66f343bd-2ffe-45df-af78-1d9667ec0e23	cf89e290-f3c0-4a46-a443-b21e3c27b925
b888d607-06c8-405c-b8b0-fb82253244b7	2025-11-26 11:28:50.724037	2025-11-26 11:28:50.724037	primary	ef0cfd01-56d6-4f73-abaf-da0ef78c1f22	cf89e290-f3c0-4a46-a443-b21e3c27b925
59666ca1-703f-4446-8ddb-6d5a5af8a2a8	2025-11-26 11:28:51.096091	2025-11-26 11:28:51.096091	primary	7b610c2d-82ac-4ffc-bd61-36a424b8bd57	cf89e290-f3c0-4a46-a443-b21e3c27b925
44acb8b9-dd7e-484f-80ce-d2894f8af0e4	2025-11-26 11:28:53.513971	2025-11-26 11:28:53.513971	primary	5a91c6b0-c0d8-4eb3-90ea-dd01a59ea976	cf89e290-f3c0-4a46-a443-b21e3c27b925
bfa6a264-857f-4804-86a3-e2bbc7874f41	2025-11-26 11:28:53.872363	2025-11-26 11:28:53.872363	primary	a6b0724e-2ff6-4188-a6b0-0703640d2354	cf89e290-f3c0-4a46-a443-b21e3c27b925
4614a3e5-7b44-479b-9658-e161678695fb	2025-11-26 11:28:54.234855	2025-11-26 11:28:54.234855	primary	d23e16b5-b2db-4cf0-9af4-a0c56e7a7db7	cf89e290-f3c0-4a46-a443-b21e3c27b925
dd21859c-ff4f-487c-9cf0-b529b2c93da5	2025-11-26 11:32:06.426689	2025-11-26 11:32:06.426689	primary	7fbfd6a6-2690-4f51-8448-c062002de596	cf89e290-f3c0-4a46-a443-b21e3c27b925
b0eed5e3-654f-4354-902a-9424dad96fd3	2025-11-26 11:32:06.426689	2025-11-26 11:32:06.426689	primary	a08a9fe9-2632-4e33-9d2f-13cd194061d4	cf89e290-f3c0-4a46-a443-b21e3c27b925
e195535f-cc71-4183-b8c7-a529f4c3eca8	2025-11-26 11:32:06.426689	2025-11-26 11:32:06.426689	primary	f8c415f7-0942-48ae-a91a-7e1bcc91bcc8	cf89e290-f3c0-4a46-a443-b21e3c27b925
c85388db-2983-4314-bd6c-214fe536b3c8	2025-11-26 12:28:37.53831	2025-11-26 12:28:37.53831	primary	5ab413e1-3900-49f8-b327-804defdf135a	5b26671d-5d53-4373-a113-c0339a4bbed3
e1cc1e17-5d98-4a02-923b-5bb8b0bd23d8	2025-11-26 12:28:37.53831	2025-11-26 12:28:37.53831	primary	3372910c-349f-42e7-8543-94e7eddf8ab1	5b26671d-5d53-4373-a113-c0339a4bbed3
43ee4c9a-b5da-422b-88f5-910488ba3645	2025-11-26 12:28:37.53831	2025-11-26 12:28:37.53831	primary	df77618d-14e7-4d21-a66e-53f0d5757072	5b26671d-5d53-4373-a113-c0339a4bbed3
c67d65a9-380d-40e1-b664-13904adcff19	2025-11-26 12:29:07.391466	2025-11-26 12:29:07.391466	primary	baaa9855-6128-48b6-9104-41ee541d3b81	5b26671d-5d53-4373-a113-c0339a4bbed3
959c870a-4097-4894-bf48-c02cb7e6eb83	2025-11-26 12:29:07.391466	2025-11-26 12:29:07.391466	primary	f8c415f7-0942-48ae-a91a-7e1bcc91bcc8	5b26671d-5d53-4373-a113-c0339a4bbed3
e9dfad21-7bc0-438d-9ca2-729a36e33aca	2025-11-26 12:29:07.391466	2025-11-26 12:29:07.391466	primary	a01acb4b-4acc-4428-9bee-dba9b3038ff8	5b26671d-5d53-4373-a113-c0339a4bbed3
\.


--
-- Data for Name: user_messages; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.user_messages (id, "createdAt", "updatedAt", "messageId", "isRead", "viewedAt", "userId") FROM stdin;
247c8cd6-f19c-4a6e-a46a-b86989204ed6	2025-09-23 14:11:05.955913	2025-09-23 14:11:05.955913	b2b81d49-ce1e-428c-a0b1-c4b72413323e	f	\N	0301ca26-e2e1-470a-9aa3-9616cfee45e5
04955ff0-e743-4857-8aad-ce7a436561ec	2025-09-25 09:33:22.347876	2025-09-26 09:27:07.08529	2495659b-84fd-45c6-bf45-84f7c8df3949	t	2025-09-26 09:27:07.08	03dc138a-04da-4a0c-bd19-e9efbf238407
2dba5629-487f-48ca-a84c-232a65039cce	2025-10-01 15:21:08.596711	2025-10-01 15:21:37.90398	495af95a-0bfa-4c89-8172-64b1b3681d59	t	2025-10-01 15:21:37.9	dc72b8c0-f888-4282-a72b-553dd68ca0b0
8b02f082-68ca-417d-abfa-85ce359164c2	2025-10-08 12:44:22.823596	2025-10-08 12:44:22.823596	1cfd1141-2051-4a9e-a278-a7e5d3eb7cce	f	\N	0fbdc046-243e-45f4-88a5-e79014c042cc
74baf142-522a-4278-b464-e42a50020be2	2025-10-13 09:53:46.721363	2025-10-13 09:53:46.721363	22e6d564-3f5d-49f0-83c4-0c438393a427	f	\N	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
482c64a7-2fcb-4dcc-a99d-1fc50d59f685	2025-10-15 08:49:17.816817	2025-10-15 08:49:38.14507	f57fed8e-f7ec-4ec7-b123-34daafad070c	t	2025-10-15 08:49:38.142	c99c3f5b-e7ef-4695-ace9-89326973345b
382b199d-af09-4bc1-abf6-438c7435e3b6	2025-10-15 10:06:32.106069	2025-10-15 10:07:01.964916	75d6a421-8e80-4578-abab-72f81c263eba	t	2025-10-15 10:07:01.964	c54a59ea-014a-4dc9-8576-3c655c835d02
e8dbb038-50ff-48a5-87d8-5c06f94fac00	2025-10-16 09:10:30.316944	2025-10-16 09:10:30.316944	433dca08-98a5-4c85-800c-f6e49051add3	f	\N	533f6786-0f97-4267-8977-6541522033b6
69c91e41-6e73-4381-8bbc-dfab23a556dd	2025-10-16 10:09:43.809896	2025-10-16 10:09:43.809896	e85fca4a-13c5-48ad-be85-05fb152feb8d	f	\N	57cecea5-da12-43dd-ae7c-66cd38408047
5a1943d6-c3f1-4219-bf02-a97285b927ab	2025-10-20 09:15:22.538933	2025-10-20 09:29:08.895219	96ee9674-d8fa-4340-9122-4e569106e591	t	2025-10-20 09:29:08.895	2bf56a47-a901-41d8-8f4d-d5a8b9609328
2aa39854-390a-426f-9284-a0d0f3794622	2025-11-10 09:23:23.391869	2025-11-10 09:23:55.039074	8815079e-6919-4b06-82a3-c188759e9262	t	2025-11-10 09:23:55.039	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
a6b6828c-7671-4895-a22c-ecae490e2360	2025-11-13 13:11:05.318124	2025-11-13 13:11:05.318124	779bc3e8-4349-4fd1-a1bf-52de64e09a2a	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
f3647ff0-35bc-42e8-89c6-e7eeb829aba3	2025-11-13 13:15:04.371665	2025-11-13 13:15:04.371665	716ed627-60f1-4538-8b69-9146d2af6df7	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
19a95ded-b45d-4048-b116-9245521f6a23	2025-11-13 13:15:59.631408	2025-11-13 13:15:59.631408	3f7d6e62-1ca5-4a1b-9648-793725133bce	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
efad375b-b4cf-448d-9b2a-77ce2195b996	2025-11-13 13:17:21.347491	2025-11-13 13:17:21.347491	82150b4e-e29e-4250-9d44-f10e696c31b7	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
e9a86a22-5dce-4783-b1b6-7850c45a6e6d	2025-11-17 15:52:06.370667	2025-11-17 15:52:06.370667	c67639bd-3489-4722-a6f1-4e2a2de894b6	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
cffa3500-9847-4aef-83c8-36487d0d490d	2025-11-17 15:53:44.495608	2025-11-17 15:53:44.495608	14c76931-8b72-4856-be74-258a46fbbb22	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
a762258e-adcf-49eb-a7d4-7ea4ddbb5d27	2025-11-17 16:35:43.518104	2025-11-17 16:35:43.518104	f84ee3c2-e1e6-419c-aa91-7169026b122d	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
c3eabc5c-6f9e-4c67-950d-4c3f979d9871	2025-11-19 17:19:11.213976	2025-11-19 17:19:11.213976	5c575b2f-2700-442c-aa03-909d318934af	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
13a0f241-2905-40b6-a137-d17c2359099b	2025-11-19 17:21:31.244756	2025-11-19 17:21:31.244756	f48765fd-1e77-4233-839b-d66d924e17c0	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
6e4274c7-e264-4f8a-8ac9-2b859e402ae3	2025-11-19 17:29:51.372626	2025-11-19 17:29:51.372626	b925cdb0-a4a2-4d06-b21d-fa8af281f809	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
c23759d7-2b98-4b78-a2a2-57eeb4690ffa	2025-11-19 17:32:41.352631	2025-11-19 17:32:41.352631	37b7b2e9-8e72-49a5-b14a-1fff8eb5f6aa	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
66f9d7eb-c9a0-41af-a971-05cb77e20df0	2025-11-19 17:37:51.911467	2025-11-19 17:37:51.911467	a099aab9-fa1c-47ab-9c88-26e3358f6b9f	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
f8c12635-c9d2-4775-9b8d-db7d9efdfaf4	2025-11-19 17:39:11.295728	2025-11-19 17:39:11.295728	02af428e-f819-4c9f-88c0-fa53146396a7	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
a8b9888e-139c-4fa5-ada6-1bb4bb6ca4ad	2025-11-19 17:39:12.96488	2025-11-19 17:39:12.96488	7c491085-5fb6-4c11-bc71-e47d53291015	f	\N	c99c3f5b-e7ef-4695-ace9-89326973345b
452ea683-b5f1-4f2c-92e4-eb4da5aa8462	2025-11-19 17:39:14.639861	2025-11-19 17:39:14.639861	2f9585b4-cbc8-46fb-b966-94395b428517	f	\N	a7295cab-0299-493d-9870-3ed59a04cfaa
2f7b7e95-694f-4970-a22a-b87032e7e8a2	2025-11-19 18:12:31.313174	2025-11-19 18:12:31.313174	d4380b5f-a808-4263-830b-a838bd07c690	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
5ae4889c-d952-4f74-b6c1-db38a299a146	2025-11-19 19:43:40.036164	2025-11-19 19:43:40.036164	b2d4f232-f538-4959-bb87-cdc118c3b510	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
3751187b-3ffa-472d-878e-14f58290edb2	2025-11-19 19:43:40.245661	2025-11-19 19:43:40.245661	1df8cd9a-56db-47ba-b2d1-226b657d2dbe	f	\N	a7295cab-0299-493d-9870-3ed59a04cfaa
4ddf9358-4fba-456c-91f0-7efc4449f348	2025-11-19 19:43:40.408585	2025-11-19 19:43:40.408585	81a663df-030d-4d32-8ef0-9989e39b8135	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
6b4a2b16-2a9a-4415-a1ea-14f86acf1871	2025-11-19 19:43:40.550875	2025-11-19 19:43:40.550875	0adc6ee4-f21b-4678-97cb-be9dda5efcaa	f	\N	a7295cab-0299-493d-9870-3ed59a04cfaa
f605de0f-f919-4f10-ab91-53ff034a7167	2025-11-19 19:43:41.012638	2025-11-19 19:43:41.012638	d54a5cd7-dbd3-439a-b864-254e6344bbcc	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
2dd0ba48-f6c0-4fc3-9f0a-6d5eec99b076	2025-11-19 19:43:43.341359	2025-11-19 19:43:43.341359	dd9d85e5-03f2-42f4-8f89-2a95f6a07809	f	\N	a7295cab-0299-493d-9870-3ed59a04cfaa
ff9bb8ed-30e7-4ab8-8d8d-bfbe4450dd62	2025-11-19 21:55:10.054921	2025-11-19 21:55:10.054921	8e71c052-f30f-4e6e-b8e4-5ca56d719510	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
3e69e1e3-7198-46af-a5c2-8424b2c2e047	2025-11-19 21:55:10.236432	2025-11-19 21:55:10.236432	6635403d-7a66-4489-8149-9e1dd505e906	f	\N	a7295cab-0299-493d-9870-3ed59a04cfaa
1852ac6f-db25-4e9f-ba4d-3648ad3ed2b2	2025-11-19 21:55:10.399361	2025-11-19 21:55:10.399361	b8bdfed5-ce38-4a44-b1f5-299bb09e1d85	f	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
4e6563da-15b2-498d-bfbc-12f704845647	2025-11-19 21:55:10.554805	2025-11-19 21:55:10.554805	beae5038-4181-4847-a88f-7b5f838a77a1	f	\N	a7295cab-0299-493d-9870-3ed59a04cfaa
d29928a5-a788-4634-93c5-eaf7439872f4	2025-11-19 22:38:20.05717	2025-11-19 22:38:20.05717	87063285-7d36-4a96-8b67-b0c26c92a5d2	f	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0
47262d35-5cb2-4448-a8a6-7fcb231d832a	2025-11-19 22:38:20.209894	2025-11-19 22:38:20.209894	0513a0c6-bd04-4f0e-a6b6-435d23e8fb99	f	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0
3443aaec-28a1-470a-a7e0-de484f777f28	2025-11-19 22:52:40.048019	2025-11-19 22:52:40.048019	cd10dc8d-9aad-4212-97d5-211279b35f94	f	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0
8e57a6e6-5883-4696-9ea5-67a13f938a80	2025-11-19 22:52:40.205127	2025-11-19 22:52:40.205127	21b8065c-e22c-4e69-a5e8-f6a1f682f362	f	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0
f27ef405-fa50-42dd-bdfd-5c2186a2d32e	2025-11-19 22:53:00.05574	2025-11-19 22:53:15.707004	f9f3fce3-fecf-45b6-aad8-680ef2bdd904	t	2025-11-19 22:53:15.699	b7637e6b-e023-4347-9cce-d51e7aacaab4
f6fe2345-47ea-4a15-8284-6758dd4b1cf6	2025-11-19 22:53:20.046801	2025-11-19 22:53:20.046801	18988d7f-0dbc-4127-a89e-87d8a8b24c8c	f	\N	ac26d78c-33db-4bbd-a387-bf38ff39ca23
e8e4b15b-1f1e-45a4-adc5-80cc12b3e2cc	2025-11-19 22:56:00.055236	2025-11-19 22:56:00.055236	c5efcaf0-e93a-4171-adc0-af78e3d76550	f	\N	b7637e6b-e023-4347-9cce-d51e7aacaab4
98149264-1a06-4109-8077-f9625ed65d62	2025-11-19 22:56:00.347863	2025-11-19 22:56:00.347863	91caf40f-ed26-4812-84bb-a3652557a419	f	\N	b7637e6b-e023-4347-9cce-d51e7aacaab4
7e342ca3-25b7-4776-932e-43c80678d2fb	2025-11-19 22:56:01.156258	2025-11-19 22:58:32.668539	c3b8ecc9-d5c4-433e-a17c-da6156ff807a	t	2025-11-19 22:58:32.66	b7637e6b-e023-4347-9cce-d51e7aacaab4
da279300-4364-4a2d-ba5e-b834bb4fd134	2025-11-19 22:56:00.200755	2025-11-19 23:01:18.2241	5ad60f56-7bb8-4c0b-a91c-162263a31f78	t	2025-11-19 23:01:18.216	b7637e6b-e023-4347-9cce-d51e7aacaab4
81b2b8e4-40ef-4a76-8fc7-7c4674a556ed	2025-11-19 22:59:50.059502	2025-11-19 23:02:20.686595	e7e4679e-f689-48c0-b3e4-557bebbae319	t	2025-11-19 23:02:20.679	b7637e6b-e023-4347-9cce-d51e7aacaab4
ba1b154f-d920-4b55-9b23-97647f1c8699	2025-11-19 23:24:31.212777	2025-11-19 23:24:31.212777	507b8072-c9f3-47a7-8c59-378e435ddbee	f	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0
331c9bdd-c0ec-4096-bb6a-fa28076efb34	2025-11-19 23:24:33.232921	2025-11-19 23:24:33.232921	fa2de157-6107-4abc-bf9a-78395105f08d	f	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0
1038e19a-b124-40cc-9d23-c1522c1dd409	2025-11-19 23:24:50.047434	2025-11-19 23:24:50.047434	4e7e9bca-210d-45b8-b39e-3a151256a092	f	\N	ac26d78c-33db-4bbd-a387-bf38ff39ca23
0dd63c05-184c-4fc0-98cc-23f3836a9548	2025-11-19 23:25:20.051171	2025-11-19 23:25:20.051171	9d6b0152-a4cc-434d-9bdf-b19c9d33b5e3	f	\N	03dc138a-04da-4a0c-bd19-e9efbf238407
dd29e889-5369-4036-aa7a-152f446582cd	2025-11-19 23:25:20.194512	2025-11-19 23:25:20.194512	4e265752-9d3c-4b65-9540-5b3b3a1741c1	f	\N	03dc138a-04da-4a0c-bd19-e9efbf238407
e5017a00-58c2-48fd-a7fe-4e10f690e196	2025-11-19 23:26:20.053869	2025-11-19 23:26:20.053869	5601cae4-6bf4-44c6-9d75-cf39f223c80f	f	\N	0301ca26-e2e1-470a-9aa3-9616cfee45e5
ffd7c467-2c22-4b3e-a9be-d6e70acea808	2025-11-19 23:26:20.217453	2025-11-19 23:26:20.217453	086a322e-0963-4eff-acec-64789d4f1172	f	\N	0301ca26-e2e1-470a-9aa3-9616cfee45e5
44537d31-70e3-4ee6-a02c-c34b0b4acc84	2025-11-19 23:26:30.212693	2025-11-19 23:26:30.212693	403de9d9-5d36-41a4-b88a-980eb8263cc2	f	\N	2f9a73de-22e5-45c4-90c5-ab909821d182
b96abf51-e722-4013-a5a7-b7361eb5d693	2025-11-19 23:26:50.051169	2025-11-19 23:26:50.051169	303d0cf3-8b08-420d-a9a2-7348c812d545	f	\N	aa8c967f-24be-49f1-be7e-d449e9d17246
985bee5f-5420-4ff1-b127-4c7dd1fd894e	2025-11-19 23:25:30.048703	2025-11-20 00:19:15.208255	13a42624-2d79-480f-ab1c-bb42ed9e1730	t	2025-11-20 00:19:15.2	c74b2ec1-5e33-420f-aaa7-adac48e5221c
e334929f-070f-40ba-9525-1ab17b5d8772	2025-11-25 08:50:49.981563	2025-11-25 09:03:35.086734	f746247d-75a4-4736-8fd7-5ae4017ec479	t	2025-11-25 09:03:34.334	5b26671d-5d53-4373-a113-c0339a4bbed3
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.users ("createdAt", "updatedAt", "phoneNumber", email, name, password, "isVerified", "profilePicture", "countryCode", "idNumber", gender, birthdate, address, "expiryDate", "imageFront", "imageBack", "selfieImage", "mailId", pin, "primaryLanguageId", "secondaryLanguageId", id) FROM stdin;
2025-11-23 23:55:41.389021	2025-11-23 23:55:45.763353	+2348066298572	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1e7be232-2070-4bce-b7fa-a0fee732d867
2025-11-20 07:58:30.9303	2025-11-20 08:15:56.962615	+34675858451	\N	SALIFU MUTARU	\N	t	\N	GH	GH4365603	Male	1989-08-10	\N	2028-12-04	https://uniti-id-images.s3.amazonaws.com/5b26671d-5d53-4373-a113-c0339a4bbed3/front.jpg	https://uniti-id-images.s3.amazonaws.com/5b26671d-5d53-4373-a113-c0339a4bbed3/back.jpg	https://uniti-id-images.s3.amazonaws.com/5b26671d-5d53-4373-a113-c0339a4bbed3/selfie.jpg	\N	\N	\N	\N	5b26671d-5d53-4373-a113-c0339a4bbed3
2025-11-24 10:14:05.273583	2025-11-24 10:14:18.872079	+34684202021	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ba3b21ba-a89a-4252-90a2-3fcf35633b5d
2025-09-15 08:53:23.912925	2025-09-15 08:57:49.324805	+34684181620	\N	DAR Majid	\N	t	\N	GH	NIE:Y4786220A	Male	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/b79363e5-730c-4875-b9fc-0f770a21dd6b.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/0b84b757-b57e-421d-a587-28ce9e0300cf.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/b2670ecc-1a6a-434d-8887-346d05a21899.jpeg	\N	\N	\N	\N	aa8c967f-24be-49f1-be7e-d449e9d17246
2025-09-14 09:29:18.438158	2025-09-14 09:30:40.853096	+2347031352657	\N	Joe	\N	t	\N	GH	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	65d9a651-17e6-42d9-a893-ef4a285e33d7
2025-09-16 12:24:51.332888	2025-09-16 12:24:54.310947	+34698547852	\N	Kratos	\N	t	\N	GH	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	697315e5-16dc-48af-9121-b723ea475f13
2025-09-15 12:25:30.129598	2025-09-15 12:29:28.286108	+2348068652575	\N	MAJE NORTH NIGER I SULEJA	\N	t	\N	GH	\N	Male	\N	\N	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/d46e90a3-850d-4c18-a1fb-6bc3964afa4f.jpeg	\N	\N	\N	\N	2f9a73de-22e5-45c4-90c5-ab909821d182
2025-09-23 14:08:08.797519	2025-09-23 14:11:05.862411	+34678546139	\N	SALIFU MUTARU	\N	t	\N	GH	3339716873	Male	1916-01-10	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/d2907ca4-5ca3-465f-9459-2c9fc09982c5.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/bd401af7-09dd-46cd-b5b5-c07f2baf9200.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/c9980db4-2ad9-45d0-ac74-f881bc72ef9e.jpeg	\N	\N	\N	\N	0301ca26-e2e1-470a-9aa3-9616cfee45e5
2025-11-19 22:02:36.401153	2025-11-19 22:17:43.231465	+34678546785	\N	SALIFU MUTARU	\N	t	\N	GH	GM4365603	Male	1989-08-10	\N	2028-12-04	file:///data/user/0/com.unitinetworks.qa/cache/mrousavy5278409912933040964.jpg	file:///data/user/0/com.unitinetworks.qa/cache/mrousavy3919619419303464196.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_8dccbcfa-0e14-43ed-90ae-204645cc944c.jpg	\N	\N	\N	\N	b7637e6b-e023-4347-9cce-d51e7aacaab4
2025-09-12 00:21:48.720307	2025-09-12 00:24:59.704532	+233543344100	\N	SALIFU MUTARU	\N	t	\N	GH	GHA0004431576	Male	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/b0bb1411-b93f-4795-a72a-e3bac83573a2.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/d76ce2de-471a-47b1-b6d1-db7ff68199d0.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/ef66fca7-9f28-4e77-bf03-3d694578efd7.jpeg	\N	\N	\N	\N	c74b2ec1-5e33-420f-aaa7-adac48e5221c
2025-11-24 10:35:27.751034	2025-11-24 10:35:29.682237	+34684202022	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	d55b1f92-5ba2-45ae-bddc-f8f6605c4d7b
2025-11-24 10:39:20.55109	2025-11-24 10:39:21.742261	+34684202020	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ce280152-acaa-46cb-8164-16e9bcd455d6
2025-11-24 13:26:23.28643	2025-11-24 13:26:26.14481	+34678585421	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	fb71b3a9-73f8-4d3f-9649-0d8c11f46295
2025-09-23 13:21:07.84633	2025-09-25 09:33:22.275484	+34684201815	\N	DAR Kamiar Majid	\N	t	\N	GH	Y4786220A	Male	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/76353aa6-c302-48f0-820a-6c1952eecd18.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/50d2c0e2-095b-4b1f-9d9e-6eef99ad52a8.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/7d610e67-4581-4011-b283-e8e6f453579f.jpeg	\N	\N	\N	\N	03dc138a-04da-4a0c-bd19-e9efbf238407
2025-09-12 14:24:27.668817	2025-09-12 14:36:26.89388	+34684201816	\N	BARCELONA BARCELONA	\N	t	\N	GH	Y4786220A	Male	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/b3910825-cb99-4df8-bae0-59fee6b82d0e.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/2d983325-a106-466c-aebf-9abc35d77406.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/cca459c0-5d26-49b2-bafe-dd814d110582.jpeg	\N	\N	\N	\N	ac26d78c-33db-4bbd-a387-bf38ff39ca23
2025-10-01 15:17:55.644083	2025-10-01 15:21:08.510065	+34678533333	\N	SALIFU MUTARU	\N	t	\N	GH	GH4365603	Male	1989-08-10	\N	2028-12-04	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/f08a01d8-1b55-40e3-836a-f330401699ec.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/60c0d431-2310-48a0-84ca-56695b9ea053.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/e15f264e-1c9a-40c3-a05e-224f7416917e.jpeg	\N	\N	\N	\N	dc72b8c0-f888-4282-a72b-553dd68ca0b0
2025-10-08 12:37:33.989273	2025-10-08 12:44:22.744469	+233202001245	\N	JOJO QUANSAH	\N	t	\N	GH	AU9330407	Male	1985-04-29	\N	2031-09-27	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/198e17e7-4590-40b1-8fbc-96c376d07979.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/134fd393-58db-46ee-b7cd-39eeedd687df.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/e0d21194-3a7b-45b7-bcc5-05ceb93a8f84.jpeg	\N	\N	\N	\N	0fbdc046-243e-45f4-88a5-e79014c042cc
2025-10-13 09:36:53.577769	2025-10-13 09:53:46.637759	+34684201819	\N	Kamiar Majid	\N	t	\N	GH	Y4786220A	Male	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/9bb8a3ea-b44d-4025-95c1-b8b04f5f09ae.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/80c16649-d1e2-4be7-af33-c291aa6eedf2.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/dff3d560-93e8-4cc8-bbc1-ed21883b64f1.jpeg	\N	\N	\N	\N	9edb0f91-cb09-47ec-90fc-fb222cbd82e0
2025-10-15 08:38:11.557108	2025-10-15 08:49:17.76848	+233593249057	\N	RITA GUANSAH	\N	t	\N	GH	002385526	Female	1985-10-06	\N	2031-09-27	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/e3af59eb-1119-40d4-8a0e-08476443c316.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/da198976-38c1-42a7-994a-7f0d4acc5b90.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/0cf9442f-5e98-4822-813c-0ea57eb137aa.jpeg	\N	\N	\N	\N	c99c3f5b-e7ef-4695-ace9-89326973345b
2025-10-15 10:02:45.57408	2025-10-15 10:06:32.036174	+34684201818	\N	ANNA REVERTE	\N	t	\N	GH	47884113E	Female	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/c3ce880d-8395-4e07-9a39-43efa7a520a4.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/295fb9d5-3920-4c23-9acc-c7956cbbd411.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/f71638dd-05bf-4e8c-aa63-a340cacff8ef.jpeg	\N	\N	\N	\N	c54a59ea-014a-4dc9-8576-3c655c835d02
2025-10-16 09:04:42.909414	2025-10-16 09:10:30.25596	+233249951134	\N	AUGUSTINA AHEDOR	\N	t	\N	GH	AM8747691	Female	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/d1a3ffe1-94b1-44e4-b376-247da4eda296.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/25d13f37-cfb8-42ff-841c-18d1d5119c33.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/9e3b706b-a72a-430e-9add-3663288f239d.jpeg	\N	\N	\N	\N	533f6786-0f97-4267-8977-6541522033b6
2025-10-16 10:04:48.113165	2025-10-16 10:09:43.733658	+233506690699	\N	JANET LARTEY	\N	t	\N	GH	GH4531413	Female	1966-05-19	\N	2029-05-31	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/2aeedc60-70d4-43a7-974c-cd33af9e3544.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/232afac4-299d-4dfa-acc0-ba6b8ec3efb8.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/44050662-f98a-4013-896f-985c99e0ae13.jpeg	\N	\N	\N	\N	57cecea5-da12-43dd-ae7c-66cd38408047
2025-11-10 11:36:27.384086	2025-11-10 11:47:23.384653	+34684201814	\N	KAMIAR DAR	\N	t	\N	GH	566330520	Male	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_3216a6da-5076-4160-8568-2108380d8641.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_de4434a3-c4a3-4851-afb6-2169e6a21f3c.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_68312534-e8a9-4046-be83-cb993b9ca234.jpg	\N	\N	\N	\N	af98950d-a6a9-4675-ae71-087d4ceff525
2025-11-24 14:35:06.33887	2025-11-24 14:35:08.835268	+34678451242	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	1f6370da-d18b-4cb6-8850-0a977b23b94e
2025-11-26 11:21:38.157137	2025-11-26 11:28:47.603937	+34674848451	\N	SALIFU MUTARU	\N	t	\N	ES	GH4395603	Male	\N	\N	\N	https://uniti-id-images.s3.amazonaws.com/cf89e290-f3c0-4a46-a443-b21e3c27b925/front.jpg	https://uniti-id-images.s3.amazonaws.com/cf89e290-f3c0-4a46-a443-b21e3c27b925/back.jpg	https://uniti-id-images.s3.amazonaws.com/cf89e290-f3c0-4a46-a443-b21e3c27b925/selfie.jpg	\N	\N	\N	\N	cf89e290-f3c0-4a46-a443-b21e3c27b925
2025-11-11 12:10:53.077526	2025-11-11 12:13:05.529416	+233242549545	\N	SAMUEL ALOMENU	\N	t	\N	GH	GHA7132659434	Male	1990-03-03	\N	2029-06-24	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_726f3707-c2b2-43e5-a12a-0a08dd13bfab.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_4ada796c-a7de-41bd-a0a2-22f670f717b2.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_20a024b5-449d-4bb1-aa6b-c1f18bdb3efc.jpg	\N	\N	\N	\N	a7295cab-0299-493d-9870-3ed59a04cfaa
2025-11-10 07:04:23.388475	2025-11-10 08:51:59.639156	+34678585852	\N	SALIFU MUTARU	\N	t	\N	GH	GH4365603	Male	1989-08-10	\N	2028-12-04	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_73b2dfe3-8d94-4e08-922f-f4d16bb882fd.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_9579eb04-8d61-4d11-9aa5-f1f1e2eace99.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_232e7d8c-1536-471c-9aea-07fe40d8d778.jpg	\N	\N	\N	\N	b1d63b14-dfbe-48ab-ace1-e8f1f87c61e2
2025-11-10 09:30:38.153866	2025-11-10 09:33:56.931424	+233546403864	\N	SALIFU MUTARU	\N	t	\N	GH	GH4365603	Male	1989-08-10	\N	2028-12-04	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_e764257b-e5f5-4196-b064-0a7c0fed539d.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_84b8aefa-689e-4714-9695-c8ab9804a736.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_f42ebbb1-8361-4844-88a9-5a544cac66c1.jpg	\N	\N	\N	\N	b5947c92-85b6-4b2c-a196-994d9c3b4739
2025-11-20 08:54:32.862255	2025-11-20 08:54:34.463674	+34675858541	\N	\N	\N	t	\N	GH	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	9aca49a1-caea-470f-8af8-7d030ab2fef1
2025-11-20 07:40:58.433576	2025-11-20 07:48:34.953991	+34678787879	\N	PIRSTRANES MUTARU	\N	t	\N	GH	GH4365603	Male	1989-08-10	\N	2028-12-04	https://uniti-id-images.s3.amazonaws.com/9eec7d5d-740f-49cb-8be4-db3e52ab59d0/front.jpg	https://uniti-id-images.s3.amazonaws.com/9eec7d5d-740f-49cb-8be4-db3e52ab59d0/back.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_be884cd9-86d6-4a70-8da1-c5c9f8d61e58.jpg	\N	\N	\N	\N	9eec7d5d-740f-49cb-8be4-db3e52ab59d0
2025-10-17 10:02:55.045365	2025-10-20 09:15:22.446536	+34665340484	\N	ANNA MONTANES	\N	t	\N	GH	47884113E	Female	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/97a7ebc2-e21f-465f-bb49-97ae7d803c72.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImageManipulator/48fd2e96-e28e-4297-824b-9ec4ccdf3ed3.jpg	file:///data/user/0/com.unitinetworks.qa/cache/ImagePicker/955f9021-1797-43c3-b118-0f9083f46df0.jpeg	\N	\N	\N	\N	2bf56a47-a901-41d8-8f4d-d5a8b9609328
2025-11-11 11:33:07.715507	2025-11-11 11:35:48.943468	+34690619099	\N	KARAN ARYA	\N	t	\N	GH	\N	Male	\N	\N	\N	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_ff81f0ef-38f2-4b4e-aee9-a8ccf5141996.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_8f2caa88-b430-4bc9-9cab-933a5c309622.jpg	file:///data/user/0/com.unitinetworks.qa/cache/rn_image_picker_lib_temp_b7ce50da-f5ff-4cf3-9ccb-b54ea75e899a.jpg	\N	\N	\N	\N	c3ee388c-1170-4fba-a817-a6afa55fd046
2025-11-24 16:18:40.153912	2025-11-24 16:18:42.081728	+34678585451	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0697631c-7493-4789-904b-8b0685408077
2025-11-26 12:37:03.007102	2025-11-26 12:37:04.523197	+34675656451	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cfa00b58-0379-459e-99d9-57658bbf9572
\.


--
-- Data for Name: verifications; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.verifications (id, "createdAt", "updatedAt", "phoneNumber", code, verified, "expiresAt") FROM stdin;
706075fb-2e6c-4495-81d2-bd3ccc4f2982	2025-09-23 14:08:08.81086	2025-09-23 14:08:10.539875	+34678546139	136247	t	2025-09-23 14:13:08.807
1dbc6250-46e5-4436-ace6-870908127603	2025-09-24 09:38:01.754501	2025-09-24 09:38:24.57594	+233242549545	856049	t	2025-09-24 09:43:01.748
7183d3f6-9e6e-4fbf-9c45-af36237048ad	2025-09-24 09:44:10.030234	2025-09-24 09:44:29.879177	+233242549545	344942	t	2025-09-24 09:49:10.025
5ca38a9a-9494-4c6b-9474-c512c937984f	2025-09-24 11:59:24.582631	2025-09-24 11:59:24.582631	+233558382126	490554	f	2025-09-24 12:04:24.574
0c73fb6b-f8ba-4690-b46b-e71983250d45	2025-09-24 12:07:04.150788	2025-09-24 12:07:17.201014	+233558382126	811990	t	2025-09-24 12:12:04.145
40cb97d7-460b-4331-87a9-580d297c7762	2025-09-25 09:12:01.610878	2025-09-25 09:12:15.250204	+233558382126	738306	t	2025-09-25 09:17:01.604
a1d0fb51-a46f-4209-aabd-9f45193d7a86	2025-09-25 09:31:33.56362	2025-09-25 09:31:34.998248	+34684201815	656591	t	2025-09-25 09:36:33.555
dd04549e-a728-453f-bb4a-5db9abf3a97a	2025-09-26 08:53:31.149277	2025-09-26 08:53:31.149277	+233508000004	412317	f	2025-09-26 08:58:31.145
77ce9cdc-55e6-43e5-89eb-5f966059eb0a	2025-09-26 09:02:35.555601	2025-09-26 09:02:35.555601	+233508000004	487297	f	2025-09-26 09:07:35.554
7bf2464d-eee7-4a4d-b2d4-cad1f2e331a7	2025-09-26 12:41:58.389358	2025-09-26 12:42:31.113212	+233508000004	449060	t	2025-09-26 12:46:58.383
9126ed32-67b4-4b5b-a6be-19e30e16d56c	2025-09-26 12:53:26.753654	2025-09-26 12:53:42.277558	+233558382126	330216	t	2025-09-26 12:58:26.748
4efc5c4b-dbd5-46f8-993c-88997cb17da4	2025-09-30 12:07:12.209294	2025-09-30 12:07:25.687452	+233558382126	542034	t	2025-09-30 12:12:12.204
fea73374-ae0e-4a1a-bdf6-d5ef99945212	2025-09-30 19:38:11.300549	2025-09-30 19:38:26.190758	+233558382126	211171	t	2025-09-30 19:43:11.295
3256dc95-ce54-4446-8da3-c7fd394d371b	2025-09-30 20:28:29.935527	2025-09-30 20:29:02.866114	+233508407594	416844	t	2025-09-30 20:33:29.934
48af1319-109e-4799-9dfd-50d71ac7dbd7	2025-10-01 11:28:39.038747	2025-10-01 11:28:57.454675	+233242549545	707160	t	2025-10-01 11:33:39.036
7f736cd5-1322-4928-9cb8-a10a7a4c44c6	2025-10-01 12:11:08.744176	2025-10-01 12:11:14.693118	+34673817263	970919	t	2025-10-01 12:16:08.742
7f07437e-920f-43cf-82bf-118a4d6c47ea	2025-10-01 12:24:49.614913	2025-10-01 12:24:51.519499	+34673827271	520135	t	2025-10-01 12:29:49.613
523fc1a1-4eaf-4fdd-8ee3-becf317b8ab3	2025-10-01 15:00:19.171834	2025-10-01 15:00:20.911433	+34678292812	850217	t	2025-10-01 15:05:19.168
c1a957b8-3667-4c67-9dff-8ca8c5210e6a	2025-10-01 15:17:55.657865	2025-10-01 15:17:57.592724	+34678533333	137602	t	2025-10-01 15:22:55.656
dbc1b11a-b46d-4b67-a649-b5b2b498b6f3	2025-10-02 08:26:52.915746	2025-10-02 08:26:55.319228	+34678543232	665433	t	2025-10-02 08:31:52.913
99c4a9d7-5f01-40ff-b6b0-296638fe9832	2025-10-02 08:40:36.392804	2025-10-02 08:40:37.826276	+34672819281	890006	t	2025-10-02 08:45:36.391
5e096e9f-5448-4998-9dbd-c7ea08e25656	2025-10-02 20:13:47.234046	2025-10-02 20:14:44.155484	+233508000004	509601	t	2025-10-02 20:18:47.229
944e7ba4-970a-41b6-889c-4940baaa1af2	2025-10-02 20:38:52.903796	2025-10-02 20:38:52.903796	+233278637032	982257	f	2025-10-02 20:43:52.901
e5dd54f0-cfce-45c4-8d19-52039a3007da	2025-10-02 20:40:34.887209	2025-10-02 20:41:11.147199	+233278637032	141211	t	2025-10-02 20:45:34.885
cf9c46b5-8f83-46bd-9e46-b71f2106583e	2025-10-03 14:57:11.831886	2025-10-03 14:57:13.269088	+34690619099	736317	t	2025-10-03 15:02:11.829
e4326b39-8613-447c-b87c-868c6f34c051	2025-10-07 12:48:12.626895	2025-10-07 12:48:12.626895	+233242549545	842255	f	2025-10-07 12:53:12.625
eade3c72-7d3d-4e06-8417-d3387426ddfd	2025-10-07 12:50:30.5114	2025-10-07 12:50:49.433204	+233242549545	993317	t	2025-10-07 12:55:30.51
f3324f2b-156d-432b-923d-a67f2daa6254	2025-10-07 12:51:57.029877	2025-10-07 12:52:10.99587	+233508000004	472506	t	2025-10-07 12:56:57.028
396c20c5-2f34-4a91-b5a2-3ada4ba1e5af	2025-10-07 16:42:01.26043	2025-10-07 16:42:35.902873	+233508000004	698132	t	2025-10-07 16:47:01.259
c6729639-f64c-4d20-b2fd-bc081597d515	2025-10-07 16:45:30.369397	2025-10-07 16:46:03.942574	+233202001245	867006	t	2025-10-07 16:50:30.371
0a32b345-d3fa-46d9-aac1-d6ed7bf5c1db	2025-10-08 12:37:33.998617	2025-10-08 12:37:57.75213	+233202001245	584641	t	2025-10-08 12:42:34
6f5912c8-feda-439b-81ca-5690a21f224a	2025-10-09 17:24:01.641123	2025-10-09 17:24:26.487516	+233242549545	160624	t	2025-10-09 17:29:01.642
12381437-0c6d-42a5-9c2a-3d9257c5f131	2025-10-10 08:52:20.036147	2025-10-10 08:52:55.137208	+233243847313	778974	t	2025-10-10 08:57:20.037
400b0e54-7a89-49d3-8d9e-803d6f21740f	2025-10-11 22:14:47.773145	2025-10-11 22:14:55.599703	+34676121231	907242	t	2025-10-11 22:19:47.773
4531d2ec-ae55-40d2-aaad-dab4f45db71e	2025-10-11 23:13:08.300265	2025-10-11 23:13:11.26247	+34678888888	272109	t	2025-10-11 23:18:08.301
7dca53f3-51ac-4e75-81c4-aad9e8015b73	2025-10-12 12:06:01.680111	2025-10-12 12:06:03.49608	+34684201816	199341	t	2025-10-12 12:11:01.679
ab315c22-1ac7-4821-bfca-0f1172e79cbb	2025-10-13 07:45:13.553061	2025-10-13 07:45:15.474049	+34678344322	731849	t	2025-10-13 07:50:13.554
7083992d-705a-4a4b-89a9-1041698822c5	2025-10-13 09:30:32.240227	2025-10-13 09:30:39.916995	+34678292821	964205	t	2025-10-13 09:35:32.241
47b0cb06-0df5-40d7-b8fc-e16e7f48e66f	2025-10-13 09:36:53.58391	2025-10-13 09:36:55.066196	+34684201819	248456	t	2025-10-13 09:41:53.584
ca61bd00-499f-40fb-bc33-63edb056ddab	2025-10-14 09:41:36.859132	2025-10-14 09:41:36.859132	+233242549545	564213	f	2025-10-14 09:46:36.862
9bb996dd-c149-47df-8204-989184f57ede	2025-10-14 09:41:48.902841	2025-10-14 09:41:48.902841	+233242549545	735182	f	2025-10-14 09:46:48.905
efa3f094-e4ce-4a6b-824c-4b3c9617921d	2025-10-14 09:42:34.821818	2025-10-14 09:42:34.821818	+233242549545	924106	f	2025-10-14 09:47:34.824
26f94647-950b-4b12-b624-18c09b53ae0f	2025-10-14 09:45:43.672465	2025-10-14 09:46:21.857065	+233543344100	790407	t	2025-10-14 09:50:43.675
b76bd7c1-16cd-4693-a0cc-c78811423c2f	2025-10-14 09:59:23.176556	2025-10-14 09:59:43.434243	+233543344100	867774	t	2025-10-14 10:04:23.179
f547cc4d-61cb-4453-99bd-ad2ce1fda112	2025-10-14 10:12:30.687252	2025-10-14 10:12:51.348038	+233543344100	643972	t	2025-10-14 10:17:30.686
ff890b04-cd5c-43bf-8c95-e69b3587c28a	2025-10-14 10:13:49.506168	2025-10-14 10:13:49.506168	+34684201811	821592	f	2025-10-14 10:18:49.509
89476db7-a592-477e-80d6-655eb8c1c495	2025-10-14 10:14:04.642186	2025-10-14 10:14:04.642186	+34684201812	325959	f	2025-10-14 10:19:04.645
684d2862-1d60-4679-8513-64937ae1f262	2025-10-14 10:14:11.756837	2025-10-14 10:14:11.756837	+34684201815	422189	f	2025-10-14 10:19:11.76
f6ac41c9-6543-4292-8bef-a414aa191faf	2025-10-14 10:14:25.608963	2025-10-14 10:14:25.608963	+34684201816	627376	f	2025-10-14 10:19:25.612
23ff5114-5482-41a6-83da-f32d0f05d441	2025-10-14 10:14:32.307956	2025-10-14 10:14:32.307956	+34684201816	126945	f	2025-10-14 10:19:32.311
3ccfef5b-c079-4f98-92c0-e3a5cb35d3f1	2025-10-14 10:14:48.928716	2025-10-14 10:14:48.928716	+233543344100	175837	f	2025-10-14 10:19:48.931
8ad5e1a1-d019-4424-8fec-dcdf51418f61	2025-10-14 10:18:35.006319	2025-10-14 10:18:50.724918	+233543344100	915584	t	2025-10-14 10:23:35.008
86207a49-94fa-4b40-866f-0d49288778c5	2025-10-14 10:24:46.718631	2025-10-14 10:25:09.782514	+233543344100	181728	t	2025-10-14 10:29:46.721
84f540f6-fd2f-4062-a0b0-2e109e8a9d6b	2025-10-14 10:25:44.784627	2025-10-14 10:25:44.784627	+34678546345	738668	f	2025-10-14 10:30:44.788
db5a1eb6-35c5-42d2-87b6-0478066f0e0e	2025-10-14 10:51:13.189864	2025-10-14 10:51:27.522531	+233558382126	523901	t	2025-10-14 10:56:13.186
b68a825a-61ed-4137-be8f-5eb6675fa5b9	2025-10-14 14:18:54.445257	2025-10-14 14:18:54.445257	+233243575059	113002	f	2025-10-14 14:23:54.445
97d27709-6ac1-47e3-8f3e-80910b7139e8	2025-10-14 14:21:15.733912	2025-10-14 14:21:15.733912	+233243572059	366241	f	2025-10-14 14:26:15.734
4eb51971-b187-4748-816a-7fcd62068ce0	2025-10-14 14:21:40.304479	2025-10-14 14:22:26.041242	+233243572029	113965	t	2025-10-14 14:26:40.284
7aca4d83-b4ed-4b66-a7d7-c2601869d8c8	2025-10-14 16:43:52.284579	2025-10-14 16:44:09.350069	+233558382126	712721	t	2025-10-14 16:48:52.283
ca995d55-c7b6-4c9f-96af-f3957909bd11	2025-10-14 17:03:33.994389	2025-10-14 17:03:48.376096	+233508000004	850445	t	2025-10-14 17:08:33.994
d9767471-cbd7-41c0-8076-65888b07a58b	2025-10-14 17:05:36.100271	2025-10-14 17:05:52.835169	+233555646246	157660	t	2025-10-14 17:10:36.1
9310d178-6e32-4f4d-a43c-56b6503c1cd7	2025-10-14 17:11:14.915829	2025-10-14 17:11:48.105478	+233555646246	874934	t	2025-10-14 17:16:14.915
8522de18-500f-4bf6-9508-8706a704e1c4	2025-10-15 07:31:22.806132	2025-10-15 07:31:53.249207	+233533960130	466560	t	2025-10-15 07:36:22.808
5fad432f-c824-460a-a79b-de8b2bf2a8df	2025-10-15 08:38:11.568205	2025-10-15 08:39:32.733448	+233593249057	285922	t	2025-10-15 08:43:11.567
ef089e80-e69d-490a-9eb7-6fd8d0905df4	2025-10-15 08:50:52.806784	2025-10-15 08:50:52.806784	+233593249057	979746	f	2025-10-15 08:55:52.806
905382d9-cbf6-4d41-a060-db5f7b32041c	2025-10-15 08:52:20.54998	2025-10-15 08:52:47.57226	+233593249057	760166	t	2025-10-15 08:57:20.549
306bf908-ea69-4e47-ab29-94c6e1cd6274	2025-10-15 08:54:10.677171	2025-10-15 08:55:14.690131	+233275512815	572851	t	2025-10-15 08:59:10.676
a45d9325-a8e1-4967-b05d-b5746bd34b3f	2025-10-15 09:22:04.710645	2025-10-15 09:22:04.710645	+233278637032	159736	f	2025-10-15 09:27:04.709
22e9d9ed-08e7-4260-8197-60a578455899	2025-10-15 09:23:49.75753	2025-10-15 09:24:11.803374	+233278637032	488600	t	2025-10-15 09:28:49.757
409a666e-6b62-4165-a129-d14f7b0e3d37	2025-10-15 09:27:42.914474	2025-10-15 09:27:42.914474	+233278637032	890695	f	2025-10-15 09:32:42.914
727d738b-cba4-46dc-8d55-42a1d27b75e0	2025-10-15 09:28:07.737025	2025-10-15 09:28:07.737025	+233278637032	295657	f	2025-10-15 09:33:07.737
8b4b8531-be56-42a6-aed7-2a1f7952b354	2025-10-15 09:28:47.103129	2025-10-15 09:28:47.103129	+233278637032	214391	f	2025-10-15 09:33:47.103
334bbef4-1c8b-4be9-b4e2-ae96ed945e95	2025-10-15 10:02:45.58777	2025-10-15 10:02:47.89489	+34684201818	350498	t	2025-10-15 10:07:45.587
1cf98353-0ee3-495b-845c-7d3638e133a3	2025-10-15 11:05:12.734241	2025-10-15 11:05:27.173369	+233508000004	294601	t	2025-10-15 11:10:12.734
45688928-19c6-4e0b-877a-5286004cda81	2025-10-15 14:07:33.931526	2025-10-15 14:08:07.439212	+233278637032	401848	t	2025-10-15 14:12:33.932
3a58423a-77de-4f86-ade9-e73f0862ed52	2025-10-16 08:46:13.27641	2025-10-16 08:46:13.27641	+233266174410	890125	f	2025-10-16 08:51:13.277
f2b6be99-e501-49cf-b909-12f4dafec127	2025-10-16 08:47:21.607029	2025-10-16 08:47:57.311514	+233553331598	999228	t	2025-10-16 08:52:21.608
8fd04ea4-eaab-400a-b932-ac46bee55660	2025-10-16 09:04:42.917272	2025-10-16 09:06:29.401309	+233249951134	989029	t	2025-10-16 09:09:42.918
2072628a-3cdb-4c0d-8403-2dcee8432394	2025-10-16 10:04:48.119944	2025-10-16 10:05:15.165048	+233506690699	641333	t	2025-10-16 10:09:48.12
647ef7e1-7cb1-4cf7-a5ad-0c673e137e49	2025-10-16 10:47:19.105467	2025-10-16 10:47:19.105467	+34690619099	630632	f	2025-10-16 10:52:19.106
065f0361-5f70-48fb-a0aa-976c50967ea9	2025-10-16 10:47:28.512621	2025-10-16 10:47:28.512621	+34690619091	376877	f	2025-10-16 10:52:28.514
05f83c55-cd2b-41e1-9c09-d8128eebb817	2025-10-16 10:47:57.713973	2025-10-16 10:47:57.713973	+34669911223	945610	f	2025-10-16 10:52:57.715
97f1264f-dc5e-40a0-92ec-efcb9424f816	2025-10-16 10:50:59.220397	2025-10-16 10:50:59.220397	+34690619099	690689	f	2025-10-16 10:55:59.222
816fd7ee-5f25-4632-b846-8ad137a0d525	2025-10-16 10:51:07.139179	2025-10-16 10:51:07.139179	+34690611648	350189	f	2025-10-16 10:56:07.14
43a92e64-41c7-47a0-b7d6-24839164fa4d	2025-10-17 08:39:06.902976	2025-10-17 08:39:06.902976	+34690619099	808958	f	2025-10-17 08:44:06.906
4d439db7-e39f-47b7-9de1-a5993454443c	2025-10-17 08:40:36.53673	2025-10-17 08:40:38.34625	+34690619099	628797	t	2025-10-17 08:45:36.539
74133549-ed5a-4589-9174-09233ef15256	2025-10-17 08:41:26.273666	2025-10-17 08:41:27.756229	+34690619099	946892	t	2025-10-17 08:46:26.276
5c53a40e-c90b-46e6-989b-8879e84de9ca	2025-10-17 08:49:00.727683	2025-10-17 08:49:02.097335	+34690619099	296195	t	2025-10-17 08:54:00.73
1d591aeb-9f06-4f91-8e82-0c2caeb131e0	2025-10-17 10:02:55.061775	2025-10-17 10:03:38.944394	+34665340484	716621	t	2025-10-17 10:07:55.063
2652d684-b523-461d-a81a-bbf6c66c50a2	2025-10-17 12:37:31.111108	2025-10-17 12:37:32.462577	+34690619099	272348	t	2025-10-17 12:42:31.112
49f283e7-c5d5-41f7-9832-3dcfc55cb6cc	2025-10-17 12:54:53.863645	2025-10-17 12:54:55.444219	+34690619099	737555	t	2025-10-17 12:59:53.864
0843dd17-8985-4446-bd3c-c602226329ac	2025-10-20 10:12:27.833607	2025-10-20 10:13:06.282163	+233508407594	350772	t	2025-10-20 10:17:27.827
4e5d7297-cf68-4129-bed7-e759ed05f6ae	2025-10-20 14:24:46.521832	2025-10-20 14:24:46.521832	+233543344100	104789	f	2025-10-20 14:29:46.518
cc246749-bd8b-4e82-b8f1-2b62f50a7553	2025-10-20 14:25:51.231959	2025-10-20 14:25:51.231959	+34670894633	633702	f	2025-10-20 14:30:51.232
cc789b0a-d064-46e7-8898-42e935d677a9	2025-10-20 14:35:11.874532	2025-10-20 14:35:11.874532	+34678765435	191654	f	2025-10-20 14:40:11.874
b9f4cfda-fe56-44c5-80da-a6d0ec66cde7	2025-10-20 14:47:41.561294	2025-10-20 14:47:41.561294	+34679182811	614542	f	2025-10-20 14:52:41.562
edb82a13-67cc-4b55-9c5e-a8a5cb0ba31f	2025-10-20 16:06:21.66196	2025-10-20 16:06:21.66196	+34678271721	227723	f	2025-10-20 16:11:21.664
558155a5-82c5-4a08-a606-945ab9044d00	2025-10-20 16:26:41.475413	2025-10-20 16:26:41.475413	+233247816248	691560	f	2025-10-20 16:31:41.477
58fc72cb-eac2-43b4-ae64-2c48d16ccb58	2025-10-20 16:27:59.691075	2025-10-20 16:27:59.691075	+233247816248	988952	f	2025-10-20 16:32:59.693
10301405-b886-4f51-9040-0acd844029d1	2025-10-20 16:29:41.767749	2025-10-20 16:32:31.742291	+233247816248	105082	t	2025-10-20 16:34:41.768
2bd508b7-5aec-4235-af35-0666a29bb1ed	2025-10-20 16:51:13.228655	2025-10-20 16:52:32.199671	+233247816248	389178	t	2025-10-20 16:56:13.23
c1d9b28f-7e39-47a1-a8fc-d1db07e6c569	2025-10-21 10:05:28.536568	2025-10-21 10:05:28.536568	+34678191821	312874	f	2025-10-21 10:10:28.535
b1a1a6e7-1e42-492f-bb74-3341c21a746d	2025-10-21 10:22:59.255345	2025-10-21 10:23:06.581517	+34679837123	119973	t	2025-10-21 10:27:59.255
7d09ce9f-add7-440f-b576-6c43dc1e85bf	2025-10-21 10:31:13.079251	2025-10-21 10:31:15.674161	+34679871623	630888	t	2025-10-21 10:36:13.079
e56d9ad9-9507-4cd6-b7ee-e9589c10c865	2025-10-21 14:30:11.136249	2025-10-21 14:30:34.34754	+233242549545	795098	t	2025-10-21 14:35:11.136
e58c05fd-9fc4-4428-b12b-a1bbd6e133f1	2025-10-21 14:34:57.979278	2025-10-21 14:35:18.701244	+233242549545	509989	t	2025-10-21 14:39:57.979
0569f717-b0e9-4f07-83c5-ad3eea8bce98	2025-10-21 14:57:32.991766	2025-10-21 14:57:48.956592	+233242549545	272991	t	2025-10-21 15:02:32.991
a7f8e5fa-0fd7-4428-8ff5-1d753a44d406	2025-10-22 05:56:04.807158	2025-10-22 05:56:20.181737	+233558382126	351471	t	2025-10-22 06:01:04.804
0b0f0679-77d9-486e-87ab-bc739f38a97a	2025-10-22 05:56:45.3002	2025-10-22 05:56:58.339453	+233558382126	204277	t	2025-10-22 06:01:45.302
03012f6a-76a2-4099-aeaf-9fa468e90dbd	2025-10-22 05:58:13.051451	2025-10-22 05:58:30.989713	+233558382126	542951	t	2025-10-22 06:03:13.053
afeb63cf-42b4-469c-9a9f-af6bca54319d	2025-10-23 10:07:31.624496	2025-10-23 10:07:46.841571	+233558382126	102790	t	2025-10-23 10:12:31.623
9e5d5606-082a-4c2a-80cc-6ffd76263190	2025-10-23 11:07:00.525526	2025-10-23 11:07:00.525526	+233558382126	449828	f	2025-10-23 11:12:00.524
0ad166e3-1872-4f2c-81ae-d67ee9dd31c8	2025-10-23 11:09:37.001203	2025-10-23 11:09:37.001203	+233558382126	141567	f	2025-10-23 11:14:37.003
f1b11f2f-0f58-4d98-be9e-187c2a89e434	2025-10-23 11:10:41.516225	2025-10-23 11:10:41.516225	+233508000004	127741	f	2025-10-23 11:15:41.518
61a3ad6c-d6ad-48ff-9a02-1408126d0dbb	2025-10-23 11:11:55.548177	2025-10-23 11:11:55.548177	+233508000004	341879	f	2025-10-23 11:16:55.55
cd57b62c-3171-4648-acb3-1bed6e4621e1	2025-10-23 11:28:01.798293	2025-10-23 11:28:01.798293	+233558382126	944572	f	2025-10-23 11:33:01.795
2ebed3f6-552b-41b5-8714-8784fa07263b	2025-10-23 11:29:08.428768	2025-10-23 11:29:24.301842	+233558382126	865532	t	2025-10-23 11:34:08.43
2b18bdd7-dde7-4ecf-a449-56397c09f0f0	2025-10-27 07:42:38.887718	2025-10-27 07:42:59.896482	+34679999999	723844	t	2025-10-27 07:47:38.887
65285c4f-2cee-44ec-9c18-c20cfce01499	2025-10-28 08:47:37.434149	2025-10-28 08:47:38.782827	+34678888888	708909	t	2025-10-28 08:52:37.436
a941dbf5-0aa3-461a-80f0-648441d62bf5	2025-10-28 11:03:14.758462	2025-10-28 11:03:38.278992	+233558382126	147569	t	2025-10-28 11:08:14.761
e9afa04d-8afd-49d0-8b70-60f4d0258c48	2025-10-31 08:10:29.788692	2025-10-31 08:10:34.419428	+34678579643	565039	t	2025-10-31 08:15:29.79
6222228f-961c-4b2d-9c1f-511c1be658b3	2025-11-04 09:27:09.712624	2025-11-04 09:27:11.477264	+34678888888	575296	t	2025-11-04 09:32:09.712
8db4c314-2a19-46f3-861b-b817f0963ec6	2025-11-04 10:17:21.837803	2025-11-04 10:17:24.176199	+34679999999	664052	t	2025-11-04 10:22:21.837
23fa95dd-cc3e-498c-8fff-7fe3672dc1de	2025-11-04 10:28:53.996781	2025-11-04 10:28:55.471559	+34675555555	698890	t	2025-11-04 10:33:53.996
d3cb1914-2b17-4547-9356-34aa9f8ba4d8	2025-11-09 12:32:10.977441	2025-11-09 12:32:12.430296	+34673333333	676972	t	2025-11-09 12:37:10.977
773c72ce-6b54-445c-af7f-62af6d3425a9	2025-11-09 17:23:42.83513	2025-11-09 17:23:44.484907	+34674444444	863027	t	2025-11-09 17:28:42.833
cd28f238-cedc-44bd-a279-6f616049c6dd	2025-11-09 20:49:39.247566	2025-11-09 20:49:40.895804	+34678844113	526856	t	2025-11-09 20:54:39.247
8e354d0e-24d4-4479-8a7a-110bce6ec244	2025-11-09 21:15:40.441626	2025-11-09 21:15:42.048532	+34675544332	334755	t	2025-11-09 21:20:40.441
f0d1e923-a183-41be-8eea-8bc4c8126e37	2025-11-10 07:04:23.402708	2025-11-10 07:04:24.920389	+34678585852	469254	t	2025-11-10 07:09:23.401
800babdb-de73-4316-9ef0-9a69b2c8ae27	2025-11-10 09:28:43.599091	2025-11-10 09:28:43.599091	+233543344100	679541	f	2025-11-10 09:33:43.601
21732c06-3844-40a0-bd9c-1d7782983794	2025-11-10 09:28:56.140233	2025-11-10 09:28:56.140233	+233543344100	222472	f	2025-11-10 09:33:56.142
0df37f74-0409-4e3f-899a-7cf67eb3402e	2025-11-10 09:29:27.64701	2025-11-10 09:29:29.430025	+34672225554	546754	t	2025-11-10 09:34:27.649
afe76d22-d171-48c9-9af5-f772e145546a	2025-11-10 09:29:49.011774	2025-11-10 09:29:49.011774	+233543344100	256062	f	2025-11-10 09:34:49.01
dd279e53-0162-4d5b-93fc-8e9a594f3ea8	2025-11-10 09:30:38.158441	2025-11-10 09:30:56.456656	+233546403864	648141	t	2025-11-10 09:35:38.161
00fb6773-f293-4077-bb6c-cf5ba2937b24	2025-11-10 10:47:54.077449	2025-11-10 10:47:54.077449	+34684201816	526789	f	2025-11-10 10:52:54.08
c76b5b38-5a70-4d05-843f-454335f4b2ed	2025-11-10 10:47:58.000616	2025-11-10 10:47:58.000616	+34684201816	138211	f	2025-11-10 10:52:58.005
e30e9a93-8c31-42be-8429-ee414fd041b1	2025-11-10 10:48:02.169038	2025-11-10 10:48:02.169038	+34684201815	854689	f	2025-11-10 10:53:02.174
90bad0d1-49af-4369-af0e-2cc71aad7c6d	2025-11-10 10:48:06.582489	2025-11-10 10:48:08.855432	+34684201814	636792	t	2025-11-10 10:53:06.588
7c9f02a0-f644-4ffa-b544-4345e5d5dd4e	2025-11-10 10:48:17.826716	2025-11-10 10:48:17.826716	+34684201814	985086	f	2025-11-10 10:53:17.832
b096434b-38be-49d2-9c4c-134d6579b4fb	2025-11-10 11:36:27.394494	2025-11-10 11:36:28.572653	+34684201814	550381	t	2025-11-10 11:41:27.394
423d1495-b2ba-4256-b215-c75f356b8f88	2025-11-11 11:33:07.729648	2025-11-11 11:33:09.125279	+34690619099	282647	t	2025-11-11 11:38:07.733
4a721bf3-f3cb-4f98-b533-f47634f8ffed	2025-11-11 12:10:53.089188	2025-11-11 12:11:16.277357	+233242549545	242234	t	2025-11-11 12:15:53.091
31289392-b48d-45fd-bf85-77bff4624668	2025-11-11 12:28:27.798825	2025-11-11 12:28:53.526695	+233558382126	568561	t	2025-11-11 12:33:27.8
5f7e70d4-447c-4b6e-9340-dc1c5cc9309d	2025-11-11 13:42:14.502606	2025-11-11 13:42:14.502606	+233242549545	813605	f	2025-11-11 13:47:14.497
91e6f7b3-a6c3-4ea6-b212-9a3ef73f0b11	2025-11-11 13:42:20.039877	2025-11-11 13:42:20.039877	+233242549545	356677	f	2025-11-11 13:47:20.04
1f625179-be29-4409-8d63-84bb3019dd41	2025-11-11 14:20:24.364949	2025-11-11 14:20:24.364949	+233242549545	437281	f	2025-11-11 14:25:24.362
be2a803c-18be-4093-889e-44afb784d59a	2025-11-11 14:21:02.217606	2025-11-11 14:21:02.217606	+233242549545	160636	f	2025-11-11 14:26:02.216
5e2c1e52-c25e-4b12-a1c5-26f3b99bff4f	2025-11-11 14:21:15.763502	2025-11-11 14:21:15.763502	+233242549545	979956	f	2025-11-11 14:26:15.764
05065b46-9f14-48ef-b12a-3061ba919ddb	2025-11-11 14:21:34.138687	2025-11-11 14:21:34.138687	+233242549545	238982	f	2025-11-11 14:26:34.139
a96a3953-291f-4ba1-b3b2-51346917de70	2025-11-11 14:21:45.870261	2025-11-11 14:21:45.870261	+233242549545	161751	f	2025-11-11 14:26:45.871
f61565a7-7c1b-49cb-976d-a73107067e76	2025-11-11 15:05:53.419214	2025-11-11 15:06:11.302009	+233558382126	203183	t	2025-11-11 15:10:53.419
41a4bc3f-6772-4323-a167-7f9ad779ca99	2025-11-11 19:58:50.046283	2025-11-11 19:58:50.046283	+233242549545	468424	f	2025-11-11 20:03:50.044
521074a3-f752-4509-af8d-8a395439ff8f	2025-11-12 10:05:34.871152	2025-11-12 10:05:36.589551	+34678585431	615525	t	2025-11-12 10:10:34.871
ef635700-a860-4ab1-862e-d2dec76b3bf9	2025-11-13 13:19:44.720375	2025-11-13 13:19:44.720375	+233546403864	871335	f	2025-11-13 13:24:44.717
a560420a-ede9-4f78-a37e-02d601a440d7	2025-11-13 13:20:06.925988	2025-11-13 13:20:06.925988	+233546403864	566553	f	2025-11-13 13:25:06.927
9cc57db5-ce1d-4b0a-9c51-7761e168b879	2025-11-17 15:21:26.584762	2025-11-17 15:21:26.584762	+233546403861	252315	f	2025-11-17 15:26:26.584
415666fa-0509-4ed8-b1a5-3a2ab16494e2	2025-11-18 08:09:38.796652	2025-11-18 08:09:41.14175	+34674433778	622227	t	2025-11-18 08:14:38.794
01e5fbb8-d4c5-4a34-b139-2e4667642e2d	2025-11-18 08:11:17.271685	2025-11-18 08:11:19.256114	+34674433778	434472	t	2025-11-18 08:16:17.268
e901291e-8cad-4394-a29f-4e1bfb64f1c6	2025-11-18 08:14:36.867648	2025-11-18 08:14:39.318664	+34678885551	315361	t	2025-11-18 08:19:36.865
b264916a-f0b3-4be7-a1d5-bcfc7a51489d	2025-11-18 08:27:16.245855	2025-11-18 08:27:18.498292	+34678545125	958631	t	2025-11-18 08:32:16.245
ddffb809-5c0a-4601-851d-7b79f31d055b	2025-11-18 08:32:30.77447	2025-11-18 08:32:33.625764	+34678545125	309856	t	2025-11-18 08:37:30.774
b266a070-ea40-46aa-886a-6d5f2c88dfa6	2025-11-18 08:38:36.557646	2025-11-18 08:38:38.344978	+34675466413	558964	t	2025-11-18 08:43:36.557
06e5f61e-f357-4c57-bb0f-92703211cb8c	2025-11-18 08:48:23.257593	2025-11-18 08:48:25.948335	+34678454845	538442	t	2025-11-18 08:53:22.858
18487678-1159-4825-b543-ee91ea0e2b72	2025-11-18 09:49:57.848099	2025-11-18 09:49:57.848099	+233546403864	672018	f	2025-11-18 09:54:57.845
11dfb39d-acf4-41e2-977d-3699300dad87	2025-11-18 09:50:15.61134	2025-11-18 09:50:15.61134	+233546403864	217179	f	2025-11-18 09:55:15.611
254f5ed2-d5f3-42e4-85d4-fad0187a9f03	2025-11-18 09:51:57.222456	2025-11-18 09:51:57.222456	+233546403864	801072	f	2025-11-18 09:56:57.222
4aa41ed8-464f-4a58-8fbe-783788799072	2025-11-18 09:54:17.956625	2025-11-18 09:54:35.767719	+233546403864	479849	t	2025-11-18 09:59:17.956
39fe9575-e3ba-4594-b0cb-e7e1c79aa5b4	2025-11-18 11:54:34.801907	2025-11-18 11:54:36.735824	+34678585858	829472	t	2025-11-18 11:59:34.801
fca515b5-fe3a-44b4-84a0-0954c91edaf2	2025-11-18 11:55:29.347082	2025-11-18 11:55:31.413028	+34678585858	120684	t	2025-11-18 12:00:29.344
d5ec48f6-2eca-4aec-93f5-7ae9721b19ff	2025-11-18 11:56:37.160784	2025-11-18 11:56:39.007699	+34678585858	459249	t	2025-11-18 12:01:37.159
3f8e7727-a38c-4549-b784-16fd8c95fe2c	2025-11-18 11:59:26.773674	2025-11-18 11:59:28.651642	+34678889965	105846	t	2025-11-18 12:04:26.773
6e7637c1-d3ee-46d5-9838-e97646d1ca26	2025-11-18 12:01:29.966102	2025-11-18 12:01:32.071111	+34678548655	633659	t	2025-11-18 12:06:29.965
a11b7cac-c5d2-4599-be17-1eb04d105b88	2025-11-18 12:06:31.695146	2025-11-18 12:06:33.699977	+34678854421	355345	t	2025-11-18 12:11:31.694
9931d929-f87b-431b-bb9d-b377e87857f9	2025-11-18 12:08:13.820299	2025-11-18 12:08:15.467014	+34678541458	905916	t	2025-11-18 12:13:13.819
754bf143-4eeb-4704-b0f6-6c4e09e53bd2	2025-11-18 12:12:04.881016	2025-11-18 12:12:08.062566	+34678541525	802503	t	2025-11-18 12:17:04.562
ab1a2835-889e-4e5c-a3bb-52e89569fd0a	2025-11-18 12:20:31.226364	2025-11-18 12:20:31.226364	+233546403864	888878	f	2025-11-18 12:25:30.906
45f7f087-5c0f-4251-bb89-9f1a47631c74	2025-11-19 10:06:29.694461	2025-11-19 10:07:11.754946	+34679898986	218301	t	2025-11-19 10:11:29.693
781e3f9d-b9f0-49eb-81ca-6dedf36ff289	2025-11-19 10:26:26.384759	2025-11-19 10:26:29.690968	+34678585854	454866	t	2025-11-19 10:31:26.053
f9ae0563-1339-480b-8b34-e58aa5c5ede0	2025-11-19 16:57:15.242599	2025-11-19 16:57:17.146713	+34684201811	242345	t	2025-11-19 17:02:15.241
018d8a8e-60ef-4665-869e-3f4ec312c58a	2025-11-19 16:59:18.468996	2025-11-19 16:59:19.746349	+34684201811	360979	t	2025-11-19 17:04:18.467
1b2bfd67-d633-471e-aaa2-149b47eca062	2025-11-19 22:02:36.421026	2025-11-19 22:02:38.288561	+34678546785	133390	t	2025-11-19 22:07:36.42
22ece9c8-f437-411d-9d7f-81aff69e0463	2025-11-19 23:16:53.19875	2025-11-19 23:17:10.722407	+233543344100	677249	t	2025-11-19 23:21:53.196
e4b737b4-2494-416b-8529-378ced537002	2025-11-19 23:20:41.546588	2025-11-19 23:21:13.471665	+233543344100	768183	t	2025-11-19 23:25:41.545
9936044e-4615-4a7a-b490-dfd43eff21af	2025-11-19 23:26:29.993072	2025-11-19 23:26:35.408294	+34678546785	640369	t	2025-11-19 23:31:29.991
38ba2055-f2de-45e5-b4d4-976f0d36c8c7	2025-11-20 00:18:01.436612	2025-11-20 00:18:29.698037	+233543344100	206279	t	2025-11-20 00:23:01.434
05e3234a-e822-4ab9-bc83-2790d80e9306	2025-11-20 06:52:22.769268	2025-11-20 06:52:24.170705	+34684201828	823190	t	2025-11-20 06:57:22.77
40fe826c-e0ab-4d00-b98b-edbc374e8dd8	2025-11-20 06:56:17.324335	2025-11-20 06:56:17.324335	+34677889944	734557	f	2025-11-20 07:01:17.324
3a89f617-5b5b-4361-8aca-4b0357d577ba	2025-11-20 06:59:22.504278	2025-11-20 06:59:23.94703	+34684201818	331691	t	2025-11-20 07:04:22.504
74e02aa5-b9ef-4186-8c15-18baf1b228c8	2025-11-20 07:00:30.564438	2025-11-20 07:00:31.745129	+34684201819	372328	t	2025-11-20 07:05:30.564
b2afba5a-efb0-4d07-b8da-6ca55b28f7a6	2025-11-20 07:01:08.264687	2025-11-20 07:01:09.530855	+34684201919	789506	t	2025-11-20 07:06:08.264
336ab94a-5517-4bff-b350-084b8a9c4d2d	2025-11-20 07:02:11.231278	2025-11-20 07:02:12.623684	+34684201919	727507	t	2025-11-20 07:07:11.231
2cf250a1-d5ce-4d43-b917-45e738e6c8bf	2025-11-20 07:04:48.029889	2025-11-20 07:04:50.25976	+34677889944	134891	t	2025-11-20 07:09:48.029
cc836e39-5e3c-4fa3-bf2b-c1772de36033	2025-11-20 07:40:58.463253	2025-11-20 07:41:00.397749	+34678787879	810185	t	2025-11-20 07:45:58.461
23acd977-e7c0-4442-a982-a52c0d89866b	2025-11-20 07:58:30.951075	2025-11-20 07:58:32.629587	+34675858451	126747	t	2025-11-20 08:03:30.95
1255cba8-e1fa-4e4f-955b-6484975f3601	2025-11-20 08:40:15.269133	2025-11-20 08:40:16.82672	+34675858451	956853	t	2025-11-20 08:45:15.267
9e04cc3f-1f4a-499c-abf5-79b0502cab49	2025-11-20 08:44:18.321587	2025-11-20 08:44:20.716357	+34675858541	380225	t	2025-11-20 08:49:18.323
3ccf655c-dea0-4829-88a2-764af62c8361	2025-11-20 08:44:45.733146	2025-11-20 08:44:45.733146	+34675858451	346607	f	2025-11-20 08:49:45.734
a67711c0-3367-4cc0-8b52-de2f1d3cdc99	2025-11-20 08:45:43.640708	2025-11-20 08:45:46.669411	+34675858451	959073	t	2025-11-20 08:50:43.642
02b636f9-58ef-4bdb-8c3d-a2c37454da4d	2025-11-20 08:50:44.311703	2025-11-20 08:50:46.13651	+34675858451	769926	t	2025-11-20 08:55:44.307
ea1db54f-e4eb-4a64-92e4-2e343687b0ab	2025-11-20 08:54:32.886041	2025-11-20 08:54:34.435875	+34675858541	160904	t	2025-11-20 08:59:32.884
19bd94a1-3de3-401f-80b3-5ad260b566b1	2025-11-20 08:54:48.839257	2025-11-20 08:54:50.588393	+34675858451	958179	t	2025-11-20 08:59:48.838
aa36599c-3c3e-47bb-b918-6c95cf342829	2025-11-20 09:53:15.515018	2025-11-20 09:53:17.162979	+34675858451	379455	t	2025-11-20 09:58:15.509
9a88bf35-87e9-4624-8225-e7959c8c3190	2025-11-20 10:03:19.471118	2025-11-20 10:03:21.414812	+34675858451	244838	t	2025-11-20 10:08:19.469
c3a4e352-411a-4f35-a2de-d8f295f4b992	2025-11-20 10:17:45.636249	2025-11-20 10:17:47.062468	+34675858451	804255	t	2025-11-20 10:22:45.634
bd884bc5-857d-46e1-b4b4-bbc5f36b036c	2025-11-20 10:22:46.12979	2025-11-20 10:22:47.648616	+34684202020	784904	t	2025-11-20 10:27:46.128
a6bd488b-7724-4ce6-beeb-f4604d6df97a	2025-11-20 10:26:23.973579	2025-11-20 10:26:25.348387	+34675858451	260049	t	2025-11-20 10:31:23.972
fc0e062f-eaee-48f7-bfa2-1f2653565ae5	2025-11-20 10:26:58.851096	2025-11-20 10:27:19.87252	+233242549545	713712	t	2025-11-20 10:31:58.849
617a9634-6d6d-46ec-abc6-ef2c0942bbb3	2025-11-20 11:10:30.177806	2025-11-20 11:10:47.740974	+233242549545	213294	t	2025-11-20 11:15:30.176
5fd40824-085e-4ecc-9d92-0d478f5b7bf1	2025-11-20 11:29:04.480369	2025-11-20 11:29:06.301798	+34684201816	987485	t	2025-11-20 11:34:04.478
003d73ae-9236-41a9-9f23-433933e98026	2025-11-20 11:29:39.28496	2025-11-20 11:29:41.717301	+34684201815	899953	t	2025-11-20 11:34:39.283
9d1fa627-270a-4988-ba86-223c3bc66dc7	2025-11-23 20:02:05.109128	2025-11-23 20:02:10.462619	+2348068652575	889015	t	2025-11-23 20:07:05.172
6f1a21f4-9eea-4d51-abcc-830aa9aa7918	2025-11-23 23:49:52.085412	2025-11-23 23:50:00.000334	+2348066298572	226489	t	2025-11-23 23:54:52.121
fcdb6e1e-c9d3-40ef-ad6c-fac034b3a071	2025-11-23 23:51:54.109994	2025-11-23 23:51:55.320297	+2348066298572	675857	t	2025-11-23 23:56:54.146
2c0ad70e-8818-4421-8137-3661a76aa5a7	2025-11-23 23:55:41.391785	2025-11-23 23:55:45.758188	+2348066298572	293759	t	2025-11-24 00:00:41.428
791258f3-4025-486a-a5e2-1143f77ff9e2	2025-11-24 10:14:05.278388	2025-11-24 10:14:18.866284	+34684202021	986253	t	2025-11-24 10:19:05.317
298162ac-593e-4799-a31d-ee387c437316	2025-11-24 10:35:27.753718	2025-11-24 10:35:29.677277	+34684202022	664391	t	2025-11-24 10:40:27.792
d3593006-cf34-406e-ad19-f29722a4ab51	2025-11-24 10:35:25.95038	2025-11-24 10:35:41.367207	+233242549545	233161	t	2025-11-24 10:40:25.989
e6c13d9e-d67d-4850-8d9f-0a82e96dc34d	2025-11-24 10:39:20.554458	2025-11-24 10:39:21.738009	+34684202020	468443	t	2025-11-24 10:44:20.593
4e470949-d5a6-4b84-b6ab-7aacf16e4af7	2025-11-24 13:26:23.289513	2025-11-24 13:26:26.139588	+34678585421	742012	t	2025-11-24 13:31:23.33
dc468e76-3fb9-4fab-96c7-c76e864f5c7b	2025-11-24 14:35:06.342525	2025-11-24 14:35:08.827919	+34678451242	784788	t	2025-11-24 14:40:06.381
e17a4ea1-3962-4364-afd4-d052a32af727	2025-11-24 14:37:16.876025	2025-11-24 14:37:21.894697	+34675858451	881206	t	2025-11-24 14:42:16.914
30fd4833-edba-4ef2-a382-b9a92ea515a4	2025-11-24 14:40:45.557503	2025-11-24 14:40:47.666556	+34675858451	497035	t	2025-11-24 14:45:45.596
6f81f133-2379-48d0-bc75-d6f0d7ef7e20	2025-11-24 15:12:48.646276	2025-11-24 15:12:50.591	+34675858451	957162	t	2025-11-24 15:17:48.685
fe0fee52-8f71-4481-893b-bd4bc188fd7a	2025-11-24 15:16:41.509371	2025-11-24 15:16:43.864705	+34675858451	231326	t	2025-11-24 15:21:41.548
f08995ea-6653-4574-86ce-32c254f067b6	2025-11-24 16:00:17.259257	2025-11-24 16:00:19.382094	+34675858451	256190	t	2025-11-24 16:05:17.299
5096aa66-6e4a-4b51-b12b-53ff008d0f02	2025-11-24 16:03:26.22345	2025-11-24 16:03:30.83109	+34675858451	416308	t	2025-11-24 16:08:26.264
8aa78fcd-c9f6-477b-916d-4403906d53b3	2025-11-24 16:12:27.883069	2025-11-24 16:12:29.858361	+34675858451	461802	t	2025-11-24 16:17:27.924
bb1a731f-67c7-4533-981d-8aa131db0541	2025-11-24 16:14:10.904446	2025-11-24 16:14:13.039802	+34675858451	702501	t	2025-11-24 16:19:10.945
25be66df-70bf-4d6f-8e39-c7b368b4f8e2	2025-11-24 16:18:40.157767	2025-11-24 16:18:42.077265	+34678585451	376239	t	2025-11-24 16:23:40.198
fc95de45-bca2-437f-96db-3ff8a7ca194d	2025-11-24 16:19:13.534625	2025-11-24 16:19:16.234751	+34675858451	935907	t	2025-11-24 16:24:13.575
55b37f12-bffd-45ca-a857-6dd2eaf92d89	2025-11-24 16:26:46.990644	2025-11-24 16:26:48.798332	+34675858451	342285	t	2025-11-24 16:31:47.03
8949cc8b-bbbc-4a61-8b4f-5578435ba1e3	2025-11-24 16:27:52.590768	2025-11-24 16:27:54.622702	+34675858451	727069	t	2025-11-24 16:32:52.63
3d07b67e-2ebc-48e2-8860-7af6269caddb	2025-11-24 16:49:40.048992	2025-11-24 16:49:41.839412	+34675858451	833563	t	2025-11-24 16:54:40.088
4ccd9d10-f937-4612-aa88-040b335d7859	2025-11-24 17:02:30.899698	2025-11-24 17:02:32.789797	+34675858451	452659	t	2025-11-24 17:07:30.939
9cba2520-4591-4680-8079-0835558b3f1d	2025-11-24 22:52:56.182009	2025-11-24 22:52:58.283741	+34675858451	307517	t	2025-11-24 22:57:56.214
7b6c94c6-fa8d-4d75-a24c-be17925cd3b6	2025-11-25 08:32:35.307496	2025-11-25 08:32:37.920029	+34675858451	967853	t	2025-11-25 08:37:34.818
7abcd454-9a37-4d30-8a65-3c4885789bbd	2025-11-25 08:53:27.554651	2025-11-25 08:53:30.026029	+34675858451	634823	t	2025-11-25 08:58:26.96
c8c50b02-e2f8-4bdb-811b-2275c0e554d1	2025-11-25 09:03:29.811979	2025-11-25 09:03:32.986984	+34675858451	383125	t	2025-11-25 09:08:29.312
88c98983-57e0-46e1-8ab9-c83fb2dae8a8	2025-11-25 09:13:54.714703	2025-11-25 09:13:57.194887	+34675858451	460624	t	2025-11-25 09:18:54.215
ae968925-4d63-42e8-87c2-cb227f54efcc	2025-11-26 06:13:53.832314	2025-11-26 06:13:55.019239	+34684201816	925178	t	2025-11-26 06:18:53.87
974ebdbb-72dc-451f-bf5b-e5adbbd969d3	2025-11-26 06:14:51.013714	2025-11-26 06:14:52.31146	+34684201818	978510	t	2025-11-26 06:19:51.051
e4acf9b2-8275-4b14-be6c-d7402ce49d74	2025-11-26 06:16:11.401139	2025-11-26 06:16:12.820079	+34684201818	801896	t	2025-11-26 06:21:11.434
8324c883-a090-4ea9-939c-a07acc759056	2025-11-26 10:39:34.783948	2025-11-26 10:39:37.698254	+34675858451	428605	t	2025-11-26 10:44:34.667
13136932-169e-4b7c-a904-797cbdeb9951	2025-11-26 10:50:14.795659	2025-11-26 10:50:18.234538	+34674848451	264909	t	2025-11-26 10:55:14.616
a4eed829-8679-4b46-9baf-c6a3453b1600	2025-11-26 11:21:38.509539	2025-11-26 11:21:40.814624	+34674848451	518520	t	2025-11-26 11:26:38.379
2790a7fc-2a4b-4849-b502-847de29dd2a0	2025-11-26 12:14:00.630807	2025-11-26 12:14:00.630807	+34675858451	511536	f	2025-11-26 12:19:00.67
739b29b8-e09a-4530-8a18-5c7e0e1d135f	2025-11-26 12:27:53.860623	2025-11-26 12:27:55.555414	+34675858451	576479	t	2025-11-26 12:32:53.9
c34543ce-ab31-4d59-a838-c4fda8625e72	2025-11-26 12:37:03.010255	2025-11-26 12:37:04.518731	+34675656451	124875	t	2025-11-26 12:42:03.05
222f86fa-f80b-4451-8b26-f02b234e9224	2025-11-26 12:41:45.470432	2025-11-26 12:41:56.232517	+34675858451	221025	t	2025-11-26 12:46:45.51
f42748d8-119f-4786-9bd5-0fd93e382784	2025-11-26 13:08:55.278327	2025-11-26 13:09:22.072841	+233242549545	364665	t	2025-11-26 13:13:55.318
0fd9b690-8440-48c4-9e05-5099839ecbdf	2025-11-26 13:15:00.896245	2025-11-26 13:15:17.249814	+233242549545	566507	t	2025-11-26 13:20:00.934
ec02d2c6-d7cc-4fb3-a6fd-2aec6808a014	2025-11-26 13:19:16.431789	2025-11-26 13:19:34.748885	+233242549545	100935	t	2025-11-26 13:24:16.468
\.


--
-- Name: cron_job_status_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cron_job_status_id_seq', 1, false);


--
-- Name: cron_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.cron_jobs_id_seq', 2, true);


--
-- Name: intervention_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.intervention_logs_id_seq', 21, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.migrations_id_seq', 2, true);


--
-- Name: app_goal_sub_categories PK_04c0eeefd08feba8dca1c4a64ff; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_goal_sub_categories
    ADD CONSTRAINT "PK_04c0eeefd08feba8dca1c4a64ff" PRIMARY KEY ("appsId", "goalSubCategoriesId");


--
-- Name: admin_users PK_06744d221bb6145dc61e5dc441d; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT "PK_06744d221bb6145dc61e5dc441d" PRIMARY KEY (id);


--
-- Name: messages PK_18325f38ae6de43878487eff986; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "PK_18325f38ae6de43878487eff986" PRIMARY KEY (id);


--
-- Name: goal_categories PK_1c80eac47901d682e6d5fcea6e2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal_categories
    ADD CONSTRAINT "PK_1c80eac47901d682e6d5fcea6e2" PRIMARY KEY (id);


--
-- Name: user_goals PK_1cf8a9384f9f60fef678fd8f363; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_goals
    ADD CONSTRAINT "PK_1cf8a9384f9f60fef678fd8f363" PRIMARY KEY (id);


--
-- Name: verifications PK_2127ad1b143cf012280390b01d1; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.verifications
    ADD CONSTRAINT "PK_2127ad1b143cf012280390b01d1" PRIMARY KEY (id);


--
-- Name: goals PK_26e17b251afab35580dff769223; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT "PK_26e17b251afab35580dff769223" PRIMARY KEY (id);


--
-- Name: goal_priorities PK_2744fcba44fa4aa87dc905bb0cb; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal_priorities
    ADD CONSTRAINT "PK_2744fcba44fa4aa87dc905bb0cb" PRIMARY KEY (id);


--
-- Name: user_goal_priorities PK_30467a2d9c540f576a573fc857e; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_goal_priorities
    ADD CONSTRAINT "PK_30467a2d9c540f576a573fc857e" PRIMARY KEY ("userGoalCategoryId", "goalPriorityId");


--
-- Name: country_languages PK_38ac9ad6f634d8d25a121a37a01; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country_languages
    ADD CONSTRAINT "PK_38ac9ad6f634d8d25a121a37a01" PRIMARY KEY ("countriesId", "languagesId");


--
-- Name: app_screen_audios PK_3957709131229cca533a8737464; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_screen_audios
    ADD CONSTRAINT "PK_3957709131229cca533a8737464" PRIMARY KEY (id);


--
-- Name: user_goal_categories PK_5731001bd11205105ee1b12911c; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_goal_categories
    ADD CONSTRAINT "PK_5731001bd11205105ee1b12911c" PRIMARY KEY (id);


--
-- Name: user_messages PK_5a90e206d5e3dfde48f640ea7c6; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_messages
    ADD CONSTRAINT "PK_5a90e206d5e3dfde48f640ea7c6" PRIMARY KEY (id);


--
-- Name: migrations PK_8c82d7f526340ab734260ea46be; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT "PK_8c82d7f526340ab734260ea46be" PRIMARY KEY (id);


--
-- Name: message_queue PK_948a560dc247eabb847829e9549; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_queue
    ADD CONSTRAINT "PK_948a560dc247eabb847829e9549" PRIMARY KEY (id);


--
-- Name: message_templates PK_9ac2bd9635be662d183f314947d; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_templates
    ADD CONSTRAINT "PK_9ac2bd9635be662d183f314947d" PRIMARY KEY (id);


--
-- Name: app_goals PK_9cc7a93ee691384dc0b4feefc62; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_goals
    ADD CONSTRAINT "PK_9cc7a93ee691384dc0b4feefc62" PRIMARY KEY ("appsId", "goalsId");


--
-- Name: users PK_a3ffb1c0c8416b9fc6f907b7433; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_a3ffb1c0c8416b9fc6f907b7433" PRIMARY KEY (id);


--
-- Name: countries PK_b2d7006793e8697ab3ae2deff18; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "PK_b2d7006793e8697ab3ae2deff18" PRIMARY KEY (id);


--
-- Name: languages PK_b517f827ca496b29f4d549c631d; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT "PK_b517f827ca496b29f4d549c631d" PRIMARY KEY (id);


--
-- Name: app_countries PK_b9c6c422ffb9e3f9913fb68d110; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_countries
    ADD CONSTRAINT "PK_b9c6c422ffb9e3f9913fb68d110" PRIMARY KEY (id);


--
-- Name: services PK_ba2d347a3168a296416c6c5ccb2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT "PK_ba2d347a3168a296416c6c5ccb2" PRIMARY KEY (id);


--
-- Name: apps PK_c5121fda0f8268f1f7f84134e19; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT "PK_c5121fda0f8268f1f7f84134e19" PRIMARY KEY (id);


--
-- Name: app_audios PK_e07326acdd3c4997631419bb2e3; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_audios
    ADD CONSTRAINT "PK_e07326acdd3c4997631419bb2e3" PRIMARY KEY (id);


--
-- Name: goal_sub_categories PK_e9a62f07690b0ffff7b9c478c44; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal_sub_categories
    ADD CONSTRAINT "PK_e9a62f07690b0ffff7b9c478c44" PRIMARY KEY (id);


--
-- Name: user_apps PK_fc0f4f1c464efb7357f6869c15c; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_apps
    ADD CONSTRAINT "PK_fc0f4f1c464efb7357f6869c15c" PRIMARY KEY (id);


--
-- Name: languages UQ_06df62e773ec68318919dafacf7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT "UQ_06df62e773ec68318919dafacf7" UNIQUE (title);


--
-- Name: users UQ_1e3d0240b49c40521aaeb953293; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "UQ_1e3d0240b49c40521aaeb953293" UNIQUE ("phoneNumber");


--
-- Name: languages UQ_7397752718d1c9eb873722ec9b2; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.languages
    ADD CONSTRAINT "UQ_7397752718d1c9eb873722ec9b2" UNIQUE (code);


--
-- Name: apps UQ_88d9328b5403a89eb94af4d5653; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT "UQ_88d9328b5403a89eb94af4d5653" UNIQUE ("appId");


--
-- Name: goals UQ_960318654fa170aae9a3f9e7a40; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT "UQ_960318654fa170aae9a3f9e7a40" UNIQUE (title);


--
-- Name: countries UQ_b47cbb5311bad9c9ae17b8c1eda; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "UQ_b47cbb5311bad9c9ae17b8c1eda" UNIQUE (code);


--
-- Name: goal_categories UQ_c2d9668747087ca1017e1846ce7; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal_categories
    ADD CONSTRAINT "UQ_c2d9668747087ca1017e1846ce7" UNIQUE (name);


--
-- Name: goal_sub_categories UQ_c4bd943fc2c32c451e00db6325d; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal_sub_categories
    ADD CONSTRAINT "UQ_c4bd943fc2c32c451e00db6325d" UNIQUE (name);


--
-- Name: admin_users UQ_dcd0c8a4b10af9c986e510b9ecc; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.admin_users
    ADD CONSTRAINT "UQ_dcd0c8a4b10af9c986e510b9ecc" UNIQUE (email);


--
-- Name: cron_job_status cron_job_status_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cron_job_status
    ADD CONSTRAINT cron_job_status_pkey PRIMARY KEY (id);


--
-- Name: cron_jobs cron_jobs_job_key_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cron_jobs
    ADD CONSTRAINT cron_jobs_job_key_key UNIQUE (job_key);


--
-- Name: cron_jobs cron_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.cron_jobs
    ADD CONSTRAINT cron_jobs_pkey PRIMARY KEY (id);


--
-- Name: evaluation_conditions evaluation_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evaluation_conditions
    ADD CONSTRAINT evaluation_conditions_pkey PRIMARY KEY (id);


--
-- Name: evaluation_conditions evaluation_conditions_rule_name_key; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.evaluation_conditions
    ADD CONSTRAINT evaluation_conditions_rule_name_key UNIQUE (rule_name);


--
-- Name: high_watermarks high_watermarks_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.high_watermarks
    ADD CONSTRAINT high_watermarks_pkey PRIMARY KEY (id);


--
-- Name: intervention_logs intervention_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.intervention_logs
    ADD CONSTRAINT intervention_logs_pkey PRIMARY KEY (id);


--
-- Name: milestone_logs milestone_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.milestone_logs
    ADD CONSTRAINT milestone_logs_pkey PRIMARY KEY (id);


--
-- Name: rewards_issued rewards_issued_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rewards_issued
    ADD CONSTRAINT rewards_issued_pkey PRIMARY KEY (id);


--
-- Name: signal_logs signal_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.signal_logs
    ADD CONSTRAINT signal_logs_pkey PRIMARY KEY (id);


--
-- Name: IDX_0c4cce5a5fac446cf045fc0a0a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_0c4cce5a5fac446cf045fc0a0a" ON public.app_goal_sub_categories USING btree ("goalSubCategoriesId");


--
-- Name: IDX_285c3533ad0e71168f015c71dd; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_285c3533ad0e71168f015c71dd" ON public.app_goal_sub_categories USING btree ("appsId");


--
-- Name: IDX_58b864fe2d90186e32372df25a; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_58b864fe2d90186e32372df25a" ON public.app_goals USING btree ("appsId");


--
-- Name: IDX_5bbf8c7905218e8daf83734ecc; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_5bbf8c7905218e8daf83734ecc" ON public.user_goal_priorities USING btree ("userGoalCategoryId");


--
-- Name: IDX_89dc703d8ca945151a4fb0945c; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_89dc703d8ca945151a4fb0945c" ON public.country_languages USING btree ("countriesId");


--
-- Name: IDX_b321147e5c326be40fc9c68c51; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_b321147e5c326be40fc9c68c51" ON public.country_languages USING btree ("languagesId");


--
-- Name: IDX_bba7a20d94bd8e16204a2bb6b9; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_bba7a20d94bd8e16204a2bb6b9" ON public.user_goal_priorities USING btree ("goalPriorityId");


--
-- Name: IDX_f5217329c699f0327b2d9cb9c2; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX "IDX_f5217329c699f0327b2d9cb9c2" ON public.app_goals USING btree ("goalsId");


--
-- Name: idx_intervention_logs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_intervention_logs_created_at ON public.intervention_logs USING btree (created_at);


--
-- Name: idx_intervention_logs_intervention_ids; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_intervention_logs_intervention_ids ON public.intervention_logs USING gin (intervention_ids);


--
-- Name: idx_intervention_logs_user_ids; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_intervention_logs_user_ids ON public.intervention_logs USING gin (user_ids);


--
-- Name: idx_milestone_logs_app_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_milestone_logs_app_id ON public.milestone_logs USING btree (app_id);


--
-- Name: idx_milestone_logs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_milestone_logs_created_at ON public.milestone_logs USING btree (created_at);


--
-- Name: idx_milestone_logs_is_checked; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_milestone_logs_is_checked ON public.milestone_logs USING btree (is_checked);


--
-- Name: idx_milestone_logs_milestone_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_milestone_logs_milestone_id ON public.milestone_logs USING btree (milestone_id);


--
-- Name: idx_milestone_logs_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_milestone_logs_user_id ON public.milestone_logs USING btree (user_id);


--
-- Name: idx_rules_type_active; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_rules_type_active ON public.evaluation_conditions USING btree (rule_type, is_active);


--
-- Name: idx_signal_logs_app_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_signal_logs_app_id ON public.signal_logs USING btree (app_id);


--
-- Name: idx_signal_logs_created_at; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_signal_logs_created_at ON public.signal_logs USING btree (created_at);


--
-- Name: idx_signal_logs_signal_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_signal_logs_signal_id ON public.signal_logs USING btree (signal_id);


--
-- Name: idx_signal_logs_user_id; Type: INDEX; Schema: public; Owner: -
--

CREATE INDEX idx_signal_logs_user_id ON public.signal_logs USING btree (user_id);


--
-- Name: app_countries FK_00a239a9e4ae728702d89d237f2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_countries
    ADD CONSTRAINT "FK_00a239a9e4ae728702d89d237f2" FOREIGN KEY (app_id) REFERENCES public.apps(id) ON DELETE CASCADE;


--
-- Name: goals FK_08e63ee409a979262dc1d1868b6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT "FK_08e63ee409a979262dc1d1868b6" FOREIGN KEY ("goalSubCategoryId") REFERENCES public.goal_sub_categories(id);


--
-- Name: app_goal_sub_categories FK_0c4cce5a5fac446cf045fc0a0a4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_goal_sub_categories
    ADD CONSTRAINT "FK_0c4cce5a5fac446cf045fc0a0a4" FOREIGN KEY ("goalSubCategoriesId") REFERENCES public.goal_sub_categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: countries FK_134a8d7f104440d12d4aa7cb198; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "FK_134a8d7f104440d12d4aa7cb198" FOREIGN KEY (preferred_voice_language_id) REFERENCES public.languages(id);


--
-- Name: app_goal_sub_categories FK_285c3533ad0e71168f015c71dd5; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_goal_sub_categories
    ADD CONSTRAINT "FK_285c3533ad0e71168f015c71dd5" FOREIGN KEY ("appsId") REFERENCES public.apps(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_goals FK_4bbd0401b703af6edaa27ea4cf6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_goals
    ADD CONSTRAINT "FK_4bbd0401b703af6edaa27ea4cf6" FOREIGN KEY ("goalId") REFERENCES public.goals(id);


--
-- Name: countries FK_4caf5b53eb19ec9806f596a72b2; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT "FK_4caf5b53eb19ec9806f596a72b2" FOREIGN KEY (preferred_display_language_id) REFERENCES public.languages(id);


--
-- Name: app_countries FK_4de4ec7ad2dcdf4f5cc4f3df56c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_countries
    ADD CONSTRAINT "FK_4de4ec7ad2dcdf4f5cc4f3df56c" FOREIGN KEY (country_id) REFERENCES public.countries(id) ON DELETE CASCADE;


--
-- Name: app_goals FK_58b864fe2d90186e32372df25a6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_goals
    ADD CONSTRAINT "FK_58b864fe2d90186e32372df25a6" FOREIGN KEY ("appsId") REFERENCES public.apps(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_goal_priorities FK_5bbf8c7905218e8daf83734ecc9; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_goal_priorities
    ADD CONSTRAINT "FK_5bbf8c7905218e8daf83734ecc9" FOREIGN KEY ("userGoalCategoryId") REFERENCES public.user_goal_categories(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_messages FK_68d799aeb820f0e823c1120fe73; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_messages
    ADD CONSTRAINT "FK_68d799aeb820f0e823c1120fe73" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: goal_sub_categories FK_72d89d705970ac523386529c698; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal_sub_categories
    ADD CONSTRAINT "FK_72d89d705970ac523386529c698" FOREIGN KEY ("goalCategoryId") REFERENCES public.goal_categories(id);


--
-- Name: app_audios FK_7ae4353751bb071391a40fcb195; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_audios
    ADD CONSTRAINT "FK_7ae4353751bb071391a40fcb195" FOREIGN KEY ("appId") REFERENCES public.apps(id) ON DELETE CASCADE;


--
-- Name: user_goal_categories FK_8001bb6194cd9ad717606002b20; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_goal_categories
    ADD CONSTRAINT "FK_8001bb6194cd9ad717606002b20" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: apps FK_860fb2ed99a000c335715c0d7b0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.apps
    ADD CONSTRAINT "FK_860fb2ed99a000c335715c0d7b0" FOREIGN KEY ("goalCategoryId") REFERENCES public.goal_categories(id);


--
-- Name: user_apps FK_884ba4e0d8cd4b80fe912c93db0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_apps
    ADD CONSTRAINT "FK_884ba4e0d8cd4b80fe912c93db0" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: country_languages FK_89dc703d8ca945151a4fb0945cd; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country_languages
    ADD CONSTRAINT "FK_89dc703d8ca945151a4fb0945cd" FOREIGN KEY ("countriesId") REFERENCES public.countries(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_messages FK_8f211af20e47fff29862054ac56; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_messages
    ADD CONSTRAINT "FK_8f211af20e47fff29862054ac56" FOREIGN KEY ("messageId") REFERENCES public.messages(id);


--
-- Name: users FK_9f9c3548c0fa4efecb1e0f292dc; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_9f9c3548c0fa4efecb1e0f292dc" FOREIGN KEY ("secondaryLanguageId") REFERENCES public.languages(id);


--
-- Name: users FK_a0ed47f0ee7de871cdbcf9d1f93; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_a0ed47f0ee7de871cdbcf9d1f93" FOREIGN KEY ("countryCode") REFERENCES public.countries(code);


--
-- Name: goals FK_a486d9bb93d1d26ac5b8dd78600; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goals
    ADD CONSTRAINT "FK_a486d9bb93d1d26ac5b8dd78600" FOREIGN KEY ("goalCategoryId") REFERENCES public.goal_categories(id);


--
-- Name: country_languages FK_b321147e5c326be40fc9c68c517; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.country_languages
    ADD CONSTRAINT "FK_b321147e5c326be40fc9c68c517" FOREIGN KEY ("languagesId") REFERENCES public.languages(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: message_queue FK_b75e4e870050e3e7a0f948defd6; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.message_queue
    ADD CONSTRAINT "FK_b75e4e870050e3e7a0f948defd6" FOREIGN KEY ("templateId") REFERENCES public.message_templates(id);


--
-- Name: user_goal_priorities FK_bba7a20d94bd8e16204a2bb6b99; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_goal_priorities
    ADD CONSTRAINT "FK_bba7a20d94bd8e16204a2bb6b99" FOREIGN KEY ("goalPriorityId") REFERENCES public.goal_priorities(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_goal_categories FK_bd6ac8878c150cb1b9469fc96d4; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_goal_categories
    ADD CONSTRAINT "FK_bd6ac8878c150cb1b9469fc96d4" FOREIGN KEY ("goalCategoryId") REFERENCES public.goal_categories(id);


--
-- Name: goal_priorities FK_be5edb7aad1a24725d54573a56f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.goal_priorities
    ADD CONSTRAINT "FK_be5edb7aad1a24725d54573a56f" FOREIGN KEY ("goalCategoryId") REFERENCES public.goal_categories(id);


--
-- Name: user_goals FK_c14a9a2e19a021a11de6775564e; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_goals
    ADD CONSTRAINT "FK_c14a9a2e19a021a11de6775564e" FOREIGN KEY ("userId") REFERENCES public.users(id);


--
-- Name: user_apps FK_cacf8c78ceb44d2dcb0f8f67247; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.user_apps
    ADD CONSTRAINT "FK_cacf8c78ceb44d2dcb0f8f67247" FOREIGN KEY ("appId") REFERENCES public.apps(id);


--
-- Name: users FK_e82afcf2bc3e13cfdd1a313112f; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "FK_e82afcf2bc3e13cfdd1a313112f" FOREIGN KEY ("primaryLanguageId") REFERENCES public.languages(id);


--
-- Name: app_goals FK_f5217329c699f0327b2d9cb9c2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.app_goals
    ADD CONSTRAINT "FK_f5217329c699f0327b2d9cb9c2a" FOREIGN KEY ("goalsId") REFERENCES public.goals(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: messages FK_fa26bb110a3cb2ea576a10bb766; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.messages
    ADD CONSTRAINT "FK_fa26bb110a3cb2ea576a10bb766" FOREIGN KEY ("coachId") REFERENCES public.admin_users(id);


--
-- Name: rewards_issued rewards_issued_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.rewards_issued
    ADD CONSTRAINT rewards_issued_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

\unrestrict egjXPR1DC8vefDOWEdA5a1ZuWpTwadxJvz0GsnTxofOJ1YEizaG2kQ0nb2hgUli

