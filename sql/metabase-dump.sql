--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2 (Debian 13.2-1.pgdg100+1)
-- Dumped by pg_dump version 13.2

-- Started on 2021-04-12 22:09:56 -03

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 228 (class 1259 OID 29146)
-- Name: activity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity (
    id integer NOT NULL,
    topic character varying(32) NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    user_id integer,
    model character varying(16),
    model_id integer,
    database_id integer,
    table_id integer,
    custom_id character varying(48),
    details character varying NOT NULL
);


ALTER TABLE public.activity OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 29144)
-- Name: activity_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.activity_id_seq OWNER TO postgres;

--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 227
-- Name: activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_id_seq OWNED BY public.activity.id;


--
-- TOC entry 251 (class 1259 OID 29362)
-- Name: card_label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.card_label (
    id integer NOT NULL,
    card_id integer NOT NULL,
    label_id integer NOT NULL
);


ALTER TABLE public.card_label OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 29360)
-- Name: card_label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.card_label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.card_label_id_seq OWNER TO postgres;

--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 250
-- Name: card_label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.card_label_id_seq OWNED BY public.card_label.id;


--
-- TOC entry 263 (class 1259 OID 29549)
-- Name: collection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    color character(7) NOT NULL,
    archived boolean DEFAULT false NOT NULL,
    location character varying(254) DEFAULT '/'::character varying NOT NULL,
    personal_owner_id integer,
    slug character varying(254) NOT NULL,
    namespace character varying(254)
);


ALTER TABLE public.collection OWNER TO postgres;

--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE collection; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.collection IS 'Collections are an optional way to organize Cards and handle permissions for them.';


--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN collection.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection.name IS 'The user-facing name of this Collection.';


--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN collection.description; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection.description IS 'Optional description for this Collection.';


--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN collection.color; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection.color IS 'Seven-character hex color for this Collection, including the preceding hash sign.';


--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN collection.archived; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection.archived IS 'Whether this Collection has been archived and should be hidden from users.';


--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN collection.location; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection.location IS 'Directory-structure path of ancestor Collections. e.g. "/1/2/" means our Parent is Collection 2, and their parent is Collection 1.';


--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN collection.personal_owner_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection.personal_owner_id IS 'If set, this Collection is a personal Collection, for exclusive use of the User with this ID.';


--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN collection.slug; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection.slug IS 'Sluggified version of the Collection name. Used only for display purposes in URL; not unique or indexed.';


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 263
-- Name: COLUMN collection.namespace; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection.namespace IS 'The namespace (hierachy) this Collection belongs to. NULL means the Collection is in the default namespace.';


--
-- TOC entry 262 (class 1259 OID 29547)
-- Name: collection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_id_seq OWNER TO postgres;

--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 262
-- Name: collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_id_seq OWNED BY public.collection.id;


--
-- TOC entry 265 (class 1259 OID 29570)
-- Name: collection_revision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.collection_revision (
    id integer NOT NULL,
    before text NOT NULL,
    after text NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    remark text
);


ALTER TABLE public.collection_revision OWNER TO postgres;

--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 265
-- Name: TABLE collection_revision; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.collection_revision IS 'Used to keep track of changes made to collections.';


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN collection_revision.before; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection_revision.before IS 'Serialized JSON of the collections graph before the changes.';


--
-- TOC entry 3787 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN collection_revision.after; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection_revision.after IS 'Serialized JSON of the collections graph after the changes.';


--
-- TOC entry 3788 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN collection_revision.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection_revision.user_id IS 'The ID of the admin who made this set of changes.';


--
-- TOC entry 3789 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN collection_revision.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection_revision.created_at IS 'The timestamp of when these changes were made.';


--
-- TOC entry 3790 (class 0 OID 0)
-- Dependencies: 265
-- Name: COLUMN collection_revision.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.collection_revision.remark IS 'Optional remarks explaining why these changes were made.';


--
-- TOC entry 264 (class 1259 OID 29568)
-- Name: collection_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.collection_revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.collection_revision_id_seq OWNER TO postgres;

--
-- TOC entry 3791 (class 0 OID 0)
-- Dependencies: 264
-- Name: collection_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.collection_revision_id_seq OWNED BY public.collection_revision.id;


--
-- TOC entry 275 (class 1259 OID 29687)
-- Name: computation_job; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.computation_job (
    id integer NOT NULL,
    creator_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    type character varying(254) NOT NULL,
    status character varying(254) NOT NULL,
    context text,
    ended_at timestamp without time zone
);


ALTER TABLE public.computation_job OWNER TO postgres;

--
-- TOC entry 3792 (class 0 OID 0)
-- Dependencies: 275
-- Name: TABLE computation_job; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.computation_job IS 'Stores submitted async computation jobs.';


--
-- TOC entry 274 (class 1259 OID 29685)
-- Name: computation_job_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.computation_job_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computation_job_id_seq OWNER TO postgres;

--
-- TOC entry 3793 (class 0 OID 0)
-- Dependencies: 274
-- Name: computation_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.computation_job_id_seq OWNED BY public.computation_job.id;


--
-- TOC entry 277 (class 1259 OID 29703)
-- Name: computation_job_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.computation_job_result (
    id integer NOT NULL,
    job_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    permanence character varying(254) NOT NULL,
    payload text NOT NULL
);


ALTER TABLE public.computation_job_result OWNER TO postgres;

--
-- TOC entry 3794 (class 0 OID 0)
-- Dependencies: 277
-- Name: TABLE computation_job_result; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.computation_job_result IS 'Stores results of async computation jobs.';


--
-- TOC entry 276 (class 1259 OID 29701)
-- Name: computation_job_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.computation_job_result_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.computation_job_result_id_seq OWNER TO postgres;

--
-- TOC entry 3795 (class 0 OID 0)
-- Dependencies: 276
-- Name: computation_job_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.computation_job_result_id_seq OWNED BY public.computation_job_result.id;


--
-- TOC entry 223 (class 1259 OID 29093)
-- Name: core_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_session (
    id character varying(254) NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    anti_csrf_token text
);


ALTER TABLE public.core_session OWNER TO postgres;

--
-- TOC entry 3796 (class 0 OID 0)
-- Dependencies: 223
-- Name: COLUMN core_session.anti_csrf_token; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.core_session.anti_csrf_token IS 'Anti-CSRF token for full-app embed sessions.';


--
-- TOC entry 206 (class 1259 OID 28689)
-- Name: core_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.core_user (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    first_name character varying(254) NOT NULL,
    last_name character varying(254) NOT NULL,
    password character varying(254) NOT NULL,
    password_salt character varying(254) DEFAULT 'default'::character varying NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean DEFAULT false NOT NULL,
    is_active boolean DEFAULT true NOT NULL,
    reset_token character varying(254),
    reset_triggered bigint,
    is_qbnewb boolean DEFAULT true NOT NULL,
    google_auth boolean DEFAULT false NOT NULL,
    ldap_auth boolean DEFAULT false NOT NULL,
    login_attributes text,
    updated_at timestamp without time zone,
    sso_source character varying(254),
    locale character varying(5)
);


ALTER TABLE public.core_user OWNER TO postgres;

--
-- TOC entry 3797 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN core_user.login_attributes; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.core_user.login_attributes IS 'JSON serialized map with attributes used for row level permissions';


--
-- TOC entry 3798 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN core_user.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.core_user.updated_at IS 'When was this User last updated?';


--
-- TOC entry 3799 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN core_user.sso_source; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.core_user.sso_source IS 'String to indicate the SSO backend the user is from';


--
-- TOC entry 3800 (class 0 OID 0)
-- Dependencies: 206
-- Name: COLUMN core_user.locale; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.core_user.locale IS 'Preferred ISO locale (language/country) code, e.g "en" or "en-US", for this User. Overrides site default.';


--
-- TOC entry 205 (class 1259 OID 28687)
-- Name: core_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.core_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.core_user_id_seq OWNER TO postgres;

--
-- TOC entry 3801 (class 0 OID 0)
-- Dependencies: 205
-- Name: core_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.core_user_id_seq OWNED BY public.core_user.id;


--
-- TOC entry 271 (class 1259 OID 29636)
-- Name: dashboard_favorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard_favorite (
    id integer NOT NULL,
    user_id integer NOT NULL,
    dashboard_id integer NOT NULL
);


ALTER TABLE public.dashboard_favorite OWNER TO postgres;

--
-- TOC entry 3802 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE dashboard_favorite; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dashboard_favorite IS 'Presence of a row here indicates a given User has favorited a given Dashboard.';


--
-- TOC entry 3803 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN dashboard_favorite.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dashboard_favorite.user_id IS 'ID of the User who favorited the Dashboard.';


--
-- TOC entry 3804 (class 0 OID 0)
-- Dependencies: 271
-- Name: COLUMN dashboard_favorite.dashboard_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dashboard_favorite.dashboard_id IS 'ID of the Dashboard favorited by the User.';


--
-- TOC entry 270 (class 1259 OID 29634)
-- Name: dashboard_favorite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_favorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_favorite_id_seq OWNER TO postgres;

--
-- TOC entry 3805 (class 0 OID 0)
-- Dependencies: 270
-- Name: dashboard_favorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboard_favorite_id_seq OWNED BY public.dashboard_favorite.id;


--
-- TOC entry 247 (class 1259 OID 29327)
-- Name: dashboardcard_series; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboardcard_series (
    id integer NOT NULL,
    dashboardcard_id integer NOT NULL,
    card_id integer NOT NULL,
    "position" integer NOT NULL
);


ALTER TABLE public.dashboardcard_series OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 29325)
-- Name: dashboardcard_series_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboardcard_series_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboardcard_series_id_seq OWNER TO postgres;

--
-- TOC entry 3806 (class 0 OID 0)
-- Dependencies: 246
-- Name: dashboardcard_series_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dashboardcard_series_id_seq OWNED BY public.dashboardcard_series.id;


--
-- TOC entry 231 (class 1259 OID 29180)
-- Name: data_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_migrations (
    id character varying(254) NOT NULL,
    "timestamp" timestamp without time zone NOT NULL
);


ALTER TABLE public.data_migrations OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 28663)
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 28669)
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 29290)
-- Name: dependency; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dependency (
    id integer NOT NULL,
    model character varying(32) NOT NULL,
    model_id integer NOT NULL,
    dependent_on_model character varying(32) NOT NULL,
    dependent_on_id integer NOT NULL,
    created_at timestamp with time zone NOT NULL
);


ALTER TABLE public.dependency OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 29288)
-- Name: dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dependency_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dependency_id_seq OWNER TO postgres;

--
-- TOC entry 3807 (class 0 OID 0)
-- Dependencies: 242
-- Name: dependency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dependency_id_seq OWNED BY public.dependency.id;


--
-- TOC entry 273 (class 1259 OID 29659)
-- Name: dimension; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dimension (
    id integer NOT NULL,
    field_id integer NOT NULL,
    name character varying(254) NOT NULL,
    type character varying(254) NOT NULL,
    human_readable_field_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE public.dimension OWNER TO postgres;

--
-- TOC entry 3808 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE dimension; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.dimension IS 'Stores references to alternate views of existing fields, such as remapping an integer to a description, like an enum';


--
-- TOC entry 3809 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN dimension.field_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dimension.field_id IS 'ID of the field this dimension row applies to';


--
-- TOC entry 3810 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN dimension.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dimension.name IS 'Short description used as the display name of this new column';


--
-- TOC entry 3811 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN dimension.type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dimension.type IS 'Either internal for a user defined remapping or external for a foreign key based remapping';


--
-- TOC entry 3812 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN dimension.human_readable_field_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dimension.human_readable_field_id IS 'Only used with external type remappings. Indicates which field on the FK related table to use for display';


--
-- TOC entry 3813 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN dimension.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dimension.created_at IS 'The timestamp of when the dimension was created.';


--
-- TOC entry 3814 (class 0 OID 0)
-- Dependencies: 273
-- Name: COLUMN dimension.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.dimension.updated_at IS 'The timestamp of when these dimension was last updated.';


--
-- TOC entry 272 (class 1259 OID 29657)
-- Name: dimension_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dimension_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dimension_id_seq OWNER TO postgres;

--
-- TOC entry 3815 (class 0 OID 0)
-- Dependencies: 272
-- Name: dimension_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dimension_id_seq OWNED BY public.dimension.id;


--
-- TOC entry 279 (class 1259 OID 29724)
-- Name: group_table_access_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_table_access_policy (
    id integer NOT NULL,
    group_id integer NOT NULL,
    table_id integer NOT NULL,
    card_id integer,
    attribute_remappings text
);


ALTER TABLE public.group_table_access_policy OWNER TO postgres;

--
-- TOC entry 3816 (class 0 OID 0)
-- Dependencies: 279
-- Name: TABLE group_table_access_policy; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.group_table_access_policy IS 'Records that a given Card (Question) should automatically replace a given Table as query source for a given a Perms Group.';


--
-- TOC entry 3817 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN group_table_access_policy.group_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_table_access_policy.group_id IS 'ID of the Permissions Group this policy affects.';


--
-- TOC entry 3818 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN group_table_access_policy.table_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_table_access_policy.table_id IS 'ID of the Table that should get automatically replaced as query source for the Permissions Group.';


--
-- TOC entry 3819 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN group_table_access_policy.card_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_table_access_policy.card_id IS 'ID of the Card (Question) to be used to replace the Table.';


--
-- TOC entry 3820 (class 0 OID 0)
-- Dependencies: 279
-- Name: COLUMN group_table_access_policy.attribute_remappings; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.group_table_access_policy.attribute_remappings IS 'JSON-encoded map of user attribute identifier to the param name used in the Card.';


--
-- TOC entry 278 (class 1259 OID 29722)
-- Name: group_table_access_policy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.group_table_access_policy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_table_access_policy_id_seq OWNER TO postgres;

--
-- TOC entry 3821 (class 0 OID 0)
-- Dependencies: 278
-- Name: group_table_access_policy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.group_table_access_policy_id_seq OWNED BY public.group_table_access_policy.id;


--
-- TOC entry 249 (class 1259 OID 29348)
-- Name: label; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.label (
    id integer NOT NULL,
    name character varying(254) NOT NULL,
    slug character varying(254) NOT NULL,
    icon character varying(128)
);


ALTER TABLE public.label OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 29346)
-- Name: label_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.label_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.label_id_seq OWNER TO postgres;

--
-- TOC entry 3822 (class 0 OID 0)
-- Dependencies: 248
-- Name: label_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.label_id_seq OWNED BY public.label.id;


--
-- TOC entry 208 (class 1259 OID 28739)
-- Name: metabase_database; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metabase_database (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    details text,
    engine character varying(254) NOT NULL,
    is_sample boolean DEFAULT false NOT NULL,
    is_full_sync boolean DEFAULT true NOT NULL,
    points_of_interest text,
    caveats text,
    metadata_sync_schedule character varying(254) DEFAULT '0 50 * * * ? *'::character varying NOT NULL,
    cache_field_values_schedule character varying(254) DEFAULT '0 50 0 * * ? *'::character varying NOT NULL,
    timezone character varying(254),
    is_on_demand boolean DEFAULT false NOT NULL,
    options text,
    auto_run_queries boolean DEFAULT true NOT NULL,
    refingerprint boolean
);


ALTER TABLE public.metabase_database OWNER TO postgres;

--
-- TOC entry 3823 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN metabase_database.metadata_sync_schedule; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_database.metadata_sync_schedule IS 'The cron schedule string for when this database should undergo the metadata sync process (and analysis for new fields).';


--
-- TOC entry 3824 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN metabase_database.cache_field_values_schedule; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_database.cache_field_values_schedule IS 'The cron schedule string for when FieldValues for eligible Fields should be updated.';


--
-- TOC entry 3825 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN metabase_database.timezone; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_database.timezone IS 'Timezone identifier for the database, set by the sync process';


--
-- TOC entry 3826 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN metabase_database.is_on_demand; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_database.is_on_demand IS 'Whether we should do On-Demand caching of FieldValues for this DB. This means FieldValues are updated when their Field is used in a Dashboard or Card param.';


--
-- TOC entry 3827 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN metabase_database.options; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_database.options IS 'Serialized JSON containing various options like QB behavior.';


--
-- TOC entry 3828 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN metabase_database.auto_run_queries; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_database.auto_run_queries IS 'Whether to automatically run queries when doing simple filtering and summarizing in the Query Builder.';


--
-- TOC entry 3829 (class 0 OID 0)
-- Dependencies: 208
-- Name: COLUMN metabase_database.refingerprint; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_database.refingerprint IS 'Whether or not to enable periodic refingerprinting for this Database.';


--
-- TOC entry 207 (class 1259 OID 28737)
-- Name: metabase_database_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metabase_database_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metabase_database_id_seq OWNER TO postgres;

--
-- TOC entry 3830 (class 0 OID 0)
-- Dependencies: 207
-- Name: metabase_database_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metabase_database_id_seq OWNED BY public.metabase_database.id;


--
-- TOC entry 212 (class 1259 OID 28773)
-- Name: metabase_field; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metabase_field (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    base_type character varying(255) NOT NULL,
    special_type character varying(255),
    active boolean DEFAULT true NOT NULL,
    description text,
    preview_display boolean DEFAULT true NOT NULL,
    "position" integer DEFAULT 0 NOT NULL,
    table_id integer NOT NULL,
    parent_id integer,
    display_name character varying(254),
    visibility_type character varying(32) DEFAULT 'normal'::character varying NOT NULL,
    fk_target_field_id integer,
    last_analyzed timestamp with time zone,
    points_of_interest text,
    caveats text,
    fingerprint text,
    fingerprint_version integer DEFAULT 0 NOT NULL,
    database_type text NOT NULL,
    has_field_values text,
    settings text,
    database_position integer DEFAULT 0 NOT NULL,
    custom_position integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.metabase_field OWNER TO postgres;

--
-- TOC entry 3831 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN metabase_field.fingerprint; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_field.fingerprint IS 'Serialized JSON containing non-identifying information about this Field, such as min, max, and percent JSON. Used for classification.';


--
-- TOC entry 3832 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN metabase_field.fingerprint_version; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_field.fingerprint_version IS 'The version of the fingerprint for this Field. Used so we can keep track of which Fields need to be analyzed again when new things are added to fingerprints.';


--
-- TOC entry 3833 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN metabase_field.database_type; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_field.database_type IS 'The actual type of this column in the database. e.g. VARCHAR or TEXT.';


--
-- TOC entry 3834 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN metabase_field.has_field_values; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_field.has_field_values IS 'Whether we have FieldValues ("list"), should ad-hoc search ("search"), disable entirely ("none"), or infer dynamically (null)"';


--
-- TOC entry 3835 (class 0 OID 0)
-- Dependencies: 212
-- Name: COLUMN metabase_field.settings; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.metabase_field.settings IS 'Serialized JSON FE-specific settings like formatting, etc. Scope of what is stored here may increase in future.';


--
-- TOC entry 211 (class 1259 OID 28771)
-- Name: metabase_field_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metabase_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metabase_field_id_seq OWNER TO postgres;

--
-- TOC entry 3836 (class 0 OID 0)
-- Dependencies: 211
-- Name: metabase_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metabase_field_id_seq OWNED BY public.metabase_field.id;


--
-- TOC entry 214 (class 1259 OID 28810)
-- Name: metabase_fieldvalues; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metabase_fieldvalues (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    "values" text,
    human_readable_values text,
    field_id integer NOT NULL
);


ALTER TABLE public.metabase_fieldvalues OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 28808)
-- Name: metabase_fieldvalues_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metabase_fieldvalues_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metabase_fieldvalues_id_seq OWNER TO postgres;

--
-- TOC entry 3837 (class 0 OID 0)
-- Dependencies: 213
-- Name: metabase_fieldvalues_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metabase_fieldvalues_id_seq OWNED BY public.metabase_fieldvalues.id;


--
-- TOC entry 210 (class 1259 OID 28756)
-- Name: metabase_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metabase_table (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    entity_name character varying(254),
    entity_type character varying(254),
    active boolean NOT NULL,
    db_id integer NOT NULL,
    display_name character varying(254),
    visibility_type character varying(254),
    schema character varying(254),
    points_of_interest text,
    caveats text,
    show_in_getting_started boolean DEFAULT false NOT NULL,
    field_order character varying(254) DEFAULT 'database'::character varying NOT NULL
);


ALTER TABLE public.metabase_table OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 28754)
-- Name: metabase_table_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metabase_table_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metabase_table_id_seq OWNER TO postgres;

--
-- TOC entry 3838 (class 0 OID 0)
-- Dependencies: 209
-- Name: metabase_table_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metabase_table_id_seq OWNED BY public.metabase_table.id;


--
-- TOC entry 245 (class 1259 OID 29302)
-- Name: metric; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metric (
    id integer NOT NULL,
    table_id integer NOT NULL,
    creator_id integer NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    archived boolean DEFAULT false NOT NULL,
    definition text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    points_of_interest text,
    caveats text,
    how_is_this_calculated text,
    show_in_getting_started boolean DEFAULT false NOT NULL
);


ALTER TABLE public.metric OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 29300)
-- Name: metric_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metric_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metric_id_seq OWNER TO postgres;

--
-- TOC entry 3839 (class 0 OID 0)
-- Dependencies: 244
-- Name: metric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metric_id_seq OWNED BY public.metric.id;


--
-- TOC entry 253 (class 1259 OID 29442)
-- Name: metric_important_field; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.metric_important_field (
    id integer NOT NULL,
    metric_id integer NOT NULL,
    field_id integer NOT NULL
);


ALTER TABLE public.metric_important_field OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 29440)
-- Name: metric_important_field_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.metric_important_field_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metric_important_field_id_seq OWNER TO postgres;

--
-- TOC entry 3840 (class 0 OID 0)
-- Dependencies: 252
-- Name: metric_important_field_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.metric_important_field_id_seq OWNED BY public.metric_important_field.id;


--
-- TOC entry 294 (class 1259 OID 29941)
-- Name: native_query_snippet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.native_query_snippet (
    id integer NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    content text NOT NULL,
    creator_id integer NOT NULL,
    archived boolean DEFAULT false NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    collection_id integer
);


ALTER TABLE public.native_query_snippet OWNER TO postgres;

--
-- TOC entry 3841 (class 0 OID 0)
-- Dependencies: 294
-- Name: TABLE native_query_snippet; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.native_query_snippet IS 'Query snippets (raw text) to be substituted in native queries';


--
-- TOC entry 3842 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN native_query_snippet.name; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.native_query_snippet.name IS 'Name of the query snippet';


--
-- TOC entry 3843 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN native_query_snippet.content; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.native_query_snippet.content IS 'Raw query snippet';


--
-- TOC entry 3844 (class 0 OID 0)
-- Dependencies: 294
-- Name: COLUMN native_query_snippet.collection_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.native_query_snippet.collection_id IS 'ID of the Snippet Folder (Collection) this Snippet is in, if any';


--
-- TOC entry 293 (class 1259 OID 29939)
-- Name: native_query_snippet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.native_query_snippet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.native_query_snippet_id_seq OWNER TO postgres;

--
-- TOC entry 3845 (class 0 OID 0)
-- Dependencies: 293
-- Name: native_query_snippet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.native_query_snippet_id_seq OWNED BY public.native_query_snippet.id;


--
-- TOC entry 259 (class 1259 OID 29499)
-- Name: permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions (
    id integer NOT NULL,
    object character varying(254) NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.permissions OWNER TO postgres;

--
-- TOC entry 255 (class 1259 OID 29465)
-- Name: permissions_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions_group (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.permissions_group OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 29463)
-- Name: permissions_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_group_id_seq OWNER TO postgres;

--
-- TOC entry 3846 (class 0 OID 0)
-- Dependencies: 254
-- Name: permissions_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_group_id_seq OWNED BY public.permissions_group.id;


--
-- TOC entry 257 (class 1259 OID 29476)
-- Name: permissions_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions_group_membership (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.permissions_group_membership OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 29474)
-- Name: permissions_group_membership_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_group_membership_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_group_membership_id_seq OWNER TO postgres;

--
-- TOC entry 3847 (class 0 OID 0)
-- Dependencies: 256
-- Name: permissions_group_membership_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_group_membership_id_seq OWNED BY public.permissions_group_membership.id;


--
-- TOC entry 258 (class 1259 OID 29497)
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_id_seq OWNER TO postgres;

--
-- TOC entry 3848 (class 0 OID 0)
-- Dependencies: 258
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_id_seq OWNED BY public.permissions.id;


--
-- TOC entry 261 (class 1259 OID 29531)
-- Name: permissions_revision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.permissions_revision (
    id integer NOT NULL,
    before text NOT NULL,
    after text NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    remark text
);


ALTER TABLE public.permissions_revision OWNER TO postgres;

--
-- TOC entry 3849 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE permissions_revision; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.permissions_revision IS 'Used to keep track of changes made to permissions.';


--
-- TOC entry 3850 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN permissions_revision.before; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.permissions_revision.before IS 'Serialized JSON of the permissions before the changes.';


--
-- TOC entry 3851 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN permissions_revision.after; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.permissions_revision.after IS 'Serialized JSON of the permissions after the changes.';


--
-- TOC entry 3852 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN permissions_revision.user_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.permissions_revision.user_id IS 'The ID of the admin who made this set of changes.';


--
-- TOC entry 3853 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN permissions_revision.created_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.permissions_revision.created_at IS 'The timestamp of when these changes were made.';


--
-- TOC entry 3854 (class 0 OID 0)
-- Dependencies: 261
-- Name: COLUMN permissions_revision.remark; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.permissions_revision.remark IS 'Optional remarks explaining why these changes were made.';


--
-- TOC entry 260 (class 1259 OID 29529)
-- Name: permissions_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.permissions_revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.permissions_revision_id_seq OWNER TO postgres;

--
-- TOC entry 3855 (class 0 OID 0)
-- Dependencies: 260
-- Name: permissions_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.permissions_revision_id_seq OWNED BY public.permissions_revision.id;


--
-- TOC entry 233 (class 1259 OID 29188)
-- Name: pulse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pulse (
    id integer NOT NULL,
    creator_id integer NOT NULL,
    name character varying(254),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    skip_if_empty boolean DEFAULT false NOT NULL,
    alert_condition character varying(254),
    alert_first_only boolean,
    alert_above_goal boolean,
    collection_id integer,
    collection_position smallint,
    archived boolean DEFAULT false,
    dashboard_id integer
);


ALTER TABLE public.pulse OWNER TO postgres;

--
-- TOC entry 3856 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN pulse.skip_if_empty; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse.skip_if_empty IS 'Skip a scheduled Pulse if none of its questions have any results';


--
-- TOC entry 3857 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN pulse.alert_condition; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse.alert_condition IS 'Condition (i.e. "rows" or "goal") used as a guard for alerts';


--
-- TOC entry 3858 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN pulse.alert_first_only; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse.alert_first_only IS 'True if the alert should be disabled after the first notification';


--
-- TOC entry 3859 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN pulse.alert_above_goal; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse.alert_above_goal IS 'For a goal condition, alert when above the goal';


--
-- TOC entry 3860 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN pulse.collection_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse.collection_id IS 'Options ID of Collection this Pulse belongs to.';


--
-- TOC entry 3861 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN pulse.collection_position; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse.collection_position IS 'Optional pinned position for this item in its Collection. NULL means item is not pinned.';


--
-- TOC entry 3862 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN pulse.archived; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse.archived IS 'Has this pulse been archived?';


--
-- TOC entry 3863 (class 0 OID 0)
-- Dependencies: 233
-- Name: COLUMN pulse.dashboard_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse.dashboard_id IS 'ID of the Dashboard if this Pulse is a Dashboard Subscription.';


--
-- TOC entry 235 (class 1259 OID 29202)
-- Name: pulse_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pulse_card (
    id integer NOT NULL,
    pulse_id integer NOT NULL,
    card_id integer NOT NULL,
    "position" integer NOT NULL,
    include_csv boolean DEFAULT false NOT NULL,
    include_xls boolean DEFAULT false NOT NULL,
    dashboard_card_id integer
);


ALTER TABLE public.pulse_card OWNER TO postgres;

--
-- TOC entry 3864 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN pulse_card.include_csv; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse_card.include_csv IS 'True if a CSV of the data should be included for this pulse card';


--
-- TOC entry 3865 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN pulse_card.include_xls; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse_card.include_xls IS 'True if a XLS of the data should be included for this pulse card';


--
-- TOC entry 3866 (class 0 OID 0)
-- Dependencies: 235
-- Name: COLUMN pulse_card.dashboard_card_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.pulse_card.dashboard_card_id IS 'If this Pulse is a Dashboard subscription, the ID of the DashboardCard that corresponds to this PulseCard.';


--
-- TOC entry 234 (class 1259 OID 29200)
-- Name: pulse_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pulse_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pulse_card_id_seq OWNER TO postgres;

--
-- TOC entry 3867 (class 0 OID 0)
-- Dependencies: 234
-- Name: pulse_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pulse_card_id_seq OWNED BY public.pulse_card.id;


--
-- TOC entry 237 (class 1259 OID 29222)
-- Name: pulse_channel; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pulse_channel (
    id integer NOT NULL,
    pulse_id integer NOT NULL,
    channel_type character varying(32) NOT NULL,
    details text NOT NULL,
    schedule_type character varying(32) NOT NULL,
    schedule_hour integer,
    schedule_day character varying(64),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    schedule_frame character varying(32),
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.pulse_channel OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 29220)
-- Name: pulse_channel_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pulse_channel_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pulse_channel_id_seq OWNER TO postgres;

--
-- TOC entry 3868 (class 0 OID 0)
-- Dependencies: 236
-- Name: pulse_channel_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pulse_channel_id_seq OWNED BY public.pulse_channel.id;


--
-- TOC entry 239 (class 1259 OID 29240)
-- Name: pulse_channel_recipient; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pulse_channel_recipient (
    id integer NOT NULL,
    pulse_channel_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.pulse_channel_recipient OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 29238)
-- Name: pulse_channel_recipient_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pulse_channel_recipient_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pulse_channel_recipient_id_seq OWNER TO postgres;

--
-- TOC entry 3869 (class 0 OID 0)
-- Dependencies: 238
-- Name: pulse_channel_recipient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pulse_channel_recipient_id_seq OWNED BY public.pulse_channel_recipient.id;


--
-- TOC entry 232 (class 1259 OID 29186)
-- Name: pulse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pulse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pulse_id_seq OWNER TO postgres;

--
-- TOC entry 3870 (class 0 OID 0)
-- Dependencies: 232
-- Name: pulse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pulse_id_seq OWNED BY public.pulse.id;


--
-- TOC entry 285 (class 1259 OID 29837)
-- Name: qrtz_blob_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_blob_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    blob_data bytea
);


ALTER TABLE public.qrtz_blob_triggers OWNER TO postgres;

--
-- TOC entry 3871 (class 0 OID 0)
-- Dependencies: 285
-- Name: TABLE qrtz_blob_triggers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_blob_triggers IS 'Used for Quartz scheduler.';


--
-- TOC entry 286 (class 1259 OID 29850)
-- Name: qrtz_calendars; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_calendars (
    sched_name character varying(120) NOT NULL,
    calendar_name character varying(200) NOT NULL,
    calendar bytea NOT NULL
);


ALTER TABLE public.qrtz_calendars OWNER TO postgres;

--
-- TOC entry 3872 (class 0 OID 0)
-- Dependencies: 286
-- Name: TABLE qrtz_calendars; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_calendars IS 'Used for Quartz scheduler.';


--
-- TOC entry 283 (class 1259 OID 29811)
-- Name: qrtz_cron_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_cron_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    cron_expression character varying(120) NOT NULL,
    time_zone_id character varying(80)
);


ALTER TABLE public.qrtz_cron_triggers OWNER TO postgres;

--
-- TOC entry 3873 (class 0 OID 0)
-- Dependencies: 283
-- Name: TABLE qrtz_cron_triggers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_cron_triggers IS 'Used for Quartz scheduler.';


--
-- TOC entry 288 (class 1259 OID 29863)
-- Name: qrtz_fired_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_fired_triggers (
    sched_name character varying(120) NOT NULL,
    entry_id character varying(95) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    instance_name character varying(200) NOT NULL,
    fired_time bigint NOT NULL,
    sched_time bigint,
    priority integer NOT NULL,
    state character varying(16) NOT NULL,
    job_name character varying(200),
    job_group character varying(200),
    is_nonconcurrent boolean,
    requests_recovery boolean
);


ALTER TABLE public.qrtz_fired_triggers OWNER TO postgres;

--
-- TOC entry 3874 (class 0 OID 0)
-- Dependencies: 288
-- Name: TABLE qrtz_fired_triggers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_fired_triggers IS 'Used for Quartz scheduler.';


--
-- TOC entry 280 (class 1259 OID 29777)
-- Name: qrtz_job_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_job_details (
    sched_name character varying(120) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    job_class_name character varying(250) NOT NULL,
    is_durable boolean NOT NULL,
    is_nonconcurrent boolean NOT NULL,
    is_update_data boolean NOT NULL,
    requests_recovery boolean NOT NULL,
    job_data bytea
);


ALTER TABLE public.qrtz_job_details OWNER TO postgres;

--
-- TOC entry 3875 (class 0 OID 0)
-- Dependencies: 280
-- Name: TABLE qrtz_job_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_job_details IS 'Used for Quartz scheduler.';


--
-- TOC entry 290 (class 1259 OID 29876)
-- Name: qrtz_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_locks (
    sched_name character varying(120) NOT NULL,
    lock_name character varying(40) NOT NULL
);


ALTER TABLE public.qrtz_locks OWNER TO postgres;

--
-- TOC entry 3876 (class 0 OID 0)
-- Dependencies: 290
-- Name: TABLE qrtz_locks; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_locks IS 'Used for Quartz scheduler.';


--
-- TOC entry 287 (class 1259 OID 29858)
-- Name: qrtz_paused_trigger_grps; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_paused_trigger_grps (
    sched_name character varying(120) NOT NULL,
    trigger_group character varying(200) NOT NULL
);


ALTER TABLE public.qrtz_paused_trigger_grps OWNER TO postgres;

--
-- TOC entry 3877 (class 0 OID 0)
-- Dependencies: 287
-- Name: TABLE qrtz_paused_trigger_grps; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_paused_trigger_grps IS 'Used for Quartz scheduler.';


--
-- TOC entry 289 (class 1259 OID 29871)
-- Name: qrtz_scheduler_state; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_scheduler_state (
    sched_name character varying(120) NOT NULL,
    instance_name character varying(200) NOT NULL,
    last_checkin_time bigint NOT NULL,
    checkin_interval bigint NOT NULL
);


ALTER TABLE public.qrtz_scheduler_state OWNER TO postgres;

--
-- TOC entry 3878 (class 0 OID 0)
-- Dependencies: 289
-- Name: TABLE qrtz_scheduler_state; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_scheduler_state IS 'Used for Quartz scheduler.';


--
-- TOC entry 282 (class 1259 OID 29798)
-- Name: qrtz_simple_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_simple_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    repeat_count bigint NOT NULL,
    repeat_interval bigint NOT NULL,
    times_triggered bigint NOT NULL
);


ALTER TABLE public.qrtz_simple_triggers OWNER TO postgres;

--
-- TOC entry 3879 (class 0 OID 0)
-- Dependencies: 282
-- Name: TABLE qrtz_simple_triggers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_simple_triggers IS 'Used for Quartz scheduler.';


--
-- TOC entry 284 (class 1259 OID 29824)
-- Name: qrtz_simprop_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_simprop_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    str_prop_1 character varying(512),
    str_prop_2 character varying(512),
    str_prop_3 character varying(512),
    int_prop_1 integer,
    int_prop_2 integer,
    long_prop_1 bigint,
    long_prop_2 bigint,
    dec_prop_1 numeric(13,4),
    dec_prop_2 numeric(13,4),
    bool_prop_1 boolean,
    bool_prop_2 boolean
);


ALTER TABLE public.qrtz_simprop_triggers OWNER TO postgres;

--
-- TOC entry 3880 (class 0 OID 0)
-- Dependencies: 284
-- Name: TABLE qrtz_simprop_triggers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_simprop_triggers IS 'Used for Quartz scheduler.';


--
-- TOC entry 281 (class 1259 OID 29785)
-- Name: qrtz_triggers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.qrtz_triggers (
    sched_name character varying(120) NOT NULL,
    trigger_name character varying(200) NOT NULL,
    trigger_group character varying(200) NOT NULL,
    job_name character varying(200) NOT NULL,
    job_group character varying(200) NOT NULL,
    description character varying(250),
    next_fire_time bigint,
    prev_fire_time bigint,
    priority integer,
    trigger_state character varying(16) NOT NULL,
    trigger_type character varying(8) NOT NULL,
    start_time bigint NOT NULL,
    end_time bigint,
    calendar_name character varying(200),
    misfire_instr smallint,
    job_data bytea
);


ALTER TABLE public.qrtz_triggers OWNER TO postgres;

--
-- TOC entry 3881 (class 0 OID 0)
-- Dependencies: 281
-- Name: TABLE qrtz_triggers; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.qrtz_triggers IS 'Used for Quartz scheduler.';


--
-- TOC entry 269 (class 1259 OID 29624)
-- Name: query; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.query (
    query_hash bytea NOT NULL,
    average_execution_time integer NOT NULL,
    query text
);


ALTER TABLE public.query OWNER TO postgres;

--
-- TOC entry 3882 (class 0 OID 0)
-- Dependencies: 269
-- Name: TABLE query; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.query IS 'Information (such as average execution time) for different queries that have been previously ran.';


--
-- TOC entry 3883 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN query.query_hash; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query.query_hash IS 'The hash of the query dictionary. (This is a 256-bit SHA3 hash of the query dict.)';


--
-- TOC entry 3884 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN query.average_execution_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query.average_execution_time IS 'Average execution time for the query, round to nearest number of milliseconds. This is updated as a rolling average.';


--
-- TOC entry 3885 (class 0 OID 0)
-- Dependencies: 269
-- Name: COLUMN query.query; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query.query IS 'The actual "query dictionary" for this query.';


--
-- TOC entry 268 (class 1259 OID 29615)
-- Name: query_cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.query_cache (
    query_hash bytea NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    results bytea NOT NULL
);


ALTER TABLE public.query_cache OWNER TO postgres;

--
-- TOC entry 3886 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE query_cache; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.query_cache IS 'Cached results of queries are stored here when using the DB-based query cache.';


--
-- TOC entry 3887 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN query_cache.query_hash; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_cache.query_hash IS 'The hash of the query dictionary. (This is a 256-bit SHA3 hash of the query dict).';


--
-- TOC entry 3888 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN query_cache.updated_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_cache.updated_at IS 'The timestamp of when these query results were last refreshed.';


--
-- TOC entry 3889 (class 0 OID 0)
-- Dependencies: 268
-- Name: COLUMN query_cache.results; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_cache.results IS 'Cached, compressed results of running the query with the given hash.';


--
-- TOC entry 267 (class 1259 OID 29604)
-- Name: query_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.query_execution (
    id integer NOT NULL,
    hash bytea NOT NULL,
    started_at timestamp with time zone NOT NULL,
    running_time integer NOT NULL,
    result_rows integer NOT NULL,
    native boolean NOT NULL,
    context character varying(32),
    error text,
    executor_id integer,
    card_id integer,
    dashboard_id integer,
    pulse_id integer,
    database_id integer
);


ALTER TABLE public.query_execution OWNER TO postgres;

--
-- TOC entry 3890 (class 0 OID 0)
-- Dependencies: 267
-- Name: TABLE query_execution; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.query_execution IS 'A log of executed queries, used for calculating historic execution times, auditing, and other purposes.';


--
-- TOC entry 3891 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.hash; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.hash IS 'The hash of the query dictionary. This is a 256-bit SHA3 hash of the query.';


--
-- TOC entry 3892 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.started_at; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.started_at IS 'Timestamp of when this query started running.';


--
-- TOC entry 3893 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.running_time; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.running_time IS 'The time, in milliseconds, this query took to complete.';


--
-- TOC entry 3894 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.result_rows; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.result_rows IS 'Number of rows in the query results.';


--
-- TOC entry 3895 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.native; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.native IS 'Whether the query was a native query, as opposed to an MBQL one (e.g., created with the GUI).';


--
-- TOC entry 3896 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.context; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.context IS 'Short string specifying how this query was executed, e.g. in a Dashboard or Pulse.';


--
-- TOC entry 3897 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.error; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.error IS 'Error message returned by failed query, if any.';


--
-- TOC entry 3898 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.executor_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.executor_id IS 'The ID of the User who triggered this query execution, if any.';


--
-- TOC entry 3899 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.card_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.card_id IS 'The ID of the Card (Question) associated with this query execution, if any.';


--
-- TOC entry 3900 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.dashboard_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.dashboard_id IS 'The ID of the Dashboard associated with this query execution, if any.';


--
-- TOC entry 3901 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.pulse_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.pulse_id IS 'The ID of the Pulse associated with this query execution, if any.';


--
-- TOC entry 3902 (class 0 OID 0)
-- Dependencies: 267
-- Name: COLUMN query_execution.database_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.query_execution.database_id IS 'ID of the database this query was ran against.';


--
-- TOC entry 266 (class 1259 OID 29602)
-- Name: query_execution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.query_execution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_execution_id_seq OWNER TO postgres;

--
-- TOC entry 3903 (class 0 OID 0)
-- Dependencies: 266
-- Name: query_execution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.query_execution_id_seq OWNED BY public.query_execution.id;


--
-- TOC entry 216 (class 1259 OID 28892)
-- Name: report_card; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_card (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    display character varying(254) NOT NULL,
    dataset_query text NOT NULL,
    visualization_settings text NOT NULL,
    creator_id integer NOT NULL,
    database_id integer,
    table_id integer,
    query_type character varying(16),
    archived boolean DEFAULT false NOT NULL,
    collection_id integer,
    public_uuid character(36),
    made_public_by_id integer,
    enable_embedding boolean DEFAULT false NOT NULL,
    embedding_params text,
    cache_ttl integer,
    result_metadata text,
    collection_position smallint
);


ALTER TABLE public.report_card OWNER TO postgres;

--
-- TOC entry 3904 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN report_card.collection_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_card.collection_id IS 'Optional ID of Collection this Card belongs to.';


--
-- TOC entry 3905 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN report_card.public_uuid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_card.public_uuid IS 'Unique UUID used to in publically-accessible links to this Card.';


--
-- TOC entry 3906 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN report_card.made_public_by_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_card.made_public_by_id IS 'The ID of the User who first publically shared this Card.';


--
-- TOC entry 3907 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN report_card.enable_embedding; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_card.enable_embedding IS 'Is this Card allowed to be embedded in different websites (using a signed JWT)?';


--
-- TOC entry 3908 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN report_card.embedding_params; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_card.embedding_params IS 'Serialized JSON containing information about required parameters that must be supplied when embedding this Card.';


--
-- TOC entry 3909 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN report_card.cache_ttl; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_card.cache_ttl IS 'The maximum time, in seconds, to return cached results for this Card rather than running a new query.';


--
-- TOC entry 3910 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN report_card.result_metadata; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_card.result_metadata IS 'Serialized JSON containing metadata about the result columns from running the query.';


--
-- TOC entry 3911 (class 0 OID 0)
-- Dependencies: 216
-- Name: COLUMN report_card.collection_position; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_card.collection_position IS 'Optional pinned position for this item in its Collection. NULL means item is not pinned.';


--
-- TOC entry 215 (class 1259 OID 28890)
-- Name: report_card_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_card_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_card_id_seq OWNER TO postgres;

--
-- TOC entry 3912 (class 0 OID 0)
-- Dependencies: 215
-- Name: report_card_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_card_id_seq OWNED BY public.report_card.id;


--
-- TOC entry 218 (class 1259 OID 28915)
-- Name: report_cardfavorite; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_cardfavorite (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    card_id integer NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.report_cardfavorite OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 28913)
-- Name: report_cardfavorite_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_cardfavorite_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_cardfavorite_id_seq OWNER TO postgres;

--
-- TOC entry 3913 (class 0 OID 0)
-- Dependencies: 217
-- Name: report_cardfavorite_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_cardfavorite_id_seq OWNED BY public.report_cardfavorite.id;


--
-- TOC entry 220 (class 1259 OID 28937)
-- Name: report_dashboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_dashboard (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    creator_id integer NOT NULL,
    parameters text NOT NULL,
    points_of_interest text,
    caveats text,
    show_in_getting_started boolean DEFAULT false NOT NULL,
    public_uuid character(36),
    made_public_by_id integer,
    enable_embedding boolean DEFAULT false NOT NULL,
    embedding_params text,
    archived boolean DEFAULT false NOT NULL,
    "position" integer,
    collection_id integer,
    collection_position smallint
);


ALTER TABLE public.report_dashboard OWNER TO postgres;

--
-- TOC entry 3914 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN report_dashboard.public_uuid; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_dashboard.public_uuid IS 'Unique UUID used to in publically-accessible links to this Dashboard.';


--
-- TOC entry 3915 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN report_dashboard.made_public_by_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_dashboard.made_public_by_id IS 'The ID of the User who first publically shared this Dashboard.';


--
-- TOC entry 3916 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN report_dashboard.enable_embedding; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_dashboard.enable_embedding IS 'Is this Dashboard allowed to be embedded in different websites (using a signed JWT)?';


--
-- TOC entry 3917 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN report_dashboard.embedding_params; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_dashboard.embedding_params IS 'Serialized JSON containing information about required parameters that must be supplied when embedding this Dashboard.';


--
-- TOC entry 3918 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN report_dashboard.archived; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_dashboard.archived IS 'Is this Dashboard archived (effectively treated as deleted?)';


--
-- TOC entry 3919 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN report_dashboard."position"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_dashboard."position" IS 'The position this Dashboard should appear in the Dashboards list, lower-numbered positions appearing before higher numbered ones.';


--
-- TOC entry 3920 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN report_dashboard.collection_id; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_dashboard.collection_id IS 'Optional ID of Collection this Dashboard belongs to.';


--
-- TOC entry 3921 (class 0 OID 0)
-- Dependencies: 220
-- Name: COLUMN report_dashboard.collection_position; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.report_dashboard.collection_position IS 'Optional pinned position for this item in its Collection. NULL means item is not pinned.';


--
-- TOC entry 219 (class 1259 OID 28935)
-- Name: report_dashboard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_dashboard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_dashboard_id_seq OWNER TO postgres;

--
-- TOC entry 3922 (class 0 OID 0)
-- Dependencies: 219
-- Name: report_dashboard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_dashboard_id_seq OWNED BY public.report_dashboard.id;


--
-- TOC entry 222 (class 1259 OID 28960)
-- Name: report_dashboardcard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.report_dashboardcard (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    "sizeX" integer NOT NULL,
    "sizeY" integer NOT NULL,
    "row" integer DEFAULT 0 NOT NULL,
    col integer DEFAULT 0 NOT NULL,
    card_id integer,
    dashboard_id integer NOT NULL,
    parameter_mappings text NOT NULL,
    visualization_settings text NOT NULL
);


ALTER TABLE public.report_dashboardcard OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 28958)
-- Name: report_dashboardcard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.report_dashboardcard_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.report_dashboardcard_id_seq OWNER TO postgres;

--
-- TOC entry 3923 (class 0 OID 0)
-- Dependencies: 221
-- Name: report_dashboardcard_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.report_dashboardcard_id_seq OWNED BY public.report_dashboardcard.id;


--
-- TOC entry 226 (class 1259 OID 29118)
-- Name: revision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.revision (
    id integer NOT NULL,
    model character varying(16) NOT NULL,
    model_id integer NOT NULL,
    user_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    object character varying NOT NULL,
    is_reversion boolean DEFAULT false NOT NULL,
    is_creation boolean DEFAULT false NOT NULL,
    message text
);


ALTER TABLE public.revision OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 29116)
-- Name: revision_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.revision_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.revision_id_seq OWNER TO postgres;

--
-- TOC entry 3924 (class 0 OID 0)
-- Dependencies: 225
-- Name: revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.revision_id_seq OWNED BY public.revision.id;


--
-- TOC entry 241 (class 1259 OID 29258)
-- Name: segment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.segment (
    id integer NOT NULL,
    table_id integer NOT NULL,
    creator_id integer NOT NULL,
    name character varying(254) NOT NULL,
    description text,
    archived boolean DEFAULT false NOT NULL,
    definition text NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    points_of_interest text,
    caveats text,
    show_in_getting_started boolean DEFAULT false NOT NULL
);


ALTER TABLE public.segment OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 29256)
-- Name: segment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.segment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.segment_id_seq OWNER TO postgres;

--
-- TOC entry 3925 (class 0 OID 0)
-- Dependencies: 240
-- Name: segment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.segment_id_seq OWNED BY public.segment.id;


--
-- TOC entry 224 (class 1259 OID 29103)
-- Name: setting; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.setting (
    key character varying(254) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.setting OWNER TO postgres;

--
-- TOC entry 292 (class 1259 OID 29903)
-- Name: task_history; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.task_history (
    id integer NOT NULL,
    task character varying(254) NOT NULL,
    db_id integer,
    started_at timestamp without time zone NOT NULL,
    ended_at timestamp without time zone NOT NULL,
    duration integer NOT NULL,
    task_details text
);


ALTER TABLE public.task_history OWNER TO postgres;

--
-- TOC entry 3926 (class 0 OID 0)
-- Dependencies: 292
-- Name: TABLE task_history; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.task_history IS 'Timing and metadata info about background/quartz processes';


--
-- TOC entry 3927 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN task_history.task; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.task_history.task IS 'Name of the task';


--
-- TOC entry 3928 (class 0 OID 0)
-- Dependencies: 292
-- Name: COLUMN task_history.task_details; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public.task_history.task_details IS 'JSON string with additional info on the task';


--
-- TOC entry 291 (class 1259 OID 29901)
-- Name: task_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.task_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_history_id_seq OWNER TO postgres;

--
-- TOC entry 3929 (class 0 OID 0)
-- Dependencies: 291
-- Name: task_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.task_history_id_seq OWNED BY public.task_history.id;


--
-- TOC entry 230 (class 1259 OID 29165)
-- Name: view_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.view_log (
    id integer NOT NULL,
    user_id integer,
    model character varying(16) NOT NULL,
    model_id integer NOT NULL,
    "timestamp" timestamp with time zone NOT NULL
);


ALTER TABLE public.view_log OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 29163)
-- Name: view_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.view_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.view_log_id_seq OWNER TO postgres;

--
-- TOC entry 3930 (class 0 OID 0)
-- Dependencies: 229
-- Name: view_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.view_log_id_seq OWNED BY public.view_log.id;


--
-- TOC entry 3210 (class 2604 OID 29149)
-- Name: activity id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity ALTER COLUMN id SET DEFAULT nextval('public.activity_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 29365)
-- Name: card_label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_label ALTER COLUMN id SET DEFAULT nextval('public.card_label_id_seq'::regclass);


--
-- TOC entry 3236 (class 2604 OID 29552)
-- Name: collection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection ALTER COLUMN id SET DEFAULT nextval('public.collection_id_seq'::regclass);


--
-- TOC entry 3239 (class 2604 OID 29573)
-- Name: collection_revision id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_revision ALTER COLUMN id SET DEFAULT nextval('public.collection_revision_id_seq'::regclass);


--
-- TOC entry 3243 (class 2604 OID 29690)
-- Name: computation_job id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computation_job ALTER COLUMN id SET DEFAULT nextval('public.computation_job_id_seq'::regclass);


--
-- TOC entry 3244 (class 2604 OID 29706)
-- Name: computation_job_result id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computation_job_result ALTER COLUMN id SET DEFAULT nextval('public.computation_job_result_id_seq'::regclass);


--
-- TOC entry 3170 (class 2604 OID 28692)
-- Name: core_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user ALTER COLUMN id SET DEFAULT nextval('public.core_user_id_seq'::regclass);


--
-- TOC entry 3241 (class 2604 OID 29639)
-- Name: dashboard_favorite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_favorite ALTER COLUMN id SET DEFAULT nextval('public.dashboard_favorite_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 29330)
-- Name: dashboardcard_series id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboardcard_series ALTER COLUMN id SET DEFAULT nextval('public.dashboardcard_series_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 29293)
-- Name: dependency id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependency ALTER COLUMN id SET DEFAULT nextval('public.dependency_id_seq'::regclass);


--
-- TOC entry 3242 (class 2604 OID 29662)
-- Name: dimension id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dimension ALTER COLUMN id SET DEFAULT nextval('public.dimension_id_seq'::regclass);


--
-- TOC entry 3245 (class 2604 OID 29727)
-- Name: group_table_access_policy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_table_access_policy ALTER COLUMN id SET DEFAULT nextval('public.group_table_access_policy_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 29351)
-- Name: label id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.label ALTER COLUMN id SET DEFAULT nextval('public.label_id_seq'::regclass);


--
-- TOC entry 3177 (class 2604 OID 28742)
-- Name: metabase_database id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_database ALTER COLUMN id SET DEFAULT nextval('public.metabase_database_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 28776)
-- Name: metabase_field id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_field ALTER COLUMN id SET DEFAULT nextval('public.metabase_field_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 28813)
-- Name: metabase_fieldvalues id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_fieldvalues ALTER COLUMN id SET DEFAULT nextval('public.metabase_fieldvalues_id_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 28759)
-- Name: metabase_table id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_table ALTER COLUMN id SET DEFAULT nextval('public.metabase_table_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 29305)
-- Name: metric id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric ALTER COLUMN id SET DEFAULT nextval('public.metric_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 29445)
-- Name: metric_important_field id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric_important_field ALTER COLUMN id SET DEFAULT nextval('public.metric_important_field_id_seq'::regclass);


--
-- TOC entry 3247 (class 2604 OID 29944)
-- Name: native_query_snippet id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.native_query_snippet ALTER COLUMN id SET DEFAULT nextval('public.native_query_snippet_id_seq'::regclass);


--
-- TOC entry 3234 (class 2604 OID 29502)
-- Name: permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions ALTER COLUMN id SET DEFAULT nextval('public.permissions_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 29468)
-- Name: permissions_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_group ALTER COLUMN id SET DEFAULT nextval('public.permissions_group_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 29479)
-- Name: permissions_group_membership id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_group_membership ALTER COLUMN id SET DEFAULT nextval('public.permissions_group_membership_id_seq'::regclass);


--
-- TOC entry 3235 (class 2604 OID 29534)
-- Name: permissions_revision id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_revision ALTER COLUMN id SET DEFAULT nextval('public.permissions_revision_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 29191)
-- Name: pulse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse ALTER COLUMN id SET DEFAULT nextval('public.pulse_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 29205)
-- Name: pulse_card id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_card ALTER COLUMN id SET DEFAULT nextval('public.pulse_card_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 29225)
-- Name: pulse_channel id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_channel ALTER COLUMN id SET DEFAULT nextval('public.pulse_channel_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 29243)
-- Name: pulse_channel_recipient id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_channel_recipient ALTER COLUMN id SET DEFAULT nextval('public.pulse_channel_recipient_id_seq'::regclass);


--
-- TOC entry 3240 (class 2604 OID 29607)
-- Name: query_execution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query_execution ALTER COLUMN id SET DEFAULT nextval('public.query_execution_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 28895)
-- Name: report_card id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_card ALTER COLUMN id SET DEFAULT nextval('public.report_card_id_seq'::regclass);


--
-- TOC entry 3199 (class 2604 OID 28918)
-- Name: report_cardfavorite id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_cardfavorite ALTER COLUMN id SET DEFAULT nextval('public.report_cardfavorite_id_seq'::regclass);


--
-- TOC entry 3200 (class 2604 OID 28940)
-- Name: report_dashboard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboard ALTER COLUMN id SET DEFAULT nextval('public.report_dashboard_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 28963)
-- Name: report_dashboardcard id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboardcard ALTER COLUMN id SET DEFAULT nextval('public.report_dashboardcard_id_seq'::regclass);


--
-- TOC entry 3207 (class 2604 OID 29121)
-- Name: revision id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revision ALTER COLUMN id SET DEFAULT nextval('public.revision_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 29261)
-- Name: segment id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segment ALTER COLUMN id SET DEFAULT nextval('public.segment_id_seq'::regclass);


--
-- TOC entry 3246 (class 2604 OID 29906)
-- Name: task_history id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_history ALTER COLUMN id SET DEFAULT nextval('public.task_history_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 29168)
-- Name: view_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.view_log ALTER COLUMN id SET DEFAULT nextval('public.view_log_id_seq'::regclass);


--
-- TOC entry 3701 (class 0 OID 29146)
-- Dependencies: 228
-- Data for Name: activity; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.activity VALUES (1, 'install', '2021-04-12 20:53:31.149687+00', NULL, 'install', NULL, NULL, NULL, NULL, '{}');
INSERT INTO public.activity VALUES (2, 'user-joined', '2021-04-12 20:56:31.889549+00', 1, 'user', 1, NULL, NULL, NULL, '{}');
INSERT INTO public.activity VALUES (3, 'card-create', '2021-04-12 21:00:28.879702+00', 1, 'card', 1, 2, 59, NULL, '{"name":"Public Survey - Contagem de Dados","description":null}');
INSERT INTO public.activity VALUES (4, 'card-create', '2021-04-12 21:03:54.901294+00', 1, 'card', 2, 2, 59, NULL, '{"name":"Survey Results Publics, Agrupado por Country","description":null}');
INSERT INTO public.activity VALUES (5, 'card-create', '2021-04-12 21:06:08.237722+00', 1, 'card', 3, 2, 59, NULL, '{"name":"Survey Results Publics, Agrupado por Emprego","description":null}');
INSERT INTO public.activity VALUES (6, 'card-create', '2021-04-12 21:06:16.637514+00', 1, 'card', 4, 2, 59, NULL, '{"name":"Total Survey Results Public","description":null}');
INSERT INTO public.activity VALUES (7, 'card-create', '2021-04-12 21:06:16.746308+00', 1, 'card', 5, 2, 59, NULL, '{"name":"Survey Results Public por New Onboard Good","description":null}');
INSERT INTO public.activity VALUES (8, 'card-create', '2021-04-12 21:06:16.835168+00', 1, 'card', 6, 2, 59, NULL, '{"name":"Survey Results Public por Employment","description":null}');
INSERT INTO public.activity VALUES (9, 'card-create', '2021-04-12 21:06:16.919481+00', 1, 'card', 7, 2, 59, NULL, '{"name":"Survey Results Public por Survey Ease","description":null}');
INSERT INTO public.activity VALUES (10, 'card-create', '2021-04-12 21:06:16.995335+00', 1, 'card', 8, 2, 59, NULL, '{"name":"Survey Results Public por Comp Fr Eq","description":null}');
INSERT INTO public.activity VALUES (11, 'card-create', '2021-04-12 21:06:17.076459+00', 1, 'card', 9, 2, 59, NULL, '{"name":"Survey Results Public por Purchase What","description":null}');
INSERT INTO public.activity VALUES (12, 'card-create', '2021-04-12 21:06:17.146087+00', 1, 'card', 10, 2, 59, NULL, '{"name":"Survey Results Public por Ed Level","description":null}');
INSERT INTO public.activity VALUES (13, 'card-create', '2021-04-12 21:06:17.230496+00', 1, 'card', 11, 2, 59, NULL, '{"name":"Survey Results Public por New Learn","description":null}');
INSERT INTO public.activity VALUES (14, 'card-create', '2021-04-12 21:06:17.311693+00', 1, 'card', 12, 2, 59, NULL, '{"name":"Survey Results Public por Sop Art Fr Eq","description":null}');
INSERT INTO public.activity VALUES (15, 'card-create', '2021-04-12 21:06:17.388175+00', 1, 'card', 13, 2, 59, NULL, '{"name":"Survey Results Public por Soco Mm","description":null}');
INSERT INTO public.activity VALUES (16, 'card-create', '2021-04-12 21:06:17.471211+00', 1, 'card', 14, 2, 59, NULL, '{"name":"Survey Results Public por Survey Length","description":null}');
INSERT INTO public.activity VALUES (17, 'card-create', '2021-04-12 21:06:17.549145+00', 1, 'card', 15, 2, 59, NULL, '{"name":"Survey Results Public por Newed Im Pt","description":null}');
INSERT INTO public.activity VALUES (18, 'card-create', '2021-04-12 21:06:17.625637+00', 1, 'card', 16, 2, 59, NULL, '{"name":"Survey Results Public por New Off Topic","description":null}');
INSERT INTO public.activity VALUES (19, 'card-create', '2021-04-12 21:06:17.714083+00', 1, 'card', 17, 2, 59, NULL, '{"name":"Survey Results Public por Welcome Change","description":null}');
INSERT INTO public.activity VALUES (20, 'card-create', '2021-04-12 21:06:17.8051+00', 1, 'card', 18, 2, 59, NULL, '{"name":"Survey Results Public por país","description":null}');
INSERT INTO public.activity VALUES (21, 'dashboard-create', '2021-04-12 21:06:17.820691+00', 1, 'dashboard', 1, NULL, NULL, NULL, '{"description":null,"name":"Uma olhada no seu Survey Results Public tabela"}');
INSERT INTO public.activity VALUES (22, 'card-create', '2021-04-12 21:08:52.428863+00', 1, 'card', 19, 2, 59, NULL, '{"name":"Total Survey Results Public","description":null}');
INSERT INTO public.activity VALUES (23, 'card-create', '2021-04-12 21:08:52.50898+00', 1, 'card', 20, 2, 59, NULL, '{"name":"Survey Results Public por New Onboard Good","description":null}');
INSERT INTO public.activity VALUES (24, 'card-create', '2021-04-12 21:08:52.570137+00', 1, 'card', 21, 2, 59, NULL, '{"name":"Survey Results Public por Employment","description":null}');
INSERT INTO public.activity VALUES (25, 'card-create', '2021-04-12 21:08:52.641945+00', 1, 'card', 22, 2, 59, NULL, '{"name":"Survey Results Public por Survey Ease","description":null}');
INSERT INTO public.activity VALUES (26, 'card-create', '2021-04-12 21:08:52.702619+00', 1, 'card', 23, 2, 59, NULL, '{"name":"Survey Results Public por Comp Fr Eq","description":null}');
INSERT INTO public.activity VALUES (27, 'card-create', '2021-04-12 21:08:52.779637+00', 1, 'card', 24, 2, 59, NULL, '{"name":"Survey Results Public por Purchase What","description":null}');
INSERT INTO public.activity VALUES (28, 'card-create', '2021-04-12 21:08:52.849108+00', 1, 'card', 25, 2, 59, NULL, '{"name":"Survey Results Public por Ed Level","description":null}');
INSERT INTO public.activity VALUES (29, 'card-create', '2021-04-12 21:08:52.927735+00', 1, 'card', 26, 2, 59, NULL, '{"name":"Survey Results Public por New Learn","description":null}');
INSERT INTO public.activity VALUES (30, 'card-create', '2021-04-12 21:08:53.004786+00', 1, 'card', 27, 2, 59, NULL, '{"name":"Survey Results Public por Sop Art Fr Eq","description":null}');
INSERT INTO public.activity VALUES (31, 'card-create', '2021-04-12 21:08:53.089981+00', 1, 'card', 28, 2, 59, NULL, '{"name":"Survey Results Public por Soco Mm","description":null}');
INSERT INTO public.activity VALUES (32, 'card-create', '2021-04-12 21:08:53.163737+00', 1, 'card', 29, 2, 59, NULL, '{"name":"Survey Results Public por Survey Length","description":null}');
INSERT INTO public.activity VALUES (33, 'card-create', '2021-04-12 21:08:53.234833+00', 1, 'card', 30, 2, 59, NULL, '{"name":"Survey Results Public por Newed Im Pt","description":null}');
INSERT INTO public.activity VALUES (34, 'card-create', '2021-04-12 21:08:53.307209+00', 1, 'card', 31, 2, 59, NULL, '{"name":"Survey Results Public por New Off Topic","description":null}');
INSERT INTO public.activity VALUES (35, 'card-create', '2021-04-12 21:08:53.423887+00', 1, 'card', 32, 2, 59, NULL, '{"name":"Survey Results Public por Welcome Change","description":null}');
INSERT INTO public.activity VALUES (36, 'card-create', '2021-04-12 21:08:53.509536+00', 1, 'card', 33, 2, 59, NULL, '{"name":"Survey Results Public por país","description":null}');
INSERT INTO public.activity VALUES (37, 'dashboard-create', '2021-04-12 21:08:53.523898+00', 1, 'dashboard', 2, NULL, NULL, NULL, '{"description":null,"name":"Uma olhada no seu Survey Results Public tabela"}');
INSERT INTO public.activity VALUES (38, 'card-update', '2021-04-13 00:45:33.543012+00', 1, 'card', 4, 2, 59, NULL, '{"name":"Total de pesquisas","description":null}');
INSERT INTO public.activity VALUES (39, 'card-update', '2021-04-13 00:50:19.853874+00', 1, 'card', 8, 2, 59, NULL, '{"name":"Survey Results Public por Comp Fr Eq","description":null}');


--
-- TOC entry 3724 (class 0 OID 29362)
-- Dependencies: 251
-- Data for Name: card_label; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3736 (class 0 OID 29549)
-- Dependencies: 263
-- Data for Name: collection; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.collection VALUES (1, 'Coleção pessoal de Usuário Administrador', NULL, '#31698A', false, '/', 1, 'colecao_pessoal_de_usuario_administrador', NULL);
INSERT INTO public.collection VALUES (3, 'Analise do Survey Results Public', NULL, '#509EE3', false, '/', NULL, 'analise_do_survey_results_public', NULL);


--
-- TOC entry 3738 (class 0 OID 29570)
-- Dependencies: 265
-- Data for Name: collection_revision; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3748 (class 0 OID 29687)
-- Dependencies: 275
-- Data for Name: computation_job; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3750 (class 0 OID 29703)
-- Dependencies: 277
-- Data for Name: computation_job_result; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3696 (class 0 OID 29093)
-- Dependencies: 223
-- Data for Name: core_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_session VALUES ('0bbdee14-e895-4796-826d-0396acb91e0d', 1, '2021-04-13 00:43:49.535741+00', NULL);


--
-- TOC entry 3679 (class 0 OID 28689)
-- Dependencies: 206
-- Data for Name: core_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.core_user VALUES (1, 'user@email.com', 'Usuário', 'Administrador', '$2a$10$WxyhSrDqfCXI.U84QUSpI.fQpObiA.pFuw4C1SQBw.rYMGi3NDtr.', 'f97bf6f7-d97f-4951-9383-0dd8799e7de2', '2021-04-12 20:56:31.750561+00', '2021-04-13 00:43:49.546988+00', true, true, NULL, NULL, false, false, false, NULL, '2021-04-12 21:45:11.604836', NULL, NULL);


--
-- TOC entry 3744 (class 0 OID 29636)
-- Dependencies: 271
-- Data for Name: dashboard_favorite; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3720 (class 0 OID 29327)
-- Dependencies: 247
-- Data for Name: dashboardcard_series; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3704 (class 0 OID 29180)
-- Dependencies: 231
-- Data for Name: data_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.data_migrations VALUES ('add-users-to-default-permissions-groups', '2021-04-12 17:53:30.144309');
INSERT INTO public.data_migrations VALUES ('add-admin-group-root-entry', '2021-04-12 17:53:30.193961');
INSERT INTO public.data_migrations VALUES ('add-databases-to-magic-permissions-groups', '2021-04-12 17:53:30.211643');
INSERT INTO public.data_migrations VALUES ('migrate-field-types', '2021-04-12 17:53:30.565358');
INSERT INTO public.data_migrations VALUES ('fix-invalid-field-types', '2021-04-12 17:53:30.588347');
INSERT INTO public.data_migrations VALUES ('copy-site-url-setting-and-remove-trailing-slashes', '2021-04-12 17:53:30.606563');
INSERT INTO public.data_migrations VALUES ('ensure-protocol-specified-in-site-url', '2021-04-12 17:53:30.62442');
INSERT INTO public.data_migrations VALUES ('populate-card-database-id', '2021-04-12 17:53:30.643138');
INSERT INTO public.data_migrations VALUES ('migrate-humanization-setting', '2021-04-12 17:53:30.658636');
INSERT INTO public.data_migrations VALUES ('mark-category-fields-as-list', '2021-04-12 17:53:30.679098');
INSERT INTO public.data_migrations VALUES ('add-legacy-sql-directive-to-bigquery-sql-cards', '2021-04-12 17:53:30.696034');
INSERT INTO public.data_migrations VALUES ('clear-ldap-user-local-passwords', '2021-04-12 17:53:30.716603');
INSERT INTO public.data_migrations VALUES ('add-migrated-collections', '2021-04-12 17:53:30.7788');
INSERT INTO public.data_migrations VALUES ('migrate-click-through', '2021-04-12 17:53:30.797935');


--
-- TOC entry 3676 (class 0 OID 28663)
-- Dependencies: 203
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.databasechangelog VALUES ('10', 'cammsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.832319', 9, 'EXECUTED', '8:9f03a236be31f54e8e5c894fe5fc7f00', 'createTable tableName=revision; createIndex indexName=idx_revision_model_model_id, tableName=revision', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('11', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.837882', 10, 'EXECUTED', '8:ca6561cab1eedbcf4dcb6d6e22cd46c6', 'sql', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('12', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.846571', 11, 'EXECUTED', '8:e862a199cba5b4ce0cba713110f66cfb', 'addColumn tableName=report_card; addColumn tableName=report_card; addColumn tableName=report_card', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('13', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.871401', 12, 'EXECUTED', '8:c2c65930bad8d3e9bab3bb6ae562fe0c', 'createTable tableName=activity; createIndex indexName=idx_activity_timestamp, tableName=activity; createIndex indexName=idx_activity_user_id, tableName=activity; createIndex indexName=idx_activity_custom_id, tableName=activity', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('14', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.898032', 13, 'EXECUTED', '8:320d2ca8ead3f31309674b2b7f54f395', 'createTable tableName=view_log; createIndex indexName=idx_view_log_user_id, tableName=view_log; createIndex indexName=idx_view_log_timestamp, tableName=view_log', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('15', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.907229', 14, 'EXECUTED', '8:505b91530103673a9be3382cd2db1070', 'addColumn tableName=revision', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('16', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.915627', 15, 'EXECUTED', '8:ecc7f02641a589e6d35f88587ac6e02b', 'dropNotNullConstraint columnName=last_login, tableName=core_user', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('17', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.924906', 16, 'EXECUTED', '8:051c23cd15359364b9895c1569c319e7', 'addColumn tableName=metabase_database; sql', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('18', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.942584', 17, 'EXECUTED', '8:62a0483dde183cfd18dd0a86e9354288', 'createTable tableName=data_migrations; createIndex indexName=idx_data_migrations_id, tableName=data_migrations', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('19', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.951898', 18, 'EXECUTED', '8:269b129dbfc39a6f9e0d3bc61c3c3b70', 'addColumn tableName=metabase_table', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('20', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.008476', 19, 'EXECUTED', '8:0afa34e8b528b83aa19b4142984f8095', 'createTable tableName=pulse; createIndex indexName=idx_pulse_creator_id, tableName=pulse; createTable tableName=pulse_card; createIndex indexName=idx_pulse_card_pulse_id, tableName=pulse_card; createIndex indexName=idx_pulse_card_card_id, tableNam...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('21', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.035866', 20, 'EXECUTED', '8:fb2cd308b17ab81b502d057ecde4fc1b', 'createTable tableName=segment; createIndex indexName=idx_segment_creator_id, tableName=segment; createIndex indexName=idx_segment_table_id, tableName=segment', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('22', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.043961', 21, 'EXECUTED', '8:80bc8a62a90791a79adedcf1ac3c6f08', 'addColumn tableName=revision', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('23', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.062708', 22, 'EXECUTED', '8:b6f054835db2b2688a1be1de3707f9a9', 'modifyDataType columnName=rows, tableName=metabase_table', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('24', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.092706', 23, 'EXECUTED', '8:60825b125b452747098b577310c142b1', 'createTable tableName=dependency; createIndex indexName=idx_dependency_model, tableName=dependency; createIndex indexName=idx_dependency_model_id, tableName=dependency; createIndex indexName=idx_dependency_dependent_on_model, tableName=dependency;...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('25', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.116836', 24, 'EXECUTED', '8:61f25563911117df72f5621d78f10089', 'createTable tableName=metric; createIndex indexName=idx_metric_creator_id, tableName=metric; createIndex indexName=idx_metric_table_id, tableName=metric', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('26', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.127189', 25, 'EXECUTED', '8:ddef40b95c55cf4ac0e6a5161911a4cb', 'addColumn tableName=metabase_database; sql', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('27', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.153314', 26, 'EXECUTED', '8:001855139df2d5dac4eb954e5abe6486', 'createTable tableName=dashboardcard_series; createIndex indexName=idx_dashboardcard_series_dashboardcard_id, tableName=dashboardcard_series; createIndex indexName=idx_dashboardcard_series_card_id, tableName=dashboardcard_series', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('28', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.163083', 27, 'EXECUTED', '8:428e4eb05e4e29141735adf9ae141a0b', 'addColumn tableName=core_user', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('29', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.172081', 28, 'EXECUTED', '8:8b02731cc34add3722c926dfd7376ae0', 'addColumn tableName=pulse_channel', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('30', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.181644', 29, 'EXECUTED', '8:2c3a50cef177cb90d47a9973cd5934e5', 'addColumn tableName=metabase_field; addNotNullConstraint columnName=visibility_type, tableName=metabase_field', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('31', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.19162', 30, 'EXECUTED', '8:30a33a82bab0bcbb2ccb6738d48e1421', 'addColumn tableName=metabase_field', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('57', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.819706', 56, 'EXECUTED', '8:aab81d477e2d19a9ab18c58b78c9af88', 'addColumn tableName=report_card', 'Added 0.25.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('32', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.23264', 31, 'EXECUTED', '8:40830260b92cedad8da273afd5eca678', 'createTable tableName=label; createIndex indexName=idx_label_slug, tableName=label; createTable tableName=card_label; addUniqueConstraint constraintName=unique_card_label_card_id_label_id, tableName=card_label; createIndex indexName=idx_card_label...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('32', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.27831', 32, 'EXECUTED', '8:483c6c6c8e0a8d056f7b9112d0b0125c', 'createTable tableName=raw_table; createIndex indexName=idx_rawtable_database_id, tableName=raw_table; addUniqueConstraint constraintName=uniq_raw_table_db_schema_name, tableName=raw_table; createTable tableName=raw_column; createIndex indexName=id...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('34', 'tlrobinson', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.285543', 33, 'EXECUTED', '8:52b082600b05bbbc46bfe837d1f37a82', 'addColumn tableName=pulse_channel', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('35', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.291088', 34, 'EXECUTED', '8:91b72167fca724e6b6a94b64f886cf09', 'modifyDataType columnName=value, tableName=setting', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('36', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.307934', 35, 'EXECUTED', '8:252e08892449dceb16c3d91337bd9573', 'addColumn tableName=report_dashboard; addNotNullConstraint columnName=parameters, tableName=report_dashboard; addColumn tableName=report_dashboardcard; addNotNullConstraint columnName=parameter_mappings, tableName=report_dashboardcard', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('37', 'tlrobinson', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.327812', 36, 'EXECUTED', '8:07d959eff81777e5690e2920583cfe5f', 'addColumn tableName=query_queryexecution; addNotNullConstraint columnName=query_hash, tableName=query_queryexecution; createIndex indexName=idx_query_queryexecution_query_hash, tableName=query_queryexecution; createIndex indexName=idx_query_querye...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('38', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.381989', 37, 'EXECUTED', '8:43604ab55179b50306eb39353e760b46', 'addColumn tableName=metabase_database; addColumn tableName=metabase_table; addColumn tableName=metabase_field; addColumn tableName=report_dashboard; addColumn tableName=metric; addColumn tableName=segment; addColumn tableName=metabase_database; ad...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('39', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.388701', 38, 'EXECUTED', '8:334adc22af5ded71ff27759b7a556951', 'addColumn tableName=core_user', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('40', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.497703', 39, 'EXECUTED', '8:ee7f50a264d6cf8d891bd01241eebd2c', 'createTable tableName=permissions_group; createIndex indexName=idx_permissions_group_name, tableName=permissions_group; createTable tableName=permissions_group_membership; addUniqueConstraint constraintName=unique_permissions_group_membership_user...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('41', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.508882', 40, 'EXECUTED', '8:fae0855adf2f702f1133e32fc98d02a5', 'dropColumn columnName=field_type, tableName=metabase_field; addDefaultValue columnName=active, tableName=metabase_field; addDefaultValue columnName=preview_display, tableName=metabase_field; addDefaultValue columnName=position, tableName=metabase_...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('42', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.551811', 41, 'EXECUTED', '8:e32b3a1624fa289a6ee1f3f0a2dac1f6', 'dropForeignKeyConstraint baseTableName=query_queryexecution, constraintName=fk_queryexecution_ref_query_id; dropColumn columnName=query_id, tableName=query_queryexecution; dropColumn columnName=is_staff, tableName=core_user; dropColumn columnName=...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('43', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.570523', 42, 'EXECUTED', '8:165e9384e46d6f9c0330784955363f70', 'createTable tableName=permissions_revision', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('44', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.581091', 43, 'EXECUTED', '8:2e356e8a1049286f1c78324828ee7867', 'dropColumn columnName=public_perms, tableName=report_card; dropColumn columnName=public_perms, tableName=report_dashboard; dropColumn columnName=public_perms, tableName=pulse', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('45', 'tlrobinson', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.59302', 44, 'EXECUTED', '8:421edd38ee0cb0983162f57193f81b0b', 'addColumn tableName=report_dashboardcard; addNotNullConstraint columnName=visualization_settings, tableName=report_dashboardcard', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('46', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.605497', 45, 'EXECUTED', '8:131df3cdd9a8c67b32c5988a3fb7fe3d', 'addNotNullConstraint columnName=row, tableName=report_dashboardcard; addNotNullConstraint columnName=col, tableName=report_dashboardcard; addDefaultValue columnName=row, tableName=report_dashboardcard; addDefaultValue columnName=col, tableName=rep...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('47', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.641057', 46, 'EXECUTED', '8:1d2474e49a27db344c250872df58a6ed', 'createTable tableName=collection; createIndex indexName=idx_collection_slug, tableName=collection; addColumn tableName=report_card; createIndex indexName=idx_card_collection_id, tableName=report_card', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('48', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.661904', 47, 'EXECUTED', '8:720ce9d4b9e6f0917aea035e9dc5d95d', 'createTable tableName=collection_revision', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('49', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.691752', 48, 'EXECUTED', '8:4508e7d5f6d4da3c4a2de3bf5e3c5851', 'addColumn tableName=report_card; addColumn tableName=report_card; createIndex indexName=idx_card_public_uuid, tableName=report_card; addColumn tableName=report_dashboard; addColumn tableName=report_dashboard; createIndex indexName=idx_dashboard_pu...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('50', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.701076', 49, 'EXECUTED', '8:98a6ab6428ea7a589507464e34ade58a', 'addColumn tableName=report_card; addColumn tableName=report_card; addColumn tableName=report_dashboard; addColumn tableName=report_dashboard', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('51', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.729055', 50, 'EXECUTED', '8:43c90b5b9f6c14bfd0e41cc0b184617e', 'createTable tableName=query_execution; createIndex indexName=idx_query_execution_started_at, tableName=query_execution; createIndex indexName=idx_query_execution_query_hash_started_at, tableName=query_execution', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('52', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.754353', 51, 'EXECUTED', '8:5af9ea2a96cd6e75a8ac1e6afde7126b', 'createTable tableName=query_cache; createIndex indexName=idx_query_cache_updated_at, tableName=query_cache; addColumn tableName=report_card', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('53', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.770325', 52, 'EXECUTED', '8:78d015c5090c57cd6972eb435601d3d0', 'createTable tableName=query', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('54', 'tlrobinson', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.780343', 53, 'EXECUTED', '8:e410005b585f5eeb5f202076ff9468f7', 'addColumn tableName=pulse', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('55', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.806686', 54, 'EXECUTED', '8:11bbd199bfa57b908ea3b1a470197de9', 'addColumn tableName=report_dashboard; addColumn tableName=report_dashboard; createTable tableName=dashboard_favorite; addUniqueConstraint constraintName=unique_dashboard_favorite_user_id_dashboard_id, tableName=dashboard_favorite; createIndex inde...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('56', 'wwwiiilll', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.813234', 55, 'EXECUTED', '8:9f46051abaee599e2838733512a32ad0', 'addColumn tableName=core_user', 'Added 0.25.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('58', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.842491', 57, 'EXECUTED', '8:3554219ca39e0fd682d0fba57531e917', 'createTable tableName=dimension; addUniqueConstraint constraintName=unique_dimension_field_id_name, tableName=dimension; createIndex indexName=idx_dimension_field_id, tableName=dimension', 'Added 0.25.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('59', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.849049', 58, 'EXECUTED', '8:5b6ce52371e0e9eee88e6d766225a94b', 'addColumn tableName=metabase_field', 'Added 0.26.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('60', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.855515', 59, 'EXECUTED', '8:2141162a1c99a5dd95e5a67c5595e6d7', 'addColumn tableName=metabase_database; addColumn tableName=metabase_database', 'Added 0.26.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('61', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.861975', 60, 'EXECUTED', '8:7dded6fd5bf74d79b9a0b62511981272', 'addColumn tableName=metabase_field', 'Added 0.26.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('62', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.86848', 61, 'EXECUTED', '8:cb32e6eaa1a2140703def2730f81fef2', 'addColumn tableName=metabase_database', 'Added 0.26.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('63', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.875283', 62, 'EXECUTED', '8:226f73b9f6617495892d281b0f8303db', 'addColumn tableName=metabase_database', 'Added 0.26.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('64', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.881689', 63, 'EXECUTED', '8:4dcc8ffd836b56756f494d5dfce07b50', 'dropForeignKeyConstraint baseTableName=raw_table, constraintName=fk_rawtable_ref_database', 'Added 0.26.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('66', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.894534', 64, 'EXECUTED', '8:e77d66af8e3b83d46c5a0064a75a1aac', 'sql; sql', 'Added 0.26.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('141', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.71746', 137, 'MARK_RAN', '8:b6b7faa02cba069e1ed13e365f59cb6b', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('67', 'attekei', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.919022', 65, 'EXECUTED', '8:59dfc37744fc362e0e312488fbc9a69b', 'createTable tableName=computation_job; createTable tableName=computation_job_result', 'Added 0.27.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('68', 'sbelak', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.927106', 66, 'EXECUTED', '8:b4ac06d133dfbdc6567d992c7e18c6ec', 'addColumn tableName=computation_job; addColumn tableName=computation_job', 'Added 0.27.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('69', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.940692', 67, 'EXECUTED', '8:eadbe00e97eb53df4b3df60462f593f6', 'addColumn tableName=pulse; addColumn tableName=pulse; addColumn tableName=pulse; dropNotNullConstraint columnName=name, tableName=pulse', 'Added 0.27.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('70', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.945927', 68, 'EXECUTED', '8:4e4eff7abb983b1127a32ba8107e7fb8', 'addColumn tableName=metabase_field; addNotNullConstraint columnName=database_type, tableName=metabase_field', 'Added 0.28.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('71', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.95027', 69, 'EXECUTED', '8:755e5c3dd8a55793f29b2c95cb79c211', 'dropNotNullConstraint columnName=card_id, tableName=report_dashboardcard', 'Added 0.28.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('72', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.984807', 70, 'EXECUTED', '8:4dc6debdf779ab9273cf2158a84bb154', 'addColumn tableName=pulse_card; addColumn tableName=pulse_card', 'Added 0.28.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('73', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:27.993066', 71, 'EXECUTED', '8:3c0f03d18ff78a0bcc9915e1d9c518d6', 'addColumn tableName=metabase_database', 'Added 0.29.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('74', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.001343', 72, 'EXECUTED', '8:16726d6560851325930c25caf3c8ab96', 'addColumn tableName=metabase_field', 'Added 0.29.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('75', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.00978', 73, 'EXECUTED', '8:6072cabfe8188872d8e3da9a675f88c1', 'addColumn tableName=report_card', 'Added 0.28.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('76', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.015808', 74, 'EXECUTED', '8:9b7190c9171ccca72617d508875c3c82', 'addColumn tableName=metabase_table', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('77', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.021796', 75, 'EXECUTED', '8:07f0a6cd8dbbd9b89be0bd7378f7bdc8', 'addColumn tableName=core_user', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('78', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.046301', 76, 'EXECUTED', '8:1977d7278269cdd0dc4f941f9e82f548', 'createTable tableName=group_table_access_policy; createIndex indexName=idx_gtap_table_id_group_id, tableName=group_table_access_policy; addUniqueConstraint constraintName=unique_gtap_table_id_group_id, tableName=group_table_access_policy', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('79', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.061495', 77, 'EXECUTED', '8:3f31cb67f9cdf7754ca95cade22d87a2', 'addColumn tableName=report_dashboard; createIndex indexName=idx_dashboard_collection_id, tableName=report_dashboard; addColumn tableName=pulse; createIndex indexName=idx_pulse_collection_id, tableName=pulse', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('80', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.070888', 78, 'EXECUTED', '8:199d0ce28955117819ca15bcc29323e5', 'addColumn tableName=collection; createIndex indexName=idx_collection_location, tableName=collection', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('81', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.077295', 79, 'EXECUTED', '8:3a6dc22403660529194d004ca7f7ad39', 'addColumn tableName=report_dashboard; addColumn tableName=report_card; addColumn tableName=pulse', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('82', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.082503', 80, 'EXECUTED', '8:ac4b94df8c648f88cfff661284d6392d', 'addColumn tableName=core_user; sql', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('83', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.089256', 81, 'EXECUTED', '8:ccd897d737737c05248293c7d56efe96', 'dropNotNullConstraint columnName=card_id, tableName=group_table_access_policy', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('84', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.098544', 82, 'EXECUTED', '8:58afc10c3e283a8050ea471aac447a97', 'renameColumn newColumnName=archived, oldColumnName=is_active, tableName=metric; addDefaultValue columnName=archived, tableName=metric; renameColumn newColumnName=archived, oldColumnName=is_active, tableName=segment; addDefaultValue columnName=arch...', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('85', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.119104', 83, 'EXECUTED', '8:9b4c9878a5018452dd63eb6d7c17f415', 'addColumn tableName=collection; createIndex indexName=idx_collection_personal_owner_id, tableName=collection; addColumn tableName=collection; sql; addNotNullConstraint columnName=_slug, tableName=collection; dropColumn columnName=slug, tableName=c...', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('86', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.125058', 84, 'EXECUTED', '8:50c75bb29f479e0b3fb782d89f7d6717', 'sql', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('87', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.133468', 85, 'EXECUTED', '8:0eccf19a93cb0ba4017aafd1d308c097', 'dropTable tableName=raw_column; dropTable tableName=raw_table', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('88', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.142661', 86, 'EXECUTED', '8:04ff5a0738473938fc31d68c1d9952e1', 'addColumn tableName=core_user', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('129', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.650418', 125, 'MARK_RAN', '8:f890168c47cc2113a8af77ed3875c4b3', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('130', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.654329', 126, 'MARK_RAN', '8:ecdcf1fd66b3477e5b6882c3286b2fd8', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('89', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.363074', 87, 'EXECUTED', '8:94d5c406e3ec44e2bc85abe96f6fd91c', 'createTable tableName=QRTZ_JOB_DETAILS; addPrimaryKey constraintName=PK_QRTZ_JOB_DETAILS, tableName=QRTZ_JOB_DETAILS; createTable tableName=QRTZ_TRIGGERS; addPrimaryKey constraintName=PK_QRTZ_TRIGGERS, tableName=QRTZ_TRIGGERS; addForeignKeyConstra...', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('90', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.371145', 88, 'EXECUTED', '8:8562a72a1190deadc5fa59a23a6396dc', 'addColumn tableName=core_user; sql; dropColumn columnName=saml_auth, tableName=core_user', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('91', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.380636', 89, 'EXECUTED', '8:9b8831e1e409f08e874c4ece043d0340', 'dropColumn columnName=raw_table_id, tableName=metabase_table; dropColumn columnName=raw_column_id, tableName=metabase_field', 'Added 0.30.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('92', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.391061', 90, 'EXECUTED', '8:1e5bc2d66778316ea640a561862c23b4', 'addColumn tableName=query_execution', 'Added 0.31.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('93', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.40164', 91, 'EXECUTED', '8:93b0d408a3970e30d7184ed1166b5476', 'addColumn tableName=query', 'Added 0.31.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('94', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.428656', 92, 'EXECUTED', '8:a2a1eedf1e8f8756856c9d49c7684bfe', 'createTable tableName=task_history; createIndex indexName=idx_task_history_end_time, tableName=task_history; createIndex indexName=idx_task_history_db_id, tableName=task_history', 'Added 0.31.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('95', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.44355', 93, 'EXECUTED', '8:9824808283004e803003b938399a4cf0', 'addUniqueConstraint constraintName=idx_databasechangelog_id_author_filename, tableName=DATABASECHANGELOG', 'Added 0.31.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('96', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.452679', 94, 'EXECUTED', '8:5cb2f36edcca9c6e14c5e109d6aeb68b', 'addColumn tableName=metabase_field', 'Added 0.31.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('97', 'senior', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.459352', 95, 'MARK_RAN', '8:9169e238663c5d036bd83428d2fa8e4b', 'modifyDataType columnName=results, tableName=query_cache', 'Added 0.32.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('98', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.475434', 96, 'EXECUTED', '8:f036d20a4dc86fb60ffb64ea838ed6b9', 'addUniqueConstraint constraintName=idx_uniq_table_db_id_schema_name, tableName=metabase_table; sql', 'Added 0.32.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('99', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.492944', 97, 'EXECUTED', '8:274bb516dd95b76c954b26084eed1dfe', 'addUniqueConstraint constraintName=idx_uniq_field_table_id_parent_id_name, tableName=metabase_field; sql', 'Added 0.32.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('100', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.500072', 98, 'EXECUTED', '8:948014f13b6198b50e3b7a066fae2ae0', 'sql', 'Added 0.32.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('101', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.50844', 99, 'EXECUTED', '8:58eabb08a175fafe8985208545374675', 'createIndex indexName=idx_field_parent_id, tableName=metabase_field', 'Added 0.32.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('103', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.517751', 100, 'EXECUTED', '8:fda3670fd16a40fd9d0f89a003098d54', 'addColumn tableName=metabase_database', 'Added 0.32.10', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('104', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.532516', 101, 'EXECUTED', '8:21709f17e6d1b521d3d3b8cbb5445218', 'addColumn tableName=core_session', 'Added EE 1.1.6/CE 0.33.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('106', 'sb', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.539337', 102, 'EXECUTED', '8:a3dd42bbe25c415ce21e4c180dc1c1d7', 'modifyDataType columnName=database_type, tableName=metabase_field', 'Added 0.33.5', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('107', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.543703', 103, 'MARK_RAN', '8:605c2b4d212315c83727aa3d914cf57f', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('108', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.548262', 104, 'MARK_RAN', '8:d11419da9384fd27d7b1670707ac864c', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('109', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.553068', 105, 'MARK_RAN', '8:a5f4ea412eb1d5c1bc824046ad11692f', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('110', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.558028', 106, 'MARK_RAN', '8:82343097044b9652f73f3d3a2ddd04fe', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('111', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.562458', 107, 'MARK_RAN', '8:528de1245ba3aa106871d3e5b3eee0ba', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('112', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.567228', 108, 'MARK_RAN', '8:010a3931299429d1adfa91941c806ea4', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('113', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.571537', 109, 'MARK_RAN', '8:8f8e0836064bdea82487ecf64a129767', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('114', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.576127', 110, 'MARK_RAN', '8:7a0bcb25ece6d9a311d6c6be7ed89bb7', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('115', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.580612', 111, 'MARK_RAN', '8:55c10c2ff7e967e3ea1fdffc5aeed93a', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('116', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.584951', 112, 'MARK_RAN', '8:dbf7c3a1d8b1eb77b7f5888126b13c2e', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('117', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.589847', 113, 'MARK_RAN', '8:f2d7f9fb1b6713bc5362fe40bfe3f91f', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('118', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.594648', 114, 'MARK_RAN', '8:17f4410e30a0c7e84a36517ebf4dab64', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('119', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.599272', 115, 'MARK_RAN', '8:195cf171ac1d5531e455baf44d9d6561', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('120', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.604169', 116, 'MARK_RAN', '8:61f53fac337020aec71868656a719bba', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('121', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.608871', 117, 'MARK_RAN', '8:1baa145d2ffe1e18d097a63a95476c5f', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('122', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.614094', 118, 'MARK_RAN', '8:929b3c551a8f631cdce2511612d82d62', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('123', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.619242', 119, 'MARK_RAN', '8:35e5baddf78df5829fe6889d216436e5', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('124', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.624135', 120, 'MARK_RAN', '8:ce2322ca187dfac51be8f12f6a132818', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('125', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.629043', 121, 'MARK_RAN', '8:dd948ac004ceb9d0a300a8e06806945f', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('126', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.635504', 122, 'MARK_RAN', '8:3d34c0d4e5dbb32b432b83d5322e2aa3', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('127', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.640204', 123, 'MARK_RAN', '8:18314b269fe11898a433ca9048400975', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('128', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.644976', 124, 'MARK_RAN', '8:44acbe257817286d88b7892e79363b66', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('131', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.660037', 127, 'MARK_RAN', '8:453af2935194978c65b19eae445d85c9', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('132', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.665301', 128, 'MARK_RAN', '8:d2c37bc80b42a15b65f148bcb1daa86e', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('133', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.670162', 129, 'MARK_RAN', '8:5b9b539d146fbdb762577dc98e7f3430', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('134', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.675761', 130, 'MARK_RAN', '8:4d0f688a168db3e357a808263b6ad355', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('135', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.680573', 131, 'MARK_RAN', '8:2ca54b0828c6aca615fb42064f1ec728', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('136', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.686379', 132, 'MARK_RAN', '8:7115eebbcf664509b9fc0c39cb6f29e9', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('137', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.692923', 133, 'MARK_RAN', '8:da754ac6e51313a32de6f6389b29e1ca', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('138', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.698571', 134, 'MARK_RAN', '8:bfb201761052189e96538f0de3ac76cf', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('139', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.706007', 135, 'MARK_RAN', '8:fdad4ec86aefb0cdf850b1929b618508', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('140', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.711952', 136, 'MARK_RAN', '8:a0cfe6468160bba8c9d602da736c41fb', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('143', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.728303', 139, 'MARK_RAN', '8:3d9a5cb41f77a33e834d0562fdddeab6', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('144', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.733624', 140, 'MARK_RAN', '8:1d5b7f79f97906105e90d330a17c4062', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('145', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.738459', 141, 'MARK_RAN', '8:b162dd48ef850ab4300e2d714eac504e', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('146', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.74314', 142, 'MARK_RAN', '8:8c0c1861582d15fe7859358f5d553c91', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('147', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.747751', 143, 'MARK_RAN', '8:5ccf590332ea0744414e40a990a43275', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('148', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.753197', 144, 'MARK_RAN', '8:12b42e87d40cd7b6399c1fb0c6704fa7', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('149', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.758329', 145, 'MARK_RAN', '8:dd45bfc4af5e05701a064a5f2a046d7f', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('150', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.763457', 146, 'MARK_RAN', '8:48beda94aeaa494f798c38a66b90fb2a', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('151', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.768136', 147, 'MARK_RAN', '8:bb752a7d09d437c7ac294d5ab2600079', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('152', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.772915', 148, 'MARK_RAN', '8:4bcbc472f2d6ae3a5e7eca425940e52b', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('153', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.777784', 149, 'MARK_RAN', '8:adce2cca96fe0531b00f9bed6bed8352', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('154', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.782269', 150, 'MARK_RAN', '8:7a1df4f7a679f47459ea1a1c0991cfba', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('155', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.786828', 151, 'MARK_RAN', '8:3c78b79c784e3a3ce09a77db1b1d0374', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('156', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.791854', 152, 'MARK_RAN', '8:51859ee6cca4aca9d141a3350eb5d6b1', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('157', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.796155', 153, 'MARK_RAN', '8:0197c46bf8536a75dbf7e9aee731f3b2', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('158', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.800536', 154, 'MARK_RAN', '8:2ebdd5a179ce2487b2e23b6be74a407c', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('159', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.806536', 155, 'MARK_RAN', '8:c62719dad239c51f045315273b56e2a9', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('160', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.81173', 156, 'MARK_RAN', '8:1441c71af662abb809cba3b3b360ce81', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('162', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.828234', 157, 'EXECUTED', '8:c37f015ad11d77d66e09925eed605cdf', 'dropTable tableName=query_queryexecution', 'Added 0.23.0 as a data migration; converted to Liquibase migration in 0.35.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('163', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.836671', 158, 'EXECUTED', '8:9ef66a82624d70738fc89807a2398ed1', 'dropColumn columnName=read_permissions, tableName=report_card', 'Added 0.35.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('164', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.846578', 159, 'EXECUTED', '8:f19470701bbb33f19f91b1199a915881', 'addColumn tableName=core_user', 'Added 0.35.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('165', 'sb', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.855139', 160, 'EXECUTED', '8:b3ae2b90db5c4264ea2ac50d304d6ad4', 'addColumn tableName=metabase_field; addColumn tableName=metabase_field; addColumn tableName=metabase_table; sql', 'Added field_order to Table and database_position to Field', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('166', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.877895', 161, 'EXECUTED', '8:92dafa5c15c46e2af8380304449c7dfa', 'modifyDataType columnName=updated_at, tableName=metabase_fieldvalues; modifyDataType columnName=updated_at, tableName=query_cache', 'Added 0.36.0/1.35.4', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('167', 'walterl, camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.904664', 162, 'EXECUTED', '8:4c11dc8c5e829b5263c198fe7879f161', 'sql; createTable tableName=native_query_snippet; createIndex indexName=idx_snippet_name, tableName=native_query_snippet', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('168', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.934621', 163, 'EXECUTED', '8:6d40bfa472bccd2d54284aeb89e1ec3c', 'modifyDataType columnName=started_at, tableName=query_execution', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('169', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.955838', 164, 'EXECUTED', '8:2b97e6eaa7854e179abb9f3749f73b18', 'dropColumn columnName=rows, tableName=metabase_table', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('170', 'sb', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.964886', 165, 'EXECUTED', '8:dbd6ee52b0f9195e449a6d744606b599', 'dropColumn columnName=fields_hash, tableName=metabase_table', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('171', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.985326', 166, 'EXECUTED', '8:0798080c0796e6ab3e791bff007118b8', 'addColumn tableName=native_query_snippet; createIndex indexName=idx_snippet_collection_id, tableName=native_query_snippet', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('172', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.994481', 167, 'EXECUTED', '8:212f4010b504e358853fd017032f844f', 'addColumn tableName=collection', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('173', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.002304', 168, 'EXECUTED', '8:4d32b4b7be3f4801e51aeffa5dd47649', 'dropForeignKeyConstraint baseTableName=activity, constraintName=fk_activity_ref_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('174', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.011706', 169, 'EXECUTED', '8:66f31503ba532702e54ea531af668531', 'addForeignKeyConstraint baseTableName=activity, constraintName=fk_activity_ref_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('175', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.021141', 170, 'EXECUTED', '8:c3ceddfca8827d73474cd9a70ea01d1c', 'dropForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_card_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('176', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.030549', 171, 'EXECUTED', '8:89c918faa84b7f3f5fa291d4da74414c', 'addForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_card_id, referencedTableName=report_card', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('177', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.040178', 172, 'EXECUTED', '8:d45f2198befc83de1f1f963c750607af', 'dropForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_label_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('178', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.048906', 173, 'EXECUTED', '8:63d396999449da2d42b3d3e22f3454fa', 'addForeignKeyConstraint baseTableName=card_label, constraintName=fk_card_label_ref_label_id, referencedTableName=label', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('179', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.058098', 174, 'EXECUTED', '8:2a0a7956402ef074e5d54c73ac2d5405', 'dropForeignKeyConstraint baseTableName=collection, constraintName=fk_collection_personal_owner_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('180', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.068002', 175, 'EXECUTED', '8:b02225e5940a2bcca3d550f24f80123e', 'addForeignKeyConstraint baseTableName=collection, constraintName=fk_collection_personal_owner_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('181', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.078392', 176, 'EXECUTED', '8:16923f06b2bbb60c6ac78a0c4b7e4d4f', 'dropForeignKeyConstraint baseTableName=collection_revision, constraintName=fk_collection_revision_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('182', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.088265', 177, 'EXECUTED', '8:d59d864c038c530a49056704c93f231d', 'addForeignKeyConstraint baseTableName=collection_revision, constraintName=fk_collection_revision_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('183', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.098409', 178, 'EXECUTED', '8:c5ed9a4f44ee92af620a47c80e010a6b', 'dropForeignKeyConstraint baseTableName=computation_job, constraintName=fk_computation_job_ref_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('184', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.108084', 179, 'EXECUTED', '8:70317e2bdaac90b9ddc33b1b93ada479', 'addForeignKeyConstraint baseTableName=computation_job, constraintName=fk_computation_job_ref_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('185', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.117085', 180, 'EXECUTED', '8:12e7457ec2d2b1a99a3fadfc64d7b7f9', 'dropForeignKeyConstraint baseTableName=computation_job_result, constraintName=fk_computation_result_ref_job_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('186', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.126686', 181, 'EXECUTED', '8:526987d0f6b2f01d7bfc9e3179721be6', 'addForeignKeyConstraint baseTableName=computation_job_result, constraintName=fk_computation_result_ref_job_id, referencedTableName=computation_job', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('187', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.136459', 182, 'EXECUTED', '8:3fbb75c0c491dc6628583184202b8f39', 'dropForeignKeyConstraint baseTableName=core_session, constraintName=fk_session_ref_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('188', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.146316', 183, 'EXECUTED', '8:4dc500830cd4c5715ca8b0956e37b3d5', 'addForeignKeyConstraint baseTableName=core_session, constraintName=fk_session_ref_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('189', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.156226', 184, 'EXECUTED', '8:e07396e0ee587dcf321d21cffa9eec29', 'dropForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_card_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('190', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.167615', 185, 'EXECUTED', '8:eded791094a16bf398896c790645c411', 'addForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_card_id, referencedTableName=report_card', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('191', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.177441', 186, 'EXECUTED', '8:bb5b9a3d64b2e44318e159e7f1fecde2', 'dropForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_dashboardcard_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('192', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.187197', 187, 'EXECUTED', '8:7d96911036dec2fee64fe8ae57c131b3', 'addForeignKeyConstraint baseTableName=dashboardcard_series, constraintName=fk_dashboardcard_series_ref_dashboardcard_id, referencedTableName=report_dashboardcard', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('193', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.197206', 188, 'EXECUTED', '8:db171179fe094db9fee7e2e7df60fa4e', 'dropForeignKeyConstraint baseTableName=group_table_access_policy, constraintName=fk_gtap_card_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('194', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.20755', 189, 'EXECUTED', '8:fccb724d7ae7606e2e7638de1791392a', 'addForeignKeyConstraint baseTableName=group_table_access_policy, constraintName=fk_gtap_card_id, referencedTableName=report_card', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('195', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.216612', 190, 'EXECUTED', '8:1d720af9f917007024c91d40410bc91d', 'dropForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_parent_ref_field_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('196', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.226844', 191, 'EXECUTED', '8:c52f5dbf742feef12a3803bda92a425b', 'addForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_parent_ref_field_id, referencedTableName=metabase_field', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('197', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.235195', 192, 'EXECUTED', '8:9c1c950b709050abe91cea17fd5970cc', 'dropForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_ref_table_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('142', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:28.723991', 138, 'MARK_RAN', '8:0c291eb50cc0f1fef3d55cfe6b62bedb', 'sql', 'Added 0.34.2', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('198', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.243919', 193, 'EXECUTED', '8:e24198ff4825a41d17ceaebd71692103', 'addForeignKeyConstraint baseTableName=metabase_field, constraintName=fk_field_ref_table_id, referencedTableName=metabase_table', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('199', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.25489', 194, 'EXECUTED', '8:146efae3f2938538961835fe07433ee1', 'dropForeignKeyConstraint baseTableName=metabase_fieldvalues, constraintName=fk_fieldvalues_ref_field_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('200', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.265119', 195, 'EXECUTED', '8:f5e7e79cb81b8d2245663c482746c853', 'addForeignKeyConstraint baseTableName=metabase_fieldvalues, constraintName=fk_fieldvalues_ref_field_id, referencedTableName=metabase_field', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('201', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.274807', 196, 'EXECUTED', '8:2d79321a27fde6cb3c4fabdb86dc60ec', 'dropForeignKeyConstraint baseTableName=metabase_table, constraintName=fk_table_ref_database_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('202', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.284526', 197, 'EXECUTED', '8:d0cefed061c4abbf2b0a0fd2a66817cb', 'addForeignKeyConstraint baseTableName=metabase_table, constraintName=fk_table_ref_database_id, referencedTableName=metabase_database', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('203', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.294416', 198, 'EXECUTED', '8:28b4ec07bfbf4b86532fe9357effdb8b', 'dropForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_creator_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('204', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.304492', 199, 'EXECUTED', '8:7195937fd2144533edfa2302ba2ae653', 'addForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_creator_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('205', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.314897', 200, 'EXECUTED', '8:4b2d5f1458641dd1b9dbc5f41600be8e', 'dropForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_table_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('206', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.324604', 201, 'EXECUTED', '8:959ef448c23aaf3acf5b69f297fe4b2f', 'addForeignKeyConstraint baseTableName=metric, constraintName=fk_metric_ref_table_id, referencedTableName=metabase_table', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('207', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.33442', 202, 'EXECUTED', '8:18135d674f2fe502313adb0475f5f139', 'dropForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metabase_field_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('208', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.344278', 203, 'EXECUTED', '8:4c86c17a00a81dfdf35a181e3dd3b08f', 'addForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metabase_field_id, referencedTableName=metabase_field', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('209', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.35358', 204, 'EXECUTED', '8:1b9c3544bf89093fc9e4f7f191fdc6df', 'dropForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metric_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('210', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.363221', 205, 'EXECUTED', '8:842d166cdf7b0a29c88efdaf95c9d0bf', 'addForeignKeyConstraint baseTableName=metric_important_field, constraintName=fk_metric_important_field_metric_id, referencedTableName=metric', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('211', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.373072', 206, 'EXECUTED', '8:91c64815a1aefb07dd124d493bfeeea9', 'dropForeignKeyConstraint baseTableName=native_query_snippet, constraintName=fk_snippet_collection_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('212', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.382853', 207, 'EXECUTED', '8:b25064ee26b71f61906a833bc22ebbc2', 'addForeignKeyConstraint baseTableName=native_query_snippet, constraintName=fk_snippet_collection_id, referencedTableName=collection', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('213', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.389867', 208, 'EXECUTED', '8:60a7d628e4f68ee4c85f5f298b1d9865', 'dropForeignKeyConstraint baseTableName=permissions, constraintName=fk_permissions_group_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('214', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.399676', 209, 'EXECUTED', '8:1c3c480313967a2d9f324a094ba25f4d', 'addForeignKeyConstraint baseTableName=permissions, constraintName=fk_permissions_group_id, referencedTableName=permissions_group', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('215', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.409038', 210, 'EXECUTED', '8:5d2c67ccead52970e9d85beb7eda48b9', 'dropForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_group_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('216', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.422567', 211, 'EXECUTED', '8:35fcd5d48600e887188eb1b990e6cc35', 'addForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_group_id, referencedTableName=permissions_group', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('217', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.432052', 212, 'EXECUTED', '8:da7460a35a724109ae9b5096cd18666b', 'dropForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_membership_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('218', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.440575', 213, 'EXECUTED', '8:dc04b7eb04cd870c53102cb37fd75a5f', 'addForeignKeyConstraint baseTableName=permissions_group_membership, constraintName=fk_permissions_group_membership_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('219', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.450028', 214, 'EXECUTED', '8:02c690f34fe8803e42441f5037d33017', 'dropForeignKeyConstraint baseTableName=permissions_revision, constraintName=fk_permissions_revision_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('220', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.457328', 215, 'EXECUTED', '8:8b8447405d7b2b52358c9676d64b7651', 'addForeignKeyConstraint baseTableName=permissions_revision, constraintName=fk_permissions_revision_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('221', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.466929', 216, 'EXECUTED', '8:54a4c0d8a4eda80dc81fb549a629d075', 'dropForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_collection_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('222', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.474394', 217, 'EXECUTED', '8:c5f22e925be3a8fd0e4f47a491f599ee', 'addForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_collection_id, referencedTableName=collection', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('223', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.483403', 218, 'EXECUTED', '8:de743e384ff90a6a31a3caebe0abb775', 'dropForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_ref_creator_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('224', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.491161', 219, 'EXECUTED', '8:b8fdf9c14d7ea3131a0a6b1f1036f91a', 'addForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_ref_creator_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('225', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.500281', 220, 'EXECUTED', '8:495a4e12cf75cac5ff54738772e6a998', 'dropForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_card_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('226', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.510732', 221, 'EXECUTED', '8:cf383d74bc407065c78c060203ba4560', 'addForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_card_id, referencedTableName=report_card', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('227', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.518322', 222, 'EXECUTED', '8:e23eaf74ab7edacfb34bd5caf05cf66f', 'dropForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_pulse_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('228', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.528001', 223, 'EXECUTED', '8:d458ddb160f61e93bb69738f262de2b4', 'addForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_pulse_id, referencedTableName=pulse', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('229', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.535067', 224, 'EXECUTED', '8:1cb939d172989cb1629e9a3da768596d', 'dropForeignKeyConstraint baseTableName=pulse_channel, constraintName=fk_pulse_channel_ref_pulse_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('230', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.548387', 225, 'EXECUTED', '8:62baea3334ac5f21feac84497f6bf643', 'addForeignKeyConstraint baseTableName=pulse_channel, constraintName=fk_pulse_channel_ref_pulse_id, referencedTableName=pulse', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('231', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.559604', 226, 'EXECUTED', '8:d096a9ce70fc0b7dfbc67ee1be4c3e31', 'dropForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_pulse_channel_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('232', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.569667', 227, 'EXECUTED', '8:be2457ae1e386c9d5ec5bfa4ae681fd6', 'addForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_pulse_channel_id, referencedTableName=pulse_channel', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('233', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.580659', 228, 'EXECUTED', '8:d5c018882af16093de446e025e2599b7', 'dropForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('234', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.589981', 229, 'EXECUTED', '8:edb6ced6c353064c46fa00b54e187aef', 'addForeignKeyConstraint baseTableName=pulse_channel_recipient, constraintName=fk_pulse_channel_recipient_ref_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('235', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.599384', 230, 'EXECUTED', '8:550c64e41e55233d52ac3ef24d664be1', 'dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_collection_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('236', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.608798', 231, 'EXECUTED', '8:04300b298b663fc2a2f3a324d1051c3c', 'addForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_collection_id, referencedTableName=collection', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('237', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.618138', 232, 'EXECUTED', '8:227a9133cdff9f1b60d8af53688ab12e', 'dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_made_public_by_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('238', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.628104', 233, 'EXECUTED', '8:7000766ddca2c914ac517611e7d86549', 'addForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_made_public_by_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('239', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.63769', 234, 'EXECUTED', '8:672f4972653f70464982008a7abea3e1', 'dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_ref_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('240', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.644885', 235, 'EXECUTED', '8:165b07c8ceb004097c83ee1b689164e4', 'addForeignKeyConstraint baseTableName=report_card, constraintName=fk_card_ref_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('241', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.650611', 236, 'EXECUTED', '8:b0a9e3d801e64e0a66c3190e458c01ae', 'dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_database_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('242', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.65888', 237, 'EXECUTED', '8:bf10f944715f87c3ad0dd7472d84df62', 'addForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_database_id, referencedTableName=metabase_database', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('243', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.666066', 238, 'EXECUTED', '8:cba5d2bfb36e13c60d82cc6cca659b61', 'dropForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_table_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('244', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.674525', 239, 'EXECUTED', '8:4d40104eaa47d01981644462ef56f369', 'addForeignKeyConstraint baseTableName=report_card, constraintName=fk_report_card_ref_table_id, referencedTableName=metabase_table', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('245', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.681605', 240, 'EXECUTED', '8:a8f9206dadfe23662d547035f71e3846', 'dropForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_card_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('246', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.69002', 241, 'EXECUTED', '8:e5db34b9db22254f7445fd65ecf45356', 'addForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_card_id, referencedTableName=report_card', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('247', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.697694', 242, 'EXECUTED', '8:76de7337a12a5ef42dcbb9274bd2d70f', 'dropForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('248', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.707217', 243, 'EXECUTED', '8:0640fb00a090cbe5dc545afbe0d25811', 'addForeignKeyConstraint baseTableName=report_cardfavorite, constraintName=fk_cardfavorite_ref_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('249', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.713212', 244, 'EXECUTED', '8:16ef5909a72ac4779427e432b3b3ce18', 'dropForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_collection_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('250', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.721434', 245, 'EXECUTED', '8:2e80ebe19816b7bde99050638772cf99', 'addForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_collection_id, referencedTableName=collection', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('251', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.731206', 246, 'EXECUTED', '8:c12aa099f293b1e3d71da5e3edb3c45a', 'dropForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_made_public_by_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('252', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.741264', 247, 'EXECUTED', '8:26b16d4d0cf7a77c1d687f49b029f421', 'addForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_made_public_by_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('253', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.751337', 248, 'EXECUTED', '8:bbf118edaa88a8ad486ec0d6965504b6', 'dropForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_ref_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('254', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.760987', 249, 'EXECUTED', '8:7fc35d78c63f41eb4dbd23cfd1505f0b', 'addForeignKeyConstraint baseTableName=report_dashboard, constraintName=fk_dashboard_ref_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('255', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.771291', 250, 'EXECUTED', '8:f6564a7516ace55104a3173eebf4c629', 'dropForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_card_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('256', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.781257', 251, 'EXECUTED', '8:61db9be3b4dd7ed1e9d01a7254e87544', 'addForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_card_id, referencedTableName=report_card', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('257', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.791966', 252, 'EXECUTED', '8:c8b51dc7ba4da9f7995a0b0c17fadad2', 'dropForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_dashboard_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('258', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.800745', 253, 'EXECUTED', '8:58974c6ad8aee63f09e6e48b1a78c267', 'addForeignKeyConstraint baseTableName=report_dashboardcard, constraintName=fk_dashboardcard_ref_dashboard_id, referencedTableName=report_dashboard', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('259', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.811812', 254, 'EXECUTED', '8:be4a52feb3b12e655c0bbd34477749b0', 'dropForeignKeyConstraint baseTableName=revision, constraintName=fk_revision_ref_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('260', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.821428', 255, 'EXECUTED', '8:4b370f9c9073a6f8f585aab713c57f47', 'addForeignKeyConstraint baseTableName=revision, constraintName=fk_revision_ref_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('261', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.829151', 256, 'EXECUTED', '8:173fe552fdf72fdb4efbc01a6ac4f7ad', 'dropForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_creator_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('1', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.721615', 1, 'EXECUTED', '8:7182ca8e82947c24fa827d31f78b19aa', 'createTable tableName=core_organization; createTable tableName=core_user; createTable tableName=core_userorgperm; addUniqueConstraint constraintName=idx_unique_user_id_organization_id, tableName=core_userorgperm; createIndex indexName=idx_userorgp...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('2', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.748358', 2, 'EXECUTED', '8:bdcf1238e2ccb4fbe66d7f9e1d9b9529', 'createTable tableName=core_session', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('4', 'cammsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.76324', 3, 'EXECUTED', '8:a8e7822a91ea122212d376f5c2d4158f', 'createTable tableName=setting', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('5', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.77253', 4, 'EXECUTED', '8:4f8653d16f4b102b3dff647277b6b988', 'addColumn tableName=core_organization', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('6', 'agilliland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.783003', 5, 'EXECUTED', '8:2d2f5d1756ecb81da7c09ccfb9b1565a', 'dropNotNullConstraint columnName=organization_id, tableName=metabase_database; dropForeignKeyConstraint baseTableName=metabase_database, constraintName=fk_database_ref_organization_id; dropNotNullConstraint columnName=organization_id, tableName=re...', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('7', 'cammsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.793544', 6, 'EXECUTED', '8:c57c69fd78d804beb77d261066521f7f', 'addColumn tableName=metabase_field', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('8', 'tlrobinson', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.80254', 7, 'EXECUTED', '8:960ec59bbcb4c9f3fa8362eca9af4075', 'addColumn tableName=metabase_table; addColumn tableName=metabase_field', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('9', 'tlrobinson', 'migrations/000_migrations.yaml', '2021-04-12 17:53:26.809536', 8, 'EXECUTED', '8:d560283a190e3c60802eb04f5532a49d', 'addColumn tableName=metabase_table', '', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('279', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:30.027631', 272, 'EXECUTED', '8:63dfccd51b62b939da71fe4435f58679', 'addColumn tableName=pulse', 'Added 0.38.0 - Dashboard subscriptions', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('280', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:30.037247', 273, 'EXECUTED', '8:ae966ee1e40f20ea438daba954a8c2a6', 'addForeignKeyConstraint baseTableName=pulse, constraintName=fk_pulse_ref_dashboard_id, referencedTableName=report_dashboard', 'Added 0.38.0 - Dashboard subscriptions', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('262', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.838921', 257, 'EXECUTED', '8:50927b8b1d1809f32c11d2e649dbcb94', 'addForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_creator_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('263', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.846055', 258, 'EXECUTED', '8:0b10c8664506917cc50359e9634c121c', 'dropForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_table_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('264', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.855925', 259, 'EXECUTED', '8:b132aedf6fbdcc5d956a2d3a154cc035', 'addForeignKeyConstraint baseTableName=segment, constraintName=fk_segment_ref_table_id, referencedTableName=metabase_table', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('265', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.864608', 260, 'EXECUTED', '8:2e339ecb05463b3765f9bb266bd28297', 'dropForeignKeyConstraint baseTableName=view_log, constraintName=fk_view_log_ref_user_id', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('266', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.874945', 261, 'EXECUTED', '8:31506e118764f5e520f755f26c696bb8', 'addForeignKeyConstraint baseTableName=view_log, constraintName=fk_view_log_ref_user_id, referencedTableName=core_user', 'Added 0.36.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('268', 'rlotun', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.887998', 262, 'EXECUTED', '8:9da2f706a7cd42b5101601e0106fa929', 'createIndex indexName=idx_lower_email, tableName=core_user', 'Added 0.37.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('269', 'rlotun', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.897114', 263, 'EXECUTED', '8:215609ca9dce2181687b4fa65e7351ba', 'sql', 'Added 0.37.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('270', 'rlotun', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.947899', 264, 'EXECUTED', '8:17001a192ba1df02104cc0d15569cbe5', 'sql', 'Added 0.37.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('271', 'rlotun', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.966964', 265, 'EXECUTED', '8:ce8ddb253a303d4f8924ff5a187080c0', 'modifyDataType columnName=email, tableName=core_user', 'Added 0.37.0', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('273', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.976354', 266, 'EXECUTED', '8:5348576bb9852f6f947e1aa39cd1626f', 'addDefaultValue columnName=is_superuser, tableName=core_user', 'Added 0.37.1', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('274', 'camsaul', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.986624', 267, 'EXECUTED', '8:11a8a84b9ba7634aeda625ff3f487d22', 'addDefaultValue columnName=is_active, tableName=core_user', 'Added 0.37.1', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('275', 'dpsutton', 'migrations/000_migrations.yaml', '2021-04-12 17:53:29.996469', 268, 'EXECUTED', '8:447d9e294f59dd1058940defec7e0f40', 'addColumn tableName=metabase_database', 'Added 0.38.0 refingerprint to Database', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('276', 'robroland', 'migrations/000_migrations.yaml', '2021-04-12 17:53:30.006987', 269, 'EXECUTED', '8:59dd1fb0732c7a9b78bce896c0cff3c0', 'addColumn tableName=pulse_card', 'Added 0.38.0 - Dashboard subscriptions', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('277', 'tsmacdonald', 'migrations/000_migrations.yaml', '2021-04-12 17:53:30.014522', 270, 'EXECUTED', '8:367180f0820b72ad2c60212e67ae53e7', 'dropForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_pulse_card_id', 'Added 0.38.0 - Dashboard subscriptions', NULL, '3.6.3', NULL, NULL, '8260806211');
INSERT INTO public.databasechangelog VALUES ('278', 'tsmacdonald', 'migrations/000_migrations.yaml', '2021-04-12 17:53:30.021357', 271, 'EXECUTED', '8:fc4fb1c1e3344374edd7b9f1f0d34c89', 'addForeignKeyConstraint baseTableName=pulse_card, constraintName=fk_pulse_card_ref_pulse_card_id, referencedTableName=report_dashboardcard', 'Added 0.38.0 - Dashboard subscrptions', NULL, '3.6.3', NULL, NULL, '8260806211');


--
-- TOC entry 3677 (class 0 OID 28669)
-- Dependencies: 204
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.databasechangeloglock VALUES (1, false, NULL, NULL);


--
-- TOC entry 3716 (class 0 OID 29290)
-- Dependencies: 243
-- Data for Name: dependency; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3746 (class 0 OID 29659)
-- Dependencies: 273
-- Data for Name: dimension; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3752 (class 0 OID 29724)
-- Dependencies: 279
-- Data for Name: group_table_access_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3722 (class 0 OID 29348)
-- Dependencies: 249
-- Data for Name: label; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3681 (class 0 OID 28739)
-- Dependencies: 208
-- Data for Name: metabase_database; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.metabase_database VALUES (2, '2021-04-12 20:56:31.750561+00', '2021-04-13 00:46:29.769828+00', 'pgsql server', NULL, '{"host":"pgsql","port":null,"dbname":"postgres","user":"postgres","password":"desafio_modulo_3","ssl":false,"additional-options":null,"tunnel-enabled":false}', 'postgres', false, true, NULL, NULL, '0 40 * * * ? *', '0 0 23 * * ? *', NULL, false, NULL, true, NULL);
INSERT INTO public.metabase_database VALUES (1, '2021-04-12 20:53:31.151909+00', '2021-04-13 01:09:40.611489+00', 'Sample Dataset', NULL, '{"db":"zip:/app/metabase.jar!/sample-dataset.db;USER=GUEST;PASSWORD=guest"}', 'h2', true, true, NULL, NULL, '0 40 * * * ? *', '0 0 15 * * ? *', 'America/Sao_Paulo', false, NULL, true, NULL);


--
-- TOC entry 3685 (class 0 OID 28773)
-- Dependencies: 212
-- Data for Name: metabase_field; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.metabase_field VALUES (9, '2021-04-12 20:53:31.836558+00', '2021-04-12 20:53:31.836558+00', 'ID', 'type/BigInteger', 'type/PK', true, 'This is a unique ID for the product. It is also called the “Invoice number” or “Confirmation number” in customer facing emails and screens.', true, 0, 2, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'BIGINT', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (14, '2021-04-12 20:53:31.91868+00', '2021-04-12 20:53:36.13034+00', 'NAME', 'type/Text', 'type/Name', true, 'The name of the user who owns an account', true, 4, 3, NULL, 'Name', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":2499,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":13.532}}}', 5, 'VARCHAR', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (22, '2021-04-12 20:53:31.953881+00', '2021-04-12 20:53:31.953881+00', 'ID', 'type/BigInteger', 'type/PK', true, 'A unique identifier given to each user.', true, 0, 3, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'BIGINT', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (30, '2021-04-12 20:53:32.015043+00', '2021-04-12 20:53:32.015043+00', 'ID', 'type/BigInteger', 'type/PK', true, 'The numerical product number. Only used internally. All external communication should use the title or EAN.', true, 0, 1, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'BIGINT', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (36, '2021-04-12 20:53:32.083822+00', '2021-04-12 20:53:32.083822+00', 'ID', 'type/BigInteger', 'type/PK', true, 'A unique internal identifier for the review. Should not be used externally.', true, 0, 4, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'BIGINT', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (6, '2021-04-12 20:53:31.820136+00', '2021-04-12 20:53:34.224021+00', 'SUBTOTAL', 'type/Float', NULL, true, 'The raw, pre-tax cost of the order. Note that this might be different in the future from the product price due to promotions, credits, etc.', true, 3, 2, NULL, 'Subtotal', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":340,"nil%":0.0},"type":{"type/Number":{"min":15.691943673970439,"q1":49.74894519060184,"q3":105.42965746993103,"max":148.22900526552291,"sd":32.53705013056317,"avg":77.01295465356547}}}', 5, 'DOUBLE', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (3, '2021-04-12 20:53:31.803905+00', '2021-04-12 20:53:34.237954+00', 'USER_ID', 'type/Integer', 'type/FK', true, 'The id of the user who made this order. Note that in some cases where an order was created on behalf of a customer who phoned the order in, this might be the employee who handled the request.', true, 1, 2, NULL, 'User ID', 'normal', 22, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":929,"nil%":0.0}}', 5, 'INTEGER', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (11, '2021-04-12 20:53:31.905618+00', '2021-04-12 20:53:35.564552+00', 'PASSWORD', 'type/Text', NULL, true, 'This is the salted password of the user. It should not be visible', true, 3, 3, NULL, 'Password', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":2500,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":36.0}}}', 5, 'VARCHAR', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (20, '2021-04-12 20:53:31.943657+00', '2021-04-12 20:53:35.576986+00', 'ZIP', 'type/Text', 'type/ZipCode', true, 'The postal code of the account’s billing address', true, 10, 3, NULL, 'Zip', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":2234,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":5.0}}}', 5, 'CHAR', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (23, '2021-04-12 20:53:31.99033+00', '2021-04-12 20:53:35.729836+00', 'PRICE', 'type/Float', NULL, true, 'The list price of the product. Note that this is not always the price the product sold for due to discounts, promotions, etc.', true, 5, 1, NULL, 'Price', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":170,"nil%":0.0},"type":{"type/Number":{"min":15.691943673970439,"q1":37.25154462926434,"q3":75.45898071609447,"max":98.81933684368194,"sd":21.711481557852057,"avg":55.74639966792074}}}', 5, 'DOUBLE', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (17, '2021-04-12 20:53:31.931156+00', '2021-04-12 20:53:36.140952+00', 'STATE', 'type/Text', 'type/State', true, 'The state or province of the account’s billing address', true, 7, 3, NULL, 'State', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":49,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":1.0,"average-length":2.0}}}', 5, 'CHAR', 'auto-list', NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (35, '2021-04-12 20:53:32.081554+00', '2021-04-12 20:53:36.056578+00', 'REVIEWER', 'type/Text', NULL, true, 'The user who left the review', true, 2, 4, NULL, 'Reviewer', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":1076,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.001798561151079137,"average-length":9.972122302158274}}}', 5, 'VARCHAR', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (8, '2021-04-12 20:53:31.831142+00', '2021-04-12 20:53:34.227256+00', 'TAX', 'type/Float', NULL, true, 'This is the amount of local and federal taxes that are collected on the purchase. Note that other governmental fees on some products are not included here, but instead are accounted for in the subtotal.', true, 4, 2, NULL, 'Tax', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":797,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":2.273340386603857,"q3":5.337275338216307,"max":11.12,"sd":2.3206651358900316,"avg":3.8722100000000004}}}', 5, 'DOUBLE', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (7, '2021-04-12 20:53:31.825671+00', '2021-04-12 20:53:34.231923+00', 'TOTAL', 'type/Float', NULL, true, 'The total billed amount.', true, 5, 2, NULL, 'Total', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":4426,"nil%":0.0},"type":{"type/Number":{"min":8.93914247937167,"q1":51.34535490743823,"q3":110.29428389265787,"max":159.34900526552292,"sd":34.26469575709948,"avg":80.35871658771228}}}', 5, 'DOUBLE', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (13, '2021-04-12 20:53:31.913613+00', '2021-04-12 20:53:35.52825+00', 'ADDRESS', 'type/Text', NULL, true, 'The street address of the account’s billing address', true, 1, 3, NULL, 'Address', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":2490,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":20.85}}}', 5, 'VARCHAR', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (16, '2021-04-12 20:53:31.928546+00', '2021-04-12 20:53:35.531656+00', 'BIRTH_DATE', 'type/Date', NULL, true, 'The date of birth of the user', true, 9, 3, NULL, 'Birth Date', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":2308,"nil%":0.0},"type":{"type/DateTime":{"earliest":"1958-04-26","latest":"2000-04-03"}}}', 5, 'DATE', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (19, '2021-04-12 20:53:31.941117+00', '2021-04-12 20:53:36.119489+00', 'LATITUDE', 'type/Float', 'type/Latitude', true, 'This is the latitude of the user on sign-up. It might be updated in the future to the last seen location.', true, 11, 3, NULL, 'Latitude', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":2491,"nil%":0.0},"type":{"type/Number":{"min":25.775827,"q1":35.302705923023126,"q3":43.773802584662,"max":70.6355001,"sd":6.390832341883712,"avg":39.87934670484002}}}', 5, 'DOUBLE', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (18, '2021-04-12 20:53:31.936454+00', '2021-04-12 20:53:36.135897+00', 'SOURCE', 'type/Text', 'type/Source', true, 'The channel through which we acquired this user. Valid values include: Affiliate, Facebook, Google, Organic and Twitter', true, 8, 3, NULL, 'Source', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":7.4084}}}', 5, 'VARCHAR', 'auto-list', NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (5, '2021-04-12 20:53:31.814816+00', '2021-04-12 20:53:34.214157+00', 'PRODUCT_ID', 'type/Integer', 'type/FK', true, 'The product ID. This is an internal identifier for the product, NOT the SKU.', true, 2, 2, NULL, 'Product ID', 'normal', 30, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":200,"nil%":0.0}}', 5, 'INTEGER', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (10, '2021-04-12 20:53:31.902457+00', '2021-04-12 20:53:36.108679+00', 'CREATED_AT', 'type/DateTime', 'type/CreationTimestamp', true, 'The date the user record was created. Also referred to as the user’s "join date"', true, 12, 3, NULL, 'Created At', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":2500,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-04-19T21:35:18.752Z","latest":"2019-04-19T14:06:27.3Z"}}}', 5, 'TIMESTAMP', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (26, '2021-04-12 20:53:32.002026+00', '2021-04-12 20:53:36.150349+00', 'CATEGORY', 'type/Text', 'type/Category', true, 'The type of product, valid values include: Doohicky, Gadget, Gizmo and Widget', true, 3, 1, NULL, 'Category', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":6.375}}}', 5, 'VARCHAR', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (28, '2021-04-12 20:53:32.009409+00', '2021-04-12 20:53:36.160023+00', 'RATING', 'type/Float', 'type/Score', true, 'The average rating users have given the product. This ranges from 1 - 5', true, 6, 1, NULL, 'Rating', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":23,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":3.5120465053408525,"q3":4.216124969497314,"max":5.0,"sd":1.3605488657451452,"avg":3.4715}}}', 5, 'DOUBLE', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (24, '2021-04-12 20:53:31.992789+00', '2021-04-12 20:53:35.724907+00', 'EAN', 'type/Text', NULL, true, 'The international article number. A 13 digit number uniquely identifying the product.', true, 1, 1, NULL, 'Ean', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":200,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":13.0}}}', 5, 'CHAR', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (25, '2021-04-12 20:53:31.997799+00', '2021-04-12 20:53:36.1687+00', 'VENDOR', 'type/Text', 'type/Company', true, 'The source of the product.', true, 4, 1, NULL, 'Vendor', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":200,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":20.6}}}', 5, 'VARCHAR', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (34, '2021-04-12 20:53:32.076413+00', '2021-04-12 20:53:36.176821+00', 'CREATED_AT', 'type/DateTime', 'type/CreationTimestamp', true, 'The day and time a review was written by a user.', true, 5, 4, NULL, 'Created At', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":1112,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-06-03T00:37:05.818Z","latest":"2020-04-19T14:15:25.677Z"}}}', 5, 'TIMESTAMP', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (33, '2021-04-12 20:53:32.060112+00', '2021-04-12 20:53:36.046559+00', 'PRODUCT_ID', 'type/Integer', 'type/FK', true, 'The product the review was for', true, 1, 4, NULL, 'Product ID', 'normal', 30, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":176,"nil%":0.0}}', 5, 'INTEGER', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (1, '2021-04-12 20:53:31.794941+00', '2021-04-12 20:53:36.085413+00', 'DISCOUNT', 'type/Float', 'type/Discount', true, 'Discount amount.', true, 6, 2, NULL, 'Discount', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":701,"nil%":0.898},"type":{"type/Number":{"min":0.17088996672584322,"q1":2.9786226681458743,"q3":7.338187788658235,"max":61.69684269960571,"sd":3.053663125001991,"avg":5.161255547580326}}}', 5, 'DOUBLE', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (32, '2021-04-12 20:53:32.058173+00', '2021-04-12 20:53:36.038181+00', 'BODY', 'type/Text', 'type/Description', true, 'The review the user left. Limited to 2000 characters.', true, 4, 4, NULL, 'Body', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":1112,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":177.41996402877697}}}', 5, 'CLOB', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (4, '2021-04-12 20:53:31.809314+00', '2021-04-12 20:53:36.082009+00', 'CREATED_AT', 'type/DateTime', 'type/CreationTimestamp', true, 'The date and time an order was submitted.', true, 7, 2, NULL, 'Created At', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":9998,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-04-30T18:56:13.352Z","latest":"2020-04-19T14:07:15.657Z"}}}', 5, 'TIMESTAMP', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (2, '2021-04-12 20:53:31.798418+00', '2021-04-12 20:53:36.094659+00', 'QUANTITY', 'type/Integer', 'type/Quantity', true, 'Number of products bought.', true, 8, 2, NULL, 'Quantity', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":62,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":1.755882607764982,"q3":4.882654507928044,"max":100.0,"sd":4.214258386403798,"avg":3.7015}}}', 5, 'INTEGER', 'auto-list', NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (21, '2021-04-12 20:53:31.948195+00', '2021-04-12 20:53:36.105948+00', 'CITY', 'type/Text', 'type/City', true, 'The city of the account’s billing address', true, 5, 3, NULL, 'City', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":1966,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.002,"average-length":8.284}}}', 5, 'VARCHAR', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (15, '2021-04-12 20:53:31.923115+00', '2021-04-12 20:53:36.114456+00', 'EMAIL', 'type/Text', 'type/Email', true, 'The contact email for the account.', true, 2, 3, NULL, 'Email', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":2500,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":1.0,"percent-state":0.0,"average-length":24.1824}}}', 5, 'VARCHAR', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (12, '2021-04-12 20:53:31.911231+00', '2021-04-12 20:53:36.124711+00', 'LONGITUDE', 'type/Float', 'type/Longitude', true, 'This is the longitude of the user on sign-up. It might be updated in the future to the last seen location.', true, 6, 3, NULL, 'Longitude', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":2491,"nil%":0.0},"type":{"type/Number":{"min":-166.5425726,"q1":-101.58350792373135,"q3":-84.65289348288829,"max":-67.96735199999999,"sd":15.399698968175663,"avg":-95.18741780363999}}}', 5, 'DOUBLE', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (29, '2021-04-12 20:53:32.013091+00', '2021-04-12 20:53:36.15327+00', 'CREATED_AT', 'type/DateTime', 'type/CreationTimestamp', true, 'The date the product was added to our catalog.', true, 7, 1, NULL, 'Created At', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":200,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2016-04-26T19:29:55.147Z","latest":"2019-04-15T13:34:19.931Z"}}}', 5, 'TIMESTAMP', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (27, '2021-04-12 20:53:32.004456+00', '2021-04-12 20:53:36.163648+00', 'TITLE', 'type/Text', 'type/Title', true, 'The name of the product as it should be displayed to customers.', true, 2, 1, NULL, 'Title', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":199,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":21.495}}}', 5, 'VARCHAR', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (31, '2021-04-12 20:53:32.053138+00', '2021-04-12 20:53:36.182151+00', 'RATING', 'type/Integer', 'type/Score', true, 'The rating (on a scale of 1-5) the user left.', true, 3, 4, NULL, 'Rating', 'normal', NULL, '2021-04-12 20:53:36.228368+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Number":{"min":1.0,"q1":3.54744353181696,"q3":4.764807071650455,"max":5.0,"sd":1.0443899855660577,"avg":3.987410071942446}}}', 5, 'SMALLINT', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (44, '2021-04-12 20:56:32.436982+00', '2021-04-12 20:56:32.436982+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 49, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (48, '2021-04-12 20:56:32.474398+00', '2021-04-12 20:56:32.474398+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 5, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (55, '2021-04-12 20:56:32.51357+00', '2021-04-12 20:56:32.51357+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 20, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (59, '2021-04-12 20:56:32.547048+00', '2021-04-12 20:56:32.547048+00', 'type', 'type/Text', NULL, true, NULL, true, 4, 54, NULL, 'Type', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (61, '2021-04-12 20:56:32.552408+00', '2021-04-12 20:56:32.552408+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 54, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (62, '2021-04-12 20:56:32.557233+00', '2021-04-12 20:56:32.557233+00', 'status', 'type/Text', NULL, true, NULL, true, 5, 54, NULL, 'Status', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (63, '2021-04-12 20:56:32.562052+00', '2021-04-12 20:56:32.562052+00', 'created_at', 'type/DateTime', NULL, true, NULL, true, 2, 54, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamp', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (64, '2021-04-12 20:56:32.566878+00', '2021-04-12 20:56:32.566878+00', 'context', 'type/Text', NULL, true, NULL, true, 6, 54, NULL, 'Context', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (65, '2021-04-12 20:56:32.571797+00', '2021-04-12 20:56:32.571797+00', 'updated_at', 'type/DateTime', NULL, true, NULL, true, 3, 54, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamp', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (66, '2021-04-12 20:56:32.576645+00', '2021-04-12 20:56:32.576645+00', 'ended_at', 'type/DateTime', NULL, true, NULL, true, 7, 54, NULL, 'Ended At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamp', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (68, '2021-04-12 20:56:32.599374+00', '2021-04-12 20:56:32.599374+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 56, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (69, '2021-04-12 20:56:32.601736+00', '2021-04-12 20:56:32.601736+00', 'created_at', 'type/DateTime', NULL, true, NULL, true, 2, 56, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamp', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (70, '2021-04-12 20:56:32.606225+00', '2021-04-12 20:56:32.606225+00', 'payload', 'type/Text', NULL, true, NULL, true, 5, 56, NULL, 'Payload', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (71, '2021-04-12 20:56:32.609925+00', '2021-04-12 20:56:32.609925+00', 'updated_at', 'type/DateTime', NULL, true, NULL, true, 3, 56, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamp', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (72, '2021-04-12 20:56:32.61185+00', '2021-04-12 20:56:32.61185+00', 'permanence', 'type/Text', NULL, true, NULL, true, 4, 56, NULL, 'Permanence', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (74, '2021-04-12 20:56:32.630791+00', '2021-04-12 20:56:32.630791+00', 'id', 'type/Text', 'type/PK', true, NULL, true, 0, 51, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (49, '2021-04-12 20:56:32.476346+00', '2021-04-12 20:56:35.063118+00', 'card_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 5, NULL, 'Card ID', 'normal', 366, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (60, '2021-04-12 20:56:32.548522+00', '2021-04-12 20:56:35.104609+00', 'creator_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 54, NULL, 'Creator ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (67, '2021-04-12 20:56:32.598057+00', '2021-04-12 20:56:35.118832+00', 'job_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 56, NULL, 'Job ID', 'normal', 61, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (51, '2021-04-12 20:56:32.494229+00', '2021-04-12 20:56:44.174734+00', 'color', 'type/Text', 'type/Category', true, 'Seven-character hex color for this Collection, including the preceding hash sign.', true, 3, 20, NULL, 'Color', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":7.0}}}', 5, 'bpchar', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (53, '2021-04-12 20:56:32.503809+00', '2021-04-12 20:56:44.178882+00', 'archived', 'type/Boolean', 'type/Category', true, 'Whether this Collection has been archived and should be hidden from users.', true, 4, 20, NULL, 'Archived', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (85, '2021-04-12 20:56:32.696652+00', '2021-04-12 20:56:32.696652+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 27, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (97, '2021-04-12 20:56:32.765723+00', '2021-04-12 20:56:32.765723+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 17, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (99, '2021-04-12 20:56:32.771109+00', '2021-04-12 20:56:32.771109+00', 'position', 'type/Integer', NULL, true, NULL, true, 3, 17, NULL, 'Position', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (102, '2021-04-12 20:56:32.78706+00', '2021-04-12 20:56:32.78706+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 6, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (103, '2021-04-12 20:56:32.798269+00', '2021-04-12 20:56:32.798269+00', 'id', 'type/Text', 'type/PK', true, NULL, true, 0, 38, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (105, '2021-04-12 20:56:32.812613+00', '2021-04-12 20:56:32.812613+00', 'model', 'type/Text', NULL, true, NULL, true, 1, 42, NULL, 'Model', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (106, '2021-04-12 20:56:32.81385+00', '2021-04-12 20:56:32.81385+00', 'dependent_on_id', 'type/Integer', NULL, true, NULL, true, 4, 42, NULL, 'Dependent On ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (107, '2021-04-12 20:56:32.815524+00', '2021-04-12 20:56:32.815524+00', 'model_id', 'type/Integer', NULL, true, NULL, true, 2, 42, NULL, 'Model ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (108, '2021-04-12 20:56:32.819094+00', '2021-04-12 20:56:32.819094+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 42, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (109, '2021-04-12 20:56:32.821018+00', '2021-04-12 20:56:32.821018+00', 'dependent_on_model', 'type/Text', NULL, true, NULL, true, 3, 42, NULL, 'Dependent On Model', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (110, '2021-04-12 20:56:32.823913+00', '2021-04-12 20:56:32.823913+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 5, 42, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (111, '2021-04-12 20:56:32.836454+00', '2021-04-12 20:56:32.836454+00', 'type', 'type/Text', NULL, true, 'Either internal for a user defined remapping or external for a foreign key based remapping', true, 3, 43, NULL, 'Type', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (112, '2021-04-12 20:56:32.83762+00', '2021-04-12 20:56:32.83762+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 43, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (113, '2021-04-12 20:56:32.841095+00', '2021-04-12 20:56:32.841095+00', 'name', 'type/Text', NULL, true, 'Short description used as the display name of this new column', true, 2, 43, NULL, 'Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (116, '2021-04-12 20:56:32.84784+00', '2021-04-12 20:56:32.84784+00', 'updated_at', 'type/DateTime', NULL, true, 'The timestamp of when these dimension was last updated.', true, 6, 43, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamp', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (117, '2021-04-12 20:56:32.851284+00', '2021-04-12 20:56:32.851284+00', 'created_at', 'type/DateTime', NULL, true, 'The timestamp of when the dimension was created.', true, 5, 43, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamp', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (120, '2021-04-12 20:56:32.868741+00', '2021-04-12 20:56:32.868741+00', 'attribute_remappings', 'type/Text', NULL, true, 'JSON-encoded map of user attribute identifier to the param name used in the Card.', true, 4, 9, NULL, 'Attribute Re Mappings', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (121, '2021-04-12 20:56:32.870482+00', '2021-04-12 20:56:32.870482+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 9, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (123, '2021-04-12 20:56:32.885173+00', '2021-04-12 20:56:32.885173+00', 'slug', 'type/Text', NULL, true, NULL, true, 2, 53, NULL, 'Slug', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (124, '2021-04-12 20:56:32.886338+00', '2021-04-12 20:56:32.886338+00', 'name', 'type/Text', NULL, true, NULL, true, 1, 53, NULL, 'Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (125, '2021-04-12 20:56:32.889799+00', '2021-04-12 20:56:32.889799+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 53, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (126, '2021-04-12 20:56:32.89164+00', '2021-04-12 20:56:32.89164+00', 'icon', 'type/Text', NULL, true, NULL, true, 3, 53, NULL, 'Icon', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (98, '2021-04-12 20:56:32.76804+00', '2021-04-12 20:56:35.161832+00', 'card_id', 'type/Integer', 'type/FK', true, NULL, true, 2, 17, NULL, 'Card ID', 'normal', 366, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (101, '2021-04-12 20:56:32.783508+00', '2021-04-12 20:56:35.181113+00', 'user_id', 'type/Integer', 'type/FK', true, 'ID of the User who favorited the Dashboard.', true, 1, 6, NULL, 'User ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (115, '2021-04-12 20:56:32.846058+00', '2021-04-12 20:56:35.226941+00', 'human_readable_field_id', 'type/Integer', 'type/FK', true, 'Only used with external type remappings. Indicates which field on the FK related table to use for display', true, 4, 43, NULL, 'Human Readable Field ID', 'normal', 162, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (114, '2021-04-12 20:56:32.842783+00', '2021-04-12 20:56:35.233515+00', 'field_id', 'type/Integer', 'type/FK', true, 'ID of the field this dimension row applies to', true, 1, 43, NULL, 'Field ID', 'normal', 162, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (118, '2021-04-12 20:56:32.864046+00', '2021-04-12 20:56:35.251827+00', 'group_id', 'type/Integer', 'type/FK', true, 'ID of the Permissions Group this policy affects.', true, 1, 9, NULL, 'Group ID', 'normal', 221, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (119, '2021-04-12 20:56:32.865202+00', '2021-04-12 20:56:35.267842+00', 'card_id', 'type/Integer', 'type/FK', true, 'ID of the Card (Question) to be used to replace the Table.', true, 3, 9, NULL, 'Card ID', 'normal', 366, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (122, '2021-04-12 20:56:32.873911+00', '2021-04-12 20:56:35.283099+00', 'table_id', 'type/Integer', 'type/FK', true, 'ID of the Table that should get automatically replaced as query source for the Permissions Group.', true, 2, 9, NULL, 'Table ID', 'normal', 184, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (128, '2021-04-12 20:56:32.910253+00', '2021-04-12 20:56:44.323817+00', 'caveats', 'type/Text', NULL, true, NULL, true, 10, 22, NULL, 'Caveats', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (79, '2021-04-12 20:56:32.675512+00', '2021-04-12 20:56:44.228355+00', 'is_active', 'type/Boolean', 'type/Category', true, NULL, true, 9, 27, NULL, 'Is Active', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (133, '2021-04-12 20:56:32.922336+00', '2021-04-12 20:56:32.922336+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 22, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (162, '2021-04-12 20:56:33.036786+00', '2021-04-12 20:56:33.036786+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 29, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (173, '2021-04-12 20:56:33.107889+00', '2021-04-12 20:56:33.107889+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 47, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (132, '2021-04-12 20:56:32.920702+00', '2021-04-12 20:56:44.332987+00', 'name', 'type/Text', 'type/Name', true, NULL, true, 3, 22, NULL, 'Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":14.5}}}', 5, 'varchar', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (184, '2021-04-12 20:56:33.154805+00', '2021-04-12 20:56:33.154805+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 48, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (192, '2021-04-12 20:56:33.193542+00', '2021-04-12 20:56:33.193542+00', 'caveats', 'type/Text', NULL, true, NULL, true, 10, 46, NULL, 'Caveats', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (193, '2021-04-12 20:56:33.195019+00', '2021-04-12 20:56:33.195019+00', 'how_is_this_calculated', 'type/Text', NULL, true, NULL, true, 11, 46, NULL, 'How Is This Calculated', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (195, '2021-04-12 20:56:33.203157+00', '2021-04-12 20:56:33.203157+00', 'name', 'type/Text', NULL, true, NULL, true, 3, 46, NULL, 'Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (197, '2021-04-12 20:56:33.21209+00', '2021-04-12 20:56:33.21209+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 46, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (198, '2021-04-12 20:56:33.214214+00', '2021-04-12 20:56:33.214214+00', 'show_in_getting_started', 'type/Boolean', NULL, true, NULL, true, 12, 46, NULL, 'Show In Getting Started', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (199, '2021-04-12 20:56:33.217651+00', '2021-04-12 20:56:33.217651+00', 'archived', 'type/Boolean', NULL, true, NULL, true, 5, 46, NULL, 'Archived', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (200, '2021-04-12 20:56:33.22201+00', '2021-04-12 20:56:33.22201+00', 'points_of_interest', 'type/Text', NULL, true, NULL, true, 9, 46, NULL, 'Points Of Interest', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (201, '2021-04-12 20:56:33.224013+00', '2021-04-12 20:56:33.224013+00', 'updated_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 8, 46, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (202, '2021-04-12 20:56:33.22727+00', '2021-04-12 20:56:33.22727+00', 'definition', 'type/Text', NULL, true, NULL, true, 6, 46, NULL, 'Definition', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (203, '2021-04-12 20:56:33.231552+00', '2021-04-12 20:56:33.231552+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 7, 46, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (204, '2021-04-12 20:56:33.233319+00', '2021-04-12 20:56:33.233319+00', 'description', 'type/Text', NULL, true, NULL, true, 4, 46, NULL, 'Description', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (206, '2021-04-12 20:56:33.251789+00', '2021-04-12 20:56:33.251789+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 50, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (209, '2021-04-12 20:56:33.270464+00', '2021-04-12 20:56:33.270464+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 6, 34, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (211, '2021-04-12 20:56:33.276087+00', '2021-04-12 20:56:33.276087+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 34, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (212, '2021-04-12 20:56:33.28072+00', '2021-04-12 20:56:33.28072+00', 'updated_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 7, 34, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (213, '2021-04-12 20:56:33.285215+00', '2021-04-12 20:56:33.285215+00', 'archived', 'type/Boolean', NULL, true, NULL, true, 5, 34, NULL, 'Archived', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (214, '2021-04-12 20:56:33.287259+00', '2021-04-12 20:56:33.287259+00', 'description', 'type/Text', NULL, true, NULL, true, 2, 34, NULL, 'Description', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (215, '2021-04-12 20:56:33.290624+00', '2021-04-12 20:56:33.290624+00', 'name', 'type/Text', NULL, true, 'Name of the query snippet', true, 1, 34, NULL, 'Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (216, '2021-04-12 20:56:33.292685+00', '2021-04-12 20:56:33.292685+00', 'content', 'type/Text', NULL, true, 'Raw query snippet', true, 3, 34, NULL, 'Content', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (219, '2021-04-12 20:56:33.310994+00', '2021-04-12 20:56:33.310994+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 44, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (221, '2021-04-12 20:56:33.324486+00', '2021-04-12 20:56:33.324486+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 25, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (223, '2021-04-12 20:56:33.337198+00', '2021-04-12 20:56:33.337198+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 45, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (226, '2021-04-12 20:56:33.357271+00', '2021-04-12 20:56:33.357271+00', 'alert_first_only', 'type/Boolean', NULL, true, 'True if the alert should be disabled after the first notification', true, 7, 7, NULL, 'Alert First Only', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (227, '2021-04-12 20:56:33.36075+00', '2021-04-12 20:56:33.36075+00', 'alert_condition', 'type/Text', NULL, true, 'Condition (i.e. "rows" or "goal") used as a guard for alerts', true, 6, 7, NULL, 'Alert Condition', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (228, '2021-04-12 20:56:33.362603+00', '2021-04-12 20:56:33.362603+00', 'collection_position', 'type/Integer', NULL, true, 'Optional pinned position for this item in its Collection. NULL means item is not pinned.', true, 10, 7, NULL, 'Collection Position', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int2', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (229, '2021-04-12 20:56:33.36608+00', '2021-04-12 20:56:33.36608+00', 'alert_above_goal', 'type/Boolean', NULL, true, 'For a goal condition, alert when above the goal', true, 8, 7, NULL, 'Alert Above Goal', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (230, '2021-04-12 20:56:33.37132+00', '2021-04-12 20:56:33.37132+00', 'name', 'type/Text', NULL, true, NULL, true, 2, 7, NULL, 'Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (232, '2021-04-12 20:56:33.380781+00', '2021-04-12 20:56:33.380781+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 7, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (196, '2021-04-12 20:56:33.207618+00', '2021-04-12 20:56:35.446133+00', 'table_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 46, NULL, 'Table ID', 'normal', 184, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (207, '2021-04-12 20:56:33.253474+00', '2021-04-12 20:56:35.472008+00', 'metric_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 50, NULL, 'Metric ID', 'normal', 197, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (205, '2021-04-12 20:56:33.250646+00', '2021-04-12 20:56:35.479674+00', 'field_id', 'type/Integer', 'type/FK', true, NULL, true, 2, 50, NULL, 'Field ID', 'normal', 162, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (210, '2021-04-12 20:56:33.272301+00', '2021-04-12 20:56:35.504916+00', 'creator_id', 'type/Integer', 'type/FK', true, NULL, true, 4, 34, NULL, 'Creator ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (225, '2021-04-12 20:56:33.355924+00', '2021-04-12 20:56:35.593612+00', 'dashboard_id', 'type/Integer', 'type/FK', true, 'ID of the Dashboard if this Pulse is a Dashboard Subscription.', true, 12, 7, NULL, 'Dashboard ID', 'normal', 390, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (233, '2021-04-12 20:56:33.386839+00', '2021-04-12 20:56:35.604215+00', 'collection_id', 'type/Integer', 'type/FK', true, 'Options ID of Collection this Pulse belongs to.', true, 9, 7, NULL, 'Collection ID', 'normal', 55, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (231, '2021-04-12 20:56:33.37627+00', '2021-04-12 20:56:35.611765+00', 'creator_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 7, NULL, 'Creator ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (218, '2021-04-12 20:56:33.308933+00', '2021-04-12 20:56:37.705594+00', 'group_id', 'type/Integer', 'type/FK', true, NULL, true, 2, 44, NULL, 'Group ID', 'normal', 221, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":3,"nil%":0.0}}', 5, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (222, '2021-04-12 20:56:33.336133+00', '2021-04-12 20:56:37.74384+00', 'group_id', 'type/Integer', 'type/FK', true, NULL, true, 2, 45, NULL, 'Group ID', 'normal', 221, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0}}', 5, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (234, '2021-04-12 20:56:33.390744+00', '2021-04-12 20:56:33.390744+00', 'archived', 'type/Boolean', NULL, true, 'Has this pulse been archived?', true, 11, 7, NULL, 'Archived', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (235, '2021-04-12 20:56:33.395351+00', '2021-04-12 20:56:33.395351+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 3, 7, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (236, '2021-04-12 20:56:33.400086+00', '2021-04-12 20:56:33.400086+00', 'updated_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 4, 7, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (237, '2021-04-12 20:56:33.403911+00', '2021-04-12 20:56:33.403911+00', 'skip_if_empty', 'type/Boolean', NULL, true, 'Skip a scheduled Pulse if none of its questions have any results', true, 5, 7, NULL, 'Skip If Empty', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (238, '2021-04-12 20:56:33.445036+00', '2021-04-12 20:56:33.445036+00', 'include_csv', 'type/Boolean', NULL, true, 'True if a CSV of the data should be included for this pulse card', true, 4, 35, NULL, 'Include Csv', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (240, '2021-04-12 20:56:33.448508+00', '2021-04-12 20:56:33.448508+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 35, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (243, '2021-04-12 20:56:33.457163+00', '2021-04-12 20:56:33.457163+00', 'include_xls', 'type/Boolean', NULL, true, 'True if a XLS of the data should be included for this pulse card', true, 5, 35, NULL, 'Include Xls', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (244, '2021-04-12 20:56:33.45936+00', '2021-04-12 20:56:33.45936+00', 'position', 'type/Integer', NULL, true, NULL, true, 3, 35, NULL, 'Position', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (245, '2021-04-12 20:56:33.479009+00', '2021-04-12 20:56:33.479009+00', 'schedule_frame', 'type/Text', NULL, true, NULL, true, 9, 12, NULL, 'Schedule Frame', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (246, '2021-04-12 20:56:33.48056+00', '2021-04-12 20:56:33.48056+00', 'schedule_day', 'type/Text', NULL, true, NULL, true, 6, 12, NULL, 'Schedule Day', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (248, '2021-04-12 20:56:33.490112+00', '2021-04-12 20:56:33.490112+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 12, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (249, '2021-04-12 20:56:33.494852+00', '2021-04-12 20:56:33.494852+00', 'details', 'type/Text', NULL, true, NULL, true, 3, 12, NULL, 'Details', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (250, '2021-04-12 20:56:33.499541+00', '2021-04-12 20:56:33.499541+00', 'enabled', 'type/Boolean', NULL, true, NULL, true, 10, 12, NULL, 'Enabled', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (251, '2021-04-12 20:56:33.504329+00', '2021-04-12 20:56:33.504329+00', 'schedule_type', 'type/Text', NULL, true, NULL, true, 4, 12, NULL, 'Schedule Type', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (252, '2021-04-12 20:56:33.509118+00', '2021-04-12 20:56:33.509118+00', 'channel_type', 'type/Text', NULL, true, NULL, true, 2, 12, NULL, 'Channel Type', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (253, '2021-04-12 20:56:33.513444+00', '2021-04-12 20:56:33.513444+00', 'schedule_hour', 'type/Integer', NULL, true, NULL, true, 5, 12, NULL, 'Schedule Hour', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (254, '2021-04-12 20:56:33.518581+00', '2021-04-12 20:56:33.518581+00', 'updated_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 8, 12, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (255, '2021-04-12 20:56:33.523171+00', '2021-04-12 20:56:33.523171+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 7, 12, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (257, '2021-04-12 20:56:33.56517+00', '2021-04-12 20:56:33.56517+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 21, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (261, '2021-04-12 20:56:33.601607+00', '2021-04-12 20:56:33.601607+00', 'blob_data', 'type/*', NULL, true, NULL, true, 3, 32, NULL, 'Blob Data', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bytea', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (263, '2021-04-12 20:56:33.631464+00', '2021-04-12 20:56:33.631464+00', 'calendar_name', 'type/Text', 'type/PK', true, NULL, true, 1, 23, NULL, 'Calendar Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (264, '2021-04-12 20:56:33.633549+00', '2021-04-12 20:56:33.633549+00', 'sched_name', 'type/Text', 'type/PK', true, NULL, true, 0, 23, NULL, 'Sched Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (265, '2021-04-12 20:56:33.638562+00', '2021-04-12 20:56:33.638562+00', 'calendar', 'type/*', NULL, true, NULL, true, 2, 23, NULL, 'Calendar', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bytea', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (271, '2021-04-12 20:56:33.686949+00', '2021-04-12 20:56:33.686949+00', 'is_nonconcurrent', 'type/Boolean', NULL, true, NULL, true, 11, 28, NULL, 'Is Non Concurrent', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (272, '2021-04-12 20:56:33.688251+00', '2021-04-12 20:56:33.688251+00', 'fired_time', 'type/BigInteger', NULL, true, NULL, true, 5, 28, NULL, 'Fired Time', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int8', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (273, '2021-04-12 20:56:33.690134+00', '2021-04-12 20:56:33.690134+00', 'sched_name', 'type/Text', 'type/PK', true, NULL, true, 0, 28, NULL, 'Sched Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (274, '2021-04-12 20:56:33.694057+00', '2021-04-12 20:56:33.694057+00', 'instance_name', 'type/Text', NULL, true, NULL, true, 4, 28, NULL, 'Instance Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (275, '2021-04-12 20:56:33.698551+00', '2021-04-12 20:56:33.698551+00', 'priority', 'type/Integer', NULL, true, NULL, true, 7, 28, NULL, 'Priority', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (276, '2021-04-12 20:56:33.700319+00', '2021-04-12 20:56:33.700319+00', 'entry_id', 'type/Text', 'type/PK', true, NULL, true, 1, 28, NULL, 'Entry ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (277, '2021-04-12 20:56:33.703935+00', '2021-04-12 20:56:33.703935+00', 'job_name', 'type/Text', NULL, true, NULL, true, 9, 28, NULL, 'Job Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (278, '2021-04-12 20:56:33.705658+00', '2021-04-12 20:56:33.705658+00', 'job_group', 'type/Text', NULL, true, NULL, true, 10, 28, NULL, 'Job Group', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (279, '2021-04-12 20:56:33.709711+00', '2021-04-12 20:56:33.709711+00', 'trigger_name', 'type/Text', NULL, true, NULL, true, 2, 28, NULL, 'Trigger Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (280, '2021-04-12 20:56:33.711882+00', '2021-04-12 20:56:33.711882+00', 'state', 'type/Text', NULL, true, NULL, true, 8, 28, NULL, 'State', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (281, '2021-04-12 20:56:33.716134+00', '2021-04-12 20:56:33.716134+00', 'trigger_group', 'type/Text', NULL, true, NULL, true, 3, 28, NULL, 'Trigger Group', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (282, '2021-04-12 20:56:33.71971+00', '2021-04-12 20:56:33.71971+00', 'requests_recovery', 'type/Boolean', NULL, true, NULL, true, 12, 28, NULL, 'Requests Recovery', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (283, '2021-04-12 20:56:33.72179+00', '2021-04-12 20:56:33.72179+00', 'sched_time', 'type/BigInteger', NULL, true, NULL, true, 6, 28, NULL, 'Sched Time', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int8', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (284, '2021-04-12 20:56:33.763368+00', '2021-04-12 20:56:33.763368+00', 'job_name', 'type/Text', 'type/PK', true, NULL, true, 1, 52, NULL, 'Job Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (285, '2021-04-12 20:56:33.764697+00', '2021-04-12 20:56:33.764697+00', 'sched_name', 'type/Text', 'type/PK', true, NULL, true, 0, 52, NULL, 'Sched Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (239, '2021-04-12 20:56:33.446429+00', '2021-04-12 20:56:35.676663+00', 'pulse_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 35, NULL, 'Pulse ID', 'normal', 232, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (247, '2021-04-12 20:56:33.485043+00', '2021-04-12 20:56:35.726251+00', 'pulse_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 12, NULL, 'Pulse ID', 'normal', 232, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (258, '2021-04-12 20:56:33.569604+00', '2021-04-12 20:56:35.75116+00', 'user_id', 'type/Integer', 'type/FK', true, NULL, true, 2, 21, NULL, 'User ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (256, '2021-04-12 20:56:33.563275+00', '2021-04-12 20:56:35.76392+00', 'pulse_channel_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 21, NULL, 'Pulse Channel ID', 'normal', 248, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (262, '2021-04-12 20:56:33.605722+00', '2021-04-12 20:56:35.790019+00', 'trigger_group', 'type/Text', 'type/FK', true, NULL, true, 2, 32, NULL, 'Trigger Group', 'normal', 336, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (259, '2021-04-12 20:56:33.594408+00', '2021-04-12 20:56:35.800238+00', 'sched_name', 'type/Text', 'type/FK', true, NULL, true, 0, 32, NULL, 'Sched Name', 'normal', 327, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (260, '2021-04-12 20:56:33.597732+00', '2021-04-12 20:56:35.809278+00', 'trigger_name', 'type/Text', 'type/FK', true, NULL, true, 1, 32, NULL, 'Trigger Name', 'normal', 330, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (267, '2021-04-12 20:56:33.655937+00', '2021-04-12 20:56:37.922287+00', 'sched_name', 'type/Text', 'type/FK', true, NULL, true, 0, 37, NULL, 'Sched Name', 'normal', 327, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (269, '2021-04-12 20:56:33.662358+00', '2021-04-12 20:56:37.931874+00', 'trigger_name', 'type/Text', 'type/FK', true, NULL, true, 1, 37, NULL, 'Trigger Name', 'normal', 330, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":10,"nil%":0.0}}', 5, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (292, '2021-04-12 20:56:33.786146+00', '2021-04-12 20:56:33.786146+00', 'job_group', 'type/Text', 'type/PK', true, NULL, true, 2, 52, NULL, 'Job Group', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (294, '2021-04-12 20:56:33.804873+00', '2021-04-12 20:56:33.804873+00', 'sched_name', 'type/Text', 'type/PK', true, NULL, true, 0, 40, NULL, 'Sched Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (295, '2021-04-12 20:56:33.806049+00', '2021-04-12 20:56:33.806049+00', 'lock_name', 'type/Text', 'type/PK', true, NULL, true, 1, 40, NULL, 'Lock Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (296, '2021-04-12 20:56:33.817017+00', '2021-04-12 20:56:33.817017+00', 'sched_name', 'type/Text', 'type/PK', true, NULL, true, 0, 15, NULL, 'Sched Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (297, '2021-04-12 20:56:33.818163+00', '2021-04-12 20:56:33.818163+00', 'trigger_group', 'type/Text', 'type/PK', true, NULL, true, 1, 15, NULL, 'Trigger Group', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (300, '2021-04-12 20:56:33.834081+00', '2021-04-12 20:56:33.834081+00', 'sched_name', 'type/Text', 'type/PK', true, NULL, true, 0, 16, NULL, 'Sched Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (301, '2021-04-12 20:56:33.83787+00', '2021-04-12 20:56:33.83787+00', 'instance_name', 'type/Text', 'type/PK', true, NULL, true, 1, 16, NULL, 'Instance Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (304, '2021-04-12 20:56:33.856409+00', '2021-04-12 20:56:33.856409+00', 'times_triggered', 'type/BigInteger', NULL, true, NULL, true, 5, 8, NULL, 'Times Triggered', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int8', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (305, '2021-04-12 20:56:33.858554+00', '2021-04-12 20:56:33.858554+00', 'repeat_interval', 'type/BigInteger', NULL, true, NULL, true, 4, 8, NULL, 'Repeat Interval', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int8', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (307, '2021-04-12 20:56:33.864439+00', '2021-04-12 20:56:33.864439+00', 'repeat_count', 'type/BigInteger', NULL, true, NULL, true, 3, 8, NULL, 'Repeat Count', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int8', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (308, '2021-04-12 20:56:33.882283+00', '2021-04-12 20:56:33.882283+00', 'str_prop_2', 'type/Text', NULL, true, NULL, true, 4, 60, NULL, 'Str Prop 2', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (309, '2021-04-12 20:56:33.883511+00', '2021-04-12 20:56:33.883511+00', 'int_prop_1', 'type/Integer', NULL, true, NULL, true, 6, 60, NULL, 'Int Prop 1', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (310, '2021-04-12 20:56:33.885714+00', '2021-04-12 20:56:33.885714+00', 'bool_prop_1', 'type/Boolean', NULL, true, NULL, true, 12, 60, NULL, 'Bo Ol Prop 1', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (312, '2021-04-12 20:56:33.892319+00', '2021-04-12 20:56:33.892319+00', 'dec_prop_2', 'type/Decimal', NULL, true, NULL, true, 11, 60, NULL, 'Dec Prop 2', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'numeric', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (313, '2021-04-12 20:56:33.897202+00', '2021-04-12 20:56:33.897202+00', 'dec_prop_1', 'type/Decimal', NULL, true, NULL, true, 10, 60, NULL, 'Dec Prop 1', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'numeric', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (314, '2021-04-12 20:56:33.901295+00', '2021-04-12 20:56:33.901295+00', 'bool_prop_2', 'type/Boolean', NULL, true, NULL, true, 13, 60, NULL, 'Bo Ol Prop 2', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 13, 0);
INSERT INTO public.metabase_field VALUES (316, '2021-04-12 20:56:33.907758+00', '2021-04-12 20:56:33.907758+00', 'str_prop_1', 'type/Text', NULL, true, NULL, true, 3, 60, NULL, 'Str Prop 1', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (317, '2021-04-12 20:56:33.910991+00', '2021-04-12 20:56:33.910991+00', 'long_prop_1', 'type/BigInteger', NULL, true, NULL, true, 8, 60, NULL, 'Long Prop 1', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int8', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (318, '2021-04-12 20:56:33.916017+00', '2021-04-12 20:56:33.916017+00', 'str_prop_3', 'type/Text', NULL, true, NULL, true, 5, 60, NULL, 'Str Prop 3', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (320, '2021-04-12 20:56:33.924393+00', '2021-04-12 20:56:33.924393+00', 'long_prop_2', 'type/BigInteger', NULL, true, NULL, true, 9, 60, NULL, 'Long Prop 2', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int8', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (321, '2021-04-12 20:56:33.929427+00', '2021-04-12 20:56:33.929427+00', 'int_prop_2', 'type/Integer', NULL, true, NULL, true, 7, 60, NULL, 'Int Prop 2', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (330, '2021-04-12 20:56:33.968279+00', '2021-04-12 20:56:33.968279+00', 'trigger_name', 'type/Text', 'type/PK', true, NULL, true, 1, 41, NULL, 'Trigger Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (336, '2021-04-12 20:56:33.980047+00', '2021-04-12 20:56:33.980047+00', 'trigger_group', 'type/Text', 'type/PK', true, NULL, true, 2, 41, NULL, 'Trigger Group', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (338, '2021-04-12 20:56:33.999982+00', '2021-04-12 20:56:33.999982+00', 'query', 'type/Text', NULL, true, 'The actual "query dictionary" for this query.', true, 2, 58, NULL, 'Query', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (339, '2021-04-12 20:56:34.001057+00', '2021-04-12 20:56:34.001057+00', 'average_execution_time', 'type/Integer', NULL, true, 'Average execution time for the query, round to nearest number of milliseconds. This is updated as a rolling average.', true, 1, 58, NULL, 'Average Execution Time', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (340, '2021-04-12 20:56:34.002665+00', '2021-04-12 20:56:34.002665+00', 'query_hash', 'type/*', 'type/PK', true, 'The hash of the query dictionary. (This is a 256-bit SHA3 hash of the query dict.)', true, 0, 58, NULL, 'Query Hash', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bytea', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (341, '2021-04-12 20:56:34.018643+00', '2021-04-12 20:56:34.018643+00', 'pulse_id', 'type/Integer', NULL, true, 'The ID of the Pulse associated with this query execution, if any.', true, 11, 11, NULL, 'Pulse ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (342, '2021-04-12 20:56:34.019931+00', '2021-04-12 20:56:34.019931+00', 'hash', 'type/*', NULL, true, 'The hash of the query dictionary. This is a 256-bit SHA3 hash of the query.', true, 1, 11, NULL, 'Hash', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bytea', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (343, '2021-04-12 20:56:34.02167+00', '2021-04-12 20:56:34.02167+00', 'running_time', 'type/Integer', NULL, true, 'The time, in milliseconds, this query took to complete.', true, 3, 11, NULL, 'Running Time', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (302, '2021-04-12 20:56:33.851426+00', '2021-04-12 20:56:35.990218+00', 'sched_name', 'type/Text', 'type/FK', true, NULL, true, 0, 8, NULL, 'Sched Name', 'normal', 327, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (319, '2021-04-12 20:56:33.921614+00', '2021-04-12 20:56:36.02373+00', 'trigger_group', 'type/Text', 'type/FK', true, NULL, true, 2, 60, NULL, 'Trigger Group', 'normal', 336, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (311, '2021-04-12 20:56:33.889578+00', '2021-04-12 20:56:36.032087+00', 'sched_name', 'type/Text', 'type/FK', true, NULL, true, 0, 60, NULL, 'Sched Name', 'normal', 327, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (315, '2021-04-12 20:56:33.903853+00', '2021-04-12 20:56:36.041321+00', 'trigger_name', 'type/Text', 'type/FK', true, NULL, true, 1, 60, NULL, 'Trigger Name', 'normal', 330, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (324, '2021-04-12 20:56:33.956258+00', '2021-04-12 20:56:38.280675+00', 'job_group', 'type/Text', 'type/FK', true, NULL, true, 4, 41, NULL, 'Job Group', 'normal', 292, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'varchar', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (327, '2021-04-12 20:56:33.961434+00', '2021-04-12 20:56:38.295087+00', 'sched_name', 'type/Text', 'type/FK', true, NULL, true, 0, 41, NULL, 'Sched Name', 'normal', 285, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (344, '2021-04-12 20:56:34.025609+00', '2021-04-12 20:56:34.025609+00', 'native', 'type/Boolean', NULL, true, 'Whether the query was a native query, as opposed to an MBQL one (e.g., created with the GUI).', true, 5, 11, NULL, 'Native', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (345, '2021-04-12 20:56:34.027679+00', '2021-04-12 20:56:34.027679+00', 'error', 'type/Text', NULL, true, 'Error message returned by failed query, if any.', true, 7, 11, NULL, 'Error', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (346, '2021-04-12 20:56:34.031497+00', '2021-04-12 20:56:34.031497+00', 'executor_id', 'type/Integer', NULL, true, 'The ID of the User who triggered this query execution, if any.', true, 8, 11, NULL, 'Executor ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (347, '2021-04-12 20:56:34.033389+00', '2021-04-12 20:56:34.033389+00', 'started_at', 'type/DateTimeWithLocalTZ', NULL, true, 'Timestamp of when this query started running.', true, 2, 11, NULL, 'Started At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (348, '2021-04-12 20:56:34.037305+00', '2021-04-12 20:56:34.037305+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 11, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (349, '2021-04-12 20:56:34.03923+00', '2021-04-12 20:56:34.03923+00', 'context', 'type/Text', NULL, true, 'Short string specifying how this query was executed, e.g. in a Dashboard or Pulse.', true, 6, 11, NULL, 'Context', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (350, '2021-04-12 20:56:34.043207+00', '2021-04-12 20:56:34.043207+00', 'card_id', 'type/Integer', NULL, true, 'The ID of the Card (Question) associated with this query execution, if any.', true, 9, 11, NULL, 'Card ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (351, '2021-04-12 20:56:34.04545+00', '2021-04-12 20:56:34.04545+00', 'dashboard_id', 'type/Integer', NULL, true, 'The ID of the Dashboard associated with this query execution, if any.', true, 10, 11, NULL, 'Dashboard ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (352, '2021-04-12 20:56:34.048786+00', '2021-04-12 20:56:34.048786+00', 'database_id', 'type/Integer', NULL, true, 'ID of the database this query was ran against.', true, 12, 11, NULL, 'Database ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (353, '2021-04-12 20:56:34.051181+00', '2021-04-12 20:56:34.051181+00', 'result_rows', 'type/Integer', NULL, true, 'Number of rows in the query results.', true, 4, 11, NULL, 'Result Rows', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (356, '2021-04-12 20:56:34.075306+00', '2021-04-12 20:56:34.075306+00', 'result_metadata', 'type/Text', NULL, true, 'Serialized JSON containing metadata about the result columns from running the query.', true, 19, 30, NULL, 'Result Metadata', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 19, 0);
INSERT INTO public.metabase_field VALUES (357, '2021-04-12 20:56:34.079254+00', '2021-04-12 20:56:34.079254+00', 'archived', 'type/Boolean', NULL, true, NULL, true, 12, 30, NULL, 'Archived', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (358, '2021-04-12 20:56:34.081315+00', '2021-04-12 20:56:34.081315+00', 'enable_embedding', 'type/Boolean', NULL, true, 'Is this Card allowed to be embedded in different websites (using a signed JWT)?', true, 16, 30, NULL, 'Enable Embedding', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 16, 0);
INSERT INTO public.metabase_field VALUES (359, '2021-04-12 20:56:34.085213+00', '2021-04-12 20:56:34.085213+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 1, 30, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (360, '2021-04-12 20:56:34.087483+00', '2021-04-12 20:56:34.087483+00', 'public_uuid', 'type/Text', NULL, true, 'Unique UUID used to in publically-accessible links to this Card.', true, 14, 30, NULL, 'Public UUID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bpchar', NULL, NULL, 14, 0);
INSERT INTO public.metabase_field VALUES (361, '2021-04-12 20:56:34.091563+00', '2021-04-12 20:56:34.091563+00', 'name', 'type/Text', NULL, true, NULL, true, 3, 30, NULL, 'Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (364, '2021-04-12 20:56:34.100194+00', '2021-04-12 20:56:34.100194+00', 'collection_position', 'type/Integer', NULL, true, 'Optional pinned position for this item in its Collection. NULL means item is not pinned.', true, 20, 30, NULL, 'Collection Position', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int2', NULL, NULL, 20, 0);
INSERT INTO public.metabase_field VALUES (365, '2021-04-12 20:56:34.104237+00', '2021-04-12 20:56:34.104237+00', 'visualization_settings', 'type/Text', NULL, true, NULL, true, 7, 30, NULL, 'Visualization Settings', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (366, '2021-04-12 20:56:34.1066+00', '2021-04-12 20:56:34.1066+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 30, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (368, '2021-04-12 20:56:34.112344+00', '2021-04-12 20:56:34.112344+00', 'cache_ttl', 'type/Integer', NULL, true, 'The maximum time, in seconds, to return cached results for this Card rather than running a new query.', true, 18, 30, NULL, 'Cache Ttl', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 18, 0);
INSERT INTO public.metabase_field VALUES (369, '2021-04-12 20:56:34.115573+00', '2021-04-12 20:56:34.115573+00', 'updated_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 2, 30, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (370, '2021-04-12 20:56:34.117388+00', '2021-04-12 20:56:34.117388+00', 'display', 'type/Text', NULL, true, NULL, true, 5, 30, NULL, 'Display', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (371, '2021-04-12 20:56:34.121198+00', '2021-04-12 20:56:34.121198+00', 'query_type', 'type/Text', NULL, true, NULL, true, 11, 30, NULL, 'Query Type', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (372, '2021-04-12 20:56:34.123104+00', '2021-04-12 20:56:34.123104+00', 'embedding_params', 'type/Text', NULL, true, 'Serialized JSON containing information about required parameters that must be supplied when embedding this Card.', true, 17, 30, NULL, 'Embedding Params', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 17, 0);
INSERT INTO public.metabase_field VALUES (373, '2021-04-12 20:56:34.126874+00', '2021-04-12 20:56:34.126874+00', 'dataset_query', 'type/Text', NULL, true, NULL, true, 6, 30, NULL, 'Data Set Query', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (374, '2021-04-12 20:56:34.129209+00', '2021-04-12 20:56:34.129209+00', 'description', 'type/Text', NULL, true, NULL, true, 4, 30, NULL, 'Description', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (375, '2021-04-12 20:56:34.151791+00', '2021-04-12 20:56:34.151791+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 1, 24, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (377, '2021-04-12 20:56:34.156622+00', '2021-04-12 20:56:34.156622+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 24, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (378, '2021-04-12 20:56:34.158815+00', '2021-04-12 20:56:34.158815+00', 'updated_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 2, 24, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (380, '2021-04-12 20:56:34.178928+00', '2021-04-12 20:56:34.178928+00', 'enable_embedding', 'type/Boolean', NULL, true, 'Is this Dashboard allowed to be embedded in different websites (using a signed JWT)?', true, 12, 19, NULL, 'Enable Embedding', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (381, '2021-04-12 20:56:34.180288+00', '2021-04-12 20:56:34.180288+00', 'parameters', 'type/Text', NULL, true, NULL, true, 6, 19, NULL, 'Parameters', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (382, '2021-04-12 20:56:34.18405+00', '2021-04-12 20:56:34.18405+00', 'public_uuid', 'type/Text', NULL, true, 'Unique UUID used to in publically-accessible links to this Dashboard.', true, 10, 19, NULL, 'Public UUID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bpchar', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (383, '2021-04-12 20:56:34.188845+00', '2021-04-12 20:56:34.188845+00', 'points_of_interest', 'type/Text', NULL, true, NULL, true, 7, 19, NULL, 'Points Of Interest', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (385, '2021-04-12 20:56:34.192551+00', '2021-04-12 20:56:34.192551+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 1, 19, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (387, '2021-04-12 20:56:34.19799+00', '2021-04-12 20:56:34.19799+00', 'name', 'type/Text', NULL, true, NULL, true, 3, 19, NULL, 'Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (388, '2021-04-12 20:56:34.201349+00', '2021-04-12 20:56:34.201349+00', 'collection_position', 'type/Integer', NULL, true, 'Optional pinned position for this item in its Collection. NULL means item is not pinned.', true, 17, 19, NULL, 'Collection Position', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int2', NULL, NULL, 17, 0);
INSERT INTO public.metabase_field VALUES (389, '2021-04-12 20:56:34.20356+00', '2021-04-12 20:56:34.20356+00', 'show_in_getting_started', 'type/Boolean', NULL, true, NULL, true, 9, 19, NULL, 'Show In Getting Started', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (390, '2021-04-12 20:56:34.206862+00', '2021-04-12 20:56:34.206862+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 19, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (355, '2021-04-12 20:56:34.073391+00', '2021-04-12 20:56:36.127389+00', 'database_id', 'type/Integer', 'type/FK', true, NULL, true, 9, 30, NULL, 'Database ID', 'normal', 133, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (354, '2021-04-12 20:56:34.072242+00', '2021-04-12 20:56:36.13346+00', 'collection_id', 'type/Integer', 'type/FK', true, 'Optional ID of Collection this Card belongs to.', true, 13, 30, NULL, 'Collection ID', 'normal', 55, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 13, 0);
INSERT INTO public.metabase_field VALUES (363, '2021-04-12 20:56:34.09801+00', '2021-04-12 20:56:36.138048+00', 'creator_id', 'type/Integer', 'type/FK', true, NULL, true, 8, 30, NULL, 'Creator ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (367, '2021-04-12 20:56:34.110317+00', '2021-04-12 20:56:36.145928+00', 'table_id', 'type/Integer', 'type/FK', true, NULL, true, 10, 30, NULL, 'Table ID', 'normal', 184, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (376, '2021-04-12 20:56:34.152884+00', '2021-04-12 20:56:36.162928+00', 'owner_id', 'type/Integer', 'type/FK', true, NULL, true, 4, 24, NULL, 'Owner ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (379, '2021-04-12 20:56:34.162275+00', '2021-04-12 20:56:36.170653+00', 'card_id', 'type/Integer', 'type/FK', true, NULL, true, 3, 24, NULL, 'Card ID', 'normal', 366, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (384, '2021-04-12 20:56:34.190468+00', '2021-04-12 20:56:36.198223+00', 'creator_id', 'type/Integer', 'type/FK', true, NULL, true, 5, 19, NULL, 'Creator ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (391, '2021-04-12 20:56:34.209083+00', '2021-04-12 20:56:34.209083+00', 'embedding_params', 'type/Text', NULL, true, 'Serialized JSON containing information about required parameters that must be supplied when embedding this Dashboard.', true, 13, 19, NULL, 'Embedding Params', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 13, 0);
INSERT INTO public.metabase_field VALUES (392, '2021-04-12 20:56:34.212633+00', '2021-04-12 20:56:34.212633+00', 'archived', 'type/Boolean', NULL, true, 'Is this Dashboard archived (effectively treated as deleted?)', true, 14, 19, NULL, 'Archived', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 14, 0);
INSERT INTO public.metabase_field VALUES (393, '2021-04-12 20:56:34.214763+00', '2021-04-12 20:56:34.214763+00', 'position', 'type/Integer', NULL, true, 'The position this Dashboard should appear in the Dashboards list, lower-numbered positions appearing before higher numbered ones.', true, 15, 19, NULL, 'Position', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 15, 0);
INSERT INTO public.metabase_field VALUES (394, '2021-04-12 20:56:34.218225+00', '2021-04-12 20:56:34.218225+00', 'caveats', 'type/Text', NULL, true, NULL, true, 8, 19, NULL, 'Caveats', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (396, '2021-04-12 20:56:34.225613+00', '2021-04-12 20:56:34.225613+00', 'updated_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 2, 19, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (397, '2021-04-12 20:56:34.229121+00', '2021-04-12 20:56:34.229121+00', 'description', 'type/Text', NULL, true, NULL, true, 4, 19, NULL, 'Description', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (399, '2021-04-12 20:56:34.263884+00', '2021-04-12 20:56:34.263884+00', 'sizeY', 'type/Integer', NULL, true, NULL, true, 4, 14, NULL, 'Size Y', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (400, '2021-04-12 20:56:34.268407+00', '2021-04-12 20:56:34.268407+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 1, 14, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (401, '2021-04-12 20:56:34.273321+00', '2021-04-12 20:56:34.273321+00', 'col', 'type/Integer', NULL, true, NULL, true, 6, 14, NULL, 'Col', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (402, '2021-04-12 20:56:34.275598+00', '2021-04-12 20:56:34.275598+00', 'sizeX', 'type/Integer', NULL, true, NULL, true, 3, 14, NULL, 'Size X', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (403, '2021-04-12 20:56:34.279297+00', '2021-04-12 20:56:34.279297+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 14, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (405, '2021-04-12 20:56:34.286355+00', '2021-04-12 20:56:34.286355+00', 'parameter_mappings', 'type/Text', NULL, true, NULL, true, 9, 14, NULL, 'Parameter Mappings', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (406, '2021-04-12 20:56:34.288287+00', '2021-04-12 20:56:34.288287+00', 'updated_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 2, 14, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (407, '2021-04-12 20:56:34.289855+00', '2021-04-12 20:56:34.289855+00', 'row', 'type/Integer', NULL, true, NULL, true, 5, 14, NULL, 'Row', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (408, '2021-04-12 20:56:34.294871+00', '2021-04-12 20:56:34.294871+00', 'visualization_settings', 'type/Text', NULL, true, NULL, true, 10, 14, NULL, 'Visualization Settings', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (409, '2021-04-12 20:56:34.319945+00', '2021-04-12 20:56:34.319945+00', 'model', 'type/Text', NULL, true, NULL, true, 1, 10, NULL, 'Model', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (411, '2021-04-12 20:56:34.326667+00', '2021-04-12 20:56:34.326667+00', 'object', 'type/Text', NULL, true, NULL, true, 5, 10, NULL, 'Object', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (412, '2021-04-12 20:56:34.331628+00', '2021-04-12 20:56:34.331628+00', 'model_id', 'type/Integer', NULL, true, NULL, true, 2, 10, NULL, 'Model ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (413, '2021-04-12 20:56:34.337669+00', '2021-04-12 20:56:34.337669+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 10, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (414, '2021-04-12 20:56:34.340283+00', '2021-04-12 20:56:34.340283+00', 'is_reversion', 'type/Boolean', NULL, true, NULL, true, 6, 10, NULL, 'Is Reversion', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (415, '2021-04-12 20:56:34.345092+00', '2021-04-12 20:56:34.345092+00', 'timestamp', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 4, 10, NULL, 'Timestamp', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (416, '2021-04-12 20:56:34.349531+00', '2021-04-12 20:56:34.349531+00', 'message', 'type/Text', NULL, true, NULL, true, 8, 10, NULL, 'Message', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (417, '2021-04-12 20:56:34.353549+00', '2021-04-12 20:56:34.353549+00', 'is_creation', 'type/Boolean', NULL, true, NULL, true, 7, 10, NULL, 'Is Creation', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (418, '2021-04-12 20:56:34.387796+00', '2021-04-12 20:56:34.387796+00', 'caveats', 'type/Text', NULL, true, NULL, true, 10, 13, NULL, 'Caveats', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (419, '2021-04-12 20:56:34.389619+00', '2021-04-12 20:56:34.389619+00', 'show_in_getting_started', 'type/Boolean', NULL, true, NULL, true, 11, 13, NULL, 'Show In Getting Started', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (421, '2021-04-12 20:56:34.399047+00', '2021-04-12 20:56:34.399047+00', 'name', 'type/Text', NULL, true, NULL, true, 3, 13, NULL, 'Name', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (423, '2021-04-12 20:56:34.409872+00', '2021-04-12 20:56:34.409872+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 13, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (424, '2021-04-12 20:56:34.414078+00', '2021-04-12 20:56:34.414078+00', 'archived', 'type/Boolean', NULL, true, NULL, true, 5, 13, NULL, 'Archived', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'bool', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (425, '2021-04-12 20:56:34.418538+00', '2021-04-12 20:56:34.418538+00', 'points_of_interest', 'type/Text', NULL, true, NULL, true, 9, 13, NULL, 'Points Of Interest', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (426, '2021-04-12 20:56:34.424505+00', '2021-04-12 20:56:34.424505+00', 'updated_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 8, 13, NULL, 'Updated At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (427, '2021-04-12 20:56:34.428668+00', '2021-04-12 20:56:34.428668+00', 'definition', 'type/Text', NULL, true, NULL, true, 6, 13, NULL, 'Definition', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (428, '2021-04-12 20:56:34.43326+00', '2021-04-12 20:56:34.43326+00', 'created_at', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 7, 13, NULL, 'Created At', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (429, '2021-04-12 20:56:34.438222+00', '2021-04-12 20:56:34.438222+00', 'description', 'type/Text', NULL, true, NULL, true, 4, 13, NULL, 'Description', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'text', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (430, '2021-04-12 20:56:34.470075+00', '2021-04-12 20:56:34.470075+00', 'key', 'type/Text', 'type/PK', true, NULL, true, 0, 33, NULL, 'Key', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (404, '2021-04-12 20:56:34.281908+00', '2021-04-12 20:56:36.217326+00', 'dashboard_id', 'type/Integer', 'type/FK', true, NULL, true, 8, 14, NULL, 'Dashboard ID', 'normal', 390, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (398, '2021-04-12 20:56:34.261452+00', '2021-04-12 20:56:36.222197+00', 'card_id', 'type/Integer', 'type/FK', true, NULL, true, 7, 14, NULL, 'Card ID', 'normal', 366, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (410, '2021-04-12 20:56:34.321852+00', '2021-04-12 20:56:36.238916+00', 'user_id', 'type/Integer', 'type/FK', true, NULL, true, 3, 10, NULL, 'User ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (420, '2021-04-12 20:56:34.394592+00', '2021-04-12 20:56:36.254123+00', 'creator_id', 'type/Integer', 'type/FK', true, NULL, true, 2, 13, NULL, 'Creator ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (422, '2021-04-12 20:56:34.40395+00', '2021-04-12 20:56:36.260648+00', 'table_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 13, NULL, 'Table ID', 'normal', 184, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (432, '2021-04-12 20:56:34.527338+00', '2021-04-12 20:56:44.749241+00', 'Hobbyist', 'type/Text', 'type/Category', true, NULL, true, 3, 59, NULL, 'Hobbyist', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":2.7904}}}', 5, 'text', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (460, '2021-04-12 20:56:34.638749+00', '2021-04-12 20:56:34.638749+00', 'Id', 'type/Integer', 'type/PK', true, NULL, true, 0, 59, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (494, '2021-04-12 20:56:34.949939+00', '2021-04-12 20:56:34.949939+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 57, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (501, '2021-04-12 20:56:34.987149+00', '2021-04-12 20:56:34.987149+00', 'model', 'type/Text', NULL, true, NULL, true, 2, 18, NULL, 'Model', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (502, '2021-04-12 20:56:34.9885+00', '2021-04-12 20:56:34.9885+00', 'model_id', 'type/Integer', NULL, true, NULL, true, 3, 18, NULL, 'Model ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (503, '2021-04-12 20:56:34.992548+00', '2021-04-12 20:56:34.992548+00', 'id', 'type/Integer', 'type/PK', true, NULL, true, 0, 18, NULL, 'ID', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'serial', NULL, NULL, 0, 0);
INSERT INTO public.metabase_field VALUES (504, '2021-04-12 20:56:34.997649+00', '2021-04-12 20:56:34.997649+00', 'timestamp', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 4, 18, NULL, 'Timestamp', 'normal', NULL, NULL, NULL, NULL, NULL, 0, 'timestamptz', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (456, '2021-04-12 20:56:34.62444+00', '2021-04-12 20:56:47.046917+00', 'Age', 'type/Text', NULL, true, NULL, true, 4, 59, NULL, 'Age', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":84,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":2.0013}}}', 5, 'text', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (47, '2021-04-12 20:56:32.473066+00', '2021-04-12 20:56:35.053853+00', 'label_id', 'type/Integer', 'type/FK', true, NULL, true, 2, 5, NULL, 'Label ID', 'normal', 125, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (194, '2021-04-12 20:56:33.198561+00', '2021-04-12 20:56:35.434376+00', 'creator_id', 'type/Integer', 'type/FK', true, NULL, true, 2, 46, NULL, 'Creator ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (362, '2021-04-12 20:56:34.093884+00', '2021-04-12 20:56:36.121807+00', 'made_public_by_id', 'type/Integer', 'type/FK', true, 'The ID of the User who first publically shared this Card.', true, 15, 30, NULL, 'Made Public By ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 15, 0);
INSERT INTO public.metabase_field VALUES (395, '2021-04-12 20:56:34.222905+00', '2021-04-12 20:56:36.187198+00', 'made_public_by_id', 'type/Integer', 'type/FK', true, 'The ID of the User who first publically shared this Dashboard.', true, 11, 19, NULL, 'Made Public By ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (386, '2021-04-12 20:56:34.195934+00', '2021-04-12 20:56:36.193285+00', 'collection_id', 'type/Integer', 'type/FK', true, 'Optional ID of Collection this Dashboard belongs to.', true, 16, 19, NULL, 'Collection ID', 'normal', 55, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 16, 0);
INSERT INTO public.metabase_field VALUES (505, '2021-04-12 20:56:34.999705+00', '2021-04-12 20:56:36.312149+00', 'user_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 18, NULL, 'User ID', 'normal', 85, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (54, '2021-04-12 20:56:32.508567+00', '2021-04-12 20:56:36.623297+00', 'personal_owner_id', 'type/Integer', 'type/FK', true, 'If set, this Collection is a personal Collection, for exclusive use of the User with this ID.', true, 6, 20, NULL, 'Personal Owner ID', 'normal', 85, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'int4', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (78, '2021-04-12 20:56:32.673543+00', '2021-04-12 20:56:44.274721+00', 'google_auth', 'type/Boolean', 'type/Category', true, NULL, true, 13, 27, NULL, 'Google Auth', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 13, 0);
INSERT INTO public.metabase_field VALUES (96, '2021-04-12 20:56:32.764404+00', '2021-04-12 20:56:35.155217+00', 'dashboardcard_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 17, NULL, 'Dashboard Card ID', 'normal', 403, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (100, '2021-04-12 20:56:32.782391+00', '2021-04-12 20:56:35.187525+00', 'dashboard_id', 'type/Integer', 'type/FK', true, 'ID of the Dashboard favorited by the User.', true, 2, 6, NULL, 'Dashboard ID', 'normal', 390, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (208, '2021-04-12 20:56:33.269263+00', '2021-04-12 20:56:35.497716+00', 'collection_id', 'type/Integer', 'type/FK', true, 'ID of the Snippet Folder (Collection) this Snippet is in, if any', true, 8, 34, NULL, 'Collection ID', 'normal', 55, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (241, '2021-04-12 20:56:33.451907+00', '2021-04-12 20:56:35.646569+00', 'card_id', 'type/Integer', 'type/FK', true, NULL, true, 2, 35, NULL, 'Card ID', 'normal', 366, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (242, '2021-04-12 20:56:33.45388+00', '2021-04-12 20:56:35.694773+00', 'dashboard_card_id', 'type/Integer', 'type/FK', true, 'If this Pulse is a Dashboard subscription, the ID of the DashboardCard that corresponds to this PulseCard.', true, 6, 35, NULL, 'Dashboard Card ID', 'normal', 403, NULL, NULL, NULL, NULL, 0, 'int4', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (306, '2021-04-12 20:56:33.862071+00', '2021-04-12 20:56:35.980296+00', 'trigger_group', 'type/Text', 'type/FK', true, NULL, true, 2, 8, NULL, 'Trigger Group', 'normal', 336, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (303, '2021-04-12 20:56:33.852598+00', '2021-04-12 20:56:35.999371+00', 'trigger_name', 'type/Text', 'type/FK', true, NULL, true, 1, 8, NULL, 'Trigger Name', 'normal', 330, NULL, NULL, NULL, NULL, 0, 'varchar', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (431, '2021-04-12 20:56:34.472417+00', '2021-04-12 20:56:44.743513+00', 'value', 'type/Text', 'type/Category', true, NULL, true, 1, 33, NULL, 'Value', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.1428571428571429,"percent-email":0.1428571428571429,"percent-state":0.0,"average-length":12.714285714285714}}}', 5, 'text', 'auto-list', NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (134, '2021-04-12 20:56:32.925561+00', '2021-04-12 20:56:44.383377+00', 'options', 'type/Text', NULL, true, 'Serialized JSON containing various options like QB behavior.', true, 15, 22, NULL, 'Options', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 15, 0);
INSERT INTO public.metabase_field VALUES (140, '2021-04-12 20:56:32.941829+00', '2021-04-12 20:56:44.393541+00', 'is_full_sync', 'type/Boolean', 'type/Category', true, NULL, true, 8, 22, NULL, 'Is Full Sync', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (298, '2021-04-12 20:56:33.831262+00', '2021-04-12 20:56:44.671292+00', 'checkin_interval', 'type/BigInteger', 'type/Category', true, NULL, true, 3, 16, NULL, 'Check In Interval', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Number":{"min":7500.0,"q1":7500.0,"q3":7500.0,"max":7500.0,"sd":null,"avg":7500.0}}}', 5, 'int8', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (220, '2021-04-12 20:56:33.323096+00', '2021-04-12 20:56:44.606281+00', 'name', 'type/Text', 'type/Name', true, NULL, true, 1, 25, NULL, 'Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":3,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":10.0}}}', 5, 'varchar', 'auto-list', NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (268, '2021-04-12 20:56:33.658499+00', '2021-04-12 20:56:44.618417+00', 'time_zone_id', 'type/Text', 'type/Category', true, NULL, true, 4, 37, NULL, 'Time Zone ID', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":17.0}}}', 5, 'varchar', 'auto-list', NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (322, '2021-04-12 20:56:33.951072+00', '2021-04-12 20:56:38.272177+00', 'job_name', 'type/Text', 'type/FK', true, NULL, true, 3, 41, NULL, 'Job Name', 'normal', 284, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":8,"nil%":0.0}}', 5, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (323, '2021-04-12 20:56:33.952383+00', '2021-04-12 20:56:44.728269+00', 'trigger_state', 'type/Text', 'type/Category', true, NULL, true, 9, 41, NULL, 'Trigger State', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":7.0}}}', 5, 'varchar', 'auto-list', NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (326, '2021-04-12 20:56:33.959712+00', '2021-04-12 20:56:44.733081+00', 'next_fire_time', 'type/BigInteger', 'type/Category', true, NULL, true, 6, 41, NULL, 'Next Fire Time', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":6,"nil%":0.0},"type":{"type/Number":{"min":1.6182612E12,"q1":1.6182621E12,"q3":1.6183089E12,"max":1.618326E12,"sd":2.6780888708181437E7,"avg":1.61828454E12}}}', 5, 'int8', 'auto-list', NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (217, '2021-04-12 20:56:33.307741+00', '2021-04-12 20:56:44.602672+00', 'object', 'type/Text', 'type/Category', true, NULL, true, 1, 44, NULL, 'Object', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":9.4}}}', 5, 'varchar', 'auto-list', NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (190, '2021-04-12 20:56:33.170403+00', '2021-04-12 20:56:44.596179+00', 'entity_type', 'type/Text', 'type/Category', true, NULL, true, 6, 48, NULL, 'Entity Type', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.9333333333333333},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":1.2833333333333334}}}', 5, 'varchar', 'auto-list', NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (287, '2021-04-12 20:56:33.770055+00', '2021-04-12 20:56:44.649698+00', 'job_class_name', 'type/Text', 'type/Category', true, NULL, true, 4, 52, NULL, 'Job Class Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":8,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":47.875}}}', 5, 'varchar', 'auto-list', NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (291, '2021-04-12 20:56:33.781307+00', '2021-04-12 20:56:44.655678+00', 'description', 'type/Text', 'type/Description', true, NULL, true, 3, 52, NULL, 'Description', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":3,"nil%":0.75},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":8.875}}}', 5, 'varchar', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (450, '2021-04-12 20:56:34.599473+00', '2021-04-12 20:56:48.451261+00', 'WorkWeekHrs', 'type/Text', NULL, true, NULL, true, 59, 59, NULL, 'Work Week Hrs', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":91,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":1.997}}}', 5, 'text', NULL, NULL, 59, 0);
INSERT INTO public.metabase_field VALUES (58, '2021-04-12 20:56:32.528516+00', '2021-04-12 20:56:44.186614+00', 'namespace', 'type/Text', NULL, true, 'The namespace (hierachy) this Collection belongs to. NULL means the Collection is in the default namespace.', true, 8, 20, NULL, 'Namespace', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'varchar', 'auto-list', NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (299, '2021-04-12 20:56:33.83239+00', '2021-04-12 20:56:44.666438+00', 'last_checkin_time', 'type/BigInteger', 'type/Category', true, NULL, true, 2, 16, NULL, 'Last Check In Time', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Number":{"min":1.618260991052E12,"q1":1.618260991052E12,"q3":1.618260991052E12,"max":1.618260991052E12,"sd":null,"avg":1.618260991052E12}}}', 5, 'int8', 'auto-list', NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (56, '2021-04-12 20:56:32.518914+00', '2021-04-12 20:56:44.182+00', 'description', 'type/Text', 'type/Description', true, 'Optional description for this Collection.', true, 2, 20, NULL, 'Description', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (50, '2021-04-12 20:56:32.492787+00', '2021-04-12 20:56:44.192994+00', 'name', 'type/Text', 'type/Name', true, 'The user-facing name of this Collection.', true, 1, 20, NULL, 'Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":36.0}}}', 5, 'text', 'auto-list', NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (57, '2021-04-12 20:56:32.523746+00', '2021-04-12 20:56:44.203347+00', 'slug', 'type/Text', 'type/Category', true, 'Sluggified version of the Collection name. Used only for display purposes in URL; not unique or indexed.', true, 7, 20, NULL, 'Slug', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":36.0}}}', 5, 'varchar', 'auto-list', NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (52, '2021-04-12 20:56:32.499054+00', '2021-04-12 20:56:44.198179+00', 'location', 'type/Text', 'type/Category', true, 'Directory-structure path of ancestor Collections. e.g. "/1/2/" means our Parent is Collection 2, and their parent is Collection 1.', true, 5, 20, NULL, 'Location', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":1.0}}}', 5, 'varchar', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (135, '2021-04-12 20:56:32.92714+00', '2021-04-12 20:56:44.337103+00', 'updated_at', 'type/DateTimeWithLocalTZ', 'type/UpdatedTimestamp', true, NULL, true, 2, 22, NULL, 'Updated At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:31.637411Z","latest":"2021-04-12T20:56:31.750561Z"}}}', 5, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (136, '2021-04-12 20:56:32.930909+00', '2021-04-12 20:56:44.342345+00', 'refingerprint', 'type/Boolean', 'type/Category', true, 'Whether or not to enable periodic refingerprinting for this Database.', true, 17, 22, NULL, 'Re Fingerprint', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0}}', 5, 'bool', 'auto-list', NULL, 17, 0);
INSERT INTO public.metabase_field VALUES (138, '2021-04-12 20:56:32.936133+00', '2021-04-12 20:56:44.348109+00', 'points_of_interest', 'type/Text', NULL, true, NULL, true, 9, 22, NULL, 'Points Of Interest', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (139, '2021-04-12 20:56:32.938339+00', '2021-04-12 20:56:44.352806+00', 'is_sample', 'type/Boolean', 'type/Category', true, NULL, true, 7, 22, NULL, 'Is Sample', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (142, '2021-04-12 20:56:32.947062+00', '2021-04-12 20:56:44.358427+00', 'timezone', 'type/Text', 'type/Category', true, 'Timezone identifier for the database, set by the sync process', true, 13, 22, NULL, 'Timezone', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.5},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":8.5}}}', 5, 'varchar', 'auto-list', NULL, 13, 0);
INSERT INTO public.metabase_field VALUES (144, '2021-04-12 20:56:32.953174+00', '2021-04-12 20:56:44.363642+00', 'description', 'type/Text', 'type/Description', true, NULL, true, 4, 22, NULL, 'Description', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (127, '2021-04-12 20:56:32.909073+00', '2021-04-12 20:56:44.368988+00', 'cache_field_values_schedule', 'type/Text', 'type/Category', true, 'The cron schedule string for when FieldValues for eligible Fields should be updated.', true, 12, 22, NULL, 'Cache Field Values Schedule', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":14.0}}}', 5, 'varchar', 'auto-list', NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (129, '2021-04-12 20:56:32.911906+00', '2021-04-12 20:56:44.373599+00', 'created_at', 'type/DateTimeWithLocalTZ', 'type/CreationTimestamp', true, NULL, true, 1, 22, NULL, 'Created At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:31.151909Z","latest":"2021-04-12T20:56:31.750561Z"}}}', 5, 'timestamptz', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (137, '2021-04-12 20:56:32.932652+00', '2021-04-12 20:56:44.38829+00', 'details', 'type/Text', 'type/SerializedJSON', true, NULL, true, 5, 22, NULL, 'Details', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Text":{"percent-json":1.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":116.0}}}', 5, 'text', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (141, '2021-04-12 20:56:32.943681+00', '2021-04-12 20:56:44.398838+00', 'engine', 'type/Text', 'type/Category', true, NULL, true, 6, 22, NULL, 'Engine', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":5.0}}}', 5, 'varchar', 'auto-list', NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (131, '2021-04-12 20:56:32.917417+00', '2021-04-12 20:56:44.326723+00', 'auto_run_queries', 'type/Boolean', 'type/Category', true, 'Whether to automatically run queries when doing simple filtering and summarizing in the Query Builder.', true, 16, 22, NULL, 'Auto Run Queries', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 16, 0);
INSERT INTO public.metabase_field VALUES (130, '2021-04-12 20:56:32.915565+00', '2021-04-12 20:56:44.378703+00', 'metadata_sync_schedule', 'type/Text', 'type/Category', true, 'The cron schedule string for when this database should undergo the metadata sync process (and analysis for new fields).', true, 11, 22, NULL, 'Metadata Sync Schedule', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":14.0}}}', 5, 'varchar', 'auto-list', NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (143, '2021-04-12 20:56:32.949181+00', '2021-04-12 20:56:44.40341+00', 'is_on_demand', 'type/Boolean', 'type/Category', true, 'Whether we should do On-Demand caching of FieldValues for this DB. This means FieldValues are updated when their Field is used in a Dashboard or Card param.', true, 14, 22, NULL, 'Is On Demand', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 14, 0);
INSERT INTO public.metabase_field VALUES (77, '2021-04-12 20:56:32.672224+00', '2021-04-12 20:56:44.225417+00', 'password', 'type/Text', 'type/Category', true, NULL, true, 4, 27, NULL, 'Password', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":60.0}}}', 5, 'varchar', 'auto-list', NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (81, '2021-04-12 20:56:32.683604+00', '2021-04-12 20:56:44.2332+00', 'date_joined', 'type/DateTimeWithLocalTZ', 'type/JoinTimestamp', true, NULL, true, 6, 27, NULL, 'Date Joined', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:56:31.750561Z","latest":"2021-04-12T20:56:31.750561Z"}}}', 5, 'timestamptz', NULL, NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (84, '2021-04-12 20:56:32.691391+00', '2021-04-12 20:56:44.235995+00', 'login_attributes', 'type/Text', NULL, true, 'JSON serialized map with attributes used for row level permissions', true, 15, 27, NULL, 'Login Attributes', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 15, 0);
INSERT INTO public.metabase_field VALUES (86, '2021-04-12 20:56:32.700898+00', '2021-04-12 20:56:44.240984+00', 'email', 'type/Text', 'type/Email', true, NULL, true, 1, 27, NULL, 'Email', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":1.0,"percent-state":0.0,"average-length":14.0}}}', 5, 'citext', 'auto-list', NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (88, '2021-04-12 20:56:32.711321+00', '2021-04-12 20:56:44.247587+00', 'is_qbnewb', 'type/Boolean', 'type/Category', true, NULL, true, 12, 27, NULL, 'Is Qb Newb', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (90, '2021-04-12 20:56:32.721906+00', '2021-04-12 20:56:44.254072+00', 'is_superuser', 'type/Boolean', 'type/Category', true, NULL, true, 8, 27, NULL, 'Is Superuser', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (91, '2021-04-12 20:56:32.724111+00', '2021-04-12 20:56:44.258959+00', 'reset_token', 'type/Text', NULL, true, NULL, true, 10, 27, NULL, 'Reset Token', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'varchar', 'auto-list', NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (95, '2021-04-12 20:56:32.740237+00', '2021-04-12 20:56:44.269171+00', 'ldap_auth', 'type/Boolean', 'type/Category', true, NULL, true, 14, 27, NULL, 'Ld Ap Auth', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 14, 0);
INSERT INTO public.metabase_field VALUES (80, '2021-04-12 20:56:32.679906+00', '2021-04-12 20:56:36.814769+00', 'last_login', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 7, 27, NULL, 'Last Login', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:56:31.88968Z","latest":"2021-04-12T20:56:31.88968Z"}}}', 5, 'timestamptz', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (82, '2021-04-12 20:56:32.685772+00', '2021-04-12 20:56:44.280686+00', 'first_name', 'type/Text', 'type/Name', true, NULL, true, 2, 27, NULL, 'First Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":9.0}}}', 5, 'varchar', 'auto-list', NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (83, '2021-04-12 20:56:32.689276+00', '2021-04-12 20:56:44.285727+00', 'locale', 'type/Text', NULL, true, 'Preferred ISO locale (language/country) code, e.g "en" or "en-US", for this User. Overrides site default.', true, 18, 27, NULL, 'Locale', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'varchar', 'auto-list', NULL, 18, 0);
INSERT INTO public.metabase_field VALUES (87, '2021-04-12 20:56:32.70807+00', '2021-04-12 20:56:44.290445+00', 'updated_at', 'type/DateTime', 'type/UpdatedTimestamp', true, 'When was this User last updated?', true, 16, 27, NULL, 'Updated At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T17:56:31.88968Z","latest":"2021-04-12T17:56:31.88968Z"}}}', 5, 'timestamp', NULL, NULL, 16, 0);
INSERT INTO public.metabase_field VALUES (89, '2021-04-12 20:56:32.716437+00', '2021-04-12 20:56:44.296373+00', 'sso_source', 'type/Text', 'type/Source', true, 'String to indicate the SSO backend the user is from', true, 17, 27, NULL, 'Ss O Source', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'varchar', 'auto-list', NULL, 17, 0);
INSERT INTO public.metabase_field VALUES (93, '2021-04-12 20:56:32.730531+00', '2021-04-12 20:56:44.300812+00', 'reset_triggered', 'type/BigInteger', NULL, true, NULL, true, 11, 27, NULL, 'Reset Triggered', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Number":{"min":null,"q1":null,"q3":null,"max":null,"sd":null,"avg":null}}}', 5, 'int8', 'auto-list', NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (94, '2021-04-12 20:56:32.735726+00', '2021-04-12 20:56:44.305941+00', 'password_salt', 'type/Text', 'type/Category', true, NULL, true, 5, 27, NULL, 'Password Salt', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":36.0}}}', 5, 'varchar', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (92, '2021-04-12 20:56:32.725996+00', '2021-04-12 20:56:44.263704+00', 'last_name', 'type/Text', 'type/Name', true, NULL, true, 3, 27, NULL, 'Last Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":7.0}}}', 5, 'varchar', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (145, '2021-04-12 20:56:32.981668+00', '2021-04-12 20:56:44.412264+00', 'active', 'type/Boolean', 'type/Category', true, NULL, true, 6, 29, NULL, 'Active', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (147, '2021-04-12 20:56:32.984786+00', '2021-04-12 20:56:44.415556+00', 'custom_position', 'type/Integer', 'type/Category', true, NULL, true, 24, 29, NULL, 'Custom Position', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":0.0,"q3":0.0,"max":0.0,"sd":0.0,"avg":0.0}}}', 5, 'int4', 'auto-list', NULL, 24, 0);
INSERT INTO public.metabase_field VALUES (149, '2021-04-12 20:56:32.989754+00', '2021-04-12 20:56:44.419811+00', 'visibility_type', 'type/Text', 'type/Category', true, NULL, true, 13, 29, NULL, 'Visibility Type', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":6.0}}}', 5, 'varchar', 'auto-list', NULL, 13, 0);
INSERT INTO public.metabase_field VALUES (150, '2021-04-12 20:56:32.993254+00', '2021-04-12 20:56:44.424992+00', 'created_at', 'type/DateTimeWithLocalTZ', 'type/CreationTimestamp', true, NULL, true, 1, 29, NULL, 'Created At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":505,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:31.794941Z","latest":"2021-04-12T20:56:34.999705Z"}}}', 5, 'timestamptz', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (153, '2021-04-12 20:56:33.003327+00', '2021-04-12 20:56:44.435317+00', 'caveats', 'type/Text', NULL, true, NULL, true, 17, 29, NULL, 'Caveats', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 17, 0);
INSERT INTO public.metabase_field VALUES (154, '2021-04-12 20:56:33.00525+00', '2021-04-12 20:56:44.440396+00', 'preview_display', 'type/Boolean', 'type/Category', true, NULL, true, 8, 29, NULL, 'Preview Display', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (157, '2021-04-12 20:56:33.017659+00', '2021-04-12 20:56:37.414875+00', 'display_name', 'type/Text', NULL, true, NULL, true, 12, 29, NULL, 'Display Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":278,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.08316831683168317,"average-length":9.974257425742575}}}', 5, 'varchar', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (160, '2021-04-12 20:56:33.031398+00', '2021-04-12 20:56:44.446901+00', 'position', 'type/Integer', NULL, true, NULL, true, 9, 29, NULL, 'Position', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":62,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":1.8265050253120976,"q3":10.193376137081925,"max":61.0,"sd":11.321954309182829,"avg":8.51881188118812}}}', 5, 'int4', 'auto-list', NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (163, '2021-04-12 20:56:33.041325+00', '2021-04-12 20:56:37.43911+00', 'parent_id', 'type/Integer', 'type/FK', true, NULL, true, 11, 29, NULL, 'Parent ID', 'normal', 162, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0}}', 5, 'int4', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (164, '2021-04-12 20:56:33.04314+00', '2021-04-12 20:56:44.451953+00', 'special_type', 'type/Text', 'type/Category', true, NULL, true, 5, 29, NULL, 'Special Type', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":19,"nil%":0.700990099009901},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":2.3564356435643563}}}', 5, 'varchar', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (166, '2021-04-12 20:56:33.051597+00', '2021-04-12 20:56:44.456852+00', 'points_of_interest', 'type/Text', NULL, true, NULL, true, 16, 29, NULL, 'Points Of Interest', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 16, 0);
INSERT INTO public.metabase_field VALUES (168, '2021-04-12 20:56:33.059716+00', '2021-04-12 20:56:44.46249+00', 'base_type', 'type/Text', 'type/Category', true, NULL, true, 4, 29, NULL, 'Base Type', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":10,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":11.415841584158416}}}', 5, 'varchar', 'auto-list', NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (165, '2021-04-12 20:56:33.04842+00', '2021-04-12 20:56:37.463569+00', 'table_id', 'type/Integer', 'type/FK', true, NULL, true, 10, 29, NULL, 'Table ID', 'normal', 184, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":55,"nil%":0.0}}', 5, 'int4', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (146, '2021-04-12 20:56:32.98296+00', '2021-04-12 20:56:44.468706+00', 'fk_target_field_id', 'type/Integer', 'type/Category', true, NULL, true, 14, 29, NULL, 'Fk Target Field ID', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":23,"nil%":0.8574257425742574},"type":{"type/Number":{"min":22.0,"q1":87.28379678605552,"q3":329.25,"max":403.0,"sd":121.26878071158244,"avg":202.65277777777777}}}', 5, 'int4', 'auto-list', NULL, 14, 0);
INSERT INTO public.metabase_field VALUES (148, '2021-04-12 20:56:32.988053+00', '2021-04-12 20:56:44.473958+00', 'fingerprint_version', 'type/Integer', 'type/Category', true, 'The version of the fingerprint for this Field. Used so we can keep track of which Fields need to be analyzed again when new things are added to fingerprints.', true, 19, 29, NULL, 'Fingerprint Version', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":0.0,"q3":2.557359383175361,"max":5.0,"sd":1.898534137633191,"avg":0.8712871287128713}}}', 5, 'int4', 'auto-list', NULL, 19, 0);
INSERT INTO public.metabase_field VALUES (151, '2021-04-12 20:56:32.997658+00', '2021-04-12 20:56:44.480335+00', 'settings', 'type/Text', NULL, true, 'Serialized JSON FE-specific settings like formatting, etc. Scope of what is stored here may increase in future.', true, 22, 29, NULL, 'Settings', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 22, 0);
INSERT INTO public.metabase_field VALUES (155, '2021-04-12 20:56:33.008601+00', '2021-04-12 20:56:44.485834+00', 'name', 'type/Text', 'type/Name', true, NULL, true, 3, 29, NULL, 'Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":287,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.08316831683168317,"average-length":9.736633663366337}}}', 5, 'varchar', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (156, '2021-04-12 20:56:33.013112+00', '2021-04-12 20:56:37.409655+00', 'last_analyzed', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 15, 29, NULL, 'Last Analyzed', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.9366336633663366},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:36.228368Z","latest":"2021-04-12T20:53:36.228368Z"}}}', 5, 'timestamptz', NULL, NULL, 15, 0);
INSERT INTO public.metabase_field VALUES (158, '2021-04-12 20:56:33.022526+00', '2021-04-12 20:56:44.491232+00', 'description', 'type/Text', 'type/Description', true, NULL, true, 7, 29, NULL, 'Description', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":119,"nil%":0.7623762376237624},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":17.18811881188119}}}', 5, 'text', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (159, '2021-04-12 20:56:33.027033+00', '2021-04-12 20:56:44.4965+00', 'fingerprint', 'type/Text', NULL, true, 'Serialized JSON containing non-identifying information about this Field, such as min, max, and percent JSON. Used for classification.', true, 18, 29, NULL, 'Fingerprint', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":61,"nil%":0.8257425742574257},"type":{"type/Text":{"percent-json":0.1742574257425743,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":24.504950495049506}}}', 5, 'text', 'auto-list', NULL, 18, 0);
INSERT INTO public.metabase_field VALUES (161, '2021-04-12 20:56:33.033268+00', '2021-04-12 20:56:44.501987+00', 'has_field_values', 'type/Text', 'type/Category', true, 'Whether we have FieldValues ("list"), should ad-hoc search ("search"), disable entirely ("none"), or infer dynamically (null)"', true, 21, 29, NULL, 'Has Field Values', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.9900990099009901},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0891089108910891}}}', 5, 'text', 'auto-list', NULL, 21, 0);
INSERT INTO public.metabase_field VALUES (167, '2021-04-12 20:56:33.055025+00', '2021-04-12 20:56:44.507141+00', 'updated_at', 'type/DateTimeWithLocalTZ', 'type/UpdatedTimestamp', true, NULL, true, 2, 29, NULL, 'Updated At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":505,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:31.836558Z","latest":"2021-04-12T20:56:37.151094Z"}}}', 5, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (169, '2021-04-12 20:56:33.064325+00', '2021-04-12 20:56:44.512974+00', 'database_type', 'type/Text', 'type/Category', true, 'The actual type of this column in the database. e.g. VARCHAR or TEXT.', true, 20, 29, NULL, 'Database Type', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":22,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":5.6138613861386135}}}', 5, 'text', 'auto-list', NULL, 20, 0);
INSERT INTO public.metabase_field VALUES (152, '2021-04-12 20:56:33.000049+00', '2021-04-12 20:56:44.429886+00', 'database_position', 'type/Integer', NULL, true, NULL, true, 23, 29, NULL, 'Database Position', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":62,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":1.8265050253120976,"q3":10.193376137081925,"max":61.0,"sd":11.321954309182829,"avg":8.51881188118812}}}', 5, 'int4', 'auto-list', NULL, 23, 0);
INSERT INTO public.metabase_field VALUES (270, '2021-04-12 20:56:33.66751+00', '2021-04-12 20:56:37.937353+00', 'trigger_group', 'type/Text', 'type/FK', true, NULL, true, 2, 37, NULL, 'Trigger Group', 'normal', 336, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'varchar', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (266, '2021-04-12 20:56:33.654223+00', '2021-04-12 20:56:44.615771+00', 'cron_expression', 'type/Text', 'type/Category', true, NULL, true, 3, 37, NULL, 'Cr On Expression', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":6,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":14.1}}}', 5, 'varchar', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (104, '2021-04-12 20:56:32.799271+00', '2021-04-12 20:56:36.918848+00', 'timestamp', 'type/DateTime', NULL, true, NULL, true, 1, 38, NULL, 'Timestamp', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":14,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T17:53:30.144309Z","latest":"2021-04-12T17:53:30.797935Z"}}}', 5, 'timestamp', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (325, '2021-04-12 20:56:33.95785+00', '2021-04-12 20:56:44.683712+00', 'prev_fire_time', 'type/BigInteger', 'type/Category', true, NULL, true, 7, 41, NULL, 'Prev Fire Time', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Number":{"min":-1.0,"q1":-1.0,"q3":-1.0,"max":-1.0,"sd":0.0,"avg":-1.0}}}', 5, 'int8', 'auto-list', NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (328, '2021-04-12 20:56:33.963377+00', '2021-04-12 20:56:44.687171+00', 'trigger_type', 'type/Text', 'type/Category', true, NULL, true, 10, 41, NULL, 'Trigger Type', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":4.0}}}', 5, 'varchar', 'auto-list', NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (332, '2021-04-12 20:56:33.971661+00', '2021-04-12 20:56:44.69189+00', 'misfire_instr', 'type/Integer', 'type/Category', true, NULL, true, 14, 41, NULL, 'Misfire Ins Tr', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":3,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":0.0,"q3":1.8685170918213299,"max":2.0,"sd":0.9944289260117533,"avg":0.9}}}', 5, 'int2', 'auto-list', NULL, 14, 0);
INSERT INTO public.metabase_field VALUES (333, '2021-04-12 20:56:33.972977+00', '2021-04-12 20:56:44.697406+00', 'job_data', 'type/*', 'type/Category', true, NULL, true, 15, 41, NULL, 'Job Data', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":3,"nil%":0.0}}', 5, 'bytea', 'auto-list', NULL, 15, 0);
INSERT INTO public.metabase_field VALUES (335, '2021-04-12 20:56:33.97797+00', '2021-04-12 20:56:44.702619+00', 'calendar_name', 'type/Text', NULL, true, NULL, true, 13, 41, NULL, 'Calendar Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'varchar', 'auto-list', NULL, 13, 0);
INSERT INTO public.metabase_field VALUES (334, '2021-04-12 20:56:33.97445+00', '2021-04-12 20:56:44.717965+00', 'priority', 'type/Integer', 'type/Category', true, NULL, true, 8, 41, NULL, 'Priority', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Number":{"min":5.0,"q1":5.0,"q3":5.0,"max":5.0,"sd":0.0,"avg":5.0}}}', 5, 'int4', 'auto-list', NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (337, '2021-04-12 20:56:33.983544+00', '2021-04-12 20:56:44.723022+00', 'end_time', 'type/BigInteger', 'type/Category', true, NULL, true, 12, 41, NULL, 'End Time', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Number":{"min":0.0,"q1":0.0,"q3":0.0,"max":0.0,"sd":0.0,"avg":0.0}}}', 5, 'int8', 'auto-list', NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (329, '2021-04-12 20:56:33.964881+00', '2021-04-12 20:56:44.7076+00', 'description', 'type/Text', 'type/Description', true, NULL, true, 5, 41, NULL, 'Description', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.6},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":11.4}}}', 5, 'varchar', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (331, '2021-04-12 20:56:33.969765+00', '2021-04-12 20:56:44.712775+00', 'start_time', 'type/BigInteger', 'type/Category', true, NULL, true, 11, 41, NULL, 'Start Time', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Number":{"min":1.618260811E12,"q1":1.618260811E12,"q3":1.618260910287527E12,"max":1.618260991E12,"sd":75894.6638440411,"avg":1.618260847E12}}}', 5, 'int8', 'auto-list', NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (224, '2021-04-12 20:56:33.340754+00', '2021-04-12 20:56:37.745409+00', 'user_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 45, NULL, 'User ID', 'normal', 85, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (170, '2021-04-12 20:56:33.098718+00', '2021-04-12 20:56:44.519825+00', 'created_at', 'type/DateTimeWithLocalTZ', 'type/CreationTimestamp', true, NULL, true, 1, 47, NULL, 'Created At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:36.879303Z","latest":"2021-04-12T20:53:36.972118Z"}}}', 5, 'timestamptz', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (172, '2021-04-12 20:56:33.105402+00', '2021-04-12 20:56:44.524313+00', 'values', 'type/Text', 'type/SerializedJSON', true, NULL, true, 3, 47, NULL, 'Values', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Text":{"percent-json":1.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":114.4}}}', 5, 'text', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (175, '2021-04-12 20:56:33.116062+00', '2021-04-12 20:56:37.506111+00', 'field_id', 'type/Integer', 'type/FK', true, NULL, true, 5, 47, NULL, 'Field ID', 'normal', 162, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0}}', 5, 'int4', NULL, NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (171, '2021-04-12 20:56:33.100132+00', '2021-04-12 20:56:44.530334+00', 'human_readable_values', 'type/Text', NULL, true, NULL, true, 4, 47, NULL, 'Human Readable Values', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (174, '2021-04-12 20:56:33.112199+00', '2021-04-12 20:56:44.535806+00', 'updated_at', 'type/DateTimeWithLocalTZ', 'type/UpdatedTimestamp', true, NULL, true, 2, 47, NULL, 'Updated At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:36.879303Z","latest":"2021-04-12T20:53:36.972118Z"}}}', 5, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (176, '2021-04-12 20:56:33.132256+00', '2021-04-12 20:56:37.547698+00', 'db_id', 'type/Integer', 'type/FK', true, NULL, true, 8, 48, NULL, 'Db ID', 'normal', 133, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0}}', 5, 'int4', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (177, '2021-04-12 20:56:33.133946+00', '2021-04-12 20:56:44.543526+00', 'field_order', 'type/Text', 'type/Category', true, NULL, true, 15, 48, NULL, 'Field Order', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":8.0}}}', 5, 'varchar', 'auto-list', NULL, 15, 0);
INSERT INTO public.metabase_field VALUES (182, '2021-04-12 20:56:33.148804+00', '2021-04-12 20:56:44.551204+00', 'name', 'type/Text', 'type/Name', true, NULL, true, 3, 48, NULL, 'Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":60,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":14.416666666666666}}}', 5, 'varchar', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (185, '2021-04-12 20:56:33.158267+00', '2021-04-12 20:56:44.557378+00', 'points_of_interest', 'type/Text', NULL, true, NULL, true, 12, 48, NULL, 'Points Of Interest', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (188, '2021-04-12 20:56:33.165382+00', '2021-04-12 20:56:44.561039+00', 'updated_at', 'type/DateTimeWithLocalTZ', 'type/UpdatedTimestamp', true, NULL, true, 2, 48, NULL, 'Updated At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":60,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:36.189767Z","latest":"2021-04-12T20:56:32.295972Z"}}}', 5, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (189, '2021-04-12 20:56:33.168722+00', '2021-04-12 20:56:44.567142+00', 'show_in_getting_started', 'type/Boolean', 'type/Category', true, NULL, true, 14, 48, NULL, 'Show In Getting Started', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 14, 0);
INSERT INTO public.metabase_field VALUES (191, '2021-04-12 20:56:33.173935+00', '2021-04-12 20:56:44.571333+00', 'description', 'type/Text', 'type/Description', true, NULL, true, 4, 48, NULL, 'Description', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":19,"nil%":0.5333333333333333},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":27.7}}}', 5, 'text', 'auto-list', NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (178, '2021-04-12 20:56:33.137745+00', '2021-04-12 20:56:44.573903+00', 'created_at', 'type/DateTimeWithLocalTZ', 'type/CreationTimestamp', true, NULL, true, 1, 48, NULL, 'Created At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":60,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:31.698301Z","latest":"2021-04-12T20:56:32.295972Z"}}}', 5, 'timestamptz', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (180, '2021-04-12 20:56:33.143405+00', '2021-04-12 20:56:44.578468+00', 'active', 'type/Boolean', 'type/Category', true, NULL, true, 7, 48, NULL, 'Active', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (181, '2021-04-12 20:56:33.145306+00', '2021-04-12 20:56:44.582545+00', 'schema', 'type/Text', 'type/Category', true, NULL, true, 11, 48, NULL, 'Schema', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":6.0}}}', 5, 'varchar', 'auto-list', NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (186, '2021-04-12 20:56:33.160182+00', '2021-04-12 20:56:44.589512+00', 'caveats', 'type/Text', NULL, true, NULL, true, 13, 48, NULL, 'Caveats', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 13, 0);
INSERT INTO public.metabase_field VALUES (187, '2021-04-12 20:56:33.16348+00', '2021-04-12 20:56:44.593697+00', 'entity_name', 'type/Text', NULL, true, NULL, true, 5, 48, NULL, 'Entity Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'varchar', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (179, '2021-04-12 20:56:33.139797+00', '2021-04-12 20:56:44.548092+00', 'display_name', 'type/Text', NULL, true, NULL, true, 9, 48, NULL, 'Display Name', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":60,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":14.766666666666667}}}', 5, 'varchar', 'auto-list', NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (183, '2021-04-12 20:56:33.153088+00', '2021-04-12 20:56:44.58524+00', 'visibility_type', 'type/Text', 'type/Category', true, NULL, true, 10, 48, NULL, 'Visibility Type', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.9166666666666667},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.4166666666666667}}}', 5, 'varchar', 'auto-list', NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (39, '2021-04-12 20:56:32.412806+00', '2021-04-12 20:56:44.151335+00', 'table_id', 'type/Integer', NULL, true, NULL, true, 7, 49, NULL, 'Table ID', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Number":{"min":null,"q1":null,"q3":null,"max":null,"sd":null,"avg":null}}}', 5, 'int4', 'auto-list', NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (42, '2021-04-12 20:56:32.427118+00', '2021-04-12 20:56:44.153714+00', 'details', 'type/Text', 'type/SerializedJSON', true, NULL, true, 9, 49, NULL, 'Details', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Text":{"percent-json":1.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":2.0}}}', 5, 'varchar', 'auto-list', NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (45, '2021-04-12 20:56:32.441867+00', '2021-04-12 20:56:36.442422+00', 'timestamp', 'type/DateTimeWithLocalTZ', NULL, true, NULL, true, 2, 49, NULL, 'Timestamp', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:53:31.149687Z","latest":"2021-04-12T20:56:31.889549Z"}}}', 5, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (37, '2021-04-12 20:56:32.405775+00', '2021-04-12 20:56:36.455+00', 'user_id', 'type/Integer', 'type/FK', true, NULL, true, 3, 49, NULL, 'User ID', 'normal', 85, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.5}}', 5, 'int4', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (40, '2021-04-12 20:56:32.417623+00', '2021-04-12 20:56:44.158283+00', 'topic', 'type/Text', 'type/Category', true, NULL, true, 1, 49, NULL, 'Topic', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":9.0}}}', 5, 'varchar', 'auto-list', NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (41, '2021-04-12 20:56:32.422347+00', '2021-04-12 20:56:44.160734+00', 'database_id', 'type/Integer', NULL, true, NULL, true, 6, 49, NULL, 'Database ID', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Number":{"min":null,"q1":null,"q3":null,"max":null,"sd":null,"avg":null}}}', 5, 'int4', 'auto-list', NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (43, '2021-04-12 20:56:32.432229+00', '2021-04-12 20:56:44.163604+00', 'model', 'type/Text', 'type/Category', true, NULL, true, 4, 49, NULL, 'Model', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":5.5}}}', 5, 'varchar', 'auto-list', NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (46, '2021-04-12 20:56:32.446518+00', '2021-04-12 20:56:44.168572+00', 'model_id', 'type/Integer', 'type/Category', true, NULL, true, 5, 49, NULL, 'Model ID', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.5},"type":{"type/Number":{"min":1.0,"q1":1.0,"q3":1.0,"max":1.0,"sd":null,"avg":1.0}}}', 5, 'int4', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (38, '2021-04-12 20:56:32.407684+00', '2021-04-12 20:56:44.149352+00', 'custom_id', 'type/Text', NULL, true, NULL, true, 8, 49, NULL, 'Custom ID', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'varchar', 'auto-list', NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (73, '2021-04-12 20:56:32.629389+00', '2021-04-12 20:56:44.213696+00', 'created_at', 'type/DateTimeWithLocalTZ', 'type/CreationTimestamp', true, NULL, true, 2, 51, NULL, 'Created At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T20:56:31.750561Z","latest":"2021-04-12T20:56:31.750561Z"}}}', 5, 'timestamptz', NULL, NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (75, '2021-04-12 20:56:32.635681+00', '2021-04-12 20:56:36.752923+00', 'user_id', 'type/Integer', 'type/FK', true, NULL, true, 1, 51, NULL, 'User ID', 'normal', 85, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'int4', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (76, '2021-04-12 20:56:32.640476+00', '2021-04-12 20:56:44.2182+00', 'anti_csrf_token', 'type/Text', NULL, true, 'Anti-CSRF token for full-app embed sessions.', true, 3, 51, NULL, 'Anti Cs Rf Token', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":1.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":0.0}}}', 5, 'text', 'auto-list', NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (286, '2021-04-12 20:56:33.766507+00', '2021-04-12 20:56:44.624641+00', 'is_update_data', 'type/Boolean', 'type/Category', true, NULL, true, 7, 52, NULL, 'Is Update Data', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (288, '2021-04-12 20:56:33.771834+00', '2021-04-12 20:56:44.628734+00', 'requests_recovery', 'type/Boolean', 'type/Category', true, NULL, true, 8, 52, NULL, 'Requests Recovery', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (289, '2021-04-12 20:56:33.775617+00', '2021-04-12 20:56:44.633723+00', 'is_nonconcurrent', 'type/Boolean', 'type/Category', true, NULL, true, 6, 52, NULL, 'Is Non Concurrent', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (290, '2021-04-12 20:56:33.777763+00', '2021-04-12 20:56:44.638972+00', 'job_data', 'type/*', 'type/Category', true, NULL, true, 9, 52, NULL, 'Job Data', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1,"nil%":0.0}}', 5, 'bytea', 'auto-list', NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (293, '2021-04-12 20:56:33.788407+00', '2021-04-12 20:56:44.644191+00', 'is_durable', 'type/Boolean', 'type/Category', true, NULL, true, 5, 52, NULL, 'Is Durable', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0}}', 5, 'bool', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (495, '2021-04-12 20:56:34.952645+00', '2021-04-12 20:56:44.939121+00', 'started_at', 'type/DateTime', 'type/CreationTimestamp', true, NULL, true, 3, 57, NULL, 'Started At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":18,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T17:53:31.25136Z","latest":"2021-04-12T17:56:36.313764Z"}}}', 5, 'timestamp', NULL, NULL, 3, 0);
INSERT INTO public.metabase_field VALUES (497, '2021-04-12 20:56:34.958167+00', '2021-04-12 20:56:44.942622+00', 'db_id', 'type/Integer', 'type/Category', true, NULL, true, 2, 57, NULL, 'Db ID', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2,"nil%":0.0},"type":{"type/Number":{"min":1.0,"q1":1.0,"q3":1.775255128608411,"max":2.0,"sd":0.48507125007266594,"avg":1.3333333333333333}}}', 5, 'int4', 'auto-list', NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (500, '2021-04-12 20:56:34.969303+00', '2021-04-12 20:56:44.945884+00', 'duration', 'type/Integer', 'type/Duration', true, NULL, true, 5, 57, NULL, 'Duration', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":16,"nil%":0.0},"type":{"type/Number":{"min":21.0,"q1":88.0,"q3":1305.0,"max":4423.0,"sd":1429.6165261232488,"avg":1108.6666666666667}}}', 5, 'int4', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (496, '2021-04-12 20:56:34.954711+00', '2021-04-12 20:56:44.116347+00', 'ended_at', 'type/DateTime', NULL, true, NULL, true, 4, 57, NULL, 'Ended At', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":18,"nil%":0.0},"type":{"type/DateTime":{"earliest":"2021-04-12T17:53:31.638852Z","latest":"2021-04-12T17:56:36.342949Z"}}}', 5, 'timestamp', NULL, NULL, 4, 0);
INSERT INTO public.metabase_field VALUES (498, '2021-04-12 20:56:34.960252+00', '2021-04-12 20:56:44.950448+00', 'task', 'type/Text', 'type/Category', true, 'Name of the task', true, 1, 57, NULL, 'Task', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":12,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":12.944444444444445}}}', 5, 'varchar', 'auto-list', NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (499, '2021-04-12 20:56:34.964669+00', '2021-04-12 20:56:44.95303+00', 'task_details', 'type/Text', 'type/Category', true, 'JSON string with additional info on the task', true, 6, 57, NULL, 'Task Details', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":13,"nil%":0.3333333333333333},"type":{"type/Text":{"percent-json":0.6666666666666667,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":97.55555555555556}}}', 5, 'text', 'auto-list', NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (434, '2021-04-12 20:56:34.536671+00', '2021-04-12 20:56:44.75122+00', 'JobSat', 'type/Text', 'type/Category', true, NULL, true, 20, 59, NULL, 'Job Sat', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":6,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":15.8507}}}', 5, 'text', 'auto-list', NULL, 20, 0);
INSERT INTO public.metabase_field VALUES (437, '2021-04-12 20:56:34.548746+00', '2021-04-12 20:56:44.757091+00', 'NEWStuck', 'type/Text', NULL, true, NULL, false, 41, 59, NULL, 'News Tuck', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":336,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":88.2315}}}', 5, 'text', NULL, NULL, 41, 0);
INSERT INTO public.metabase_field VALUES (439, '2021-04-12 20:56:34.557625+00', '2021-04-12 20:56:43.860346+00', 'PlatformDesireNextYear', 'type/Text', NULL, true, NULL, true, 44, 59, NULL, 'Platform Desire Next Year', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2593,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":29.8217}}}', 5, 'text', NULL, NULL, 44, 0);
INSERT INTO public.metabase_field VALUES (442, '2021-04-12 20:56:34.568146+00', '2021-04-12 20:56:43.875433+00', 'DatabaseDesireNextYear', 'type/Text', NULL, true, NULL, true, 12, 59, NULL, 'Database Desire Next Year', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1320,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":20.4075}}}', 5, 'text', NULL, NULL, 12, 0);
INSERT INTO public.metabase_field VALUES (444, '2021-04-12 20:56:34.574733+00', '2021-04-12 20:56:44.762273+00', 'Trans', 'type/Text', 'type/Category', true, NULL, true, 54, 59, NULL, 'Trans', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":3,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":2.0088}}}', 5, 'text', 'auto-list', NULL, 54, 0);
INSERT INTO public.metabase_field VALUES (452, '2021-04-12 20:56:34.607796+00', '2021-04-12 20:56:44.771998+00', 'NEWOtherComms', 'type/Text', 'type/Category', true, NULL, true, 36, 59, NULL, 'New Other Comms', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":3,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":2.4107}}}', 5, 'text', 'auto-list', NULL, 36, 0);
INSERT INTO public.metabase_field VALUES (454, '2021-04-12 20:56:34.617803+00', '2021-04-12 20:56:43.93453+00', 'Ethnicity', 'type/Text', NULL, true, NULL, true, 17, 59, NULL, 'Ethnicity', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":105,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":21.9884}}}', 5, 'text', NULL, NULL, 17, 0);
INSERT INTO public.metabase_field VALUES (458, '2021-04-12 20:56:34.630362+00', '2021-04-12 20:56:44.782213+00', 'WelcomeChange', 'type/Text', 'type/Category', true, NULL, true, 58, 59, NULL, 'Welcome Change', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":37.1173}}}', 5, 'text', 'auto-list', NULL, 58, 0);
INSERT INTO public.metabase_field VALUES (462, '2021-04-12 20:56:34.645966+00', '2021-04-12 20:56:43.970171+00', 'ConvertedComp', 'type/Text', NULL, true, NULL, true, 8, 59, NULL, 'Converted Comp', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2395,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":4.0059}}}', 5, 'text', NULL, NULL, 8, 0);
INSERT INTO public.metabase_field VALUES (464, '2021-04-12 20:56:34.654259+00', '2021-04-12 20:56:44.787887+00', 'YearsCodePro', 'type/Text', NULL, true, NULL, true, 61, 59, NULL, 'Years Code Pro', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":52,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":1.9031}}}', 5, 'text', 'auto-list', NULL, 61, 0);
INSERT INTO public.metabase_field VALUES (467, '2021-04-12 20:56:34.664436+00', '2021-04-12 20:56:43.996899+00', 'NEWCollabToolsWorkedWith', 'type/Text', NULL, true, NULL, true, 27, 59, NULL, 'Newco Ll Ab Tools Worked With', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":709,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":37.8338}}}', 5, 'text', NULL, NULL, 27, 0);
INSERT INTO public.metabase_field VALUES (469, '2021-04-12 20:56:34.670559+00', '2021-04-12 20:56:44.792907+00', 'SOVisitFreq', 'type/Text', 'type/Category', true, NULL, true, 51, 59, NULL, 'So Visit Fr Eq', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":22.1465}}}', 5, 'text', 'auto-list', NULL, 51, 0);
INSERT INTO public.metabase_field VALUES (471, '2021-04-12 20:56:34.679984+00', '2021-04-12 20:56:44.797762+00', 'NEWOffTopic', 'type/Text', 'type/Category', true, NULL, true, 34, 59, NULL, 'New Off Topic', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":4.176}}}', 5, 'text', 'auto-list', NULL, 34, 0);
INSERT INTO public.metabase_field VALUES (474, '2021-04-12 20:56:34.690951+00', '2021-04-12 20:56:44.802971+00', 'OrgSize', 'type/Text', 'type/Category', true, NULL, true, 43, 59, NULL, 'Org Size', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":10,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":17.6028}}}', 5, 'text', 'auto-list', NULL, 43, 0);
INSERT INTO public.metabase_field VALUES (476, '2021-04-12 20:56:34.697417+00', '2021-04-12 20:56:44.0391+00', 'Respondent', 'type/Text', NULL, true, NULL, true, 1, 59, NULL, 'Respondent', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":10001,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":3.899}}}', 5, 'text', NULL, NULL, 1, 0);
INSERT INTO public.metabase_field VALUES (478, '2021-04-12 20:56:34.703419+00', '2021-04-12 20:56:44.808624+00', 'NEWJobHuntResearch', 'type/Text', NULL, true, NULL, false, 32, 59, NULL, 'New Job Hunt Research', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":64,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":146.3606}}}', 5, 'text', 'auto-list', NULL, 32, 0);
INSERT INTO public.metabase_field VALUES (480, '2021-04-12 20:56:34.709093+00', '2021-04-12 20:56:44.813709+00', 'MainBranch', 'type/Text', 'type/Category', true, NULL, true, 2, 59, NULL, 'Main Branch', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":34.7336}}}', 5, 'text', 'auto-list', NULL, 2, 0);
INSERT INTO public.metabase_field VALUES (483, '2021-04-12 20:56:34.718994+00', '2021-04-12 20:56:44.818739+00', 'NEWJobHunt', 'type/Text', NULL, true, NULL, false, 31, 59, NULL, 'New Job Hunt', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1194,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":99.2534}}}', 5, 'text', NULL, NULL, 31, 0);
INSERT INTO public.metabase_field VALUES (485, '2021-04-12 20:56:34.730202+00', '2021-04-12 20:56:44.821319+00', 'Gender', 'type/Text', 'type/Category', true, NULL, true, 18, 59, NULL, 'Gender', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":8,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":3.5035}}}', 5, 'text', 'auto-list', NULL, 18, 0);
INSERT INTO public.metabase_field VALUES (487, '2021-04-12 20:56:34.740473+00', '2021-04-12 20:56:44.826563+00', 'Employment', 'type/Text', 'type/Category', true, NULL, true, 16, 59, NULL, 'Employment', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":8,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":20.4105}}}', 5, 'text', 'auto-list', NULL, 16, 0);
INSERT INTO public.metabase_field VALUES (490, '2021-04-12 20:56:34.756225+00', '2021-04-12 20:56:44.082476+00', 'WebframeDesireNextYear', 'type/Text', NULL, true, NULL, true, 56, 59, NULL, 'Web Frame Desire Next Year', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1385,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":16.5652}}}', 5, 'text', NULL, NULL, 56, 0);
INSERT INTO public.metabase_field VALUES (492, '2021-04-12 20:56:34.766343+00', '2021-04-12 20:56:44.830968+00', 'NEWPurpleLink', 'type/Text', 'type/Category', true, NULL, true, 39, 59, NULL, 'New Purple Link', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":12.4331}}}', 5, 'text', 'auto-list', NULL, 39, 0);
INSERT INTO public.metabase_field VALUES (433, '2021-04-12 20:56:34.53063+00', '2021-04-12 20:56:44.836179+00', 'Sexuality', 'type/Text', 'type/Category', true, NULL, true, 47, 59, NULL, 'Sexuality', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":15,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":18.5348}}}', 5, 'text', 'auto-list', NULL, 47, 0);
INSERT INTO public.metabase_field VALUES (435, '2021-04-12 20:56:34.541497+00', '2021-04-12 20:56:44.838801+00', 'DevType', 'type/Text', NULL, true, NULL, false, 14, 59, NULL, 'Dev Type', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2353,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":64.4624}}}', 5, 'text', NULL, NULL, 14, 0);
INSERT INTO public.metabase_field VALUES (436, '2021-04-12 20:56:34.546169+00', '2021-04-12 20:56:44.843768+00', 'NEWSOSites', 'type/Text', NULL, true, NULL, false, 40, 59, NULL, 'New Sos Ites', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":52,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":104.5164}}}', 5, 'text', 'auto-list', NULL, 40, 0);
INSERT INTO public.metabase_field VALUES (438, '2021-04-12 20:56:34.554053+00', '2021-04-12 20:56:44.847831+00', 'SOAccount', 'type/Text', 'type/Category', true, NULL, true, 48, 59, NULL, 'So Account', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":3.7234}}}', 5, 'text', 'auto-list', NULL, 48, 0);
INSERT INTO public.metabase_field VALUES (440, '2021-04-12 20:56:34.561998+00', '2021-04-12 20:56:44.852906+00', 'Country', 'type/Text', 'type/Country', true, NULL, true, 9, 59, NULL, 'Country', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":137,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0016,"average-length":9.3195}}}', 5, 'text', NULL, NULL, 9, 0);
INSERT INTO public.metabase_field VALUES (441, '2021-04-12 20:56:34.564218+00', '2021-04-12 20:56:44.855769+00', 'JobSeek', 'type/Text', 'type/Category', true, NULL, true, 21, 59, NULL, 'Job Seek', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":47.9831}}}', 5, 'text', 'auto-list', NULL, 21, 0);
INSERT INTO public.metabase_field VALUES (443, '2021-04-12 20:56:34.572366+00', '2021-04-12 20:56:44.860119+00', 'CompFreq', 'type/Text', 'type/Category', true, NULL, true, 6, 59, NULL, 'Comp Fr Eq', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":5.2112}}}', 5, 'text', 'auto-list', NULL, 6, 0);
INSERT INTO public.metabase_field VALUES (445, '2021-04-12 20:56:34.578907+00', '2021-04-12 20:56:43.890128+00', 'WebframeWorkedWith', 'type/Text', NULL, true, NULL, true, 57, 59, NULL, 'Web Frame Worked With', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1354,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":16.8961}}}', 5, 'text', NULL, NULL, 57, 0);
INSERT INTO public.metabase_field VALUES (446, '2021-04-12 20:56:34.582619+00', '2021-04-12 20:56:43.895174+00', 'MiscTechDesireNextYear', 'type/Text', NULL, true, NULL, true, 24, 59, NULL, 'Misc Tech Desire Next Year', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1682,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":19.3778}}}', 5, 'text', NULL, NULL, 24, 0);
INSERT INTO public.metabase_field VALUES (447, '2021-04-12 20:56:34.588121+00', '2021-04-12 20:56:44.865004+00', 'JobFactors', 'type/Text', NULL, true, NULL, false, 19, 59, NULL, 'Job Factors', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":220,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":111.8622}}}', 5, 'text', NULL, NULL, 19, 0);
INSERT INTO public.metabase_field VALUES (448, '2021-04-12 20:56:34.592614+00', '2021-04-12 20:56:44.869651+00', 'YearsCode', 'type/Text', NULL, true, NULL, true, 60, 59, NULL, 'Years Code', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":53,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":1.7711}}}', 5, 'text', 'auto-list', NULL, 60, 0);
INSERT INTO public.metabase_field VALUES (451, '2021-04-12 20:56:34.602998+00', '2021-04-12 20:56:44.880224+00', 'SurveyEase', 'type/Text', 'type/Category', true, NULL, true, 52, 59, NULL, 'Survey Ease', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":10.8986}}}', 5, 'text', 'auto-list', NULL, 52, 0);
INSERT INTO public.metabase_field VALUES (453, '2021-04-12 20:56:34.612909+00', '2021-04-12 20:56:44.885723+00', 'NEWOnboardGood', 'type/Text', 'type/Category', true, NULL, true, 35, 59, NULL, 'New Onboard Good', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":6.8553}}}', 5, 'text', 'auto-list', NULL, 35, 0);
INSERT INTO public.metabase_field VALUES (455, '2021-04-12 20:56:34.620384+00', '2021-04-12 20:56:43.939399+00', 'CompTotal', 'type/Text', NULL, true, NULL, true, 7, 59, NULL, 'Comp Total', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1068,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":4.0603}}}', 5, 'text', NULL, NULL, 7, 0);
INSERT INTO public.metabase_field VALUES (457, '2021-04-12 20:56:34.628138+00', '2021-04-12 20:56:43.949313+00', 'NEWCollabToolsDesireNextYear', 'type/Text', NULL, true, NULL, true, 26, 59, NULL, 'Newco Ll Ab Tools Desire Next Year', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":724,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":29.4249}}}', 5, 'text', NULL, NULL, 26, 0);
INSERT INTO public.metabase_field VALUES (459, '2021-04-12 20:56:34.634988+00', '2021-04-12 20:56:44.891442+00', 'SurveyLength', 'type/Text', 'type/Category', true, NULL, true, 53, 59, NULL, 'Survey Length', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":17.5119}}}', 5, 'text', 'auto-list', NULL, 53, 0);
INSERT INTO public.metabase_field VALUES (461, '2021-04-12 20:56:34.643625+00', '2021-04-12 20:56:44.894359+00', 'Age1stCode', 'type/Text', NULL, true, NULL, true, 5, 59, NULL, 'Ag E1st Code', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":52,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":2.0277}}}', 5, 'text', 'auto-list', NULL, 5, 0);
INSERT INTO public.metabase_field VALUES (463, '2021-04-12 20:56:34.650098+00', '2021-04-12 20:56:44.898536+00', 'SOComm', 'type/Text', 'type/Category', true, NULL, true, 49, 59, NULL, 'Soco Mm', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":12.3262}}}', 5, 'text', 'auto-list', NULL, 49, 0);
INSERT INTO public.metabase_field VALUES (465, '2021-04-12 20:56:34.65875+00', '2021-04-12 20:56:44.901026+00', 'NEWOvertime', 'type/Text', 'type/Category', true, NULL, true, 37, 59, NULL, 'New Overtime', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":6,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":32.0456}}}', 5, 'text', 'auto-list', NULL, 37, 0);
INSERT INTO public.metabase_field VALUES (466, '2021-04-12 20:56:34.660569+00', '2021-04-12 20:56:44.904944+00', 'SOPartFreq', 'type/Text', 'type/Category', true, NULL, true, 50, 59, NULL, 'Sop Art Fr Eq', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":28.7558}}}', 5, 'text', 'auto-list', NULL, 50, 0);
INSERT INTO public.metabase_field VALUES (468, '2021-04-12 20:56:34.666749+00', '2021-04-12 20:56:44.90773+00', 'EdLevel', 'type/Text', 'type/Category', true, NULL, true, 15, 59, NULL, 'Ed Level', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":10,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":46.3826}}}', 5, 'text', 'auto-list', NULL, 15, 0);
INSERT INTO public.metabase_field VALUES (470, '2021-04-12 20:56:34.67492+00', '2021-04-12 20:56:44.011272+00', 'CurrencySymbol', 'type/Text', NULL, true, NULL, true, 11, 59, NULL, 'Currency Symbol', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":107,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":2.8182}}}', 5, 'text', NULL, NULL, 11, 0);
INSERT INTO public.metabase_field VALUES (472, '2021-04-12 20:56:34.682594+00', '2021-04-12 20:56:44.021503+00', 'LanguageWorkedWith', 'type/Text', NULL, true, NULL, true, 23, 59, NULL, 'Language Worked With', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":3891,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":36.6384}}}', 5, 'text', NULL, NULL, 23, 0);
INSERT INTO public.metabase_field VALUES (473, '2021-04-12 20:56:34.686982+00', '2021-04-12 20:56:44.026946+00', 'CurrencyDesc', 'type/Text', NULL, true, NULL, true, 10, 59, NULL, 'Currency Desc', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":107,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":13.3743}}}', 5, 'text', NULL, NULL, 10, 0);
INSERT INTO public.metabase_field VALUES (477, '2021-04-12 20:56:34.701249+00', '2021-04-12 20:56:44.916561+00', 'NEWDevOpsImpt', 'type/Text', 'type/Category', true, NULL, true, 29, 59, NULL, 'New Dev Ops Im Pt', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":6,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":13.2388}}}', 5, 'text', 'auto-list', NULL, 29, 0);
INSERT INTO public.metabase_field VALUES (479, '2021-04-12 20:56:34.707025+00', '2021-04-12 20:56:44.050854+00', 'DatabaseWorkedWith', 'type/Text', NULL, true, NULL, true, 13, 59, NULL, 'Database Worked With', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":1213,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":22.6172}}}', 5, 'text', NULL, NULL, 13, 0);
INSERT INTO public.metabase_field VALUES (481, '2021-04-12 20:56:34.712799+00', '2021-04-12 20:56:44.919645+00', 'NEWDevOps', 'type/Text', 'type/Category', true, NULL, true, 28, 59, NULL, 'New Dev Ops', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":2.9172}}}', 5, 'text', 'auto-list', NULL, 28, 0);
INSERT INTO public.metabase_field VALUES (482, '2021-04-12 20:56:34.714813+00', '2021-04-12 20:56:44.061363+00', 'LanguageDesireNextYear', 'type/Text', NULL, true, NULL, true, 22, 59, NULL, 'Language Desire Next Year', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4340,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":28.8719}}}', 5, 'text', NULL, NULL, 22, 0);
INSERT INTO public.metabase_field VALUES (484, '2021-04-12 20:56:34.725435+00', '2021-04-12 20:56:44.067265+00', 'MiscTechWorkedWith', 'type/Text', NULL, true, NULL, true, 25, 59, NULL, 'Misc Tech Worked With', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":935,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":13.2391}}}', 5, 'text', NULL, NULL, 25, 0);
INSERT INTO public.metabase_field VALUES (486, '2021-04-12 20:56:34.735151+00', '2021-04-12 20:56:44.923205+00', 'UndergradMajor', 'type/Text', 'type/Category', true, NULL, true, 55, 59, NULL, 'Undergrad Major', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":13,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":55.5269}}}', 5, 'text', 'auto-list', NULL, 55, 0);
INSERT INTO public.metabase_field VALUES (488, '2021-04-12 20:56:34.7462+00', '2021-04-12 20:56:44.927224+00', 'OpSys', 'type/Text', 'type/Category', true, NULL, true, 42, 59, NULL, 'Op Sys', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":7.3793}}}', 5, 'text', 'auto-list', NULL, 42, 0);
INSERT INTO public.metabase_field VALUES (489, '2021-04-12 20:56:34.751086+00', '2021-04-12 20:56:44.080706+00', 'PlatformWorkedWith', 'type/Text', NULL, true, NULL, true, 45, 59, NULL, 'Platform Worked With', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":2236,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":26.4653}}}', 5, 'text', NULL, NULL, 45, 0);
INSERT INTO public.metabase_field VALUES (491, '2021-04-12 20:56:34.761172+00', '2021-04-12 20:56:44.931579+00', 'NEWLearn', 'type/Text', 'type/Category', true, NULL, true, 33, 59, NULL, 'New Learn', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":14.5839}}}', 5, 'text', 'auto-list', NULL, 33, 0);
INSERT INTO public.metabase_field VALUES (493, '2021-04-12 20:56:34.771407+00', '2021-04-12 20:56:44.93486+00', 'NEWEdImpt', 'type/Text', 'type/Category', true, NULL, true, 30, 59, NULL, 'Newed Im Pt', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":6,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":16.8316}}}', 5, 'text', 'auto-list', NULL, 30, 0);
INSERT INTO public.metabase_field VALUES (449, '2021-04-12 20:56:34.597308+00', '2021-04-12 20:56:44.767499+00', 'NEWPurchaseResearch', 'type/Text', NULL, true, NULL, false, 38, 59, NULL, 'New Purchase Research', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":63,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":62.7045}}}', 5, 'text', 'auto-list', NULL, 38, 0);
INSERT INTO public.metabase_field VALUES (475, '2021-04-12 20:56:34.695505+00', '2021-04-12 20:56:44.91297+00', 'PurchaseWhat', 'type/Text', 'type/Category', true, NULL, true, 46, 59, NULL, 'Purchase What', 'normal', NULL, '2021-04-12 20:56:45.230608+00', NULL, NULL, '{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":19.6454}}}', 5, 'text', 'auto-list', NULL, 46, 0);


--
-- TOC entry 3687 (class 0 OID 28810)
-- Dependencies: 214
-- Data for Name: metabase_fieldvalues; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.metabase_fieldvalues VALUES (1, '2021-04-12 20:53:36.879303+00', '2021-04-12 20:53:36.879303+00', '[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,63,65,67,68,69,70,71,72,73,75,78,82,83,88,100]', NULL, 2);
INSERT INTO public.metabase_fieldvalues VALUES (2, '2021-04-12 20:53:36.913048+00', '2021-04-12 20:53:36.913048+00', '["Affiliate","Facebook","Google","Organic","Twitter"]', NULL, 18);
INSERT INTO public.metabase_fieldvalues VALUES (3, '2021-04-12 20:53:36.930605+00', '2021-04-12 20:53:36.930605+00', '["AK","AL","AR","AZ","CA","CO","CT","DE","FL","GA","IA","ID","IL","IN","KS","KY","LA","MA","MD","ME","MI","MN","MO","MS","MT","NC","ND","NE","NH","NJ","NM","NV","NY","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VA","VT","WA","WI","WV","WY"]', NULL, 17);
INSERT INTO public.metabase_fieldvalues VALUES (4, '2021-04-12 20:53:36.948205+00', '2021-04-12 20:53:36.948205+00', '["Doohickey","Gadget","Gizmo","Widget"]', NULL, 26);
INSERT INTO public.metabase_fieldvalues VALUES (5, '2021-04-12 20:53:36.972118+00', '2021-04-12 20:53:36.972118+00', '[1,2,3,4,5]', NULL, 31);
INSERT INTO public.metabase_fieldvalues VALUES (6, '2021-04-12 20:56:45.265579+00', '2021-04-12 20:56:45.265579+00', '[null]', NULL, 39);
INSERT INTO public.metabase_fieldvalues VALUES (7, '2021-04-12 20:56:45.287178+00', '2021-04-12 20:56:45.287178+00', '["{}"]', NULL, 42);
INSERT INTO public.metabase_fieldvalues VALUES (8, '2021-04-12 20:56:45.304891+00', '2021-04-12 20:56:45.304891+00', '["install","user-joined"]', NULL, 40);
INSERT INTO public.metabase_fieldvalues VALUES (9, '2021-04-12 20:56:45.322864+00', '2021-04-12 20:56:45.322864+00', '[null]', NULL, 41);
INSERT INTO public.metabase_fieldvalues VALUES (10, '2021-04-12 20:56:45.342424+00', '2021-04-12 20:56:45.342424+00', '["install","user"]', NULL, 43);
INSERT INTO public.metabase_fieldvalues VALUES (11, '2021-04-12 20:56:45.361464+00', '2021-04-12 20:56:45.361464+00', '[1,null]', NULL, 46);
INSERT INTO public.metabase_fieldvalues VALUES (12, '2021-04-12 20:56:45.382011+00', '2021-04-12 20:56:45.382011+00', '[null]', NULL, 38);
INSERT INTO public.metabase_fieldvalues VALUES (13, '2021-04-12 20:56:45.40539+00', '2021-04-12 20:56:45.40539+00', '["#31698A"]', NULL, 51);
INSERT INTO public.metabase_fieldvalues VALUES (14, '2021-04-12 20:56:45.420082+00', '2021-04-12 20:56:45.420082+00', '[false]', NULL, 53);
INSERT INTO public.metabase_fieldvalues VALUES (15, '2021-04-12 20:56:45.437413+00', '2021-04-12 20:56:45.437413+00', '[null]', NULL, 58);
INSERT INTO public.metabase_fieldvalues VALUES (16, '2021-04-12 20:56:45.453556+00', '2021-04-12 20:56:45.453556+00', '["/"]', NULL, 52);
INSERT INTO public.metabase_fieldvalues VALUES (17, '2021-04-12 20:56:45.470165+00', '2021-04-12 20:56:45.470165+00', '[null]', NULL, 56);
INSERT INTO public.metabase_fieldvalues VALUES (18, '2021-04-12 20:56:45.486458+00', '2021-04-12 20:56:45.486458+00', '["Coleção pessoal de Guilherne almeida"]', NULL, 50);
INSERT INTO public.metabase_fieldvalues VALUES (19, '2021-04-12 20:56:45.501454+00', '2021-04-12 20:56:45.501454+00', '["colecao_pessoal_de_guilherne_almeida"]', NULL, 57);
INSERT INTO public.metabase_fieldvalues VALUES (20, '2021-04-12 20:56:45.527966+00', '2021-04-12 20:56:45.527966+00', '[null]', NULL, 76);
INSERT INTO public.metabase_fieldvalues VALUES (21, '2021-04-12 20:56:45.545424+00', '2021-04-12 20:56:45.545424+00', '[true]', NULL, 79);
INSERT INTO public.metabase_fieldvalues VALUES (22, '2021-04-12 20:56:45.560193+00', '2021-04-12 20:56:45.560193+00', '[false]', NULL, 78);
INSERT INTO public.metabase_fieldvalues VALUES (23, '2021-04-12 20:56:45.575898+00', '2021-04-12 20:56:45.575898+00', '["$2a$10$JF8GMHIqU4A2iKopjwE.Z.7pkFbj5Es8iokhJwnOpeBu0LThCmuqC"]', NULL, 77);
INSERT INTO public.metabase_fieldvalues VALUES (24, '2021-04-12 20:56:45.590569+00', '2021-04-12 20:56:45.590569+00', '[null]', NULL, 84);
INSERT INTO public.metabase_fieldvalues VALUES (25, '2021-04-12 20:56:45.604126+00', '2021-04-12 20:56:45.604126+00', '["user@email.com"]', NULL, 86);
INSERT INTO public.metabase_fieldvalues VALUES (26, '2021-04-12 20:56:45.616969+00', '2021-04-12 20:56:45.616969+00', '[true]', NULL, 88);
INSERT INTO public.metabase_fieldvalues VALUES (27, '2021-04-12 20:56:45.629442+00', '2021-04-12 20:56:45.629442+00', '[true]', NULL, 90);
INSERT INTO public.metabase_fieldvalues VALUES (28, '2021-04-12 20:56:45.642193+00', '2021-04-12 20:56:45.642193+00', '[null]', NULL, 91);
INSERT INTO public.metabase_fieldvalues VALUES (29, '2021-04-12 20:56:45.655357+00', '2021-04-12 20:56:45.655357+00', '[false]', NULL, 95);
INSERT INTO public.metabase_fieldvalues VALUES (30, '2021-04-12 20:56:45.669978+00', '2021-04-12 20:56:45.669978+00', '["Guilherne"]', NULL, 82);
INSERT INTO public.metabase_fieldvalues VALUES (31, '2021-04-12 20:56:45.683351+00', '2021-04-12 20:56:45.683351+00', '[null]', NULL, 83);
INSERT INTO public.metabase_fieldvalues VALUES (32, '2021-04-12 20:56:45.697271+00', '2021-04-12 20:56:45.697271+00', '[null]', NULL, 89);
INSERT INTO public.metabase_fieldvalues VALUES (33, '2021-04-12 20:56:45.709662+00', '2021-04-12 20:56:45.709662+00', '[null]', NULL, 93);
INSERT INTO public.metabase_fieldvalues VALUES (34, '2021-04-12 20:56:45.724693+00', '2021-04-12 20:56:45.724693+00', '["e6069ad6-35e1-4543-933f-92737e7f3efb"]', NULL, 94);
INSERT INTO public.metabase_fieldvalues VALUES (35, '2021-04-12 20:56:45.739851+00', '2021-04-12 20:56:45.739851+00', '["almeida"]', NULL, 92);
INSERT INTO public.metabase_fieldvalues VALUES (36, '2021-04-12 20:56:45.776757+00', '2021-04-12 20:56:45.776757+00', '[null]', NULL, 128);
INSERT INTO public.metabase_fieldvalues VALUES (37, '2021-04-12 20:56:45.79081+00', '2021-04-12 20:56:45.79081+00', '["paulao da massa","Sample Dataset"]', NULL, 132);
INSERT INTO public.metabase_fieldvalues VALUES (38, '2021-04-12 20:56:45.811351+00', '2021-04-12 20:56:45.811351+00', '[null]', NULL, 134);
INSERT INTO public.metabase_fieldvalues VALUES (39, '2021-04-12 20:56:45.830776+00', '2021-04-12 20:56:45.830776+00', '[true]', NULL, 140);
INSERT INTO public.metabase_fieldvalues VALUES (40, '2021-04-12 20:56:45.853579+00', '2021-04-12 20:56:45.853579+00', '[null]', NULL, 136);
INSERT INTO public.metabase_fieldvalues VALUES (41, '2021-04-12 20:56:45.871446+00', '2021-04-12 20:56:45.871446+00', '[null]', NULL, 138);
INSERT INTO public.metabase_fieldvalues VALUES (42, '2021-04-12 20:56:45.887647+00', '2021-04-12 20:56:45.887647+00', '[false,true]', NULL, 139);
INSERT INTO public.metabase_fieldvalues VALUES (43, '2021-04-12 20:56:45.904257+00', '2021-04-12 20:56:45.904257+00', '["America/Sao_Paulo",null]', NULL, 142);
INSERT INTO public.metabase_fieldvalues VALUES (44, '2021-04-12 20:56:45.923263+00', '2021-04-12 20:56:45.923263+00', '[null]', NULL, 144);
INSERT INTO public.metabase_fieldvalues VALUES (45, '2021-04-12 20:56:45.938632+00', '2021-04-12 20:56:45.938632+00', '["0 50 0 * * ? *"]', NULL, 127);
INSERT INTO public.metabase_fieldvalues VALUES (46, '2021-04-12 20:56:45.951051+00', '2021-04-12 20:56:45.951051+00', '["{\"db\":\"zip:/app/metabase.jar!/sample-dataset.db;USER=GUEST;PASSWORD=guest\"}","{\"host\":\"pgsql\",\"port\":null,\"dbname\":\"postgres\",\"user\":\"postgres\",\"password\":\"desafio_modulo_3\",\"ssl\":false,\"additional-options\":null,\"tunnel-enabled\":false}"]', NULL, 137);
INSERT INTO public.metabase_fieldvalues VALUES (47, '2021-04-12 20:56:45.962837+00', '2021-04-12 20:56:45.962837+00', '["h2","postgres"]', NULL, 141);
INSERT INTO public.metabase_fieldvalues VALUES (48, '2021-04-12 20:56:45.973938+00', '2021-04-12 20:56:45.973938+00', '[true]', NULL, 131);
INSERT INTO public.metabase_fieldvalues VALUES (49, '2021-04-12 20:56:45.986653+00', '2021-04-12 20:56:45.986653+00', '["0 50 * * * ? *"]', NULL, 130);
INSERT INTO public.metabase_fieldvalues VALUES (50, '2021-04-12 20:56:45.999435+00', '2021-04-12 20:56:45.999435+00', '[false]', NULL, 143);
INSERT INTO public.metabase_fieldvalues VALUES (51, '2021-04-12 20:56:46.017067+00', '2021-04-12 20:56:46.017067+00', '[true]', NULL, 145);
INSERT INTO public.metabase_fieldvalues VALUES (52, '2021-04-12 20:56:46.032509+00', '2021-04-12 20:56:46.032509+00', '[0]', NULL, 147);
INSERT INTO public.metabase_fieldvalues VALUES (53, '2021-04-12 20:56:46.047315+00', '2021-04-12 20:56:46.047315+00', '["normal"]', NULL, 149);
INSERT INTO public.metabase_fieldvalues VALUES (54, '2021-04-12 20:56:46.062101+00', '2021-04-12 20:56:46.062101+00', '[null]', NULL, 153);
INSERT INTO public.metabase_fieldvalues VALUES (55, '2021-04-12 20:56:46.073993+00', '2021-04-12 20:56:46.073993+00', '[false,true]', NULL, 154);
INSERT INTO public.metabase_fieldvalues VALUES (56, '2021-04-12 20:56:46.08604+00', '2021-04-12 20:56:46.08604+00', '[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61]', NULL, 160);
INSERT INTO public.metabase_fieldvalues VALUES (57, '2021-04-12 20:56:46.099614+00', '2021-04-12 20:56:46.099614+00', '["type/Category","type/City","type/Company","type/Country","type/CreationTimestamp","type/Description","type/Discount","type/Duration","type/Email","type/FK","type/JoinTimestamp","type/Latitude","type/Longitude","type/Name","type/PK","type/Quantity","type/Score","type/SerializedJSON","type/Source","type/State","type/Title","type/UpdatedTimestamp","type/ZipCode",null]', NULL, 164);
INSERT INTO public.metabase_fieldvalues VALUES (58, '2021-04-12 20:56:46.110857+00', '2021-04-12 20:56:46.110857+00', '[null]', NULL, 166);
INSERT INTO public.metabase_fieldvalues VALUES (59, '2021-04-12 20:56:46.121682+00', '2021-04-12 20:56:46.121682+00', '["type/*","type/BigInteger","type/Boolean","type/Date","type/DateTime","type/DateTimeWithLocalTZ","type/Decimal","type/Float","type/Integer","type/Text"]', NULL, 168);
INSERT INTO public.metabase_fieldvalues VALUES (60, '2021-04-12 20:56:46.132042+00', '2021-04-12 20:56:46.132042+00', '[22,30,55,61,85,125,133,162,184,197,221,232,248,284,285,292,327,330,336,366,390,403,null]', NULL, 146);
INSERT INTO public.metabase_fieldvalues VALUES (61, '2021-04-12 20:56:46.142649+00', '2021-04-12 20:56:46.142649+00', '[0,5]', NULL, 148);
INSERT INTO public.metabase_fieldvalues VALUES (62, '2021-04-12 20:56:46.153456+00', '2021-04-12 20:56:46.153456+00', '[null]', NULL, 151);
INSERT INTO public.metabase_fieldvalues VALUES (63, '2021-04-12 20:56:46.175407+00', '2021-04-12 20:56:46.175407+00', '["auto-list",null]', NULL, 161);
INSERT INTO public.metabase_fieldvalues VALUES (64, '2021-04-12 20:56:46.187714+00', '2021-04-12 20:56:46.187714+00', '["BIGINT","bool","bpchar","bytea","CHAR","citext","CLOB","DATE","DOUBLE","int2","int4","int8","INTEGER","numeric","serial","SMALLINT","text","timestamp","TIMESTAMP","timestamptz","varchar","VARCHAR"]', NULL, 169);
INSERT INTO public.metabase_fieldvalues VALUES (65, '2021-04-12 20:56:46.19998+00', '2021-04-12 20:56:46.19998+00', '[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61]', NULL, 152);
INSERT INTO public.metabase_fieldvalues VALUES (96, '2021-04-12 20:56:46.724431+00', '2021-04-12 20:56:46.724431+00', '["CRON"]', NULL, 328);
INSERT INTO public.metabase_fieldvalues VALUES (97, '2021-04-12 20:56:46.740735+00', '2021-04-12 20:56:46.740735+00', '[0,1,2]', NULL, 332);
INSERT INTO public.metabase_fieldvalues VALUES (98, '2021-04-12 20:56:46.755137+00', '2021-04-12 20:56:46.755137+00', '["0x","0xACED0005","0xACED0005"]', NULL, 333);
INSERT INTO public.metabase_fieldvalues VALUES (99, '2021-04-12 20:56:46.768814+00', '2021-04-12 20:56:46.768814+00', '[null]', NULL, 335);
INSERT INTO public.metabase_fieldvalues VALUES (100, '2021-04-12 20:56:46.781294+00', '2021-04-12 20:56:46.781294+00', '[5]', NULL, 334);
INSERT INTO public.metabase_fieldvalues VALUES (101, '2021-04-12 20:56:46.794577+00', '2021-04-12 20:56:46.794577+00', '[0]', NULL, 337);
INSERT INTO public.metabase_fieldvalues VALUES (102, '2021-04-12 20:56:46.8115+00', '2021-04-12 20:56:46.8115+00', '["sync-and-analyze Database 1","sync-and-analyze Database 2","update-field-values Database 1","update-field-values Database 2",null]', NULL, 329);
INSERT INTO public.metabase_fieldvalues VALUES (103, '2021-04-12 20:56:46.826241+00', '2021-04-12 20:56:46.826241+00', '[1618260811000,1618260991000]', NULL, 331);
INSERT INTO public.metabase_fieldvalues VALUES (104, '2021-04-12 20:56:46.910174+00', '2021-04-12 20:56:46.910174+00', '["2021-04-12 17:56:31.750561-03","Blog do Haynes","false","http://localhost:3000","pt","true","user@email.com"]', NULL, 431);
INSERT INTO public.metabase_fieldvalues VALUES (105, '2021-04-12 20:56:46.9842+00', '2021-04-12 20:56:46.9842+00', '["NA","No","Yes"]', NULL, 432);
INSERT INTO public.metabase_fieldvalues VALUES (106, '2021-04-12 20:56:47.10514+00', '2021-04-12 20:56:47.10514+00', '["NA","Neither satisfied nor dissatisfied","Slightly dissatisfied","Slightly satisfied","Very dissatisfied","Very satisfied"]', NULL, 434);
INSERT INTO public.metabase_fieldvalues VALUES (107, '2021-04-12 20:56:47.171475+00', '2021-04-12 20:56:47.171475+00', '["NA","No","Yes"]', NULL, 444);
INSERT INTO public.metabase_fieldvalues VALUES (108, '2021-04-12 20:56:47.23462+00', '2021-04-12 20:56:47.23462+00', '["NA","No","Yes"]', NULL, 452);
INSERT INTO public.metabase_fieldvalues VALUES (66, '2021-04-12 20:56:46.215432+00', '2021-04-12 20:56:46.215432+00', '["[\"/\"]","[\"{}\"]","[\"$2a$10$JF8GMHIqU4A2iKopjwE.Z.7pkFbj5Es8iokhJwnOpeBu0LThCmuqC\"]","[0]","[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61]","[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,63,65,67,68,69,70,71,72,73,75,78,82,83,88,100]","[0,5]","[\"0 50 * * * ? *\"]","[\"0 50 0 * * ? *\"]","[1,2,3,4,5]","[1,null]","[22,30,55,61,85,125,133,162,184,197,221,232,248,284,285,292,327,330,336,366,390,403,null]","[\"#31698A\"]","[\"Affiliate\",\"Facebook\",\"Google\",\"Organic\",\"Twitter\"]","[\"AK\",\"AL\",\"AR\",\"AZ\",\"CA\",\"CO\",\"CT\",\"DE\",\"FL\",\"GA\",\"IA\",\"ID\",\"IL\",\"IN\",\"KS\",\"KY\",\"LA\",\"MA\",\"MD\",\"ME\",\"MI\",\"MN\",\"MO\",\"MS\",\"MT\",\"NC\",\"ND\",\"NE\",\"NH\",\"NJ\",\"NM\",\"NV\",\"NY\",\"OH\",\"OK\",\"OR\",\"PA\",\"RI\",\"SC\",\"SD\",\"TN\",\"TX\",\"UT\",\"VA\",\"VT\",\"WA\",\"WI\",\"WV\",\"WY\"]","[\"almeida\"]","[\"America/Sao_Paulo\",null]","[\"auto-list\",null]","[\"BIGINT\",\"bool\",\"bpchar\",\"bytea\",\"CHAR\",\"citext\",\"CLOB\",\"DATE\",\"DOUBLE\",\"int2\",\"int4\",\"int8\",\"INTEGER\",\"numeric\",\"serial\",\"SMALLINT\",\"text\",\"timestamp\",\"TIMESTAMP\",\"timestamptz\",\"varchar\",\"VARCHAR\"]","[\"colecao_pessoal_de_guilherne_almeida\"]","[\"Coleção pessoal de Guilherne almeida\"]","[\"{\\\"db\\\":\\\"zip:/app/metabase.jar!/sample-dataset.db;USER=GUEST;PASSWORD=guest\\\"}\",\"{\\\"host\\\":\\\"pgsql\\\",\\\"port\\\":null,\\\"dbname\\\":\\\"postgres\\\",\\\"user\\\":\\\"postgres\\\",\\\"password\\\":\\\"desafio_modulo_3\\\",\\\"ssl\\\":false,\\\"additional-options\\\":null,\\\"tunnel-enabled\\\":false}\"]","[\"Doohickey\",\"Gadget\",\"Gizmo\",\"Widget\"]","[\"e6069ad6-35e1-4543-933f-92737e7f3efb\"]","[false]","[false,true]","[\"Guilherne\"]","[\"h2\",\"postgres\"]","[\"install\",\"user\"]","[\"install\",\"user-joined\"]","[\"normal\"]","[null]","[\"paulao da massa\",\"Sample Dataset\"]","[true]","[\"type/Category\",\"type/City\",\"type/Company\",\"type/Country\",\"type/CreationTimestamp\",\"type/Description\",\"type/Discount\",\"type/Duration\",\"type/Email\",\"type/FK\",\"type/JoinTimestamp\",\"type/Latitude\",\"type/Longitude\",\"type/Name\",\"type/PK\",\"type/Quantity\",\"type/Score\",\"type/SerializedJSON\",\"type/Source\",\"type/State\",\"type/Title\",\"type/UpdatedTimestamp\",\"type/ZipCode\",null]","[\"type/*\",\"type/BigInteger\",\"type/Boolean\",\"type/Date\",\"type/DateTime\",\"type/DateTimeWithLocalTZ\",\"type/Decimal\",\"type/Float\",\"type/Integer\",\"type/Text\"]","[\"user@email.com\"]"]', NULL, 172);
INSERT INTO public.metabase_fieldvalues VALUES (67, '2021-04-12 20:56:46.229463+00', '2021-04-12 20:56:46.229463+00', '[null]', NULL, 171);
INSERT INTO public.metabase_fieldvalues VALUES (68, '2021-04-12 20:56:46.246+00', '2021-04-12 20:56:46.246+00', '["entity/EventTable","entity/GenericTable","entity/ProductTable","entity/TransactionTable","entity/UserTable",null]', NULL, 190);
INSERT INTO public.metabase_fieldvalues VALUES (69, '2021-04-12 20:56:46.260232+00', '2021-04-12 20:56:46.260232+00', '["database"]', NULL, 177);
INSERT INTO public.metabase_fieldvalues VALUES (70, '2021-04-12 20:56:46.272913+00', '2021-04-12 20:56:46.272913+00', '["activity","card_label","collection","collection_revision","computation_job","computation_job_result","core_session","core_user","dashboardcard_series","dashboard_favorite","databasechangelog","databasechangeloglock","data_migrations","dependency","dimension","group_table_access_policy","label","metabase_database","metabase_field","metabase_fieldvalues","metabase_table","metric","metric_important_field","native_query_snippet","ORDERS","PEOPLE","permissions","permissions_group","permissions_group_membership","permissions_revision","PRODUCTS","pulse","pulse_card","pulse_channel","pulse_channel_recipient","qrtz_blob_triggers","qrtz_calendars","qrtz_cron_triggers","qrtz_fired_triggers","qrtz_job_details","qrtz_locks","qrtz_paused_trigger_grps","qrtz_scheduler_state","qrtz_simple_triggers","qrtz_simprop_triggers","qrtz_triggers","query","query_cache","query_execution","report_card","report_cardfavorite","report_dashboard","report_dashboardcard","REVIEWS","revision","segment","setting","survey_results_public","task_history","view_log"]', NULL, 182);
INSERT INTO public.metabase_fieldvalues VALUES (71, '2021-04-12 20:56:46.285239+00', '2021-04-12 20:56:46.285239+00', '[null]', NULL, 185);
INSERT INTO public.metabase_fieldvalues VALUES (72, '2021-04-12 20:56:46.297131+00', '2021-04-12 20:56:46.297131+00', '[false]', NULL, 189);
INSERT INTO public.metabase_fieldvalues VALUES (73, '2021-04-12 20:56:46.308944+00', '2021-04-12 20:56:46.308944+00', '["A log of executed queries, used for calculating historic execution times, auditing, and other purposes.","Cached results of queries are stored here when using the DB-based query cache.","Collections are an optional way to organize Cards and handle permissions for them.","Information (such as average execution time) for different queries that have been previously ran.","Presence of a row here indicates a given User has favorited a given Dashboard.","Query snippets (raw text) to be substituted in native queries","Records that a given Card (Question) should automatically replace a given Table as query source for a given a Perms Group.","Stores references to alternate views of existing fields, such as remapping an integer to a description, like an enum","Stores results of async computation jobs.","Stores submitted async computation jobs.","These are reviews our customers have left on products. Note that these are not tied to orders so it is possible people have reviewed products they did not purchase from us.","This is a confirmed order for a product from a user.","This is a user account. Note that employees and customer support staff will have accounts.","This is our product catalog. It includes all products ever sold by the Sample Company.","Timing and metadata info about background/quartz processes","Used for Quartz scheduler.","Used to keep track of changes made to collections.","Used to keep track of changes made to permissions.",null]', NULL, 191);
INSERT INTO public.metabase_fieldvalues VALUES (74, '2021-04-12 20:56:46.321865+00', '2021-04-12 20:56:46.321865+00', '[true]', NULL, 180);
INSERT INTO public.metabase_fieldvalues VALUES (75, '2021-04-12 20:56:46.334626+00', '2021-04-12 20:56:46.334626+00', '["public","PUBLIC"]', NULL, 181);
INSERT INTO public.metabase_fieldvalues VALUES (76, '2021-04-12 20:56:46.347579+00', '2021-04-12 20:56:46.347579+00', '[null]', NULL, 186);
INSERT INTO public.metabase_fieldvalues VALUES (77, '2021-04-12 20:56:46.358787+00', '2021-04-12 20:56:46.358787+00', '[null]', NULL, 187);
INSERT INTO public.metabase_fieldvalues VALUES (78, '2021-04-12 20:56:46.370704+00', '2021-04-12 20:56:46.370704+00', '["Activity","Card Label","Collection","Collection Revision","Computation Job","Computation Job Result","Core Session","Core User","Dashboard Card Series","Dashboard Favorite","Database Changelog","Database Changelog Lock","Data Migrations","Dependency","Dimension","Group Table Access Policy","Label","Metabase Database","Metabase Field","Metabase Field Values","Metabase Table","Metric","Metric Important Field","Native Query Snippet","Orders","People","Permissions","Permissions Group","Permissions Group Membership","Permissions Revision","Products","Pulse","Pulse Card","Pulse Channel","Pulse Channel Recipient","Qr Tz Blob Triggers","Qr Tz Calendars","Qr Tz Cr On Triggers","Qr Tz Fired Triggers","Qr Tz Job Details","Qr Tz Locks","Qr Tz Paused Trigger Gr Ps","Qr Tz Scheduler State","Qr Tz Simple Triggers","Qr Tz Sim Prop Triggers","Qr Tz Triggers","Query","Query Cache","Query Execution","Report Card","Report Card Favorite","Report Dashboard","Report Dashboard Card","Reviews","Revision","Segment","Setting","Survey Results Public","Task History","View Log"]', NULL, 179);
INSERT INTO public.metabase_fieldvalues VALUES (79, '2021-04-12 20:56:46.385441+00', '2021-04-12 20:56:46.385441+00', '["cruft",null]', NULL, 183);
INSERT INTO public.metabase_fieldvalues VALUES (80, '2021-04-12 20:56:46.411688+00', '2021-04-12 20:56:46.411688+00', '["/","/collection/root/","/db/1/","/db/2/"]', NULL, 217);
INSERT INTO public.metabase_fieldvalues VALUES (81, '2021-04-12 20:56:46.426345+00', '2021-04-12 20:56:46.426345+00', '["Administrators","All Users","MetaBot"]', NULL, 220);
INSERT INTO public.metabase_fieldvalues VALUES (82, '2021-04-12 20:56:46.468287+00', '2021-04-12 20:56:46.468287+00', '["America/Sao_Paulo"]', NULL, 268);
INSERT INTO public.metabase_fieldvalues VALUES (83, '2021-04-12 20:56:46.486622+00', '2021-04-12 20:56:46.486622+00', '["0 0 * * * ? *","0 0 12 * * ? *","0 15 6,18 * * ? *","0 15 7 * * ? *","0 50 * * * ? *","0 50 0 * * ? *"]', NULL, 266);
INSERT INTO public.metabase_fieldvalues VALUES (84, '2021-04-12 20:56:46.515399+00', '2021-04-12 20:56:46.515399+00', '["metabase.task.follow_up_emails.AbandonmentEmail","metabase.task.follow_up_emails.FollowUpEmail","metabase.task.send_anonymous_stats.SendAnonymousUsageStats","metabase.task.send_pulses.SendPulses","metabase.task.sync_databases.SyncAndAnalyzeDatabase","metabase.task.sync_databases.UpdateFieldValues","metabase.task.task_history_cleanup.TaskHistoryCleanup","metabase.task.upgrade_checks.CheckForNewVersions"]', NULL, 287);
INSERT INTO public.metabase_fieldvalues VALUES (85, '2021-04-12 20:56:46.532022+00', '2021-04-12 20:56:46.532022+00', '["sync-and-analyze for all databases","update-field-values for all databases",null]', NULL, 291);
INSERT INTO public.metabase_fieldvalues VALUES (86, '2021-04-12 20:56:46.548079+00', '2021-04-12 20:56:46.548079+00', '[false]', NULL, 286);
INSERT INTO public.metabase_fieldvalues VALUES (87, '2021-04-12 20:56:46.56391+00', '2021-04-12 20:56:46.56391+00', '[false]', NULL, 288);
INSERT INTO public.metabase_fieldvalues VALUES (88, '2021-04-12 20:56:46.578959+00', '2021-04-12 20:56:46.578959+00', '[false,true]', NULL, 289);
INSERT INTO public.metabase_fieldvalues VALUES (89, '2021-04-12 20:56:46.596519+00', '2021-04-12 20:56:46.596519+00', '["0xACED0005"]', NULL, 290);
INSERT INTO public.metabase_fieldvalues VALUES (90, '2021-04-12 20:56:46.611101+00', '2021-04-12 20:56:46.611101+00', '[false,true]', NULL, 293);
INSERT INTO public.metabase_fieldvalues VALUES (91, '2021-04-12 20:56:46.630815+00', '2021-04-12 20:56:46.630815+00', '[7500]', NULL, 298);
INSERT INTO public.metabase_fieldvalues VALUES (92, '2021-04-12 20:56:46.645277+00', '2021-04-12 20:56:46.645277+00', '[1618261006054]', NULL, 299);
INSERT INTO public.metabase_fieldvalues VALUES (93, '2021-04-12 20:56:46.681801+00', '2021-04-12 20:56:46.681801+00', '["WAITING"]', NULL, 323);
INSERT INTO public.metabase_fieldvalues VALUES (94, '2021-04-12 20:56:46.694984+00', '2021-04-12 20:56:46.694984+00', '[1618261200000,1618262100000,1618264200000,1618285800000,1618308900000,1618326000000]', NULL, 326);
INSERT INTO public.metabase_fieldvalues VALUES (95, '2021-04-12 20:56:46.708518+00', '2021-04-12 20:56:46.708518+00', '[-1]', NULL, 325);
INSERT INTO public.metabase_fieldvalues VALUES (109, '2021-04-12 20:56:47.34477+00', '2021-04-12 20:56:47.34477+00', '["A lot less welcome now than last year","A lot more welcome now than last year","Just as welcome now as I felt last year","NA","Not applicable - I did not use Stack Overflow last year","Somewhat less welcome now than last year","Somewhat more welcome now than last year"]', NULL, 458);
INSERT INTO public.metabase_fieldvalues VALUES (125, '2021-04-12 20:56:48.631009+00', '2021-04-12 20:56:48.631009+00', '["NA","No","Onboarding? What onboarding?","Yes"]', NULL, 453);
INSERT INTO public.metabase_fieldvalues VALUES (126, '2021-04-12 20:56:48.6901+00', '2021-04-12 20:56:48.6901+00', '["Appropriate in length","NA","Too long","Too short"]', NULL, 459);
INSERT INTO public.metabase_fieldvalues VALUES (127, '2021-04-12 20:56:48.737402+00', '2021-04-12 20:56:48.737402+00', '["10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","5","50","51","52","53","54","55","56","58","6","63","64","68","7","72","73","76","8","83","85","9","NA","Older than 85","Younger than 5 years"]', NULL, 461);
INSERT INTO public.metabase_fieldvalues VALUES (128, '2021-04-12 20:56:48.805952+00', '2021-04-12 20:56:48.805952+00', '["NA","Neutral","No, not at all","No, not really","Not sure","Yes, definitely","Yes, somewhat"]', NULL, 463);
INSERT INTO public.metabase_fieldvalues VALUES (129, '2021-04-12 20:56:48.870886+00', '2021-04-12 20:56:48.870886+00', '["NA","Never","Occasionally: 1-2 days per quarter but less than monthly","Often: 1-2 days per week or more","Rarely: 1-2 days per year or less","Sometimes: 1-2 days per month but less than weekly"]', NULL, 465);
INSERT INTO public.metabase_fieldvalues VALUES (130, '2021-04-12 20:56:48.933364+00', '2021-04-12 20:56:48.933364+00', '["A few times per month or weekly","A few times per week","Daily or almost daily","I have never participated in Q&A on Stack Overflow","Less than once per month or monthly","Multiple times per day","NA"]', NULL, 466);
INSERT INTO public.metabase_fieldvalues VALUES (131, '2021-04-12 20:56:48.985944+00', '2021-04-12 20:56:48.985944+00', '["Associate degree (A.A., A.S., etc.)","Bachelor’s degree (B.A., B.S., B.Eng., etc.)","I never completed any formal education","Master’s degree (M.A., M.S., M.Eng., MBA, etc.)","NA","Other doctoral degree (Ph.D., Ed.D., etc.)","Primary/elementary school","Professional degree (JD, MD, etc.)","Secondary school (e.g. American high school, German Realschule or Gymnasium, etc.)","Some college/university study without earning a degree"]', NULL, 468);
INSERT INTO public.metabase_fieldvalues VALUES (132, '2021-04-12 20:56:49.054336+00', '2021-04-12 20:56:49.054336+00', '["Extremely important","NA","Neutral","Not at all important","Not very important","Somewhat important"]', NULL, 477);
INSERT INTO public.metabase_fieldvalues VALUES (133, '2021-04-12 20:56:49.114341+00', '2021-04-12 20:56:49.114341+00', '["NA","No","Not sure","Yes"]', NULL, 481);
INSERT INTO public.metabase_fieldvalues VALUES (134, '2021-04-12 20:56:49.184108+00', '2021-04-12 20:56:49.184108+00', '["A business discipline (such as accounting, finance, marketing, etc.)","A health science (such as nursing, pharmacy, radiology, etc.)","A humanities discipline (such as literature, history, philosophy, etc.)","A natural science (such as biology, chemistry, physics, etc.)","Another engineering discipline (such as civil, electrical, mechanical, etc.)","A social science (such as anthropology, psychology, political science, etc.)","Computer science, computer engineering, or software engineering","Fine arts or performing arts (such as graphic design, music, studio art, etc.)","I never declared a major","Information systems, information technology, or system administration","Mathematics or statistics","NA","Web development or web design"]', NULL, 486);
INSERT INTO public.metabase_fieldvalues VALUES (135, '2021-04-12 20:56:49.246073+00', '2021-04-12 20:56:49.246073+00', '["BSD","Linux-based","MacOS","NA","Windows"]', NULL, 488);
INSERT INTO public.metabase_fieldvalues VALUES (136, '2021-04-12 20:56:49.304452+00', '2021-04-12 20:56:49.304452+00', '["Every few months","NA","Once a decade","Once a year","Once every few years"]', NULL, 491);
INSERT INTO public.metabase_fieldvalues VALUES (137, '2021-04-12 20:56:49.430844+00', '2021-04-12 20:56:49.430844+00', '["Critically important","Fairly important","NA","Not at all important/not necessary","Somewhat important","Very important"]', NULL, 493);
INSERT INTO public.metabase_fieldvalues VALUES (138, '2021-04-12 20:56:49.502452+00', '2021-04-12 20:56:49.502452+00', '["Ask developers I know/work with","Ask developers I know/work with;Read ratings or reviews on third party sites like G2Crowd","Ask developers I know/work with;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit","Ask developers I know/work with;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit;Research companies that have emailed me","Ask developers I know/work with;Read ratings or reviews on third party sites like G2Crowd;Research companies that have emailed me","Ask developers I know/work with;Research companies that have advertised on sites I visit","Ask developers I know/work with;Research companies that have advertised on sites I visit;Research companies that have emailed me","Ask developers I know/work with;Research companies that have emailed me","Ask developers I know/work with;Visit developer communities like Stack Overflow","Ask developers I know/work with;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd","Ask developers I know/work with;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit","Ask developers I know/work with;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit;Research companies that have emailed me","Ask developers I know/work with;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have emailed me","Ask developers I know/work with;Visit developer communities like Stack Overflow;Research companies that have advertised on sites I visit","Ask developers I know/work with;Visit developer communities like Stack Overflow;Research companies that have advertised on sites I visit;Research companies that have emailed me","Ask developers I know/work with;Visit developer communities like Stack Overflow;Research companies that have emailed me","NA","Read ratings or reviews on third party sites like G2Crowd","Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit","Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit;Research companies that have emailed me","Read ratings or reviews on third party sites like G2Crowd;Research companies that have emailed me","Research companies that have advertised on sites I visit","Research companies that have advertised on sites I visit;Research companies that have emailed me","Research companies that have emailed me","Start a free trial","Start a free trial;Ask developers I know/work with","Start a free trial;Ask developers I know/work with;Read ratings or reviews on third party sites like G2Crowd","Start a free trial;Ask developers I know/work with;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit","Start a free trial;Ask developers I know/work with;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit;Research companies that have emailed me","Start a free trial;Ask developers I know/work with;Read ratings or reviews on third party sites like G2Crowd;Research companies that have emailed me","Start a free trial;Ask developers I know/work with;Research companies that have advertised on sites I visit","Start a free trial;Ask developers I know/work with;Research companies that have advertised on sites I visit;Research companies that have emailed me","Start a free trial;Ask developers I know/work with;Research companies that have emailed me","Start a free trial;Ask developers I know/work with;Visit developer communities like Stack Overflow","Start a free trial;Ask developers I know/work with;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd","Start a free trial;Ask developers I know/work with;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit","Start a free trial;Ask developers I know/work with;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit;Research companies that have emailed me","Start a free trial;Ask developers I know/work with;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have emailed me","Start a free trial;Ask developers I know/work with;Visit developer communities like Stack Overflow;Research companies that have advertised on sites I visit","Start a free trial;Ask developers I know/work with;Visit developer communities like Stack Overflow;Research companies that have advertised on sites I visit;Research companies that have emailed me","Start a free trial;Ask developers I know/work with;Visit developer communities like Stack Overflow;Research companies that have emailed me","Start a free trial;Read ratings or reviews on third party sites like G2Crowd","Start a free trial;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit","Start a free trial;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit;Research companies that have emailed me","Start a free trial;Read ratings or reviews on third party sites like G2Crowd;Research companies that have emailed me","Start a free trial;Research companies that have advertised on sites I visit","Start a free trial;Research companies that have advertised on sites I visit;Research companies that have emailed me","Start a free trial;Research companies that have emailed me","Start a free trial;Visit developer communities like Stack Overflow","Start a free trial;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd","Start a free trial;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit","Start a free trial;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit;Research companies that have emailed me","Start a free trial;Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have emailed me","Start a free trial;Visit developer communities like Stack Overflow;Research companies that have advertised on sites I visit","Start a free trial;Visit developer communities like Stack Overflow;Research companies that have advertised on sites I visit;Research companies that have emailed me","Start a free trial;Visit developer communities like Stack Overflow;Research companies that have emailed me","Visit developer communities like Stack Overflow","Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd","Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit","Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have advertised on sites I visit;Research companies that have emailed me","Visit developer communities like Stack Overflow;Read ratings or reviews on third party sites like G2Crowd;Research companies that have emailed me","Visit developer communities like Stack Overflow;Research companies that have advertised on sites I visit","Visit developer communities like Stack Overflow;Research companies that have advertised on sites I visit;Research companies that have emailed me","Visit developer communities like Stack Overflow;Research companies that have emailed me"]', NULL, 449);
INSERT INTO public.metabase_fieldvalues VALUES (139, '2021-04-12 20:56:49.578604+00', '2021-04-12 20:56:49.578604+00', '["I have a great deal of influence","I have little or no influence","I have some influence","NA"]', NULL, 475);
INSERT INTO public.metabase_fieldvalues VALUES (140, '2021-04-12 20:56:49.595828+00', '2021-04-12 20:56:49.595828+00', '[1,2]', NULL, 497);
INSERT INTO public.metabase_fieldvalues VALUES (141, '2021-04-12 20:56:49.608071+00', '2021-04-12 20:56:49.608071+00', '[21,29,57,88,123,250,257,376,386,433,742,810,1160,1305,2623,3512,3657,4423,7775,8843]', NULL, 500);
INSERT INTO public.metabase_fieldvalues VALUES (142, '2021-04-12 20:56:49.622322+00', '2021-04-12 20:56:49.622322+00', '["analyze","classify-fields","classify-tables","field values scanning","fingerprint-fields","sync","sync-fields","sync-fks","sync-metabase-metadata","sync-tables","sync-timezone","update-field-values"]', NULL, 498);
INSERT INTO public.metabase_fieldvalues VALUES (143, '2021-04-12 20:56:49.636518+00', '2021-04-12 20:56:49.636518+00', '["{\"errors\":0,\"created\":5,\"updated\":0,\"deleted\":0}","{\"fields-classified\":201,\"fields-failed\":0}","{\"fields-classified\":32,\"fields-failed\":0}","{\"no-data-fingerprints\":0,\"failed-fingerprints\":0,\"updated-fingerprints\":32,\"fingerprints-attempted\":32}","{\"no-data-fingerprints\":213,\"failed-fingerprints\":0,\"updated-fingerprints\":201,\"fingerprints-attempted\":414}","{\"throwable\":{\"via\":[{\"type\":\"java.lang.Exception\",\"message\":\"Impossível de identificar data no texto ''2021-04-12 17:56:31.945 -03'' para o banco de dados ''postgres''\",\"at\":[\"metabase.driver.common$current_db_time$fn__37113\",\"invoke\",\"common.clj\",233]},{\"type\":\"java.text.ParseException\",\"message\":\"Unparseable date: \\\"2021-04-12 17:56:31.945 -03\\\"\",\"at\":[\"java.text.DateFormat\",\"parse\",null,-1]}],\"trace\":[[\"java.text.DateFormat\",\"parse\",null,-1],[\"metabase.driver.common.ThreadSafeSimpleDateFormat\",\"parse\",\"common.clj\",153],[\"metabase.driver.common$first_successful_parse\",\"invokeStatic\",\"common.clj\",170],[\"metabase.driver.common$first_successful_parse\",\"invoke\",\"common.clj\",164],[\"metabase.driver.common$current_db_time$fn__37113\",\"invoke\",\"common.clj\",229],[\"metabase.driver$do_with_driver\",\"invokeStatic\",\"driver.clj\",60],[\"metabase.driver$do_with_driver\",\"invoke\",\"driver.clj\",56],[\"metabase.driver.common$current_db_time\",\"invokeStatic\",\"common.clj\",203],[\"metabase.driver.common$current_db_time\",\"invoke\",\"common.clj\",193],[\"clojure.lang.AFn\",\"applyToHelper\",\"AFn.java\",156],[\"clojure.lang.AFn\",\"applyTo\",\"AFn.java\",144],[\"clojure.core$apply\",\"invokeStatic\",\"core.clj\",665],[\"clojure.core$apply\",\"invoke\",\"core.clj\",660],[\"metabase.driver.postgres$fn__78495\",\"invokeStatic\",\"postgres.clj\",78],[\"metabase.driver.postgres$fn__78495\",\"doInvoke\",\"postgres.clj\",76],[\"clojure.lang.RestFn\",\"invoke\",\"RestFn.java\",421],[\"clojure.lang.MultiFn\",\"invoke\",\"MultiFn.java\",234],[\"metabase.sync.sync_metadata.sync_timezone$fn__61226$sync_timezone_BANG___61231$fn__61232\",\"invoke\",\"sync_timezone.clj\",20],[\"metabase.sync.sync_metadata.sync_timezone$fn__61226$sync_timezone_BANG___61231\",\"invoke\",\"sync_timezone.clj\",14],[\"clojure.lang.AFn\",\"applyToHelper\",\"AFn.java\",154],[\"clojure.lang.AFn\",\"applyTo\",\"AFn.java\",144],[\"clojure.core$apply\",\"invokeStatic\",\"core.clj\",667],[\"clojure.core$apply\",\"invoke\",\"core.clj\",660],[\"metabase.sync.util$fn__39205$run_step_with_metadata__39210$fn__39214$fn__39216\",\"doInvoke\",\"util.clj\",352],[\"clojure.lang.RestFn\",\"invoke\",\"RestFn.java\",397],[\"metabase.sync.util$with_start_and_finish_logging_STAR_\",\"invokeStatic\",\"util.clj\",99],[\"metabase.sync.util$with_start_and_finish_logging_STAR_\",\"invoke\",\"util.clj\",93],[\"metabase.sync.util$with_start_and_finish_debug_logging\",\"invokeStatic\",\"util.clj\",116],[\"metabase.sync.util$with_start_and_finish_debug_logging\",\"invoke\",\"util.clj\",113],[\"metabase.sync.util$fn__39205$run_step_with_metadata__39210$fn__39214\",\"invoke\",\"util.clj\",347],[\"metabase.sync.util$fn__39205$run_step_with_metadata__39210\",\"invoke\",\"util.clj\",342],[\"metabase.sync.util$fn__39396$run_sync_operation__39401$fn__39402$fn__39410\",\"invoke\",\"util.clj\",441],[\"metabase.sync.util$fn__39396$run_sync_operation__39401$fn__39402\",\"invoke\",\"util.clj\",439],[\"metabase.sync.util$fn__39396$run_sync_operation__39401\",\"invoke\",\"util.clj\",433],[\"metabase.sync.sync_metadata$fn__61583$sync_db_metadata_BANG___61588$fn__61589$fn__61590\",\"invoke\",\"sync_metadata.clj\",49],[\"metabase.sync.util$do_with_error_handling\",\"invokeStatic\",\"util.clj\",151],[\"metabase.sync.util$do_with_error_handling\",\"invoke\",\"util.clj\",144],[\"metabase.sync.util$do_with_error_handling\",\"invokeStatic\",\"util.clj\",147],[\"metabase.sync.util$do_with_error_handling\",\"invoke\",\"util.clj\",144],[\"clojure.core$partial$fn__5839\",\"invoke\",\"core.clj\",2623],[\"metabase.driver$fn__29103\",\"invokeStatic\",\"driver.clj\",527],[\"metabase.driver$fn__29103\",\"invoke\",\"driver.clj\",527],[\"clojure.lang.MultiFn\",\"invoke\",\"MultiFn.java\",239],[\"metabase.sync.util$sync_in_context$fn__39117\",\"invoke\",\"util.clj\",135],[\"metabase.sync.util$with_db_logging_disabled$fn__39114\",\"invoke\",\"util.clj\",126],[\"metabase.sync.util$with_start_and_finish_logging_STAR_\",\"invokeStatic\",\"util.clj\",99],[\"metabase.sync.util$with_start_and_finish_logging_STAR_\",\"invoke\",\"util.clj\",93],[\"metabase.sync.util$with_start_and_finish_logging$fn__39103\",\"invoke\",\"util.clj\",111],[\"metabase.sync.util$with_sync_events$fn__39098\",\"invoke\",\"util.clj\",85],[\"metabase.sync.util$with_duplicate_ops_prevented$fn__39089\",\"invoke\",\"util.clj\",64],[\"metabase.sync.util$do_sync_operation\",\"invokeStatic\",\"util.clj\",169],[\"metabase.sync.util$do_sync_operation\",\"invoke\",\"util.clj\",166],[\"metabase.sync.sync_metadata$fn__61583$sync_db_metadata_BANG___61588$fn__61589\",\"invoke\",\"sync_metadata.clj\",48],[\"metabase.sync.sync_metadata$fn__61583$sync_db_metadata_BANG___61588\",\"invoke\",\"sync_metadata.clj\",45],[\"metabase.sync$fn__61638$sync_database_BANG___61647$fn__61653$fn__61655$fn__61657\",\"invoke\",\"sync.clj\",41],[\"clojure.core$mapv$fn__8445\",\"invoke\",\"core.clj\",6912],[\"clojure.lang.ArrayChunk\",\"reduce\",\"ArrayChunk.java\",58],[\"clojure.core.protocols$fn__8154\",\"invokeStatic\",\"protocols.clj\",136],[\"clojure.core.protocols$fn__8154\",\"invoke\",\"protocols.clj\",124],[\"clojure.core.protocols$fn__8114$G__8109__8123\",\"invoke\",\"protocols.clj\",19],[\"clojure.core.protocols$seq_reduce\",\"invokeStatic\",\"protocols.clj\",31],[\"clojure.core.protocols$fn__8146\",\"invokeStatic\",\"protocols.clj\",75],[\"clojure.core.protocols$fn__8146\",\"invoke\",\"protocols.clj\",75],[\"clojure.core.protocols$fn__8088$G__8083__8101\",\"invoke\",\"protocols.clj\",13],[\"clojure.core$reduce\",\"invokeStatic\",\"core.clj\",6828],[\"clojure.core$mapv\",\"invokeStatic\",\"core.clj\",6903],[\"clojure.core$mapv\",\"invoke\",\"core.clj\",6903],[\"metabase.sync$fn__61638$sync_database_BANG___61647$fn__61653$fn__61655\",\"invoke\",\"sync.clj\",41],[\"metabase.sync.util$do_with_error_handling\",\"invokeStatic\",\"util.clj\",151],[\"metabase.sync.util$do_with_error_handling\",\"invoke\",\"util.clj\",144],[\"metabase.sync.util$do_with_error_handling\",\"invokeStatic\",\"util.clj\",147],[\"metabase.sync.util$do_with_error_handling\",\"invoke\",\"util.clj\",144],[\"clojure.core$partial$fn__5839\",\"invoke\",\"core.clj\",2623],[\"metabase.driver$fn__29103\",\"invokeStatic\",\"driver.clj\",527],[\"metabase.driver$fn__29103\",\"invoke\",\"driver.clj\",527],[\"clojure.lang.MultiFn\",\"invoke\",\"MultiFn.java\",239],[\"metabase.sync.util$sync_in_context$fn__39117\",\"invoke\",\"util.clj\",135],[\"metabase.sync.util$with_db_logging_disabled$fn__39114\",\"invoke\",\"util.clj\",126],[\"metabase.sync.util$with_start_and_finish_logging_STAR_\",\"invokeStatic\",\"util.clj\",99],[\"metabase.sync.util$with_start_and_finish_logging_STAR_\",\"invoke\",\"util.clj\",93],[\"metabase.sync.util$with_start_and_finish_logging$fn__39103\",\"invoke\",\"util.clj\",111],[\"metabase.sync.util$with_sync_events$fn__39098\",\"invoke\",\"util.clj\",85],[\"metabase.sync.util$with_duplicate_ops_prevented$fn__39089\",\"invoke\",\"util.clj\",64],[\"metabase.sync.util$do_sync_operation\",\"invokeStatic\",\"util.clj\",169],[\"metabase.sync.util$do_sync_operation\",\"invoke\",\"util.clj\",166],[\"metabase.sync$fn__61638$sync_database_BANG___61647$fn__61653\",\"invoke\",\"sync.clj\",40],[\"metabase.sync$fn__61638$sync_database_BANG___61647\",\"invoke\",\"sync.clj\",26],[\"metabase.sync$fn__61638$sync_database_BANG___61647$fn__61648\",\"invoke\",\"sync.clj\",36],[\"metabase.sync$fn__61638$sync_database_BANG___61647\",\"invoke\",\"sync.clj\",26],[\"metabase.events.sync_database$process_sync_database_event$fn__79563\",\"invoke\",\"sync_database.clj\",37],[\"clojure.core$binding_conveyor_fn$fn__5754\",\"invoke\",\"core.clj\",2030],[\"clojure.lang.AFn\",\"call\",\"AFn.java\",18],[\"java.util.concurrent.FutureTask\",\"run\",null,-1],[\"java.util.concurrent.ThreadPoolExecutor\",\"runWorker\",null,-1],[\"java.util.concurrent.ThreadPoolExecutor$Worker\",\"run\",null,-1],[\"java.lang.Thread\",\"run\",null,-1]],\"cause\":\"Unparseable date: \\\"2021-04-12 17:56:31.945 -03\\\"\"}}","{\"timezone-id\":\"America/Sao_Paulo\"}","{\"total-fields\":36,\"updated-fields\":36}","{\"total-fields\":469,\"updated-fields\":469}","{\"total-fks\":3,\"updated-fks\":3,\"total-failed\":0}","{\"total-fks\":69,\"updated-fks\":69,\"total-failed\":0}","{\"total-tables\":4,\"tables-classified\":4}","{\"total-tables\":51,\"tables-classified\":51}","{\"updated-tables\":4,\"total-tables\":0}","{\"updated-tables\":56,\"total-tables\":0}",null]', NULL, 499);
INSERT INTO public.metabase_fieldvalues VALUES (110, '2021-04-12 20:56:47.453613+00', '2021-04-12 20:56:47.453613+00', '["1","10","11","12","13","14","15","16","17","18","19","2","20","21","22","23","24","25","26","27","28","29","3","30","31","32","33","34","35","36","37","38","39","4","40","41","42","43","44","45","46","47","48","49","5","50","6","7","8","9","Less than 1 year","More than 50 years","NA"]', NULL, 464);
INSERT INTO public.metabase_fieldvalues VALUES (111, '2021-04-12 20:56:47.524117+00', '2021-04-12 20:56:47.524117+00', '["A few times per month or weekly","A few times per week","Daily or almost daily","I have never visited Stack Overflow (before today)","Less than once per month or monthly","Multiple times per day","NA"]', NULL, 469);
INSERT INTO public.metabase_fieldvalues VALUES (112, '2021-04-12 20:56:47.582397+00', '2021-04-12 20:56:47.582397+00', '["NA","No","Not sure","Yes"]', NULL, 471);
INSERT INTO public.metabase_fieldvalues VALUES (113, '2021-04-12 20:56:47.642372+00', '2021-04-12 20:56:47.642372+00', '["10,000 or more employees","1,000 to 4,999 employees","100 to 499 employees","10 to 19 employees","20 to 99 employees","2 to 9 employees","5,000 to 9,999 employees","500 to 999 employees","Just me - I am a freelancer, sole proprietor, etc.","NA"]', NULL, 474);
INSERT INTO public.metabase_fieldvalues VALUES (114, '2021-04-12 20:56:47.81046+00', '2021-04-12 20:56:47.81046+00', '["I am a developer by profession","I am a student who is learning to code","I am not primarily a developer, but I write code sometimes as part of my work","I code primarily as a hobby","I used to be a developer by profession, but no longer am","NA"]', NULL, 480);
INSERT INTO public.metabase_fieldvalues VALUES (115, '2021-04-12 20:56:47.868456+00', '2021-04-12 20:56:47.868456+00', '["Man","Man;Non-binary, genderqueer, or gender non-conforming","NA","Non-binary, genderqueer, or gender non-conforming","Woman","Woman;Man","Woman;Man;Non-binary, genderqueer, or gender non-conforming","Woman;Non-binary, genderqueer, or gender non-conforming"]', NULL, 485);
INSERT INTO public.metabase_fieldvalues VALUES (116, '2021-04-12 20:56:47.922253+00', '2021-04-12 20:56:47.922253+00', '["Employed full-time","Employed part-time","Independent contractor, freelancer, or self-employed","NA","Not employed, and not looking for work","Not employed, but looking for work","Retired","Student"]', NULL, 487);
INSERT INTO public.metabase_fieldvalues VALUES (117, '2021-04-12 20:56:47.979871+00', '2021-04-12 20:56:47.979871+00', '["Amused","Annoyed","Hello, old friend","Indifferent","NA"]', NULL, 492);
INSERT INTO public.metabase_fieldvalues VALUES (118, '2021-04-12 20:56:48.042029+00', '2021-04-12 20:56:48.042029+00', '["Bisexual","Bisexual;Gay or Lesbian","Bisexual;Gay or Lesbian;Queer","Bisexual;Gay or Lesbian;Straight / Heterosexual","Bisexual;Gay or Lesbian;Straight / Heterosexual;Queer","Bisexual;Queer","Bisexual;Straight / Heterosexual","Bisexual;Straight / Heterosexual;Queer","Gay or Lesbian","Gay or Lesbian;Queer","Gay or Lesbian;Straight / Heterosexual","NA","Queer","Straight / Heterosexual","Straight / Heterosexual;Queer"]', NULL, 433);
INSERT INTO public.metabase_fieldvalues VALUES (119, '2021-04-12 20:56:48.106681+00', '2021-04-12 20:56:48.106681+00', '["I have never visited any of these sites","NA","Stack Exchange (public Q&A for a variety of topics)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow Advertising (for technology companies)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow for Teams (private Q&A for organizations)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Advertising (for technology companies)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow Advertising (for technology companies)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow Talent (for hiring companies/recruiters)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Exchange (public Q&A for a variety of topics);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow Advertising (for technology companies)","Stack Overflow for Teams (private Q&A for organizations)","Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Advertising (for technology companies)","Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow Jobs (for job seekers)","Stack Overflow Jobs (for job seekers);Stack Overflow Advertising (for technology companies)","Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations)","Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Advertising (for technology companies)","Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow Jobs (for job seekers);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow Jobs (for job seekers);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow for Teams (private Q&A for organizations)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Jobs (for job seekers);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow (public Q&A for anyone who codes);Stack Exchange (public Q&A for a variety of topics);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow for Teams (private Q&A for organizations)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Jobs (for job seekers)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Jobs (for job seekers);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Jobs (for job seekers);Stack Overflow for Teams (private Q&A for organizations);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Jobs (for job seekers);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Jobs (for job seekers);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow (public Q&A for anyone who codes);Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)","Stack Overflow Talent (for hiring companies/recruiters)","Stack Overflow Talent (for hiring companies/recruiters);Stack Overflow Advertising (for technology companies)"]', NULL, 436);
INSERT INTO public.metabase_fieldvalues VALUES (120, '2021-04-12 20:56:48.170744+00', '2021-04-12 20:56:48.170744+00', '["NA","No","Not sure/can''t remember","Yes"]', NULL, 438);
INSERT INTO public.metabase_fieldvalues VALUES (121, '2021-04-12 20:56:48.231626+00', '2021-04-12 20:56:48.231626+00', '["I am actively looking for a job","I am not interested in new job opportunities","I’m not actively looking, but I am open to new opportunities","NA"]', NULL, 441);
INSERT INTO public.metabase_fieldvalues VALUES (122, '2021-04-12 20:56:48.282297+00', '2021-04-12 20:56:48.282297+00', '["Monthly","NA","Weekly","Yearly"]', NULL, 443);
INSERT INTO public.metabase_fieldvalues VALUES (123, '2021-04-12 20:56:48.3495+00', '2021-04-12 20:56:48.3495+00', '["1","10","11","12","13","14","15","16","17","18","19","2","20","21","22","23","24","25","26","27","28","29","3","30","31","32","33","34","35","36","37","38","39","4","40","41","42","43","44","45","46","47","48","49","5","50","6","7","8","9","Less than 1 year","More than 50 years","NA"]', NULL, 448);
INSERT INTO public.metabase_fieldvalues VALUES (124, '2021-04-12 20:56:48.562515+00', '2021-04-12 20:56:48.562515+00', '["Difficult","Easy","NA","Neither easy nor difficult"]', NULL, 451);


--
-- TOC entry 3683 (class 0 OID 28756)
-- Dependencies: 210
-- Data for Name: metabase_table; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.metabase_table VALUES (2, '2021-04-12 20:53:31.710109+00', '2021-04-12 20:53:36.189767+00', 'ORDERS', 'This is a confirmed order for a product from a user.', NULL, 'entity/TransactionTable', true, 1, 'Orders', NULL, 'PUBLIC', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (3, '2021-04-12 20:53:31.715807+00', '2021-04-12 20:53:36.191833+00', 'PEOPLE', 'This is a user account. Note that employees and customer support staff will have accounts.', NULL, 'entity/UserTable', true, 1, 'People', NULL, 'PUBLIC', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (1, '2021-04-12 20:53:31.698301+00', '2021-04-12 20:53:36.19745+00', 'PRODUCTS', 'This is our product catalog. It includes all products ever sold by the Sample Company.', NULL, 'entity/ProductTable', true, 1, 'Products', NULL, 'PUBLIC', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (4, '2021-04-12 20:53:31.721771+00', '2021-04-12 20:53:36.204159+00', 'REVIEWS', 'These are reviews our customers have left on products. Note that these are not tied to orders so it is possible people have reviewed products they did not purchase from us.', NULL, 'entity/GenericTable', true, 1, 'Reviews', NULL, 'PUBLIC', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (36, '2021-04-12 20:56:32.171548+00', '2021-04-12 20:56:32.171548+00', 'databasechangeloglock', NULL, NULL, NULL, true, 2, 'Database Changelog Lock', 'cruft', 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (39, '2021-04-12 20:56:32.186602+00', '2021-04-12 20:56:32.186602+00', 'databasechangelog', NULL, NULL, NULL, true, 2, 'Database Changelog', 'cruft', 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (23, '2021-04-12 20:56:32.115275+00', '2021-04-12 20:56:45.109712+00', 'qrtz_calendars', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Calendars', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (56, '2021-04-12 20:56:32.281672+00', '2021-04-12 20:56:44.972912+00', 'computation_job_result', 'Stores results of async computation jobs.', NULL, 'entity/GenericTable', true, 2, 'Computation Job Result', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (11, '2021-04-12 20:56:32.061166+00', '2021-04-12 20:56:45.164763+00', 'query_execution', 'A log of executed queries, used for calculating historic execution times, auditing, and other purposes.', NULL, 'entity/GenericTable', true, 2, 'Query Execution', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (52, '2021-04-12 20:56:32.266911+00', '2021-04-12 20:56:45.128128+00', 'qrtz_job_details', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Job Details', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (54, '2021-04-12 20:56:32.274341+00', '2021-04-12 20:56:44.969529+00', 'computation_job', 'Stores submitted async computation jobs.', NULL, 'entity/GenericTable', true, 2, 'Computation Job', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (40, '2021-04-12 20:56:32.19085+00', '2021-04-12 20:56:45.134098+00', 'qrtz_locks', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Locks', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (30, '2021-04-12 20:56:32.145093+00', '2021-04-12 20:56:45.16897+00', 'report_card', NULL, NULL, 'entity/GenericTable', true, 2, 'Report Card', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (51, '2021-04-12 20:56:32.262865+00', '2021-04-12 20:56:44.975784+00', 'core_session', NULL, NULL, 'entity/GenericTable', true, 2, 'Core Session', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (28, '2021-04-12 20:56:32.136232+00', '2021-04-12 20:56:45.121894+00', 'qrtz_fired_triggers', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Fired Triggers', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (15, '2021-04-12 20:56:32.082239+00', '2021-04-12 20:56:45.138768+00', 'qrtz_paused_trigger_grps', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Paused Trigger Gr Ps', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (24, '2021-04-12 20:56:32.119105+00', '2021-04-12 20:56:45.172943+00', 'report_cardfavorite', NULL, NULL, 'entity/GenericTable', true, 2, 'Report Card Favorite', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (38, '2021-04-12 20:56:32.181292+00', '2021-04-12 20:56:44.99136+00', 'data_migrations', NULL, NULL, 'entity/GenericTable', true, 2, 'Data Migrations', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (60, '2021-04-12 20:56:32.295972+00', '2021-04-12 20:56:45.15244+00', 'qrtz_simprop_triggers', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Sim Prop Triggers', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (8, '2021-04-12 20:56:32.045139+00', '2021-04-12 20:56:45.148763+00', 'qrtz_simple_triggers', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Simple Triggers', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (26, '2021-04-12 20:56:32.127307+00', '2021-04-12 20:56:32.127307+00', 'query_cache', 'Cached results of queries are stored here when using the DB-based query cache.', NULL, NULL, true, 2, 'Query Cache', 'cruft', 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (41, '2021-04-12 20:56:32.195193+00', '2021-04-12 20:56:45.156128+00', 'qrtz_triggers', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Triggers', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (16, '2021-04-12 20:56:32.087355+00', '2021-04-12 20:56:45.144019+00', 'qrtz_scheduler_state', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Scheduler State', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (19, '2021-04-12 20:56:32.098993+00', '2021-04-12 20:56:45.177239+00', 'report_dashboard', NULL, NULL, 'entity/GenericTable', true, 2, 'Report Dashboard', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (49, '2021-04-12 20:56:32.255313+00', '2021-04-12 20:56:44.959291+00', 'activity', NULL, NULL, 'entity/GenericTable', true, 2, 'Activity', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (5, '2021-04-12 20:56:32.021007+00', '2021-04-12 20:56:44.962585+00', 'card_label', NULL, NULL, 'entity/GenericTable', true, 2, 'Card Label', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (20, '2021-04-12 20:56:32.10334+00', '2021-04-12 20:56:44.966201+00', 'collection', 'Collections are an optional way to organize Cards and handle permissions for them.', NULL, 'entity/GenericTable', true, 2, 'Collection', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (27, '2021-04-12 20:56:32.132172+00', '2021-04-12 20:56:44.978997+00', 'core_user', NULL, NULL, 'entity/UserTable', true, 2, 'Core User', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (17, '2021-04-12 20:56:32.092043+00', '2021-04-12 20:56:44.983907+00', 'dashboardcard_series', NULL, NULL, 'entity/GenericTable', true, 2, 'Dashboard Card Series', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (42, '2021-04-12 20:56:32.201476+00', '2021-04-12 20:56:44.996002+00', 'dependency', NULL, NULL, 'entity/GenericTable', true, 2, 'Dependency', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (53, '2021-04-12 20:56:32.270636+00', '2021-04-12 20:56:45.007393+00', 'label', NULL, NULL, 'entity/GenericTable', true, 2, 'Label', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (22, '2021-04-12 20:56:32.110881+00', '2021-04-12 20:56:45.011446+00', 'metabase_database', NULL, NULL, 'entity/GenericTable', true, 2, 'Metabase Database', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (29, '2021-04-12 20:56:32.139934+00', '2021-04-12 20:56:45.016088+00', 'metabase_field', NULL, NULL, 'entity/GenericTable', true, 2, 'Metabase Field', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (47, '2021-04-12 20:56:32.245946+00', '2021-04-12 20:56:45.019207+00', 'metabase_fieldvalues', NULL, NULL, 'entity/GenericTable', true, 2, 'Metabase Field Values', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (48, '2021-04-12 20:56:32.250804+00', '2021-04-12 20:56:45.024057+00', 'metabase_table', NULL, NULL, 'entity/GenericTable', true, 2, 'Metabase Table', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (46, '2021-04-12 20:56:32.24077+00', '2021-04-12 20:56:45.027114+00', 'metric', NULL, NULL, 'entity/GenericTable', true, 2, 'Metric', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (50, '2021-04-12 20:56:32.258865+00', '2021-04-12 20:56:45.030471+00', 'metric_important_field', NULL, NULL, 'entity/GenericTable', true, 2, 'Metric Important Field', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (44, '2021-04-12 20:56:32.211972+00', '2021-04-12 20:56:45.051269+00', 'permissions', NULL, NULL, 'entity/GenericTable', true, 2, 'Permissions', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (25, '2021-04-12 20:56:32.122955+00', '2021-04-12 20:56:45.069674+00', 'permissions_group', NULL, NULL, 'entity/GenericTable', true, 2, 'Permissions Group', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (7, '2021-04-12 20:56:32.038469+00', '2021-04-12 20:56:45.08036+00', 'pulse', NULL, NULL, 'entity/GenericTable', true, 2, 'Pulse', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (35, '2021-04-12 20:56:32.166554+00', '2021-04-12 20:56:45.085364+00', 'pulse_card', NULL, NULL, 'entity/GenericTable', true, 2, 'Pulse Card', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (12, '2021-04-12 20:56:32.067563+00', '2021-04-12 20:56:45.091914+00', 'pulse_channel', NULL, NULL, 'entity/GenericTable', true, 2, 'Pulse Channel', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (21, '2021-04-12 20:56:32.107372+00', '2021-04-12 20:56:45.098031+00', 'pulse_channel_recipient', NULL, NULL, 'entity/GenericTable', true, 2, 'Pulse Channel Recipient', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (32, '2021-04-12 20:56:32.152899+00', '2021-04-12 20:56:45.103892+00', 'qrtz_blob_triggers', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Blob Triggers', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (14, '2021-04-12 20:56:32.077198+00', '2021-04-12 20:56:45.181551+00', 'report_dashboardcard', NULL, NULL, 'entity/GenericTable', true, 2, 'Report Dashboard Card', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (10, '2021-04-12 20:56:32.055927+00', '2021-04-12 20:56:45.184826+00', 'revision', NULL, NULL, 'entity/GenericTable', true, 2, 'Revision', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (13, '2021-04-12 20:56:32.072088+00', '2021-04-12 20:56:45.188911+00', 'segment', NULL, NULL, 'entity/GenericTable', true, 2, 'Segment', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (33, '2021-04-12 20:56:32.156773+00', '2021-04-12 20:56:45.194298+00', 'setting', NULL, NULL, 'entity/GenericTable', true, 2, 'Setting', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (59, '2021-04-12 20:56:32.292357+00', '2021-04-12 20:56:45.201497+00', 'survey_results_public', NULL, NULL, 'entity/GenericTable', true, 2, 'Survey Results Public', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (18, '2021-04-12 20:56:32.095563+00', '2021-04-12 20:56:45.209394+00', 'view_log', NULL, NULL, 'entity/EventTable', true, 2, 'View Log', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (55, '2021-04-12 20:56:32.277887+00', '2021-04-12 20:56:32.277887+00', 'permissions_revision', 'Used to keep track of changes made to permissions.', NULL, NULL, true, 2, 'Permissions Revision', 'cruft', 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (31, '2021-04-12 20:56:32.148892+00', '2021-04-12 20:56:32.148892+00', 'collection_revision', 'Used to keep track of changes made to collections.', NULL, NULL, true, 2, 'Collection Revision', 'cruft', 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (6, '2021-04-12 20:56:32.032841+00', '2021-04-12 20:56:44.987997+00', 'dashboard_favorite', 'Presence of a row here indicates a given User has favorited a given Dashboard.', NULL, 'entity/GenericTable', true, 2, 'Dashboard Favorite', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (43, '2021-04-12 20:56:32.205974+00', '2021-04-12 20:56:44.99938+00', 'dimension', 'Stores references to alternate views of existing fields, such as remapping an integer to a description, like an enum', NULL, 'entity/GenericTable', true, 2, 'Dimension', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (9, '2021-04-12 20:56:32.050994+00', '2021-04-12 20:56:45.003367+00', 'group_table_access_policy', 'Records that a given Card (Question) should automatically replace a given Table as query source for a given a Perms Group.', NULL, 'entity/GenericTable', true, 2, 'Group Table Access Policy', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (34, '2021-04-12 20:56:32.161821+00', '2021-04-12 20:56:45.037734+00', 'native_query_snippet', 'Query snippets (raw text) to be substituted in native queries', NULL, 'entity/GenericTable', true, 2, 'Native Query Snippet', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (45, '2021-04-12 20:56:32.225908+00', '2021-04-12 20:56:45.074797+00', 'permissions_group_membership', NULL, NULL, 'entity/GenericTable', true, 2, 'Permissions Group Membership', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (37, '2021-04-12 20:56:32.17673+00', '2021-04-12 20:56:45.115521+00', 'qrtz_cron_triggers', 'Used for Quartz scheduler.', NULL, 'entity/GenericTable', true, 2, 'Qr Tz Cr On Triggers', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (58, '2021-04-12 20:56:32.288596+00', '2021-04-12 20:56:45.16069+00', 'query', 'Information (such as average execution time) for different queries that have been previously ran.', NULL, 'entity/GenericTable', true, 2, 'Query', NULL, 'public', NULL, NULL, false, 'database');
INSERT INTO public.metabase_table VALUES (57, '2021-04-12 20:56:32.285362+00', '2021-04-12 20:56:45.204752+00', 'task_history', 'Timing and metadata info about background/quartz processes', NULL, 'entity/GenericTable', true, 2, 'Task History', NULL, 'public', NULL, NULL, false, 'database');


--
-- TOC entry 3718 (class 0 OID 29302)
-- Dependencies: 245
-- Data for Name: metric; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3726 (class 0 OID 29442)
-- Dependencies: 253
-- Data for Name: metric_important_field; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3767 (class 0 OID 29941)
-- Dependencies: 294
-- Data for Name: native_query_snippet; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3732 (class 0 OID 29499)
-- Dependencies: 259
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.permissions VALUES (1, '/', 2);
INSERT INTO public.permissions VALUES (2, '/collection/root/', 1);
INSERT INTO public.permissions VALUES (3, '/collection/root/', 3);
INSERT INTO public.permissions VALUES (4, '/db/1/', 1);
INSERT INTO public.permissions VALUES (5, '/db/2/', 1);
INSERT INTO public.permissions VALUES (6, '/collection/2/', 1);
INSERT INTO public.permissions VALUES (7, '/collection/2/', 3);
INSERT INTO public.permissions VALUES (8, '/collection/3/', 1);
INSERT INTO public.permissions VALUES (9, '/collection/3/', 3);
INSERT INTO public.permissions VALUES (10, '/collection/4/', 1);
INSERT INTO public.permissions VALUES (11, '/collection/4/', 3);


--
-- TOC entry 3728 (class 0 OID 29465)
-- Dependencies: 255
-- Data for Name: permissions_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.permissions_group VALUES (1, 'All Users');
INSERT INTO public.permissions_group VALUES (2, 'Administrators');
INSERT INTO public.permissions_group VALUES (3, 'MetaBot');


--
-- TOC entry 3730 (class 0 OID 29476)
-- Dependencies: 257
-- Data for Name: permissions_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.permissions_group_membership VALUES (1, 1, 1);
INSERT INTO public.permissions_group_membership VALUES (2, 1, 2);


--
-- TOC entry 3734 (class 0 OID 29531)
-- Dependencies: 261
-- Data for Name: permissions_revision; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3706 (class 0 OID 29188)
-- Dependencies: 233
-- Data for Name: pulse; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3708 (class 0 OID 29202)
-- Dependencies: 235
-- Data for Name: pulse_card; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3710 (class 0 OID 29222)
-- Dependencies: 237
-- Data for Name: pulse_channel; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3712 (class 0 OID 29240)
-- Dependencies: 239
-- Data for Name: pulse_channel_recipient; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3758 (class 0 OID 29837)
-- Dependencies: 285
-- Data for Name: qrtz_blob_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3759 (class 0 OID 29850)
-- Dependencies: 286
-- Data for Name: qrtz_calendars; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3756 (class 0 OID 29811)
-- Dependencies: 283
-- Data for Name: qrtz_cron_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.sync-and-analyze.trigger.1', 'DEFAULT', '0 40 * * * ? *', 'America/Sao_Paulo');
INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.update-field-values.trigger.1', 'DEFAULT', '0 0 15 * * ? *', 'America/Sao_Paulo');
INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.sync-and-analyze.trigger.2', 'DEFAULT', '0 40 * * * ? *', 'America/Sao_Paulo');
INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.update-field-values.trigger.2', 'DEFAULT', '0 0 23 * * ? *', 'America/Sao_Paulo');
INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.upgrade-checks.trigger', 'DEFAULT', '0 15 6,18 * * ? *', 'America/Sao_Paulo');
INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.anonymous-stats.trigger', 'DEFAULT', '0 15 7 * * ? *', 'America/Sao_Paulo');
INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.abandonment-emails.trigger', 'DEFAULT', '0 0 12 * * ? *', 'America/Sao_Paulo');
INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.send-pulses.trigger', 'DEFAULT', '0 0 * * * ? *', 'America/Sao_Paulo');
INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.follow-up-emails.trigger', 'DEFAULT', '0 0 12 * * ? *', 'America/Sao_Paulo');
INSERT INTO public.qrtz_cron_triggers VALUES ('MetabaseScheduler', 'metabase.task.task-history-cleanup.trigger', 'DEFAULT', '0 0 * * * ? *', 'America/Sao_Paulo');


--
-- TOC entry 3761 (class 0 OID 29863)
-- Dependencies: 288
-- Data for Name: qrtz_fired_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3753 (class 0 OID 29777)
-- Dependencies: 280
-- Data for Name: qrtz_job_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.qrtz_job_details VALUES ('MetabaseScheduler', 'metabase.task.upgrade-checks.job', 'DEFAULT', NULL, 'metabase.task.upgrade_checks.CheckForNewVersions', false, false, false, false, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800');
INSERT INTO public.qrtz_job_details VALUES ('MetabaseScheduler', 'metabase.task.anonymous-stats.job', 'DEFAULT', NULL, 'metabase.task.send_anonymous_stats.SendAnonymousUsageStats', false, false, false, false, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800');
INSERT INTO public.qrtz_job_details VALUES ('MetabaseScheduler', 'metabase.task.abandonment-emails.job', 'DEFAULT', NULL, 'metabase.task.follow_up_emails.AbandonmentEmail', false, false, false, false, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800');
INSERT INTO public.qrtz_job_details VALUES ('MetabaseScheduler', 'metabase.task.send-pulses.job', 'DEFAULT', NULL, 'metabase.task.send_pulses.SendPulses', false, false, false, false, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800');
INSERT INTO public.qrtz_job_details VALUES ('MetabaseScheduler', 'metabase.task.follow-up-emails.job', 'DEFAULT', NULL, 'metabase.task.follow_up_emails.FollowUpEmail', false, false, false, false, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800');
INSERT INTO public.qrtz_job_details VALUES ('MetabaseScheduler', 'metabase.task.task-history-cleanup.job', 'DEFAULT', NULL, 'metabase.task.task_history_cleanup.TaskHistoryCleanup', false, false, false, false, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800');
INSERT INTO public.qrtz_job_details VALUES ('MetabaseScheduler', 'metabase.task.sync-and-analyze.job', 'DEFAULT', 'sync-and-analyze for all databases', 'metabase.task.sync_databases.SyncAndAnalyzeDatabase', true, true, false, false, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800');
INSERT INTO public.qrtz_job_details VALUES ('MetabaseScheduler', 'metabase.task.update-field-values.job', 'DEFAULT', 'update-field-values for all databases', 'metabase.task.sync_databases.UpdateFieldValues', true, true, false, false, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787000737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f40000000000010770800000010000000007800');


--
-- TOC entry 3763 (class 0 OID 29876)
-- Dependencies: 290
-- Data for Name: qrtz_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.qrtz_locks VALUES ('MetabaseScheduler', 'STATE_ACCESS');
INSERT INTO public.qrtz_locks VALUES ('MetabaseScheduler', 'TRIGGER_ACCESS');


--
-- TOC entry 3760 (class 0 OID 29858)
-- Dependencies: 287
-- Data for Name: qrtz_paused_trigger_grps; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3762 (class 0 OID 29871)
-- Dependencies: 289
-- Data for Name: qrtz_scheduler_state; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.qrtz_scheduler_state VALUES ('MetabaseScheduler', 'c6877a3e1cc91618276180230', 1618276195369, 7500);


--
-- TOC entry 3755 (class 0 OID 29798)
-- Dependencies: 282
-- Data for Name: qrtz_simple_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3757 (class 0 OID 29824)
-- Dependencies: 284
-- Data for Name: qrtz_simprop_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3754 (class 0 OID 29785)
-- Dependencies: 281
-- Data for Name: qrtz_triggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.sync-and-analyze.trigger.1', 'DEFAULT', 'metabase.task.sync-and-analyze.job', 'DEFAULT', 'sync-and-analyze Database 1', 1618278000000, -1, 5, 'WAITING', 'CRON', 1618274576000, 0, NULL, 2, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000017800');
INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.update-field-values.trigger.1', 'DEFAULT', 'metabase.task.update-field-values.job', 'DEFAULT', 'update-field-values Database 1', 1618336800000, -1, 5, 'WAITING', 'CRON', 1618274576000, 0, NULL, 2, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000017800');
INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.sync-and-analyze.trigger.2', 'DEFAULT', 'metabase.task.sync-and-analyze.job', 'DEFAULT', 'sync-and-analyze Database 2', 1618278000000, -1, 5, 'WAITING', 'CRON', 1618274576000, 0, NULL, 2, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000027800');
INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.update-field-values.trigger.2', 'DEFAULT', 'metabase.task.update-field-values.job', 'DEFAULT', 'update-field-values Database 2', 1618279200000, -1, 5, 'WAITING', 'CRON', 1618274576000, 0, NULL, 2, '\xaced0005737200156f72672e71756172747a2e4a6f62446174614d61709fb083e8bfa9b0cb020000787200266f72672e71756172747a2e7574696c732e537472696e674b65794469727479466c61674d61708208e8c3fbc55d280200015a0013616c6c6f77735472616e7369656e74446174617872001d6f72672e71756172747a2e7574696c732e4469727479466c61674d617013e62ead28760ace0200025a000564697274794c00036d617074000f4c6a6176612f7574696c2f4d61703b787001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000c7708000000100000000174000564622d6964737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b0200007870000000027800');
INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.upgrade-checks.trigger', 'DEFAULT', 'metabase.task.upgrade-checks.job', 'DEFAULT', NULL, 1618305300000, -1, 5, 'WAITING', 'CRON', 1618276180000, 0, NULL, 0, '\x');
INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.anonymous-stats.trigger', 'DEFAULT', 'metabase.task.anonymous-stats.job', 'DEFAULT', NULL, 1618308900000, -1, 5, 'WAITING', 'CRON', 1618276180000, 0, NULL, 0, '\x');
INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.abandonment-emails.trigger', 'DEFAULT', 'metabase.task.abandonment-emails.job', 'DEFAULT', NULL, 1618326000000, -1, 5, 'WAITING', 'CRON', 1618276180000, 0, NULL, 0, '\x');
INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.send-pulses.trigger', 'DEFAULT', 'metabase.task.send-pulses.job', 'DEFAULT', NULL, 1618279200000, -1, 5, 'WAITING', 'CRON', 1618276180000, 0, NULL, 1, '\x');
INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.follow-up-emails.trigger', 'DEFAULT', 'metabase.task.follow-up-emails.job', 'DEFAULT', NULL, 1618326000000, -1, 5, 'WAITING', 'CRON', 1618276180000, 0, NULL, 0, '\x');
INSERT INTO public.qrtz_triggers VALUES ('MetabaseScheduler', 'metabase.task.task-history-cleanup.trigger', 'DEFAULT', 'metabase.task.task-history-cleanup.job', 'DEFAULT', NULL, 1618279200000, -1, 5, 'WAITING', 'CRON', 1618276180000, 0, NULL, 0, '\x');


--
-- TOC entry 3742 (class 0 OID 29624)
-- Dependencies: 269
-- Data for Name: query; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.query VALUES ('\x14fd5f2446eb6658457ceeb1947af47321e11e6e3a1d72306569e68efcd703bd', 424, '{"database":2,"query":{"source-table":59,"aggregation":[["count"]],"breakout":[["field-id",460]]},"type":"query","middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xdcd9044e460d95e3c8893f19e6b3c3d71c26d67e3d9cba895b2d9ba986e77882', 140, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",475]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x0585dc2d184bac94534cbd2403d6642e889bd62d47422efbd82d86268d197bc0', 98, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",487]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xcf06a4ba33b0aefb02799361e9f3025421e5e2ef61dd099e8a9f32d8e8505630', 59, '{"database":2,"query":{"source-table":59,"aggregation":[["count"]],"breakout":[["field-id",440]]},"type":"query","middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x57acbbc8bded1b5dd742beb5c18506b86358da43eb636131091e162d843a01ec', 375, '{"database":2,"query":{"source-table":59},"type":"query","middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x616fd7760c588fd6705f27d540496caa09c3c5089197ebcecc823472036c67c5', 57, '{"database":2,"query":{"source-table":59,"aggregation":[["count"]],"breakout":[["field-id",487]]},"type":"query","middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x8ea983308aafc2f354ac5dd24f0ff0cf99c364214bf94b8efc4d5836c3fb4b14', 142, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",451]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x66ea22b887d1e9e6a5105d33d67c51a06ceaed376a106e9b49f547f7b61304f1', 145, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",468]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xe23cd6f1e911379e5a0b9112da877430d7f1d0f67f7be0dd106d4b6bb672ba38', 165, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",468]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x9b9417ad60bf91ea863cb4fa09a2964d24cd13542058e5e77a53bd0707f89bf1', 126, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",491]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xd195eeb4cae2534aecc2395dbe4cdd0a3c8b6c2a19e6a9697ec45539f92c6e9b', 105, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",466]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x70a34b2315525e1972a097ebc000b01ccb5069a0b8f76840f3278d310e4e4cde', 136, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",463]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x3fdeec3143dc39a6065b66ba264b42df40f4b1f4d230eaa1a12d0774532f0418', 135, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",459]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xd1b7faa6e2a2a90f21ff70c212544875bb140f22f2f3834b067b3acd51435f5c', 123, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",493]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x4fb7f09c97d37c1097fd7318c0eac120c46e937089067ddcddc0d3808a4dacc5', 167, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",471]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xe1a5e31d3e81821bdbcbe4e418e7447afc09fd0141a0bd7b23c174fdeca71baa', 146, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",458]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x5780a19a3294fbb94bdf6e7552721db8b57e7ab67563b30cc19b2022796842bf', 135, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",440]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x46094daa88c06f59ce4f0cb0359b8c26b13b01b4849014e12ddabc7c172e7edf', 128, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"aggregation":[["count"]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xc6f823a8558ac79cf7d7a94b0155f3e0f61ddc80c92bad0818c95d0b322d3a7e', 245, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",453]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x816cd803a8b892ee90a01f8542b3ba10198f83738ac86e8b39f41511b964685c', 61, '{"type":"query","database":2,"query":{"source-table":59,"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x425b91ac4053f47c3db7984e1a6c0abc5f5b0822e22fa13e4fb29b445a296066', 108, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",453]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xd69fc420e7a5eaa9ab0d1cdc2e81f68ef30b031a19deab52c54dcc4e5a735cf8', 85, '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",443]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x255ede57837e37392823ba3a129a4e91bdf2caaa45e72044ced403e37c50a548', 247, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",475]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x46d944335cb0c2ad7d0baa37cc706c021ad76a7c330c78f1404128e3466ab465', 192, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",463]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x123eb330486b50201c84df810b250f3ffd2b98bd5c30789a461df6d73e200621', 218, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",443]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xa430ea8cd9a36f02ec3e160e77ce07183f9bc4d371d4e32518733076eb49a130', 169, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",493]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x1793d16b9954bf1177ad807e7dcf45f3a7b254e8283509a4d44eb8c5324ad0b3', 140, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",453]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x61a4490866685a3313ab04b9de37c437217a266cbe011673afb3146fb76e0e32', 146, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"aggregation":[["count"]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x6b38bcfeaf3a55d4c21ef01cc8ea701552619b51e33eb1d8d292aab969be9c97', 155, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",443]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x3aca1fd6b341c6e8d8f303440e86a978818367d73f3d39f2793004fa48b3a170', 210, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",451]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xc820f1ecaf74e7fff18f8eb2b402772359ec37ecc460f74611e7e8e9efbfc0ce', 198, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",487]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x94b39d5f6859f7a3c6fa2ff746e12bd90caed4aeed98a322015b40613e667fa3', 195, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",475]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xd7d0659477e4b8489189ea3085a5af37852862d293ccb74787ef0a1db10ddf9c', 275, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",459]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xf255fff03baf164536ec4a34725e5b6dec20f83fffd3ad60106655e55abb48a6', 175, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",471]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x53498a66f44f421afec494ba851a6c425a489592c42d10ed311a577a03710237', 259, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",451]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x99e3536af479f1279fb3057f762748de7a7728b19604820c3a41dd312db7c027', 191, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",459]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xffc46acf6d85b79254f6f893d56f0986f98791bd93d83cb623774e5c8887e0c2', 161, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",471]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x7033b41a872341dbdc8899ca35f83a12af3fdeefee5202974489de3a518aaa06', 161, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",458]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x49dba81a1b3f67751dd8f458a420aaa01a8b1d1c3ffd7a1f25e4720d0661f0ae', 151, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",440]],"aggregation":[["count"]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x01c0e65f08c0564dd589e5a1ae20bd6d4eee1c064fe4eac900059affd46280fb', 79, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",466]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x474c926ce8408471e31e0471a154225f62fe01ccdcdff21624fcb0d29b19445d', 96, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",487]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x0a9acab03a3ddd988144b36f07e752a020de14de1b955b4b783cbad14bda66be', 208, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",487]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x655f22f16e054fea9b3839338f8118be98ea3aba0f68dd5785af94ec6295f927', 224, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",491]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x5ca6b03157aabc0ceb396e002683992fd7439250d3281daf2dc1921f31cfffe4', 244, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",466]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x2adc1808ea63c315ff31206c0044f513192adb3c37001f3ab844e112d0134d02', 233, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",463]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x32f73e5efa54e186853cbeb1f8d8fb8175c711c4c1a3ccf6a07c07a5b02ff0a1', 183, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",493]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x3064ddaeb7ce55249849a8801956465b359c8a868262d16be68dcb1657841db0', 100, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",459]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xe77641435a52644c986f96aebab205aa3d7bc3e9268200d8254b7c6483b4722d', 235, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",440]],"aggregation":[["count"]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xdf3f5ff38d5a9ae5daf1a71e76cfae5d04213fdf9319bae2a8e7da1703bc9a09', 298, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",468]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x0c8abd11d9d21efa15bb228fa08731acb5a22729c56496b83acb775860a5e1d2', 212, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",458]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"category","target":["dimension",["field-id",451]],"value":["Easy"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x0d1b32d9b746365680419f0dfa4a00dde110ed088db4fc8604df08211e6d39d3', 124, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"aggregation":[["count"]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xfbdfd42020482d18f682af32d1476f1488bcb8f1d33ec9b8bc97d4bf8a195b25', 139, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",453]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xfb4a879e4c60cce2fac2e895e8a14fad9c731ae40d8d19cd337df84d26c26fdf', 163, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",491]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x44a3fecd456eab682a420d1c68582a3e39b14ec6ed5dfed91988d007e24859d7', 193, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",475]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xf30cd15248b7364e1783101ab1c5fa5b2520f3fd071d04d58450d1a3deac016c', 122, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",458]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x600a2229788ee1a477671b3aee0b0e7daed52c09e227e4d8757c95d5265d3f22', 113, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",451]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x0520a112f77fe2a29e20e16ec5f12c3172cb515b727ab3b4012d0e697254ff1f', 183, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",443]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\xaa115c9fab18074cbdf838818d5adbebe67375571e398ae3ce3416be7a7ade9a', 79, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",471]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x2ab8e373aceb672fd3dee7f14a5c8c79e1993e5bbaed2737ac28d3ab4777d250', 151, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",468]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x197d5b999f7c0829cabc188a9b8cba971bddc37795ed63b76f64789a278b4945', 207, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",491]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x11a28c1337685819b91da009d5d03763ca87b2dc7f461978b7efd9aed62fbf9b', 124, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",463]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x8cd49599b2e19c6f0973cbf5e031975c147ed95da4e291faa8a34465011f2671', 123, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",440]],"aggregation":[["count"]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x1fdddca020e4e9bf458003d29b299833228243db7478860f946ab346341abad9', 124, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",493]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"parameters":[{"type":"location/country","target":["dimension",["field-id",440]],"value":["Brazil"]}],"async?":true,"cache-ttl":null}');
INSERT INTO public.query VALUES ('\x75871d35c899c0eab36da661b318737591c97485b9722fda1e13dae4831b4c0b', 8, '{"type":"query","database":2,"query":{"source-table":56,"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x9709e67ac3091e29512b53402a5594caeeed1f22dbf9af9e25bbc35e9aa35349', 24, '{"type":"query","database":2,"query":{"source-table":56,"filter":["and",["time-interval",["datetime-field",["field-id",69],"day"],-30,"day"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x012b814ac7edf4cd226baec9f18a894a1a2a3623c2ad12300e735fea3dcffc4a', 10, '{"type":"query","database":2,"query":{"source-table":56,"filter":["and",["time-interval",["datetime-field",["field-id",71],"day"],-30,"day"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xe15f246b453a6d154e2ce310cd8c444a1f72a5e517a44331620f8e30f01df478', 30, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",69],"day"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xca58afe853ae3779e9f30262e2c8e9b756cd3c4b87bee3de7b1bb81257744840', 20, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",71],"day"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x79a1d39d5a93f57f3b0b3af5d35a0ce117b339776eb33e23e1665e50e0aaacb6', 110, '{"type":"query","database":2,"query":{"source-table":56,"aggregation":[["distinct",["fk->",67,61]]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x7e896dabd863187c81d3da517616cd738895fb2cac1a027b39a99f76ab7b9fc3', 26, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",69],"day-of-week"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x72a8ff5aee028aa1ab6db901ad45090172329251a2cb0e68fa74d8e7b8d20342', 18, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",71],"day-of-week"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x322479366187300b8d5730f86abfb4cbfca73e4f377e6d77b14647daa63b5f32', 17, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",69],"hour-of-day"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x9a4dea38f25d44ff0a012b33b46e458ca1abe05abbb756d5548161f2b084366e', 14, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",71],"hour-of-day"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x0f7461e1e5ef06772ce56f658f00336e4888331e0b2193061acb0ab78ae4133f', 13, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",69],"month-of-year"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x378ff8ca8d413549f5157ab8b2498d0fedd6e28859e30f581090ecb6d093aaa3', 13, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",71],"month-of-year"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\x3ec6d880136d46f9324baf3999c3f4ba396a7f5ed623bea93bfec74bdc328e53', 16, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",69],"quarter-of-year"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xe383ac040e6d7aa5dc4158a600d2d4eb30ceb47ead497326ceb1720b4ec6892c', 18, '{"type":"query","database":2,"query":{"source-table":56,"breakout":[["datetime-field",["field-id",71],"quarter-of-year"]],"aggregation":[["count"]]},"middleware":{"js-int-to-string?":true,"add-default-userland-constraints?":true}}');
INSERT INTO public.query VALUES ('\xfcb449b9c8ae1381b992461a9b5e075292dad42991a4379c6fd1b6ed6ec55384', 212, '{"constraints":{"max-results":10000,"max-results-bare-rows":2000},"type":"query","middleware":{"js-int-to-string?":true},"database":2,"query":{"source-table":59,"breakout":[["field-id",466]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]},"async?":true,"cache-ttl":null}');


--
-- TOC entry 3741 (class 0 OID 29615)
-- Dependencies: 268
-- Data for Name: query_cache; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3740 (class 0 OID 29604)
-- Dependencies: 267
-- Data for Name: query_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.query_execution VALUES (1, '\x816cd803a8b892ee90a01f8542b3ba10198f83738ac86e8b39f41511b964685c', '2021-04-12 20:58:40.618603+00', 78, 1, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (2, '\x425b91ac4053f47c3db7984e1a6c0abc5f5b0822e22fa13e4fb29b445a296066', '2021-04-12 20:58:40.657182+00', 118, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (3, '\x0585dc2d184bac94534cbd2403d6642e889bd62d47422efbd82d86268d197bc0', '2021-04-12 20:58:40.707625+00', 106, 8, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (4, '\xd69fc420e7a5eaa9ab0d1cdc2e81f68ef30b031a19deab52c54dcc4e5a735cf8', '2021-04-12 20:58:40.806477+00', 86, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (5, '\x8ea983308aafc2f354ac5dd24f0ff0cf99c364214bf94b8efc4d5836c3fb4b14', '2021-04-12 20:58:40.758389+00', 154, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (6, '\xdcd9044e460d95e3c8893f19e6b3c3d71c26d67e3d9cba895b2d9ba986e77882', '2021-04-12 20:58:40.861606+00', 151, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (7, '\x66ea22b887d1e9e6a5105d33d67c51a06ceaed376a106e9b49f547f7b61304f1', '2021-04-12 20:58:40.926375+00', 159, 10, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (8, '\x9b9417ad60bf91ea863cb4fa09a2964d24cd13542058e5e77a53bd0707f89bf1', '2021-04-12 20:58:40.984559+00', 137, 5, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (9, '\xd195eeb4cae2534aecc2395dbe4cdd0a3c8b6c2a19e6a9697ec45539f92c6e9b', '2021-04-12 20:58:41.028845+00', 111, 7, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (10, '\x70a34b2315525e1972a097ebc000b01ccb5069a0b8f76840f3278d310e4e4cde', '2021-04-12 20:58:41.11323+00', 147, 7, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (11, '\x3fdeec3143dc39a6065b66ba264b42df40f4b1f4d230eaa1a12d0774532f0418', '2021-04-12 20:58:41.141264+00', 147, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (12, '\xd1b7faa6e2a2a90f21ff70c212544875bb140f22f2f3834b067b3acd51435f5c', '2021-04-12 20:58:41.172771+00', 132, 6, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (13, '\x4fb7f09c97d37c1097fd7318c0eac120c46e937089067ddcddc0d3808a4dacc5', '2021-04-12 20:58:41.223408+00', 187, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (14, '\xe1a5e31d3e81821bdbcbe4e418e7447afc09fd0141a0bd7b23c174fdeca71baa', '2021-04-12 20:58:41.275686+00', 159, 7, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (15, '\x5780a19a3294fbb94bdf6e7552721db8b57e7ab67563b30cc19b2022796842bf', '2021-04-12 20:58:41.328153+00', 147, 184, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (16, '\x57acbbc8bded1b5dd742beb5c18506b86358da43eb636131091e162d843a01ec', '2021-04-12 20:59:39.985308+00', 396, 2000, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (17, '\x14fd5f2446eb6658457ceeb1947af47321e11e6e3a1d72306569e68efcd703bd', '2021-04-12 20:59:56.436414+00', 424, 10000, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (18, '\x816cd803a8b892ee90a01f8542b3ba10198f83738ac86e8b39f41511b964685c', '2021-04-12 21:00:04.484967+00', 14, 1, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (19, '\x57acbbc8bded1b5dd742beb5c18506b86358da43eb636131091e162d843a01ec', '2021-04-12 21:00:45.068251+00', 289, 2000, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (20, '\xcf06a4ba33b0aefb02799361e9f3025421e5e2ef61dd099e8a9f32d8e8505630', '2021-04-12 21:01:15.301787+00', 59, 184, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (21, '\x57acbbc8bded1b5dd742beb5c18506b86358da43eb636131091e162d843a01ec', '2021-04-12 21:04:11.030652+00', 281, 2000, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (22, '\x616fd7760c588fd6705f27d540496caa09c3c5089197ebcecc823472036c67c5', '2021-04-12 21:05:21.429768+00', 57, 8, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (23, '\x46094daa88c06f59ce4f0cb0359b8c26b13b01b4849014e12ddabc7c172e7edf', '2021-04-12 21:06:19.890283+00', 27, 1, false, 'question', NULL, 1, 4, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (24, '\x0a9acab03a3ddd988144b36f07e752a020de14de1b955b4b783cbad14bda66be', '2021-04-12 21:06:19.939433+00', 121, 8, false, 'question', NULL, 1, 6, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (25, '\xe23cd6f1e911379e5a0b9112da877430d7f1d0f67f7be0dd106d4b6bb672ba38', '2021-04-12 21:06:19.960375+00', 124, 10, false, 'question', NULL, 1, 10, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (26, '\xc6f823a8558ac79cf7d7a94b0155f3e0f61ddc80c92bad0818c95d0b322d3a7e', '2021-04-12 21:06:19.957353+00', 170, 4, false, 'question', NULL, 1, 5, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (27, '\x53498a66f44f421afec494ba851a6c425a489592c42d10ed311a577a03710237', '2021-04-12 21:06:19.935882+00', 213, 4, false, 'question', NULL, 1, 7, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (28, '\x255ede57837e37392823ba3a129a4e91bdf2caaa45e72044ced403e37c50a548', '2021-04-12 21:06:19.960368+00', 193, 4, false, 'question', NULL, 1, 9, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (29, '\x123eb330486b50201c84df810b250f3ffd2b98bd5c30789a461df6d73e200621', '2021-04-12 21:06:19.992544+00', 171, 4, false, 'question', NULL, 1, 8, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (30, '\x197d5b999f7c0829cabc188a9b8cba971bddc37795ed63b76f64789a278b4945', '2021-04-12 21:06:20.081323+00', 183, 5, false, 'question', NULL, 1, 11, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (31, '\xfcb449b9c8ae1381b992461a9b5e075292dad42991a4379c6fd1b6ed6ec55384', '2021-04-12 21:06:20.099697+00', 168, 7, false, 'question', NULL, 1, 12, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (32, '\xa430ea8cd9a36f02ec3e160e77ce07183f9bc4d371d4e32518733076eb49a130', '2021-04-12 21:06:20.183091+00', 133, 6, false, 'question', NULL, 1, 15, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (33, '\xffc46acf6d85b79254f6f893d56f0986f98791bd93d83cb623774e5c8887e0c2', '2021-04-12 21:06:20.202649+00', 139, 4, false, 'question', NULL, 1, 16, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (34, '\x46d944335cb0c2ad7d0baa37cc706c021ad76a7c330c78f1404128e3466ab465', '2021-04-12 21:06:20.178523+00', 144, 7, false, 'question', NULL, 1, 13, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (35, '\x99e3536af479f1279fb3057f762748de7a7728b19604820c3a41dd312db7c027', '2021-04-12 21:06:20.181421+00', 168, 4, false, 'question', NULL, 1, 14, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (36, '\x49dba81a1b3f67751dd8f458a420aaa01a8b1d1c3ffd7a1f25e4720d0661f0ae', '2021-04-12 21:06:20.292009+00', 114, 184, false, 'question', NULL, 1, 18, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (37, '\x7033b41a872341dbdc8899ca35f83a12af3fdeefee5202974489de3a518aaa06', '2021-04-12 21:06:20.284281+00', 136, 7, false, 'question', NULL, 1, 17, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (38, '\x1793d16b9954bf1177ad807e7dcf45f3a7b254e8283509a4d44eb8c5324ad0b3', '2021-04-12 21:07:35.746114+00', 140, 4, false, 'question', NULL, 1, 5, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (39, '\x61a4490866685a3313ab04b9de37c437217a266cbe011673afb3146fb76e0e32', '2021-04-12 21:07:35.745987+00', 146, 1, false, 'question', NULL, 1, 4, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (40, '\x6b38bcfeaf3a55d4c21ef01cc8ea701552619b51e33eb1d8d292aab969be9c97', '2021-04-12 21:07:35.756201+00', 155, 4, false, 'question', NULL, 1, 8, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (41, '\x3aca1fd6b341c6e8d8f303440e86a978818367d73f3d39f2793004fa48b3a170', '2021-04-12 21:07:35.755534+00', 210, 1, false, 'question', NULL, 1, 7, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (42, '\xc820f1ecaf74e7fff18f8eb2b402772359ec37ecc460f74611e7e8e9efbfc0ce', '2021-04-12 21:07:35.749503+00', 198, 8, false, 'question', NULL, 1, 6, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (43, '\x94b39d5f6859f7a3c6fa2ff746e12bd90caed4aeed98a322015b40613e667fa3', '2021-04-12 21:07:35.822154+00', 195, 4, false, 'question', NULL, 1, 9, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (44, '\x655f22f16e054fea9b3839338f8118be98ea3aba0f68dd5785af94ec6295f927', '2021-04-12 21:07:35.813336+00', 224, 5, false, 'question', NULL, 1, 11, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (45, '\x5ca6b03157aabc0ceb396e002683992fd7439250d3281daf2dc1921f31cfffe4', '2021-04-12 21:07:35.857874+00', 244, 7, false, 'question', NULL, 1, 12, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (46, '\x2adc1808ea63c315ff31206c0044f513192adb3c37001f3ab844e112d0134d02', '2021-04-12 21:07:35.919097+00', 233, 7, false, 'question', NULL, 1, 13, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (47, '\xe77641435a52644c986f96aebab205aa3d7bc3e9268200d8254b7c6483b4722d', '2021-04-12 21:07:35.923296+00', 235, 161, false, 'question', NULL, 1, 18, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (48, '\x32f73e5efa54e186853cbeb1f8d8fb8175c711c4c1a3ccf6a07c07a5b02ff0a1', '2021-04-12 21:07:35.994106+00', 183, 6, false, 'question', NULL, 1, 15, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (49, '\xdf3f5ff38d5a9ae5daf1a71e76cfae5d04213fdf9319bae2a8e7da1703bc9a09', '2021-04-12 21:07:35.883474+00', 298, 10, false, 'question', NULL, 1, 10, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (50, '\xd7d0659477e4b8489189ea3085a5af37852862d293ccb74787ef0a1db10ddf9c', '2021-04-12 21:07:35.933326+00', 275, 4, false, 'question', NULL, 1, 14, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (51, '\x0c8abd11d9d21efa15bb228fa08731acb5a22729c56496b83acb775860a5e1d2', '2021-04-12 21:07:35.997139+00', 212, 7, false, 'question', NULL, 1, 17, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (52, '\xf255fff03baf164536ec4a34725e5b6dec20f83fffd3ad60106655e55abb48a6', '2021-04-12 21:07:36.057308+00', 175, 4, false, 'question', NULL, 1, 16, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (53, '\x46094daa88c06f59ce4f0cb0359b8c26b13b01b4849014e12ddabc7c172e7edf', '2021-04-12 21:07:37.774376+00', 30, 1, false, 'question', NULL, 1, 4, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (54, '\xe23cd6f1e911379e5a0b9112da877430d7f1d0f67f7be0dd106d4b6bb672ba38', '2021-04-12 21:07:37.792148+00', 106, 10, false, 'question', NULL, 1, 10, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (55, '\xc6f823a8558ac79cf7d7a94b0155f3e0f61ddc80c92bad0818c95d0b322d3a7e', '2021-04-12 21:07:37.778851+00', 134, 4, false, 'question', NULL, 1, 5, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (56, '\x123eb330486b50201c84df810b250f3ffd2b98bd5c30789a461df6d73e200621', '2021-04-12 21:07:37.794698+00', 128, 4, false, 'question', NULL, 1, 8, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (57, '\x255ede57837e37392823ba3a129a4e91bdf2caaa45e72044ced403e37c50a548', '2021-04-12 21:07:37.799308+00', 136, 4, false, 'question', NULL, 1, 9, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (58, '\x0a9acab03a3ddd988144b36f07e752a020de14de1b955b4b783cbad14bda66be', '2021-04-12 21:07:37.778564+00', 211, 8, false, 'question', NULL, 1, 6, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (59, '\x53498a66f44f421afec494ba851a6c425a489592c42d10ed311a577a03710237', '2021-04-12 21:07:37.799308+00', 207, 4, false, 'question', NULL, 1, 7, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (60, '\x197d5b999f7c0829cabc188a9b8cba971bddc37795ed63b76f64789a278b4945', '2021-04-12 21:07:37.846688+00', 218, 5, false, 'question', NULL, 1, 11, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (61, '\x49dba81a1b3f67751dd8f458a420aaa01a8b1d1c3ffd7a1f25e4720d0661f0ae', '2021-04-12 21:07:37.924191+00', 195, 184, false, 'question', NULL, 1, 18, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (62, '\xfcb449b9c8ae1381b992461a9b5e075292dad42991a4379c6fd1b6ed6ec55384', '2021-04-12 21:07:37.838279+00', 289, 7, false, 'question', NULL, 1, 12, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (63, '\x46d944335cb0c2ad7d0baa37cc706c021ad76a7c330c78f1404128e3466ab465', '2021-04-12 21:07:37.841284+00', 283, 7, false, 'question', NULL, 1, 13, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (64, '\x99e3536af479f1279fb3057f762748de7a7728b19604820c3a41dd312db7c027', '2021-04-12 21:07:37.925898+00', 219, 4, false, 'question', NULL, 1, 14, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (65, '\xa430ea8cd9a36f02ec3e160e77ce07183f9bc4d371d4e32518733076eb49a130', '2021-04-12 21:07:37.933905+00', 217, 6, false, 'question', NULL, 1, 15, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (66, '\xffc46acf6d85b79254f6f893d56f0986f98791bd93d83cb623774e5c8887e0c2', '2021-04-12 21:07:38.028443+00', 133, 4, false, 'question', NULL, 1, 16, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (67, '\x7033b41a872341dbdc8899ca35f83a12af3fdeefee5202974489de3a518aaa06', '2021-04-12 21:07:37.957687+00', 216, 7, false, 'question', NULL, 1, 17, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (68, '\x01c0e65f08c0564dd589e5a1ae20bd6d4eee1c064fe4eac900059affd46280fb', '2021-04-12 21:07:47.653943+00', 79, 7, false, 'question', NULL, 1, 12, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (69, '\x474c926ce8408471e31e0471a154225f62fe01ccdcdff21624fcb0d29b19445d', '2021-04-12 21:07:47.631518+00', 96, 8, false, 'question', NULL, 1, 6, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (70, '\x0d1b32d9b746365680419f0dfa4a00dde110ed088db4fc8604df08211e6d39d3', '2021-04-12 21:07:47.631252+00', 124, 1, false, 'question', NULL, 1, 4, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (71, '\x600a2229788ee1a477671b3aee0b0e7daed52c09e227e4d8757c95d5265d3f22', '2021-04-12 21:07:47.644285+00', 113, 4, false, 'question', NULL, 1, 7, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (72, '\xfbdfd42020482d18f682af32d1476f1488bcb8f1d33ec9b8bc97d4bf8a195b25', '2021-04-12 21:07:47.631339+00', 139, 4, false, 'question', NULL, 1, 5, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (73, '\x2ab8e373aceb672fd3dee7f14a5c8c79e1993e5bbaed2737ac28d3ab4777d250', '2021-04-12 21:07:47.650145+00', 151, 10, false, 'question', NULL, 1, 10, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (74, '\x0520a112f77fe2a29e20e16ec5f12c3172cb515b727ab3b4012d0e697254ff1f', '2021-04-12 21:07:47.642138+00', 183, 4, false, 'question', NULL, 1, 8, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (79, '\x8cd49599b2e19c6f0973cbf5e031975c147ed95da4e291faa8a34465011f2671', '2021-04-12 21:07:47.747194+00', 123, 1, false, 'question', NULL, 1, 18, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (80, '\xf30cd15248b7364e1783101ab1c5fa5b2520f3fd071d04d58450d1a3deac016c', '2021-04-12 21:07:47.775271+00', 122, 7, false, 'question', NULL, 1, 17, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (82, '\x1fdddca020e4e9bf458003d29b299833228243db7478860f946ab346341abad9', '2021-04-12 21:07:47.795172+00', 124, 6, false, 'question', NULL, 1, 15, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (87, '\x0a9acab03a3ddd988144b36f07e752a020de14de1b955b4b783cbad14bda66be', '2021-04-12 21:07:50.500163+00', 177, 8, false, 'question', NULL, 1, 6, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (93, '\xffc46acf6d85b79254f6f893d56f0986f98791bd93d83cb623774e5c8887e0c2', '2021-04-12 21:07:50.632782+00', 142, 4, false, 'question', NULL, 1, 16, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (94, '\x49dba81a1b3f67751dd8f458a420aaa01a8b1d1c3ffd7a1f25e4720d0661f0ae', '2021-04-12 21:07:50.659679+00', 127, 184, false, 'question', NULL, 1, 18, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (97, '\x7033b41a872341dbdc8899ca35f83a12af3fdeefee5202974489de3a518aaa06', '2021-04-12 21:07:50.704857+00', 131, 7, false, 'question', NULL, 1, 17, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (99, '\x425b91ac4053f47c3db7984e1a6c0abc5f5b0822e22fa13e4fb29b445a296066', '2021-04-12 21:08:07.145645+00', 64, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (102, '\xd69fc420e7a5eaa9ab0d1cdc2e81f68ef30b031a19deab52c54dcc4e5a735cf8', '2021-04-12 21:08:07.252763+00', 81, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (103, '\xdcd9044e460d95e3c8893f19e6b3c3d71c26d67e3d9cba895b2d9ba986e77882', '2021-04-12 21:08:07.300616+00', 87, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (109, '\xd1b7faa6e2a2a90f21ff70c212544875bb140f22f2f3834b067b3acd51435f5c', '2021-04-12 21:08:07.547632+00', 78, 6, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (112, '\x5780a19a3294fbb94bdf6e7552721db8b57e7ab67563b30cc19b2022796842bf', '2021-04-12 21:08:07.656174+00', 73, 184, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (75, '\xfb4a879e4c60cce2fac2e895e8a14fad9c731ae40d8d19cd337df84d26c26fdf', '2021-04-12 21:07:47.655237+00', 163, 5, false, 'question', NULL, 1, 11, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (78, '\x3064ddaeb7ce55249849a8801956465b359c8a868262d16be68dcb1657841db0', '2021-04-12 21:07:47.773343+00', 100, 4, false, 'question', NULL, 1, 14, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (88, '\xc6f823a8558ac79cf7d7a94b0155f3e0f61ddc80c92bad0818c95d0b322d3a7e', '2021-04-12 21:07:50.496676+00', 193, 4, false, 'question', NULL, 1, 5, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (107, '\x70a34b2315525e1972a097ebc000b01ccb5069a0b8f76840f3278d310e4e4cde', '2021-04-12 21:08:07.46021+00', 93, 7, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (108, '\x3fdeec3143dc39a6065b66ba264b42df40f4b1f4d230eaa1a12d0774532f0418', '2021-04-12 21:08:07.501237+00', 79, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (76, '\x44a3fecd456eab682a420d1c68582a3e39b14ec6ed5dfed91988d007e24859d7', '2021-04-12 21:07:47.650145+00', 193, 4, false, 'question', NULL, 1, 9, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (77, '\x11a28c1337685819b91da009d5d03763ca87b2dc7f461978b7efd9aed62fbf9b', '2021-04-12 21:07:47.744831+00', 124, 7, false, 'question', NULL, 1, 13, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (81, '\xaa115c9fab18074cbdf838818d5adbebe67375571e398ae3ce3416be7a7ade9a', '2021-04-12 21:07:47.840029+00', 79, 4, false, 'question', NULL, 1, 16, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (83, '\x46094daa88c06f59ce4f0cb0359b8c26b13b01b4849014e12ddabc7c172e7edf', '2021-04-12 21:07:50.472066+00', 25, 1, false, 'question', NULL, 1, 4, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (84, '\x53498a66f44f421afec494ba851a6c425a489592c42d10ed311a577a03710237', '2021-04-12 21:07:50.497531+00', 127, 4, false, 'question', NULL, 1, 7, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (85, '\x46d944335cb0c2ad7d0baa37cc706c021ad76a7c330c78f1404128e3466ab465', '2021-04-12 21:07:50.506301+00', 137, 7, false, 'question', NULL, 1, 13, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (86, '\x123eb330486b50201c84df810b250f3ffd2b98bd5c30789a461df6d73e200621', '2021-04-12 21:07:50.498725+00', 142, 4, false, 'question', NULL, 1, 8, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (90, '\x255ede57837e37392823ba3a129a4e91bdf2caaa45e72044ced403e37c50a548', '2021-04-12 21:07:50.49622+00', 198, 4, false, 'question', NULL, 1, 9, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (92, '\x197d5b999f7c0829cabc188a9b8cba971bddc37795ed63b76f64789a278b4945', '2021-04-12 21:07:50.49887+00', 203, 5, false, 'question', NULL, 1, 11, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (110, '\x4fb7f09c97d37c1097fd7318c0eac120c46e937089067ddcddc0d3808a4dacc5', '2021-04-12 21:08:07.583505+00', 79, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (111, '\xe1a5e31d3e81821bdbcbe4e418e7447afc09fd0141a0bd7b23c174fdeca71baa', '2021-04-12 21:08:07.618772+00', 84, 7, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (89, '\xfcb449b9c8ae1381b992461a9b5e075292dad42991a4379c6fd1b6ed6ec55384', '2021-04-12 21:07:50.497531+00', 187, 7, false, 'question', NULL, 1, 12, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (91, '\xe23cd6f1e911379e5a0b9112da877430d7f1d0f67f7be0dd106d4b6bb672ba38', '2021-04-12 21:07:50.496493+00', 188, 10, false, 'question', NULL, 1, 10, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (95, '\xa430ea8cd9a36f02ec3e160e77ce07183f9bc4d371d4e32518733076eb49a130', '2021-04-12 21:07:50.660227+00', 137, 6, false, 'question', NULL, 1, 15, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (96, '\x99e3536af479f1279fb3057f762748de7a7728b19604820c3a41dd312db7c027', '2021-04-12 21:07:50.705631+00', 115, 4, false, 'question', NULL, 1, 14, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (98, '\x816cd803a8b892ee90a01f8542b3ba10198f83738ac86e8b39f41511b964685c', '2021-04-12 21:08:07.117025+00', 15, 1, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (100, '\x0585dc2d184bac94534cbd2403d6642e889bd62d47422efbd82d86268d197bc0', '2021-04-12 21:08:07.193853+00', 70, 8, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (101, '\x8ea983308aafc2f354ac5dd24f0ff0cf99c364214bf94b8efc4d5836c3fb4b14', '2021-04-12 21:08:07.214178+00', 90, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (104, '\x66ea22b887d1e9e6a5105d33d67c51a06ceaed376a106e9b49f547f7b61304f1', '2021-04-12 21:08:07.348846+00', 95, 10, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (105, '\xd195eeb4cae2534aecc2395dbe4cdd0a3c8b6c2a19e6a9697ec45539f92c6e9b', '2021-04-12 21:08:07.426775+00', 80, 7, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (106, '\x9b9417ad60bf91ea863cb4fa09a2964d24cd13542058e5e77a53bd0707f89bf1', '2021-04-12 21:08:07.437233+00', 76, 5, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (113, '\x75871d35c899c0eab36da661b318737591c97485b9722fda1e13dae4831b4c0b', '2021-04-12 21:08:56.553846+00', 8, 1, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (114, '\x9709e67ac3091e29512b53402a5594caeeed1f22dbf9af9e25bbc35e9aa35349', '2021-04-12 21:08:56.584475+00', 24, 1, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (115, '\x012b814ac7edf4cd226baec9f18a894a1a2a3623c2ad12300e735fea3dcffc4a', '2021-04-12 21:08:56.615793+00', 10, 1, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (116, '\xe15f246b453a6d154e2ce310cd8c444a1f72a5e517a44331620f8e30f01df478', '2021-04-12 21:08:56.693234+00', 30, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (117, '\xca58afe853ae3779e9f30262e2c8e9b756cd3c4b87bee3de7b1bb81257744840', '2021-04-12 21:08:56.74716+00', 20, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (118, '\x79a1d39d5a93f57f3b0b3af5d35a0ce117b339776eb33e23e1665e50e0aaacb6', '2021-04-12 21:08:56.663873+00', 110, 1, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (119, '\x7e896dabd863187c81d3da517616cd738895fb2cac1a027b39a99f76ab7b9fc3', '2021-04-12 21:08:56.786082+00', 26, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (120, '\x72a8ff5aee028aa1ab6db901ad45090172329251a2cb0e68fa74d8e7b8d20342', '2021-04-12 21:08:56.831943+00', 18, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (121, '\x322479366187300b8d5730f86abfb4cbfca73e4f377e6d77b14647daa63b5f32', '2021-04-12 21:08:56.871717+00', 17, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (122, '\x9a4dea38f25d44ff0a012b33b46e458ca1abe05abbb756d5548161f2b084366e', '2021-04-12 21:08:56.914481+00', 14, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (123, '\x0f7461e1e5ef06772ce56f658f00336e4888331e0b2193061acb0ab78ae4133f', '2021-04-12 21:08:56.959206+00', 13, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (124, '\x378ff8ca8d413549f5157ab8b2498d0fedd6e28859e30f581090ecb6d093aaa3', '2021-04-12 21:08:56.999571+00', 13, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (125, '\x3ec6d880136d46f9324baf3999c3f4ba396a7f5ed623bea93bfec74bdc328e53', '2021-04-12 21:08:57.038859+00', 16, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (126, '\xe383ac040e6d7aa5dc4158a600d2d4eb30ceb47ead497326ceb1720b4ec6892c', '2021-04-12 21:08:57.073978+00', 18, 0, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (127, '\x816cd803a8b892ee90a01f8542b3ba10198f83738ac86e8b39f41511b964685c', '2021-04-12 21:09:00.000309+00', 12, 1, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (128, '\x425b91ac4053f47c3db7984e1a6c0abc5f5b0822e22fa13e4fb29b445a296066', '2021-04-12 21:09:00.022423+00', 59, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (129, '\x0585dc2d184bac94534cbd2403d6642e889bd62d47422efbd82d86268d197bc0', '2021-04-12 21:09:00.056072+00', 63, 8, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (130, '\x8ea983308aafc2f354ac5dd24f0ff0cf99c364214bf94b8efc4d5836c3fb4b14', '2021-04-12 21:09:00.082451+00', 83, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (131, '\xd69fc420e7a5eaa9ab0d1cdc2e81f68ef30b031a19deab52c54dcc4e5a735cf8', '2021-04-12 21:09:00.115922+00', 72, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (132, '\xdcd9044e460d95e3c8893f19e6b3c3d71c26d67e3d9cba895b2d9ba986e77882', '2021-04-12 21:09:00.149932+00', 98, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (133, '\x66ea22b887d1e9e6a5105d33d67c51a06ceaed376a106e9b49f547f7b61304f1', '2021-04-12 21:09:00.18496+00', 71, 10, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (134, '\x9b9417ad60bf91ea863cb4fa09a2964d24cd13542058e5e77a53bd0707f89bf1', '2021-04-12 21:09:00.224149+00', 78, 5, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (135, '\xd195eeb4cae2534aecc2395dbe4cdd0a3c8b6c2a19e6a9697ec45539f92c6e9b', '2021-04-12 21:09:00.269606+00', 78, 7, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (136, '\x70a34b2315525e1972a097ebc000b01ccb5069a0b8f76840f3278d310e4e4cde', '2021-04-12 21:09:00.293681+00', 82, 7, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (137, '\x3fdeec3143dc39a6065b66ba264b42df40f4b1f4d230eaa1a12d0774532f0418', '2021-04-12 21:09:00.327324+00', 85, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (138, '\xd1b7faa6e2a2a90f21ff70c212544875bb140f22f2f3834b067b3acd51435f5c', '2021-04-12 21:09:00.363973+00', 87, 6, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (139, '\x4fb7f09c97d37c1097fd7318c0eac120c46e937089067ddcddc0d3808a4dacc5', '2021-04-12 21:09:00.394046+00', 90, 4, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (140, '\xe1a5e31d3e81821bdbcbe4e418e7447afc09fd0141a0bd7b23c174fdeca71baa', '2021-04-12 21:09:00.427665+00', 95, 7, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (141, '\x5780a19a3294fbb94bdf6e7552721db8b57e7ab67563b30cc19b2022796842bf', '2021-04-12 21:09:00.471671+00', 88, 184, false, 'ad-hoc', NULL, 1, NULL, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (142, '\x46094daa88c06f59ce4f0cb0359b8c26b13b01b4849014e12ddabc7c172e7edf', '2021-04-12 21:09:19.722206+00', 32, 1, false, 'question', NULL, 1, 4, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (143, '\x123eb330486b50201c84df810b250f3ffd2b98bd5c30789a461df6d73e200621', '2021-04-12 21:09:19.719006+00', 82, 4, false, 'question', NULL, 1, 8, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (144, '\xe23cd6f1e911379e5a0b9112da877430d7f1d0f67f7be0dd106d4b6bb672ba38', '2021-04-12 21:09:19.723379+00', 126, 10, false, 'question', NULL, 1, 10, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (145, '\x0a9acab03a3ddd988144b36f07e752a020de14de1b955b4b783cbad14bda66be', '2021-04-12 21:09:19.745055+00', 112, 8, false, 'question', NULL, 1, 6, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (146, '\x197d5b999f7c0829cabc188a9b8cba971bddc37795ed63b76f64789a278b4945', '2021-04-12 21:09:19.726563+00', 146, 5, false, 'question', NULL, 1, 11, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (147, '\xc6f823a8558ac79cf7d7a94b0155f3e0f61ddc80c92bad0818c95d0b322d3a7e', '2021-04-12 21:09:19.745367+00', 159, 4, false, 'question', NULL, 1, 5, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (148, '\x255ede57837e37392823ba3a129a4e91bdf2caaa45e72044ced403e37c50a548', '2021-04-12 21:09:19.728843+00', 186, 4, false, 'question', NULL, 1, 9, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (149, '\x53498a66f44f421afec494ba851a6c425a489592c42d10ed311a577a03710237', '2021-04-12 21:09:19.729515+00', 198, 4, false, 'question', NULL, 1, 7, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (150, '\xfcb449b9c8ae1381b992461a9b5e075292dad42991a4379c6fd1b6ed6ec55384', '2021-04-12 21:09:19.747548+00', 221, 7, false, 'question', NULL, 1, 12, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (151, '\x46d944335cb0c2ad7d0baa37cc706c021ad76a7c330c78f1404128e3466ab465', '2021-04-12 21:09:19.86675+00', 167, 7, false, 'question', NULL, 1, 13, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (152, '\x99e3536af479f1279fb3057f762748de7a7728b19604820c3a41dd312db7c027', '2021-04-12 21:09:19.886464+00', 158, 4, false, 'question', NULL, 1, 14, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (153, '\xa430ea8cd9a36f02ec3e160e77ce07183f9bc4d371d4e32518733076eb49a130', '2021-04-12 21:09:19.919596+00', 124, 6, false, 'question', NULL, 1, 15, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (154, '\xffc46acf6d85b79254f6f893d56f0986f98791bd93d83cb623774e5c8887e0c2', '2021-04-12 21:09:19.925072+00', 120, 4, false, 'question', NULL, 1, 16, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (155, '\x7033b41a872341dbdc8899ca35f83a12af3fdeefee5202974489de3a518aaa06', '2021-04-12 21:09:19.937819+00', 147, 7, false, 'question', NULL, 1, 17, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (156, '\x49dba81a1b3f67751dd8f458a420aaa01a8b1d1c3ffd7a1f25e4720d0661f0ae', '2021-04-12 21:09:19.982375+00', 140, 184, false, 'question', NULL, 1, 18, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (157, '\x46094daa88c06f59ce4f0cb0359b8c26b13b01b4849014e12ddabc7c172e7edf', '2021-04-13 00:45:08.960995+00', 420, 1, false, 'question', NULL, 1, 4, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (158, '\x123eb330486b50201c84df810b250f3ffd2b98bd5c30789a461df6d73e200621', '2021-04-13 00:48:58.196943+00', 198, 4, false, 'question', NULL, 1, 8, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (159, '\x46094daa88c06f59ce4f0cb0359b8c26b13b01b4849014e12ddabc7c172e7edf', '2021-04-13 00:50:45.207485+00', 71, 1, false, 'question', NULL, 1, 4, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (160, '\x123eb330486b50201c84df810b250f3ffd2b98bd5c30789a461df6d73e200621', '2021-04-13 00:50:45.200481+00', 190, 4, false, 'question', NULL, 1, 8, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (161, '\x53498a66f44f421afec494ba851a6c425a489592c42d10ed311a577a03710237', '2021-04-13 00:50:45.157244+00', 294, 4, false, 'question', NULL, 1, 7, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (162, '\x0a9acab03a3ddd988144b36f07e752a020de14de1b955b4b783cbad14bda66be', '2021-04-13 00:50:45.149663+00', 276, 8, false, 'question', NULL, 1, 6, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (163, '\xc6f823a8558ac79cf7d7a94b0155f3e0f61ddc80c92bad0818c95d0b322d3a7e', '2021-04-13 00:50:45.144898+00', 365, 4, false, 'question', NULL, 1, 5, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (164, '\x255ede57837e37392823ba3a129a4e91bdf2caaa45e72044ced403e37c50a548', '2021-04-13 00:50:45.19258+00', 342, 4, false, 'question', NULL, 1, 9, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (165, '\xe23cd6f1e911379e5a0b9112da877430d7f1d0f67f7be0dd106d4b6bb672ba38', '2021-04-13 00:50:45.313058+00', 274, 10, false, 'question', NULL, 1, 10, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (166, '\x197d5b999f7c0829cabc188a9b8cba971bddc37795ed63b76f64789a278b4945', '2021-04-13 00:50:45.431602+00', 251, 5, false, 'question', NULL, 1, 11, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (167, '\xfcb449b9c8ae1381b992461a9b5e075292dad42991a4379c6fd1b6ed6ec55384', '2021-04-13 00:50:45.491403+00', 284, 7, false, 'question', NULL, 1, 12, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (168, '\x99e3536af479f1279fb3057f762748de7a7728b19604820c3a41dd312db7c027', '2021-04-13 00:50:45.534812+00', 291, 4, false, 'question', NULL, 1, 14, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (169, '\xa430ea8cd9a36f02ec3e160e77ce07183f9bc4d371d4e32518733076eb49a130', '2021-04-13 00:50:45.592012+00', 293, 6, false, 'question', NULL, 1, 15, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (170, '\x46d944335cb0c2ad7d0baa37cc706c021ad76a7c330c78f1404128e3466ab465', '2021-04-13 00:50:45.50803+00', 381, 7, false, 'question', NULL, 1, 13, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (171, '\xffc46acf6d85b79254f6f893d56f0986f98791bd93d83cb623774e5c8887e0c2', '2021-04-13 00:50:45.64145+00', 271, 4, false, 'question', NULL, 1, 16, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (172, '\x7033b41a872341dbdc8899ca35f83a12af3fdeefee5202974489de3a518aaa06', '2021-04-13 00:50:45.730131+00', 241, 7, false, 'question', NULL, 1, 17, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (173, '\x49dba81a1b3f67751dd8f458a420aaa01a8b1d1c3ffd7a1f25e4720d0661f0ae', '2021-04-13 00:50:45.837117+00', 267, 184, false, 'question', NULL, 1, 18, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (174, '\x123eb330486b50201c84df810b250f3ffd2b98bd5c30789a461df6d73e200621', '2021-04-13 01:06:29.01465+00', 705, 4, false, 'question', NULL, 1, 8, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (175, '\x0a9acab03a3ddd988144b36f07e752a020de14de1b955b4b783cbad14bda66be', '2021-04-13 01:06:29.012232+00', 756, 8, false, 'question', NULL, 1, 6, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (176, '\x53498a66f44f421afec494ba851a6c425a489592c42d10ed311a577a03710237', '2021-04-13 01:06:29.044019+00', 681, 4, false, 'question', NULL, 1, 7, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (177, '\x46094daa88c06f59ce4f0cb0359b8c26b13b01b4849014e12ddabc7c172e7edf', '2021-04-13 01:06:29.000544+00', 680, 1, false, 'question', NULL, 1, 4, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (178, '\xc6f823a8558ac79cf7d7a94b0155f3e0f61ddc80c92bad0818c95d0b322d3a7e', '2021-04-13 01:06:29.047226+00', 759, 4, false, 'question', NULL, 1, 5, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (179, '\x255ede57837e37392823ba3a129a4e91bdf2caaa45e72044ced403e37c50a548', '2021-04-13 01:06:29.156798+00', 639, 4, false, 'question', NULL, 1, 9, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (180, '\xe23cd6f1e911379e5a0b9112da877430d7f1d0f67f7be0dd106d4b6bb672ba38', '2021-04-13 01:06:29.738292+00', 354, 10, false, 'question', NULL, 1, 10, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (181, '\x197d5b999f7c0829cabc188a9b8cba971bddc37795ed63b76f64789a278b4945', '2021-04-13 01:06:29.773962+00', 338, 5, false, 'question', NULL, 1, 11, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (182, '\x46d944335cb0c2ad7d0baa37cc706c021ad76a7c330c78f1404128e3466ab465', '2021-04-13 01:06:29.923995+00', 308, 7, false, 'question', NULL, 1, 13, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (185, '\xfcb449b9c8ae1381b992461a9b5e075292dad42991a4379c6fd1b6ed6ec55384', '2021-04-13 01:06:29.929542+00', 364, 7, false, 'question', NULL, 1, 12, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (183, '\xa430ea8cd9a36f02ec3e160e77ce07183f9bc4d371d4e32518733076eb49a130', '2021-04-13 01:06:29.911254+00', 299, 6, false, 'question', NULL, 1, 15, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (184, '\x99e3536af479f1279fb3057f762748de7a7728b19604820c3a41dd312db7c027', '2021-04-13 01:06:29.922842+00', 303, 4, false, 'question', NULL, 1, 14, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (186, '\xffc46acf6d85b79254f6f893d56f0986f98791bd93d83cb623774e5c8887e0c2', '2021-04-13 01:06:30.128187+00', 262, 4, false, 'question', NULL, 1, 16, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (187, '\x7033b41a872341dbdc8899ca35f83a12af3fdeefee5202974489de3a518aaa06', '2021-04-13 01:06:30.18825+00', 236, 7, false, 'question', NULL, 1, 17, NULL, NULL, 2);
INSERT INTO public.query_execution VALUES (188, '\x49dba81a1b3f67751dd8f458a420aaa01a8b1d1c3ffd7a1f25e4720d0661f0ae', '2021-04-13 01:06:30.31204+00', 257, 184, false, 'question', NULL, 1, 18, NULL, NULL, 2);


--
-- TOC entry 3689 (class 0 OID 28892)
-- Dependencies: 216
-- Data for Name: report_card; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.report_card VALUES (4, '2021-04-12 21:06:16.631786+00', '2021-04-13 01:06:29.675359+00', 'Total de pesquisas', NULL, 'scalar', '{"type":"query","database":2,"query":{"source-table":59,"aggregation":[["count"]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":[]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":1,"nil%":0.0},"type":{"type/Number":{"min":64461.0,"q1":64461.0,"q3":64461.0,"max":64461.0,"sd":null,"avg":64461.0}}}}]', NULL);
INSERT INTO public.report_card VALUES (8, '2021-04-12 21:06:16.985429+00', '2021-04-13 01:06:29.711201+00', 'Survey Results Public por Comp Fr Eq', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",443]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["CompFreq"],"graph.colors":["#509EE3"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"CompFreq","display_name":"Comp Fr Eq","base_type":"type/Text","special_type":"type/Category","id":443,"field_ref":["field-id",443],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":5.2112}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Number":{"min":1352.0,"q1":10125.5,"q3":22105.0,"max":24392.0,"sd":10131.1033086234,"avg":16115.25}}}}]', NULL);
INSERT INTO public.report_card VALUES (9, '2021-04-12 21:06:17.06619+00', '2021-04-13 01:06:29.765904+00', 'Survey Results Public por Purchase What', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",475]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["PurchaseWhat"],"graph.colors":["#9CC177"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"PurchaseWhat","display_name":"Purchase What","base_type":"type/Text","special_type":"type/Category","id":475,"field_ref":["field-id",475],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":19.6454}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Number":{"min":6998.0,"q1":11188.5,"q3":21042.0,"max":25097.0,"sd":7418.402630171359,"avg":16115.25}}}}]', NULL);
INSERT INTO public.report_card VALUES (10, '2021-04-12 21:06:17.136646+00', '2021-04-13 01:06:30.084871+00', 'Survey Results Public por Ed Level', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",468]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["EdLevel"],"graph.colors":["#A989C5"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"EdLevel","display_name":"Ed Level","base_type":"type/Text","special_type":"type/Category","id":468,"field_ref":["field-id",468],"fingerprint":{"global":{"distinct-count":10,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":46.3826}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":10,"nil%":0.0},"type":{"type/Number":{"min":493.0,"q1":941.0,"q3":7239.0,"max":26542.0,"sd":8120.536359543419,"avg":6446.1}}}}]', NULL);
INSERT INTO public.report_card VALUES (16, '2021-04-12 21:06:17.615457+00', '2021-04-13 01:06:30.386174+00', 'Survey Results Public por New Off Topic', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",471]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWOffTopic"],"graph.colors":["#7172AD"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"NEWOffTopic","display_name":"New Off Topic","base_type":"type/Text","special_type":"type/Category","id":471,"field_ref":["field-id",471],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":4.176}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Number":{"min":12063.0,"q1":12860.0,"q3":19370.5,"max":20213.0,"sd":3876.2800358935197,"avg":16115.25}}}}]', NULL);
INSERT INTO public.report_card VALUES (6, '2021-04-12 21:06:16.825132+00', '2021-04-13 01:06:29.748778+00', 'Survey Results Public por Employment', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",487]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["Employment"],"graph.colors":["#509EE3"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"Employment","display_name":"Employment","base_type":"type/Text","special_type":"type/Category","id":487,"field_ref":["field-id",487],"fingerprint":{"global":{"distinct-count":8,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":20.4105}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":8,"nil%":0.0},"type":{"type/Number":{"min":243.0,"q1":464.5,"q3":6729.5,"max":45270.0,"sd":15277.03789480427,"avg":8057.625}}}}]', NULL);
INSERT INTO public.report_card VALUES (12, '2021-04-12 21:06:17.303388+00', '2021-04-13 01:06:30.290457+00', 'Survey Results Public por Sop Art Fr Eq', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",466]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SOPartFreq"],"graph.colors":["#EF8C8C"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"SOPartFreq","display_name":"Sop Art Fr Eq","base_type":"type/Text","special_type":"type/Category","id":466,"field_ref":["field-id",466],"fingerprint":{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":28.7558}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Number":{"min":1225.0,"q1":2696.75,"q3":15858.5,"max":20432.0,"sd":7504.056119066225,"avg":9208.714285714286}}}}]', NULL);
INSERT INTO public.report_card VALUES (17, '2021-04-12 21:06:17.70418+00', '2021-04-13 01:06:30.422134+00', 'Survey Results Public por Welcome Change', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",458]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["WelcomeChange"],"graph.colors":["#9CC177"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"WelcomeChange","display_name":"Welcome Change","base_type":"type/Text","special_type":"type/Category","id":458,"field_ref":["field-id",458],"fingerprint":{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":37.1173}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Number":{"min":2031.0,"q1":2372.0,"q3":10088.5,"max":37201.0,"sd":12798.113958891048,"avg":9208.714285714286}}}}]', NULL);
INSERT INTO public.report_card VALUES (11, '2021-04-12 21:06:17.222347+00', '2021-04-13 01:06:30.099045+00', 'Survey Results Public por New Learn', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",491]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWLearn"],"graph.colors":["#EF8C8C"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"NEWLearn","display_name":"New Learn","base_type":"type/Text","special_type":"type/Category","id":491,"field_ref":["field-id",491],"fingerprint":{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":14.5839}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":5,"nil%":0.0},"type":{"type/Number":{"min":1241.0,"q1":6539.0,"q3":20754.25,"max":20938.0,"sd":8404.370154865861,"avg":12892.2}}}}]', NULL);
INSERT INTO public.report_card VALUES (14, '2021-04-12 21:06:17.462002+00', '2021-04-13 01:06:30.222915+00', 'Survey Results Public por Survey Length', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",459]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SurveyLength"],"graph.colors":["#EF8C8C"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"SurveyLength","display_name":"Survey Length","base_type":"type/Text","special_type":"type/Category","id":459,"field_ref":["field-id",459],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":17.5119}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Number":{"min":2156.0,"q1":6466.0,"q3":25764.5,"max":38769.0,"sd":15788.37486623201,"avg":16115.25}}}}]', NULL);
INSERT INTO public.report_card VALUES (7, '2021-04-12 21:06:16.908157+00', '2021-04-13 01:06:29.723125+00', 'Survey Results Public por Survey Ease', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",451]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SurveyEase"],"graph.colors":["#509EE3"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"SurveyEase","display_name":"Survey Ease","base_type":"type/Text","special_type":"type/Category","id":451,"field_ref":["field-id",451],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":10.8986}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Number":{"min":700.0,"q1":6679.5,"q3":25551.0,"max":34626.0,"sd":14051.733021825694,"avg":16115.25}}}}]', NULL);
INSERT INTO public.report_card VALUES (13, '2021-04-12 21:06:17.378479+00', '2021-04-13 01:06:30.229474+00', 'Survey Results Public por Soco Mm', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",463]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SOComm"],"graph.colors":["#EF8C8C"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"SOComm","display_name":"Soco Mm","base_type":"type/Text","special_type":"type/Category","id":463,"field_ref":["field-id",463],"fingerprint":{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":12.3262}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":7,"nil%":0.0},"type":{"type/Number":{"min":1045.0,"q1":5617.25,"q3":13933.5,"max":15273.0,"sd":5169.238168056801,"avg":9208.714285714286}}}}]', NULL);
INSERT INTO public.report_card VALUES (15, '2021-04-12 21:06:17.539149+00', '2021-04-13 01:06:30.204682+00', 'Survey Results Public por Newed Im Pt', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",493]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWEdImpt"],"graph.colors":["#f9d45c"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"NEWEdImpt","display_name":"Newed Im Pt","base_type":"type/Text","special_type":"type/Category","id":493,"field_ref":["field-id",493],"fingerprint":{"global":{"distinct-count":6,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":16.8316}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":6,"nil%":0.0},"type":{"type/Number":{"min":4752.0,"q1":7785.0,"q3":12674.0,"max":15996.0,"sd":3940.603189868272,"avg":10743.5}}}}]', NULL);
INSERT INTO public.report_card VALUES (18, '2021-04-12 21:06:17.794618+00', '2021-04-13 01:06:30.566384+00', 'Survey Results Public por país', NULL, 'map', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",440]],"aggregation":[["count"]]}}', '{"map.type":"region","map.region":"world_countries","graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["Country"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"Country","display_name":"Country","base_type":"type/Text","special_type":"type/Country","id":440,"field_ref":["field-id",440],"fingerprint":{"global":{"distinct-count":137,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0016,"average-length":9.3195}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":118,"nil%":0.0},"type":{"type/Number":{"min":1.0,"q1":8.15875242204785,"q3":289.5,"max":12469.0,"sd":1199.8698132811041,"avg":350.33152173913044}}}}]', NULL);
INSERT INTO public.report_card VALUES (5, '2021-04-12 21:06:16.736218+00', '2021-04-13 01:06:29.798147+00', 'Survey Results Public por New Onboard Good', NULL, 'row', '{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",453]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}}', '{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWOnboardGood"],"graph.colors":["#509EE3"]}', 1, 2, 59, 'query', false, 3, NULL, NULL, false, NULL, NULL, '[{"name":"NEWOnboardGood","display_name":"New Onboard Good","base_type":"type/Text","special_type":"type/Category","id":453,"field_ref":["field-id",453],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Text":{"percent-json":0.0,"percent-url":0.0,"percent-email":0.0,"percent-state":0.0,"average-length":6.8553}}}},{"name":"count","display_name":"Contagem","base_type":"type/BigInteger","special_type":"type/Quantity","field_ref":["aggregation",0],"fingerprint":{"global":{"distinct-count":4,"nil%":0.0},"type":{"type/Number":{"min":9239.0,"q1":10947.0,"q3":21283.5,"max":21838.0,"sd":6145.261067142171,"avg":16115.25}}}}]', NULL);


--
-- TOC entry 3691 (class 0 OID 28915)
-- Dependencies: 218
-- Data for Name: report_cardfavorite; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3693 (class 0 OID 28937)
-- Dependencies: 220
-- Data for Name: report_dashboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.report_dashboard VALUES (1, '2021-04-12 21:06:16.585+00', '2021-04-12 21:06:16.585+00', 'Uma olhada no seu Survey Results Public tabela', NULL, 1, '[{"id":"191019457","type":"category","name":"New Onboard Good","slug":"NEWOnboardGood"},{"id":"2062329088","type":"location/country","name":"Country","slug":"Country"},{"id":"746504410","type":"category","name":"Employment","slug":"Employment"},{"id":"600434031","type":"category","name":"Survey Ease","slug":"SurveyEase"}]', NULL, NULL, false, NULL, NULL, false, NULL, false, NULL, 3, 1);
INSERT INTO public.report_dashboard VALUES (2, '2021-04-12 21:08:52.37538+00', '2021-04-12 21:08:52.37538+00', 'Uma olhada no seu Survey Results Public tabela', NULL, 1, '[{"id":"191019457","type":"category","name":"New Onboard Good","slug":"NEWOnboardGood"},{"id":"2062329088","type":"location/country","name":"Country","slug":"Country"},{"id":"746504410","type":"category","name":"Employment","slug":"Employment"},{"id":"600434031","type":"category","name":"Survey Ease","slug":"SurveyEase"}]', NULL, NULL, false, NULL, NULL, false, NULL, false, NULL, NULL, 1);


--
-- TOC entry 3695 (class 0 OID 28960)
-- Dependencies: 222
-- Data for Name: report_dashboardcard; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.report_dashboardcard VALUES (1, '2021-04-12 21:06:16.597505+00', '2021-04-12 21:06:16.597505+00', 18, 2, 0, 0, NULL, 1, '[]', '{"text":"# Resumo","virtual_card":{"name":null,"display":"text","dataset_query":{},"visualization_settings":{}},"dashcard.background":false,"text.align_vertical":"bottom"}');
INSERT INTO public.report_dashboardcard VALUES (2, '2021-04-12 21:06:16.647841+00', '2021-04-12 21:06:16.647841+00', 6, 4, 2, 0, 4, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":4},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":4},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":4},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":4}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (3, '2021-04-12 21:06:16.664476+00', '2021-04-12 21:06:16.664476+00', 18, 2, 6, 0, NULL, 1, '[]', '{"text":"# Como esses Survey Results Public são distribuídos","virtual_card":{"name":null,"display":"text","dataset_query":{},"visualization_settings":{}},"dashcard.background":false,"text.align_vertical":"bottom"}');
INSERT INTO public.report_dashboardcard VALUES (4, '2021-04-12 21:06:16.752061+00', '2021-04-12 21:06:16.752061+00', 6, 8, 8, 0, 5, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":5},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":5},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":5},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":5}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (5, '2021-04-12 21:06:16.84362+00', '2021-04-12 21:06:16.84362+00', 6, 8, 8, 6, 6, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":6},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":6},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":6},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":6}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (6, '2021-04-12 21:06:16.927636+00', '2021-04-12 21:06:16.927636+00', 6, 8, 8, 12, 7, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":7},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":7},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":7},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":7}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (7, '2021-04-12 21:06:16.996136+00', '2021-04-12 21:06:16.996136+00', 6, 8, 16, 0, 8, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":8},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":8},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":8},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":8}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (8, '2021-04-12 21:06:17.076988+00', '2021-04-12 21:06:17.076988+00', 6, 8, 16, 6, 9, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":9},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":9},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":9},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":9}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (9, '2021-04-12 21:06:17.147218+00', '2021-04-12 21:06:17.147218+00', 6, 8, 16, 12, 10, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":10},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":10},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":10},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":10}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (10, '2021-04-12 21:06:17.233736+00', '2021-04-12 21:06:17.233736+00', 6, 8, 24, 0, 11, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":11},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":11},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":11},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":11}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (11, '2021-04-12 21:06:17.314293+00', '2021-04-12 21:06:17.314293+00', 6, 8, 24, 6, 12, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":12},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":12},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":12},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":12}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (12, '2021-04-12 21:06:17.392039+00', '2021-04-12 21:06:17.392039+00', 6, 8, 24, 12, 13, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":13},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":13},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":13},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":13}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (13, '2021-04-12 21:06:17.475747+00', '2021-04-12 21:06:17.475747+00', 6, 8, 32, 0, 14, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":14},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":14},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":14},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":14}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (14, '2021-04-12 21:06:17.552571+00', '2021-04-12 21:06:17.552571+00', 6, 8, 32, 6, 15, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":15},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":15},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":15},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":15}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (15, '2021-04-12 21:06:17.629656+00', '2021-04-12 21:06:17.629656+00', 6, 8, 32, 12, 16, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":16},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":16},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":16},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":16}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (16, '2021-04-12 21:06:17.71786+00', '2021-04-12 21:06:17.71786+00', 6, 8, 40, 0, 17, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":17},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":17},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":17},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":17}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (17, '2021-04-12 21:06:17.73768+00', '2021-04-12 21:06:17.73768+00', 18, 2, 48, 0, NULL, 1, '[]', '{"text":"# Onde seu Survey Results Public está","virtual_card":{"name":null,"display":"text","dataset_query":{},"visualization_settings":{}},"dashcard.background":false,"text.align_vertical":"bottom"}');
INSERT INTO public.report_dashboardcard VALUES (18, '2021-04-12 21:06:17.808887+00', '2021-04-12 21:06:17.808887+00', 6, 6, 50, 0, 18, 1, '[{"parameter_id":"191019457","target":["dimension",["field-id",453]],"card_id":18},{"parameter_id":"2062329088","target":["dimension",["field-id",440]],"card_id":18},{"parameter_id":"746504410","target":["dimension",["field-id",487]],"card_id":18},{"parameter_id":"600434031","target":["dimension",["field-id",451]],"card_id":18}]', '{}');
INSERT INTO public.report_dashboardcard VALUES (19, '2021-04-12 21:08:52.385845+00', '2021-04-12 21:08:52.385845+00', 18, 2, 0, 0, NULL, 2, '[]', '{"text":"# Resumo","virtual_card":{"name":null,"display":"text","dataset_query":{},"visualization_settings":{}},"dashcard.background":false,"text.align_vertical":"bottom"}');
INSERT INTO public.report_dashboardcard VALUES (21, '2021-04-12 21:08:52.441301+00', '2021-04-12 21:08:52.441301+00', 18, 2, 6, 0, NULL, 2, '[]', '{"text":"# Como esses Survey Results Public são distribuídos","virtual_card":{"name":null,"display":"text","dataset_query":{},"visualization_settings":{}},"dashcard.background":false,"text.align_vertical":"bottom"}');
INSERT INTO public.report_dashboardcard VALUES (35, '2021-04-12 21:08:53.455823+00', '2021-04-12 21:08:53.455823+00', 18, 2, 48, 0, NULL, 2, '[]', '{"text":"# Onde seu Survey Results Public está","virtual_card":{"name":null,"display":"text","dataset_query":{},"visualization_settings":{}},"dashcard.background":false,"text.align_vertical":"bottom"}');


--
-- TOC entry 3699 (class 0 OID 29118)
-- Dependencies: 226
-- Data for Name: revision; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.revision VALUES (1, 'Card', 1, 1, '2021-04-12 21:00:28.88859+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":null,"query_type":"query","name":"Public Survey - Contagem de Dados","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","query":{"source-table":59,"aggregation":[["count"]]},"database":2},"id":1,"display":"scalar","visualization_settings":{},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (2, 'Card', 2, 1, '2021-04-12 21:03:54.896583+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":null,"query_type":"query","name":"Survey Results Publics, Agrupado por Country","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"database":2,"query":{"source-table":59,"aggregation":[["count"]],"breakout":[["field-id",440]]},"type":"query"},"id":2,"display":"map","visualization_settings":{"map.region":"world_countries","map.type":"region","map.latitude_column":"count","map.colors":["#daecfb","#aad1f4","#7ab7ec","#499ce5","hsl(208.20000000000005, 79.7%, 42.1%)"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (3, 'Card', 3, 1, '2021-04-12 21:06:08.236423+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":null,"query_type":"query","name":"Survey Results Publics, Agrupado por Emprego","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"database":2,"query":{"source-table":59,"aggregation":[["count"]],"breakout":[["field-id",487]]},"type":"query"},"id":3,"display":"bar","visualization_settings":{"graph.show_goal":false,"graph.show_values":true,"stackable.stack_display":"bar","graph.label_value_frequency":"fit","graph.metrics":["count"],"graph.label_value_formatting":"auto","series_settings":{"count":{"display":"bar"}},"graph.dimensions":["Employment"],"stackable.stack_type":null},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (4, 'Card', 4, 1, '2021-04-12 21:06:16.635974+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Total Survey Results Public","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"aggregation":[["count"]]}},"id":4,"display":"scalar","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":[]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (5, 'Card', 5, 1, '2021-04-12 21:06:16.741833+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por New Onboard Good","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",453]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":5,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWOnboardGood"],"graph.colors":["#509EE3"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (6, 'Card', 6, 1, '2021-04-12 21:06:16.830818+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Employment","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",487]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":6,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["Employment"],"graph.colors":["#509EE3"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (7, 'Card', 7, 1, '2021-04-12 21:06:16.914483+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Survey Ease","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",451]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":7,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SurveyEase"],"graph.colors":["#509EE3"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (8, 'Card', 8, 1, '2021-04-12 21:06:16.990968+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Comp Fr Eq","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",443]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":8,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["CompFreq"],"graph.colors":["#509EE3"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (9, 'Card', 9, 1, '2021-04-12 21:06:17.07192+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Purchase What","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",475]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":9,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["PurchaseWhat"],"graph.colors":["#9CC177"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (10, 'Card', 10, 1, '2021-04-12 21:06:17.141793+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Ed Level","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",468]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":10,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["EdLevel"],"graph.colors":["#A989C5"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (11, 'Card', 11, 1, '2021-04-12 21:06:17.22739+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por New Learn","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",491]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":11,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWLearn"],"graph.colors":["#EF8C8C"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (12, 'Card', 12, 1, '2021-04-12 21:06:17.30824+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Sop Art Fr Eq","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",466]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":12,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SOPartFreq"],"graph.colors":["#EF8C8C"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (13, 'Card', 13, 1, '2021-04-12 21:06:17.38487+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Soco Mm","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",463]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":13,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SOComm"],"graph.colors":["#EF8C8C"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (14, 'Card', 14, 1, '2021-04-12 21:06:17.46715+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Survey Length","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",459]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":14,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SurveyLength"],"graph.colors":["#EF8C8C"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (15, 'Card', 15, 1, '2021-04-12 21:06:17.544949+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Newed Im Pt","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",493]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":15,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWEdImpt"],"graph.colors":["#f9d45c"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (17, 'Card', 17, 1, '2021-04-12 21:06:17.709089+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Welcome Change","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",458]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":17,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["WelcomeChange"],"graph.colors":["#9CC177"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (22, 'Card', 21, 1, '2021-04-12 21:08:52.566454+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Employment","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",487]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":21,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["Employment"],"graph.colors":["#509EE3"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (31, 'Card', 30, 1, '2021-04-12 21:08:53.231566+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Newed Im Pt","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",493]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":30,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWEdImpt"],"graph.colors":["#f9d45c"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (34, 'Card', 33, 1, '2021-04-12 21:08:53.506347+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por país","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",440]],"aggregation":[["count"]]}},"id":33,"display":"map","visualization_settings":{"map.type":"region","map.region":"world_countries","graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["Country"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (16, 'Card', 16, 1, '2021-04-12 21:06:17.620851+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por New Off Topic","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",471]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":16,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWOffTopic"],"graph.colors":["#7172AD"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (18, 'Card', 18, 1, '2021-04-12 21:06:17.799777+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por país","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",440]],"aggregation":[["count"]]}},"id":18,"display":"map","visualization_settings":{"map.type":"region","map.region":"world_countries","graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["Country"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (19, 'Dashboard', 1, 1, '2021-04-12 21:06:17.837276+00', '{"description":null,"name":"Uma olhada no seu Survey Results Public tabela","cards":[{"sizeX":18,"sizeY":2,"row":0,"col":0,"id":1,"card_id":null,"series":[]},{"sizeX":6,"sizeY":4,"row":2,"col":0,"id":2,"card_id":4,"series":[]},{"sizeX":18,"sizeY":2,"row":6,"col":0,"id":3,"card_id":null,"series":[]},{"sizeX":6,"sizeY":8,"row":8,"col":0,"id":4,"card_id":5,"series":[]},{"sizeX":6,"sizeY":8,"row":8,"col":6,"id":5,"card_id":6,"series":[]},{"sizeX":6,"sizeY":8,"row":8,"col":12,"id":6,"card_id":7,"series":[]},{"sizeX":6,"sizeY":8,"row":16,"col":0,"id":7,"card_id":8,"series":[]},{"sizeX":6,"sizeY":8,"row":16,"col":6,"id":8,"card_id":9,"series":[]},{"sizeX":6,"sizeY":8,"row":16,"col":12,"id":9,"card_id":10,"series":[]},{"sizeX":6,"sizeY":8,"row":24,"col":0,"id":10,"card_id":11,"series":[]},{"sizeX":6,"sizeY":8,"row":24,"col":6,"id":11,"card_id":12,"series":[]},{"sizeX":6,"sizeY":8,"row":24,"col":12,"id":12,"card_id":13,"series":[]},{"sizeX":6,"sizeY":8,"row":32,"col":0,"id":13,"card_id":14,"series":[]},{"sizeX":6,"sizeY":8,"row":32,"col":6,"id":14,"card_id":15,"series":[]},{"sizeX":6,"sizeY":8,"row":32,"col":12,"id":15,"card_id":16,"series":[]},{"sizeX":6,"sizeY":8,"row":40,"col":0,"id":16,"card_id":17,"series":[]},{"sizeX":18,"sizeY":2,"row":48,"col":0,"id":17,"card_id":null,"series":[]},{"sizeX":6,"sizeY":6,"row":50,"col":0,"id":18,"card_id":18,"series":[]}]}', false, true, NULL);
INSERT INTO public.revision VALUES (20, 'Card', 19, 1, '2021-04-12 21:08:52.420211+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Total Survey Results Public","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"aggregation":[["count"]]}},"id":19,"display":"scalar","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":[]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (21, 'Card', 20, 1, '2021-04-12 21:08:52.505246+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por New Onboard Good","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",453]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":20,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWOnboardGood"],"graph.colors":["#509EE3"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (23, 'Card', 22, 1, '2021-04-12 21:08:52.638456+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Survey Ease","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",451]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":22,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SurveyEase"],"graph.colors":["#509EE3"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (24, 'Card', 23, 1, '2021-04-12 21:08:52.699179+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Comp Fr Eq","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",443]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":23,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["CompFreq"],"graph.colors":["#509EE3"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (25, 'Card', 24, 1, '2021-04-12 21:08:52.774574+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Purchase What","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",475]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":24,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["PurchaseWhat"],"graph.colors":["#9CC177"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (26, 'Card', 25, 1, '2021-04-12 21:08:52.84589+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Ed Level","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",468]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":25,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["EdLevel"],"graph.colors":["#A989C5"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (27, 'Card', 26, 1, '2021-04-12 21:08:52.924299+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por New Learn","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",491]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":26,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWLearn"],"graph.colors":["#EF8C8C"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (28, 'Card', 27, 1, '2021-04-12 21:08:53.001422+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Sop Art Fr Eq","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",466]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":27,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SOPartFreq"],"graph.colors":["#EF8C8C"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (33, 'Card', 32, 1, '2021-04-12 21:08:53.420215+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Welcome Change","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",458]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":32,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["WelcomeChange"],"graph.colors":["#9CC177"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (29, 'Card', 28, 1, '2021-04-12 21:08:53.087202+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Soco Mm","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",463]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":28,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SOComm"],"graph.colors":["#EF8C8C"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (30, 'Card', 29, 1, '2021-04-12 21:08:53.159363+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por Survey Length","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",459]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":29,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["SurveyLength"],"graph.colors":["#EF8C8C"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (32, 'Card', 31, 1, '2021-04-12 21:08:53.303032+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":4,"query_type":"query","name":"Survey Results Public por New Off Topic","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",471]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":31,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["NEWOffTopic"],"graph.colors":["#7172AD"]},"public_uuid":null}', false, true, NULL);
INSERT INTO public.revision VALUES (35, 'Dashboard', 2, 1, '2021-04-12 21:08:53.538327+00', '{"description":null,"name":"Uma olhada no seu Survey Results Public tabela","cards":[{"sizeX":18,"sizeY":2,"row":0,"col":0,"id":19,"card_id":null,"series":[]},{"sizeX":6,"sizeY":4,"row":2,"col":0,"id":20,"card_id":19,"series":[]},{"sizeX":18,"sizeY":2,"row":6,"col":0,"id":21,"card_id":null,"series":[]},{"sizeX":6,"sizeY":8,"row":8,"col":0,"id":22,"card_id":20,"series":[]},{"sizeX":6,"sizeY":8,"row":8,"col":6,"id":23,"card_id":21,"series":[]},{"sizeX":6,"sizeY":8,"row":8,"col":12,"id":24,"card_id":22,"series":[]},{"sizeX":6,"sizeY":8,"row":16,"col":0,"id":25,"card_id":23,"series":[]},{"sizeX":6,"sizeY":8,"row":16,"col":6,"id":26,"card_id":24,"series":[]},{"sizeX":6,"sizeY":8,"row":16,"col":12,"id":27,"card_id":25,"series":[]},{"sizeX":6,"sizeY":8,"row":24,"col":0,"id":28,"card_id":26,"series":[]},{"sizeX":6,"sizeY":8,"row":24,"col":6,"id":29,"card_id":27,"series":[]},{"sizeX":6,"sizeY":8,"row":24,"col":12,"id":30,"card_id":28,"series":[]},{"sizeX":6,"sizeY":8,"row":32,"col":0,"id":31,"card_id":29,"series":[]},{"sizeX":6,"sizeY":8,"row":32,"col":6,"id":32,"card_id":30,"series":[]},{"sizeX":6,"sizeY":8,"row":32,"col":12,"id":33,"card_id":31,"series":[]},{"sizeX":6,"sizeY":8,"row":40,"col":0,"id":34,"card_id":32,"series":[]},{"sizeX":18,"sizeY":2,"row":48,"col":0,"id":35,"card_id":null,"series":[]},{"sizeX":6,"sizeY":6,"row":50,"col":0,"id":36,"card_id":33,"series":[]}]}', false, true, NULL);
INSERT INTO public.revision VALUES (36, 'Card', 4, 1, '2021-04-13 00:45:33.50941+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Total de pesquisas","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"aggregation":[["count"]]}},"id":4,"display":"scalar","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":[]},"public_uuid":null}', false, false, NULL);
INSERT INTO public.revision VALUES (37, 'Card', 8, 1, '2021-04-13 00:50:19.82604+00', '{"description":null,"archived":false,"collection_position":null,"table_id":59,"database_id":2,"enable_embedding":false,"collection_id":3,"query_type":"query","name":"Survey Results Public por Comp Fr Eq","creator_id":1,"made_public_by_id":null,"embedding_params":null,"cache_ttl":null,"dataset_query":{"type":"query","database":2,"query":{"source-table":59,"breakout":[["field-id",443]],"aggregation":[["count"]],"order-by":[["desc",["aggregation",0]]]}},"id":8,"display":"row","visualization_settings":{"graph.series_labels":["número"],"graph.metrics":["count"],"graph.dimensions":["CompFreq"],"graph.colors":["#509EE3"]},"public_uuid":null}', false, false, NULL);


--
-- TOC entry 3714 (class 0 OID 29258)
-- Dependencies: 241
-- Data for Name: segment; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3697 (class 0 OID 29103)
-- Dependencies: 224
-- Data for Name: setting; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.setting VALUES ('redirect-all-requests-to-https', 'false');
INSERT INTO public.setting VALUES ('site-url', 'http://localhost:3000');
INSERT INTO public.setting VALUES ('admin-email', 'user@email.com');
INSERT INTO public.setting VALUES ('site-locale', 'pt');
INSERT INTO public.setting VALUES ('anon-tracking-enabled', 'true');
INSERT INTO public.setting VALUES ('version-info', '{"latest":{"version":"v0.38.3","released":"2021-04-01","patch":true,"highlights":["Overflow text on Ask a question page ","Filtering on coerced column doesn''t always know its coerced","Wrong series label in multiple series scatterplot","Dashboard Subscription fails for all SQL questions with a Field Filter on date column connected on dashboard","Dashboard Subscription Emails do not work with filtered Native Queries","Dashboard Subscription sidebar broken for Sandboxed users","Provide more logging information on permission errors when creating Cards"," In Settings > Email, Save Changes is enabled even when there are no changes","Exports always uses UTC as timezone instead of the selected Report Timezone","Invalid Redirect Location After SAML Sign-in via Full App Embed","Cannot download XLSX if there''s more than 1 million results","Frontend load issue: SMTP Email","Pie chart sometimes does not show total","Users with collections \"edit\" permissions and no data access permissions can''t edit question metadata","Add Bitcoin as a unit of currency","Column \"Custom title\" not working in tooltips","Schema sync does not update changes in column type case","Error on visualization change of a question with SQL queries view only permission","Line chart dots don''t have `cursor: pointer` when hovering"]},"older":[{"version":"v0.38.2","released":"2021-03-17","patch":true,"highlights":["Data model not showing PostgreSQL tables when they are partitioned","Migrate old pre-1.37 \"Custom Drill-through\" settings to x.37+ \"Click Behavior\"","Regression with URL links"]},{"version":"v0.38.1","released":"2021-03-03","patch":true,"highlights":["Serialization `dump` of aggregated questions are not copied over on `load`","Serialization doesn''t update Sub-Query variable reference","Oracle, BigQuery filtering by column with day-of-week bucketing not working","Pivot Table export not working on unsaved questions","Pivot Table does not work for users without data permissions","Pivot Table not working with Sandboxed user","BigQuery: Joins in the query builder generate invalid table aliases","BigQuery: Question Stays running until timeout when query is error in Native Query","Serialization: Archived items are included in `dump`","Breadcrumbs can be confusing (the current one \"seems\" clickable when it''s not)","regexextract breaks query on sandboxed table","Multi-level aggregations fails when filter is the last section","Pivot queries aren''t recorded to query execution log","Start of Week not applied to Field Filter in Native question, which can lead to incorrect results","In Safari 14, add-grouping button disappears randomly but consistently","Serialization does not initialize 3rd party drivers when loading a dump","Wrong day names are displayed when using not-Sunday as start of the week and grouping by \"Day of week\"","Difficult to see which cells has \"Click behavior\" vs normal behavior","Object Detail previous/next buttons not working correctly","Global number formatting does not apply to percentages","Native question filter widget reordering doesn''t work"]},{"version":"v0.38.0.1","released":"2021-02-19","patch":false,"highlights":[]},{"version":"v0.38.0","released":"2021-02-16","patch":false,"highlights":["Sandboxed question with `case` Custom Field doesn''t substitute the \"else\" argument''s table","Custom Expression using `case()` function fails when referencing the same column names","Filtering a Custom Column does not give correct results when using \"Not equal to\"","Cannot remove columns via QB sidebar, then query fails, but works if being removed via Notebook","fix(rotate-encryption-key) settings-last-updated is not encrypted","For Pivot Tables, download popup doesn''t show","Dashboard Subscriptions: Have to click the close button multiple times after viewing a Subscription","Advanced Sandboxing ignores Data Model features like Object Detail of FK","Publish \"latest\" OSS JAR","Custom GeoJSON files are not sorted in the dropdown","user@password JDBC connection strings for application DB no longer work","Shrunken bubbles shown in question for null values","Drilling down by a Region Map assigns the wrong value to the filter","Using \"Reset to defaults\" on textbox causes it to become a corrupted card on dashboard","Add a lightweight notify api endpoint","Sandboxing on tables with remapped FK (Display Values) causes query to fail","Allow usage of PKCS-12 certificates with Postgres connections","dump-to-h2 does not return a non-zero exit code on failure","Advanced Sandboxing using questions that return more/other columns than the sandboxed table is not possible anymore, but the errors are not helpful","Bar chart x-axis positions can cause different spacing depending on the dates returned","Custom Columns breaks Pivot Table","Pivot tables broken on dashboard after resize","dump-to-h2 with --dump-plaintext should check for presence of MB_ENCRYPTION_SECRET_KEY","Right alignment of pivot table value cells looks broken","Don''t inform admins about MB cloud on EE instances","add cmd rotate-encryption-key","Token check retry is too aggressive","Login page should automatically focus on the email input field","Dashboard subscriptions including cards no longer in dashboard","UI should update when a collection changes parent"]},{"version":"v0.37.9","released":"2021-02-11","patch":true,"highlights":[]},{"version":"v0.37.8","released":"2021-01-29","patch":true,"highlights":["Cannot add (date) filter if calendar is collapsed"]},{"version":"v0.37.7","released":"2021-01-20","patch":true,"highlights":[]},{"version":"v0.37.6","released":"2021-01-13","patch":true,"highlights":[]},{"version":"v0.37.5","released":"2021-01-05","patch":true,"highlights":["Linked filters breaking SQL questions on v0.37.2","Embedding loading slow","Cannot toggle off ''Automatically run queries when doing simple filtering and summarizing'' "]},{"version":"v0.37.4","released":"2020-12-17","patch":true,"highlights":["Error in Query: Input to aggregation-name does not match schema","Revert #13895","Exports always uses UTC as timezone instead of the selected Report Timezone","Between Dates filter behaves inconsistently based on whether the column is from a joined table or not"]},{"version":"v0.37.3","released":"2020-12-03","patch":true,"highlights":["Fix chain filtering with temporal string params like ''last32weeks''","Linked filters breaking SQL questions on v0.37.2","Running with timezone `Europe/Moscow` shows Pulse timezone as `MT` instead of `MSK` and sends pulses on incorrect time","Order fields to dump by ID","Remove object count from log output"]},{"version":"v0.37.2","released":"2020-11-16","patch":true,"highlights":["When visualization returns `null` (No results), then UI becomes broken"]},{"version":"v0.37.1","released":"2020-11-12","patch":true,"highlights":["Table schema sync performance impact","v0.37.0.2 doesn''t sync Vertica schema","Pie chart shows spinner, when returned measure/value is `null` or `0`","Wrong day names are displayed when using not-Sunday as start of the week and grouping by \"Day of week\"","When result row is `null`, then frontend incorrectly shows as \"No results!\"","Snowflake tables with a GEOGRAPHY column cannot be explored","Cannot edit BigQuery settings without providing service account JSON again","Sync crashes with OOM on very large columns/row samples [proposal]","500 stack overflow error on collection/graph API call","Custom Column after aggregation creates wrong query and fails","The expression editor shouldn''t start in error mode without any user input","Pulse attachment file sent without file extension","Metric with unnamed Custom Expression breaks Data Model for table","Nested queries with duplicate column names fail","pulse attachment file(question name) Korean support problem","Pulse Bar Chart Negative Values Formatting"]},{"version":"v0.37.0.2","released":"2020-10-26","patch":false,"highlights":[]},{"version":"v0.36.8.2","released":"2020-10-26","patch":true,"highlights":[]},{"version":"v0.37.0.1","released":"2020-10-23","patch":false,"highlights":[]},{"version":"v0.36.8.1","released":"2020-10-23","patch":true,"highlights":[]},{"version":"v0.37.0","released":"2020-10-22","patch":false,"highlights":["Fix null handling in filters regression","Add translation for Bulgarian","0.37.0-rc3: Click behavior to Dashboard shown on Public/Embedded","NO_COLOR/MB_COLORIZE_LOGS does not remove all ansi codes","0.37.0-rc3: Filtering a joined table column by \"Is not\" or \"Does not contain\" fails","Update translations for final 0.37 release","0.37.0-rc2: Monday week start displays incorrectly on bar chart","0.37.0-rc2: Linked filter showing all values (not filtering)","Only get substrings in fingerprinting when supported [ci drivers]","0.37.0-rc2: log4j should not output to file by default","0.37-RC2: we should suppress drag behavior when custom click behavior is set","0.37-RC2: disable Done button in cases where click behavior target isn''t specified","0.37-RC2: weird edit state when saving a dashboard with incomplete click behavior","0.37-RC2: Interactivity summary tokens squashed on small dashboard cards","0.37.0-rc2: Hovering on custom map no longer displays region name, displays region identifier instead","0.37.0-rc1: \"Click behavior\" to URL for non-table card, doesn''t show reference fields to use as variables","0.37.0-rc1: Variables from Saved Question are referencing the same question","0.37.0-rc2: Cannot create custom drill-through to dashboard","0.37-rc1: after clicking a custom link that passes a value to a param, clicking Back shouldn''t bring that value to the original dashboard","0.37-rc1: When mapping dashboard filters to columns, SQL questions should display the name of the column mapped to the field filter","0.37-rc1: customizing a dashboard card''s click behavior without specifying a destination causes strange behavior","0.37-rc1: canceling the dashboard archive action takes you to the collection","Embedded versions of new chain filters endpoints ","\"Does not contain\" and \"Is not\" filter also removes nulls","Docs - 37 release - new dashboard functionality","forward slash on table name causes ORA-01424 and blocks the sync step","Update login layout and illustration.","MySQL grouping on a TIME field is not working","Field Filter variables in SQL question don’t show table name when connecting filters in dashboard","Upgrade to log4j 2.x"]},{"version":"v0.36.8","released":"2020-10-22","patch":true,"highlights":[]},{"version":"v0.36.7","released":"2020-10-09","patch":true,"highlights":["Presto not respecting SSL and always uses http instead of https","Footer (with export/fullscreen/refresh buttons) on Public/Embedded questions disappears when using Premium Embedding","Postgres sync not respecting SSH tunneling"]},{"version":"v0.36.6","released":"2020-09-15T22:58:04.727Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.36.5.1","released":"2020-09-11T23:16:26.199Z","patch":true,"highlights":["Remappings should work on broken out fields"]},{"version":"v0.36.4","released":"2020-08-17T22:41:20.449Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.36.3","released":"2020-08-04T23:57:45.595Z","patch":true,"highlights":["Support for externally linked tables"]},{"version":"v0.36.2","released":"2020-07-31T17:46:34.479Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.36.1","released":"2020-07-30T18:10:44.459Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.36.0","released":"2020-07-21T19:56:40.066Z","patch":false,"highlights":["SQL/native query snippets","Language selection"]},{"version":"v0.35.4","released":"2020-05-29T17:31:58.191Z","patch":true,"highlights":["Security fix for BigQuery and SparkSQL","Turkish translation available again","More than 20 additional bug fixes and enhancements"]},{"version":"v0.35.3","released":"2020-04-21T21:18:24.959Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.35.2","released":"2020-04-10T23:03:53.756Z","patch":true,"highlights":["Fix email and premium embedding settings","Fix table permissions for database without a schema","Fix \"Error reducing result rows\" error"]},{"version":"v0.35.1","released":"2020-04-02T21:52:06.867Z","patch":true,"highlights":["Issue with date field filters after v0.35.0 upgrade","Unable to filter on manually JOINed table"]},{"version":"v0.35.0","released":"2020-03-25T18:29:17.286Z","patch":false,"highlights":["Filter expressions, string extracts, and more","Reference saved questions in your SQL queries","Performance improvements"]},{"version":"v0.34.3","released":"2020-02-25T20:47:03.897Z","patch":true,"highlights":["Line, area, bar, combo, and scatter charts now allow a maximum of 100 series instead of 20.","Chart labels now have more options to show significant decimal values.","Various bug fixes"]},{"version":"v0.34.2","released":"2020-02-05T22:02:15.277Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.34.1","released":"2020-01-14T00:02:42.489Z","patch":true,"highlights":["Various bug fixes"]},{"version":"v0.34.0","released":"2019-12-20T01:21:39.568Z","patch":false,"highlights":["Added support for variables and field filters in native Mongo queries","Added option to display data values on Line, Bar, and Area charts","Many Timezone fixes"]},{"version":"v0.33.7.3","released":"2019-12-17T01:45:45.720Z","patch":true,"highlights":["Important security fix for Google Auth login"]},{"version":"v0.33.7","released":"2019-12-13T20:35:14.667Z","patch":true,"highlights":["Important security fix for Google Auth login"]},{"version":"v0.33.6","released":"2019-11-19T20:35:14.667Z","patch":true,"highlights":["Fixed regression that could cause saved questions to fail to render (#11297)","Fixed regression where No Results icon didn''t show (#11282)","Pie chart visual improvements (#10837)"]},{"version":"v0.33.5","released":"2019-11-08T20:35:14.667Z","patch":true,"highlights":["Added Slovak translation","Fixed support for MySQL 8 with the default authentication method","Fixed issues with X-axis label formatting in timeseries charts"]},{"version":"v0.33.4","released":"2019-10-08T20:35:14.667Z","patch":true,"highlights":["Custom expression support for joined columns","Fixed issue with filtering by month-of-year in MongoDB","Misc Bug Fixes"]},{"version":"v0.33.3","released":"2019-09-20T08:09:36.358Z","patch":true,"highlights":["Chinese and Persian translations now available again","Misc Bug Fixes "]},{"version":"v0.33.2","released":"2019-09-04T08:09:36.358Z","patch":true,"highlights":["Fixed Cards not saving","Fixed searrch not working "]},{"version":"v0.33.1","released":"2019-09-04T08:09:36.358Z","patch":true,"highlights":["Fixed conditional formatting not working","Fixed an issue where some previously saved column settings were not applied ","Fixed an issue where pulses were not loading "]},{"version":"v0.33.0","released":"2019-08-19T08:09:36.358Z","patch":false,"highlights":["Notebook mode + Simple Query Mode","Joins","Post Aggregation filters"]},{"version":"v0.32.10","released":"2019-07-28T08:09:36.358Z","patch":true,"highlights":["Fix User can''t logout / gets automatically logged in.","Fix No data displayed when pivoting data","Fixed Dashboard Filters on Linked Entities Broke"]},{"version":"v0.32.9","released":"2019-06-14T08:09:36.358Z","patch":true,"highlights":["Fix issues connecting to MongoDB Atlas Cluster","Fix database addition on setup","Fixed numeric category error with Postgres"]},{"version":"v0.32.8","released":"2019-05-13T08:09:36.358Z","patch":true,"highlights":["Fix i18n"]},{"version":"v0.32.7","released":"2019-05-09T08:09:36.358Z","patch":true,"highlights":["Fix published SHA Hash"]},{"version":"v0.32.6","released":"2019-05-08T12:09:36.358Z","patch":true,"highlights":["Fixed regression where Dashboards would fail to fully populate","Performance improvements when running queries","Security improvements"]},{"version":"v0.32.5","released":"2019-04-20T12:09:36.358Z","patch":true,"highlights":["Improve long-running query handling","Fix H2 to MySQL/Postgres migration issue","Fix issue with embedded maps with custom GeoJSON"]},{"version":"v0.32.4","released":"2019-04-09T12:09:36.358Z","patch":true,"highlights":["Fix issue where Google Auth login did not work","FFix issue where Google Auth login did not work"]},{"version":"v0.32.3","released":"2019-04-08T12:09:36.358Z","patch":true,"highlights":["Fixed Snowflake connection issues","Fixed Dashboard copy","Fixed non-root context logins"]},{"version":"v0.32.2","released":"2019-04-03T12:09:36.358Z","patch":true,"highlights":["Fixed dashboard date filters ","Fixed SSL error using Quartz w/ MySQL","Fix colors in dashboards"]},{"version":"v0.32.1","released":"2019-03-29T12:09:36.358Z","patch":true,"highlights":["Fixed MySQL connections with SSL","Fixed table sync issue"]},{"version":"v0.32.0","released":"2019-03-28T12:09:36.358Z","patch":false,"highlights":["Modular Drivers (reducing memory consumption)","Async queries (improving responsiveness)","Reduced memory consumption."]},{"version":"v0.31.2","released":"2018-12-07T12:09:36.358Z","patch":true,"highlights":["Added German translation","Fixed Heroku out-of-memory errors","Fixed issue with Slack-based Pulses due to rate limiting."]},{"version":"v0.31.1","released":"2018-11-21T12:09:36.358Z","patch":true,"highlights":["Ability to clone dashboards","Faster startup time and lower memory consumption","Migration issue fixes."]},{"version":"v0.31.0","released":"2018-11-08T12:09:36.358Z","patch":false,"highlights":["New visualizations and combo charts","Granular formatting controls","Snowflake Support"]},{"version":"v0.30.4","released":"2018-09-27T12:09:36.358Z","patch":true,"highlights":["Metabase fails to launch in Chinese","Fix token status checking","Fix BigQuery SQL parameters with encrypted DB details"]},{"version":"v0.30.3","released":"2018-09-13T12:09:36.358Z","patch":true,"highlights":["Localization for Chinese, Japanese, Turkish, Persian","Self referencing FK leads to exception","Security improvements"]},{"version":"v0.30.2","released":"2018-09-06T12:09:36.358Z","patch":true,"highlights":["Localization for French + Norwegian","Stability fixes for HTTP/2"]},{"version":"v0.30.1","released":"2018-08-08T12:09:36.358Z","patch":true,"highlights":["Localization for Portuguese","Timezone fix","SQL Template tag re-ordering fix"]},{"version":"v0.30.0","released":"2018-08-08T12:09:36.358Z","patch":false,"highlights":["App wide search","Enhanced Collection permissions","Comparison X-Rays"]},{"version":"v0.29.3","released":"2018-05-12T12:09:36.358Z","patch":true,"highlights":["Fix X-ray rules loading on Oracle JVM 8"]},{"version":"v0.29.2","released":"2018-05-10T12:09:36.358Z","patch":true,"highlights":["Fix Spark Driver"]},{"version":"v0.29.1","released":"2018-05-10T11:09:36.358Z","patch":true,"highlights":["Better heroku memory consumption","Fixed X-Ray Bugs","Drill through from line chart selects wrong date"]},{"version":"v0.29.0","released":"2018-05-01T11:09:36.358Z","patch":false,"highlights":["New and Improved X-Rays","Search field values","Spark SQL Support"]},{"version":"v0.28.6","released":"2018-04-12T11:09:36.358Z","patch":true,"highlights":["Fix chart rendering in pulses"]},{"version":"v0.28.5","released":"2018-04-04T11:09:36.358Z","patch":true,"highlights":["Fix memory consumption for SQL templates","Fix public dashboards parameter validation","Fix Unable to add cards to dashboards or search for cards, StackOverflowError on backend"]},{"version":"v0.28.4","released":"2018-03-29T11:09:36.358Z","patch":true,"highlights":["Fix broken embedded dashboards","Fix migration regression","Fix input typing bug"]},{"version":"v0.28.3","released":"2018-03-23T11:09:36.358Z","patch":true,"highlights":["Security improvements"]},{"version":"v0.28.2","released":"2018-03-20T11:09:36.358Z","patch":true,"highlights":["Security improvements","Sort on custom and saved metrics","Performance improvements for large numbers of questions and dashboards"]},{"version":"v0.28.1","released":"2018-02-09T11:09:36.358Z","patch":true,"highlights":["Fix admin panel update string","Fix pulse rendering bug","Fix CSV & XLS download bug"]},{"version":"v0.28.0","released":"2018-02-07T11:09:36.358Z","patch":false,"highlights":["Text Cards in Dashboards","Pulse + Alert attachments","Performance Improvements"]},{"version":"v0.27.2","released":"2017-12-12T11:09:36.358Z","patch":true,"highlights":["Migration bug fix"]},{"version":"v0.27.1","released":"2017-12-01T11:09:36.358Z","patch":true,"highlights":["Migration bug fix","Apply filters to embedded downloads"]},{"version":"v0.27.0","released":"2017-11-27T11:09:36.358Z","patch":false,"highlights":["Alerts","X-Ray insights","Charting improvements"]},{"version":"v0.26.2","released":"2017-09-27T11:09:36.358Z","patch":true,"highlights":["Update Redshift Driver","Support Java 9","Fix performance issue with fields listing"]},{"version":"v0.26.1","released":"2017-09-27T11:09:36.358Z","patch":true,"highlights":["Fix migration issue on MySQL"]},{"version":"v0.26.0","released":"2017-09-26T11:09:36.358Z","patch":true,"highlights":["Segment + Metric X-Rays and Comparisons","Better control over metadata introspection process","Improved Timezone support and bug fixes"]},{"version":"v0.25.2","released":"2017-08-09T11:09:36.358Z","patch":true,"highlights":["Bug and performance fixes"]},{"version":"v0.25.1","released":"2017-07-27T11:09:36.358Z","patch":true,"highlights":["After upgrading to 0.25, unknown protocol error.","Don''t show saved questions in the permissions database lists","Elastic beanstalk upgrades broken in 0.25 "]},{"version":"v0.25.0","released":"2017-07-25T11:09:36.358Z","patch":false,"highlights":["Nested questions","Enum and custom remapping support","LDAP authentication support"]},{"version":"v0.24.2","released":"2017-06-01T11:09:36.358Z","patch":true,"highlights":["Misc Bug fixes"]},{"version":"v0.24.1","released":"2017-05-10T11:09:36.358Z","patch":true,"highlights":["Fix upgrades with MySQL/Mariadb"]},{"version":"v0.24.0","released":"2017-05-10T11:09:36.358Z","patch":false,"highlights":["Drill-through + Actions","Result Caching","Presto Driver"]},{"version":"v0.23.1","released":"2017-03-30T11:09:36.358Z","patch":true,"highlights":["Filter widgets for SQL Template Variables","Fix spurious startup error","Java 7 startup bug fixed"]},{"version":"v0.23.0","released":"2017-03-21T11:09:36.358Z","patch":false,"highlights":["Public links for cards + dashboards","Embedding cards + dashboards in other applications","Encryption of database credentials"]},{"version":"v0.22.2","released":"2017-01-10T11:09:36.358Z","patch":true,"highlights":["Fix startup on OpenJDK 7"]},{"version":"v0.22.1","released":"2017-01-10T11:09:36.358Z","patch":true,"highlights":["IMPORTANT: Closed a Collections Permissions security hole","Improved startup performance","Bug fixes"]},{"version":"v0.22.0","released":"2017-01-10T11:09:36.358Z","patch":false,"highlights":["Collections + Collections Permissions","Multiple Aggregations","Custom Expressions"]},{"version":"v0.21.1","released":"2016-12-08T11:09:36.358Z","patch":true,"highlights":["BigQuery bug fixes","Charting bug fixes"]},{"version":"v0.21.0","released":"2016-12-08T11:09:36.358Z","patch":false,"highlights":["Google Analytics Driver","Vertica Driver","Better Time + Date Filters"]},{"version":"v0.20.3","released":"2016-10-26T11:09:36.358Z","patch":true,"highlights":["Fix H2->MySQL/PostgreSQL migrations, part 2"]},{"version":"v0.20.2","released":"2016-10-25T11:09:36.358Z","patch":true,"highlights":["Support Oracle 10+11","Fix H2->MySQL/PostgreSQL migrations","Revision timestamp fix"]},{"version":"v0.20.1","released":"2016-10-18T11:09:36.358Z","patch":true,"highlights":["Lots of bug fixes"]},{"version":"v0.20.0","released":"2016-10-11T11:09:36.358Z","patch":false,"highlights":["Data access permissions","Oracle Driver","Charting improvements"]},{"version":"v0.19.3","released":"2016-08-12T11:09:36.358Z","patch":true,"highlights":["fix Dashboard editing header"]},{"version":"v0.19.2","released":"2016-08-10T11:09:36.358Z","patch":true,"highlights":["fix Dashboard chart titles","fix pin map saving"]},{"version":"v0.19.1","released":"2016-08-04T11:09:36.358Z","patch":true,"highlights":["fix Dashboard Filter Editing","fix CSV Download of SQL Templates","fix Metabot enabled toggle"]},{"version":"v0.19.0","released":"2016-08-01T21:09:36.358Z","patch":false,"highlights":["SSO via Google Accounts","SQL Templates","Better charting controls"]},{"version":"v0.18.1","released":"2016-06-29T21:09:36.358Z","patch":true,"highlights":["Fix for Hour of day sorting bug","Fix for Column ordering bug in BigQuery","Fix for Mongo charting bug"]},{"version":"v0.18.0","released":"2016-06-022T21:09:36.358Z","patch":false,"highlights":["Dashboard Filters","Crate.IO Support","Checklist for Metabase Admins","Converting Metabase Questions -> SQL"]},{"version":"v0.17.1","released":"2016-05-04T21:09:36.358Z","patch":true,"highlights":["Fix for Line chart ordering bug","Fix for Time granularity bugs"]},{"version":"v0.17.0","released":"2016-05-04T21:09:36.358Z","patch":false,"highlights":["Tags + Search for Saved Questions","Calculated columns","Faster Syncing of Metadata","Lots of database driver improvements and bug fixes"]},{"version":"v0.16.1","released":"2016-05-04T21:09:36.358Z","patch":true,"highlights":["Fixes for several time alignment issues (timezones)","Resolved problem with SQL Server db connections"]},{"version":"v0.16.0","released":"2016-05-04T21:09:36.358Z","patch":false,"highlights":["Fullscreen (and fabulous) Dashboards","Say hello to Metabot in Slack"]}]}');
INSERT INTO public.setting VALUES ('site-name', 'Desafio 3');
INSERT INTO public.setting VALUES ('report-timezone', 'America/Sao_Paulo');
INSERT INTO public.setting VALUES ('custom-formatting', '{"type/Temporal":{"date_style":"M/D/YYYY","date_abbreviate":false,"time_style":"k:mm"},"type/Number":{"number_separators":",."},"type/Currency":{"currency":"BRL"}}');
INSERT INTO public.setting VALUES ('settings-last-updated', '2021-04-12 21:47:33.196361-03');


--
-- TOC entry 3765 (class 0 OID 29903)
-- Dependencies: 292
-- Data for Name: task_history; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.task_history VALUES (1, 'sync', 1, '2021-04-12 17:53:31.25136', '2021-04-12 17:53:32.412086', 1160, NULL);
INSERT INTO public.task_history VALUES (2, 'sync-timezone', 1, '2021-04-12 17:53:31.252357', '2021-04-12 17:53:31.638852', 386, '{"timezone-id":"America/Sao_Paulo"}');
INSERT INTO public.task_history VALUES (3, 'sync-tables', 1, '2021-04-12 17:53:31.639206', '2021-04-12 17:53:31.727711', 88, '{"updated-tables":4,"total-tables":0}');
INSERT INTO public.task_history VALUES (4, 'sync-fields', 1, '2021-04-12 17:53:31.727813', '2021-04-12 17:53:32.104196', 376, '{"total-fields":36,"updated-fields":36}');
INSERT INTO public.task_history VALUES (5, 'sync-fks', 1, '2021-04-12 17:53:32.104271', '2021-04-12 17:53:32.161731', 57, '{"total-fks":3,"updated-fks":3,"total-failed":0}');
INSERT INTO public.task_history VALUES (6, 'sync-metabase-metadata', 1, '2021-04-12 17:53:32.16183', '2021-04-12 17:53:32.41202', 250, NULL);
INSERT INTO public.task_history VALUES (7, 'analyze', 1, '2021-04-12 17:53:32.549329', '2021-04-12 17:53:36.206818', 3657, NULL);
INSERT INTO public.task_history VALUES (8, 'fingerprint-fields', 1, '2021-04-12 17:53:32.549377', '2021-04-12 17:53:36.061562', 3512, '{"no-data-fingerprints":0,"failed-fingerprints":0,"updated-fingerprints":32,"fingerprints-attempted":32}');
INSERT INTO public.task_history VALUES (9, 'classify-fields', 1, '2021-04-12 17:53:36.061632', '2021-04-12 17:53:36.185383', 123, '{"fields-classified":32,"fields-failed":0}');
INSERT INTO public.task_history VALUES (10, 'classify-tables', 1, '2021-04-12 17:53:36.185435', '2021-04-12 17:53:36.206727', 21, '{"total-tables":4,"tables-classified":4}');
INSERT INTO public.task_history VALUES (11, 'field values scanning', 1, '2021-04-12 17:53:36.232325', '2021-04-12 17:53:36.974915', 742, NULL);
INSERT INTO public.task_history VALUES (12, 'update-field-values', 1, '2021-04-12 17:53:36.232364', '2021-04-12 17:53:36.97487', 742, '{"errors":0,"created":5,"updated":0,"deleted":0}');
INSERT INTO public.task_history VALUES (13, 'sync', 2, '2021-04-12 17:56:31.91962', '2021-04-12 17:56:36.342949', 4423, NULL);
INSERT INTO public.task_history VALUES (14, 'sync-timezone', 2, '2021-04-12 17:56:31.919647', '2021-04-12 17:56:31.949269', 29, '{"throwable":{"via":[{"type":"java.lang.Exception","message":"Impossível de identificar data no texto ''2021-04-12 17:56:31.945 -03'' para o banco de dados ''postgres''","at":["metabase.driver.common$current_db_time$fn__37113","invoke","common.clj",233]},{"type":"java.text.ParseException","message":"Unparseable date: \"2021-04-12 17:56:31.945 -03\"","at":["java.text.DateFormat","parse",null,-1]}],"trace":[["java.text.DateFormat","parse",null,-1],["metabase.driver.common.ThreadSafeSimpleDateFormat","parse","common.clj",153],["metabase.driver.common$first_successful_parse","invokeStatic","common.clj",170],["metabase.driver.common$first_successful_parse","invoke","common.clj",164],["metabase.driver.common$current_db_time$fn__37113","invoke","common.clj",229],["metabase.driver$do_with_driver","invokeStatic","driver.clj",60],["metabase.driver$do_with_driver","invoke","driver.clj",56],["metabase.driver.common$current_db_time","invokeStatic","common.clj",203],["metabase.driver.common$current_db_time","invoke","common.clj",193],["clojure.lang.AFn","applyToHelper","AFn.java",156],["clojure.lang.AFn","applyTo","AFn.java",144],["clojure.core$apply","invokeStatic","core.clj",665],["clojure.core$apply","invoke","core.clj",660],["metabase.driver.postgres$fn__78495","invokeStatic","postgres.clj",78],["metabase.driver.postgres$fn__78495","doInvoke","postgres.clj",76],["clojure.lang.RestFn","invoke","RestFn.java",421],["clojure.lang.MultiFn","invoke","MultiFn.java",234],["metabase.sync.sync_metadata.sync_timezone$fn__61226$sync_timezone_BANG___61231$fn__61232","invoke","sync_timezone.clj",20],["metabase.sync.sync_metadata.sync_timezone$fn__61226$sync_timezone_BANG___61231","invoke","sync_timezone.clj",14],["clojure.lang.AFn","applyToHelper","AFn.java",154],["clojure.lang.AFn","applyTo","AFn.java",144],["clojure.core$apply","invokeStatic","core.clj",667],["clojure.core$apply","invoke","core.clj",660],["metabase.sync.util$fn__39205$run_step_with_metadata__39210$fn__39214$fn__39216","doInvoke","util.clj",352],["clojure.lang.RestFn","invoke","RestFn.java",397],["metabase.sync.util$with_start_and_finish_logging_STAR_","invokeStatic","util.clj",99],["metabase.sync.util$with_start_and_finish_logging_STAR_","invoke","util.clj",93],["metabase.sync.util$with_start_and_finish_debug_logging","invokeStatic","util.clj",116],["metabase.sync.util$with_start_and_finish_debug_logging","invoke","util.clj",113],["metabase.sync.util$fn__39205$run_step_with_metadata__39210$fn__39214","invoke","util.clj",347],["metabase.sync.util$fn__39205$run_step_with_metadata__39210","invoke","util.clj",342],["metabase.sync.util$fn__39396$run_sync_operation__39401$fn__39402$fn__39410","invoke","util.clj",441],["metabase.sync.util$fn__39396$run_sync_operation__39401$fn__39402","invoke","util.clj",439],["metabase.sync.util$fn__39396$run_sync_operation__39401","invoke","util.clj",433],["metabase.sync.sync_metadata$fn__61583$sync_db_metadata_BANG___61588$fn__61589$fn__61590","invoke","sync_metadata.clj",49],["metabase.sync.util$do_with_error_handling","invokeStatic","util.clj",151],["metabase.sync.util$do_with_error_handling","invoke","util.clj",144],["metabase.sync.util$do_with_error_handling","invokeStatic","util.clj",147],["metabase.sync.util$do_with_error_handling","invoke","util.clj",144],["clojure.core$partial$fn__5839","invoke","core.clj",2623],["metabase.driver$fn__29103","invokeStatic","driver.clj",527],["metabase.driver$fn__29103","invoke","driver.clj",527],["clojure.lang.MultiFn","invoke","MultiFn.java",239],["metabase.sync.util$sync_in_context$fn__39117","invoke","util.clj",135],["metabase.sync.util$with_db_logging_disabled$fn__39114","invoke","util.clj",126],["metabase.sync.util$with_start_and_finish_logging_STAR_","invokeStatic","util.clj",99],["metabase.sync.util$with_start_and_finish_logging_STAR_","invoke","util.clj",93],["metabase.sync.util$with_start_and_finish_logging$fn__39103","invoke","util.clj",111],["metabase.sync.util$with_sync_events$fn__39098","invoke","util.clj",85],["metabase.sync.util$with_duplicate_ops_prevented$fn__39089","invoke","util.clj",64],["metabase.sync.util$do_sync_operation","invokeStatic","util.clj",169],["metabase.sync.util$do_sync_operation","invoke","util.clj",166],["metabase.sync.sync_metadata$fn__61583$sync_db_metadata_BANG___61588$fn__61589","invoke","sync_metadata.clj",48],["metabase.sync.sync_metadata$fn__61583$sync_db_metadata_BANG___61588","invoke","sync_metadata.clj",45],["metabase.sync$fn__61638$sync_database_BANG___61647$fn__61653$fn__61655$fn__61657","invoke","sync.clj",41],["clojure.core$mapv$fn__8445","invoke","core.clj",6912],["clojure.lang.ArrayChunk","reduce","ArrayChunk.java",58],["clojure.core.protocols$fn__8154","invokeStatic","protocols.clj",136],["clojure.core.protocols$fn__8154","invoke","protocols.clj",124],["clojure.core.protocols$fn__8114$G__8109__8123","invoke","protocols.clj",19],["clojure.core.protocols$seq_reduce","invokeStatic","protocols.clj",31],["clojure.core.protocols$fn__8146","invokeStatic","protocols.clj",75],["clojure.core.protocols$fn__8146","invoke","protocols.clj",75],["clojure.core.protocols$fn__8088$G__8083__8101","invoke","protocols.clj",13],["clojure.core$reduce","invokeStatic","core.clj",6828],["clojure.core$mapv","invokeStatic","core.clj",6903],["clojure.core$mapv","invoke","core.clj",6903],["metabase.sync$fn__61638$sync_database_BANG___61647$fn__61653$fn__61655","invoke","sync.clj",41],["metabase.sync.util$do_with_error_handling","invokeStatic","util.clj",151],["metabase.sync.util$do_with_error_handling","invoke","util.clj",144],["metabase.sync.util$do_with_error_handling","invokeStatic","util.clj",147],["metabase.sync.util$do_with_error_handling","invoke","util.clj",144],["clojure.core$partial$fn__5839","invoke","core.clj",2623],["metabase.driver$fn__29103","invokeStatic","driver.clj",527],["metabase.driver$fn__29103","invoke","driver.clj",527],["clojure.lang.MultiFn","invoke","MultiFn.java",239],["metabase.sync.util$sync_in_context$fn__39117","invoke","util.clj",135],["metabase.sync.util$with_db_logging_disabled$fn__39114","invoke","util.clj",126],["metabase.sync.util$with_start_and_finish_logging_STAR_","invokeStatic","util.clj",99],["metabase.sync.util$with_start_and_finish_logging_STAR_","invoke","util.clj",93],["metabase.sync.util$with_start_and_finish_logging$fn__39103","invoke","util.clj",111],["metabase.sync.util$with_sync_events$fn__39098","invoke","util.clj",85],["metabase.sync.util$with_duplicate_ops_prevented$fn__39089","invoke","util.clj",64],["metabase.sync.util$do_sync_operation","invokeStatic","util.clj",169],["metabase.sync.util$do_sync_operation","invoke","util.clj",166],["metabase.sync$fn__61638$sync_database_BANG___61647$fn__61653","invoke","sync.clj",40],["metabase.sync$fn__61638$sync_database_BANG___61647","invoke","sync.clj",26],["metabase.sync$fn__61638$sync_database_BANG___61647$fn__61648","invoke","sync.clj",36],["metabase.sync$fn__61638$sync_database_BANG___61647","invoke","sync.clj",26],["metabase.events.sync_database$process_sync_database_event$fn__79563","invoke","sync_database.clj",37],["clojure.core$binding_conveyor_fn$fn__5754","invoke","core.clj",2030],["clojure.lang.AFn","call","AFn.java",18],["java.util.concurrent.FutureTask","run",null,-1],["java.util.concurrent.ThreadPoolExecutor","runWorker",null,-1],["java.util.concurrent.ThreadPoolExecutor$Worker","run",null,-1],["java.lang.Thread","run",null,-1]],"cause":"Unparseable date: \"2021-04-12 17:56:31.945 -03\""}}');
INSERT INTO public.task_history VALUES (15, 'sync-tables', 2, '2021-04-12 17:56:31.950773', '2021-04-12 17:56:32.383922', 433, '{"updated-tables":56,"total-tables":0}');
INSERT INTO public.task_history VALUES (16, 'sync-fields', 2, '2021-04-12 17:56:32.383976', '2021-04-12 17:56:35.00793', 2623, '{"total-fields":469,"updated-fields":469}');
INSERT INTO public.task_history VALUES (17, 'sync-fks', 2, '2021-04-12 17:56:35.007983', '2021-04-12 17:56:36.31367', 1305, '{"total-fks":69,"updated-fks":69,"total-failed":0}');
INSERT INTO public.task_history VALUES (18, 'sync-metabase-metadata', 2, '2021-04-12 17:56:36.313764', '2021-04-12 17:56:36.342913', 29, NULL);
INSERT INTO public.task_history VALUES (19, 'analyze', 2, '2021-04-12 17:56:36.370889', '2021-04-12 17:56:45.21415', 8843, NULL);
INSERT INTO public.task_history VALUES (20, 'fingerprint-fields', 2, '2021-04-12 17:56:36.370911', '2021-04-12 17:56:44.145942', 7775, '{"no-data-fingerprints":213,"failed-fingerprints":0,"updated-fingerprints":201,"fingerprints-attempted":414}');
INSERT INTO public.task_history VALUES (21, 'classify-fields', 2, '2021-04-12 17:56:44.145987', '2021-04-12 17:56:44.9567', 810, '{"fields-classified":201,"fields-failed":0}');
INSERT INTO public.task_history VALUES (22, 'classify-tables', 2, '2021-04-12 17:56:44.956749', '2021-04-12 17:56:45.214097', 257, '{"total-tables":51,"tables-classified":51}');
INSERT INTO public.task_history VALUES (23, 'field values scanning', 2, '2021-04-12 17:56:45.238013', '2021-04-12 17:56:49.641567', 4403, NULL);
INSERT INTO public.task_history VALUES (24, 'update-field-values', 2, '2021-04-12 17:56:45.238044', '2021-04-12 17:56:49.641523', 4403, '{"errors":0,"created":138,"updated":0,"deleted":0}');
INSERT INTO public.task_history VALUES (25, 'send-pulses', NULL, '2021-04-12 18:00:00.023', '2021-04-12 18:00:00.037', 14, NULL);
INSERT INTO public.task_history VALUES (26, 'task-history-cleanup', NULL, '2021-04-12 18:00:00.039', '2021-04-12 18:00:00.042', 3, NULL);
INSERT INTO public.task_history VALUES (27, 'task-history-cleanup', NULL, '2021-04-12 21:42:56.014', '2021-04-12 21:42:56.033', 19, NULL);
INSERT INTO public.task_history VALUES (28, 'send-pulses', NULL, '2021-04-12 21:42:55.978', '2021-04-12 21:42:56.01', 32, NULL);
INSERT INTO public.task_history VALUES (29, 'task-history-cleanup', NULL, '2021-04-12 22:00:00.069', '2021-04-12 22:00:00.089', 20, NULL);
INSERT INTO public.task_history VALUES (30, 'send-pulses', NULL, '2021-04-12 22:00:00.036', '2021-04-12 22:00:00.078', 42, NULL);


--
-- TOC entry 3703 (class 0 OID 29165)
-- Dependencies: 230
-- Data for Name: view_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.view_log VALUES (1, 1, 'card', 1, '2021-04-12 21:00:28.882282+00');
INSERT INTO public.view_log VALUES (2, 1, 'card', 2, '2021-04-12 21:03:54.89317+00');
INSERT INTO public.view_log VALUES (3, 1, 'card', 3, '2021-04-12 21:06:08.229493+00');
INSERT INTO public.view_log VALUES (4, 1, 'card', 4, '2021-04-12 21:06:16.634234+00');
INSERT INTO public.view_log VALUES (5, 1, 'card', 5, '2021-04-12 21:06:16.73985+00');
INSERT INTO public.view_log VALUES (6, 1, 'card', 6, '2021-04-12 21:06:16.828946+00');
INSERT INTO public.view_log VALUES (7, 1, 'card', 7, '2021-04-12 21:06:16.912604+00');
INSERT INTO public.view_log VALUES (8, 1, 'card', 8, '2021-04-12 21:06:16.989062+00');
INSERT INTO public.view_log VALUES (9, 1, 'card', 9, '2021-04-12 21:06:17.07029+00');
INSERT INTO public.view_log VALUES (10, 1, 'card', 10, '2021-04-12 21:06:17.140288+00');
INSERT INTO public.view_log VALUES (11, 1, 'card', 11, '2021-04-12 21:06:17.225713+00');
INSERT INTO public.view_log VALUES (12, 1, 'card', 12, '2021-04-12 21:06:17.30686+00');
INSERT INTO public.view_log VALUES (13, 1, 'card', 13, '2021-04-12 21:06:17.383197+00');
INSERT INTO public.view_log VALUES (14, 1, 'card', 14, '2021-04-12 21:06:17.465594+00');
INSERT INTO public.view_log VALUES (15, 1, 'card', 15, '2021-04-12 21:06:17.543089+00');
INSERT INTO public.view_log VALUES (16, 1, 'card', 16, '2021-04-12 21:06:17.618875+00');
INSERT INTO public.view_log VALUES (17, 1, 'card', 17, '2021-04-12 21:06:17.707645+00');
INSERT INTO public.view_log VALUES (18, 1, 'card', 18, '2021-04-12 21:06:17.798299+00');
INSERT INTO public.view_log VALUES (19, 1, 'dashboard', 1, '2021-04-12 21:06:19.82811+00');
INSERT INTO public.view_log VALUES (20, 1, 'card', 19, '2021-04-12 21:08:52.417995+00');
INSERT INTO public.view_log VALUES (21, 1, 'card', 20, '2021-04-12 21:08:52.503499+00');
INSERT INTO public.view_log VALUES (22, 1, 'card', 21, '2021-04-12 21:08:52.565177+00');
INSERT INTO public.view_log VALUES (23, 1, 'card', 22, '2021-04-12 21:08:52.63696+00');
INSERT INTO public.view_log VALUES (24, 1, 'card', 23, '2021-04-12 21:08:52.697838+00');
INSERT INTO public.view_log VALUES (25, 1, 'card', 24, '2021-04-12 21:08:52.772903+00');
INSERT INTO public.view_log VALUES (26, 1, 'card', 25, '2021-04-12 21:08:52.843333+00');
INSERT INTO public.view_log VALUES (27, 1, 'card', 26, '2021-04-12 21:08:52.922735+00');
INSERT INTO public.view_log VALUES (28, 1, 'card', 27, '2021-04-12 21:08:52.999852+00');
INSERT INTO public.view_log VALUES (29, 1, 'card', 28, '2021-04-12 21:08:53.08579+00');
INSERT INTO public.view_log VALUES (30, 1, 'card', 29, '2021-04-12 21:08:53.158025+00');
INSERT INTO public.view_log VALUES (31, 1, 'card', 30, '2021-04-12 21:08:53.230084+00');
INSERT INTO public.view_log VALUES (32, 1, 'card', 31, '2021-04-12 21:08:53.301445+00');
INSERT INTO public.view_log VALUES (33, 1, 'card', 32, '2021-04-12 21:08:53.418623+00');
INSERT INTO public.view_log VALUES (34, 1, 'card', 33, '2021-04-12 21:08:53.505108+00');
INSERT INTO public.view_log VALUES (35, 1, 'dashboard', 1, '2021-04-12 21:09:19.365191+00');
INSERT INTO public.view_log VALUES (36, 1, 'card', 4, '2021-04-13 00:45:08.391574+00');
INSERT INTO public.view_log VALUES (37, 1, 'card', 8, '2021-04-13 00:48:57.791146+00');
INSERT INTO public.view_log VALUES (38, 1, 'dashboard', 1, '2021-04-13 00:50:45.003458+00');
INSERT INTO public.view_log VALUES (39, 1, 'dashboard', 1, '2021-04-13 01:06:28.822751+00');


--
-- TOC entry 3931 (class 0 OID 0)
-- Dependencies: 227
-- Name: activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.activity_id_seq', 39, true);


--
-- TOC entry 3932 (class 0 OID 0)
-- Dependencies: 250
-- Name: card_label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.card_label_id_seq', 1, false);


--
-- TOC entry 3933 (class 0 OID 0)
-- Dependencies: 262
-- Name: collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_id_seq', 4, true);


--
-- TOC entry 3934 (class 0 OID 0)
-- Dependencies: 264
-- Name: collection_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.collection_revision_id_seq', 1, false);


--
-- TOC entry 3935 (class 0 OID 0)
-- Dependencies: 274
-- Name: computation_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.computation_job_id_seq', 1, false);


--
-- TOC entry 3936 (class 0 OID 0)
-- Dependencies: 276
-- Name: computation_job_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.computation_job_result_id_seq', 1, false);


--
-- TOC entry 3937 (class 0 OID 0)
-- Dependencies: 205
-- Name: core_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.core_user_id_seq', 1, true);


--
-- TOC entry 3938 (class 0 OID 0)
-- Dependencies: 270
-- Name: dashboard_favorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_favorite_id_seq', 1, false);


--
-- TOC entry 3939 (class 0 OID 0)
-- Dependencies: 246
-- Name: dashboardcard_series_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboardcard_series_id_seq', 1, false);


--
-- TOC entry 3940 (class 0 OID 0)
-- Dependencies: 242
-- Name: dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dependency_id_seq', 1, false);


--
-- TOC entry 3941 (class 0 OID 0)
-- Dependencies: 272
-- Name: dimension_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dimension_id_seq', 1, false);


--
-- TOC entry 3942 (class 0 OID 0)
-- Dependencies: 278
-- Name: group_table_access_policy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.group_table_access_policy_id_seq', 1, false);


--
-- TOC entry 3943 (class 0 OID 0)
-- Dependencies: 248
-- Name: label_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.label_id_seq', 1, false);


--
-- TOC entry 3944 (class 0 OID 0)
-- Dependencies: 207
-- Name: metabase_database_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metabase_database_id_seq', 2, true);


--
-- TOC entry 3945 (class 0 OID 0)
-- Dependencies: 211
-- Name: metabase_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metabase_field_id_seq', 505, true);


--
-- TOC entry 3946 (class 0 OID 0)
-- Dependencies: 213
-- Name: metabase_fieldvalues_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metabase_fieldvalues_id_seq', 143, true);


--
-- TOC entry 3947 (class 0 OID 0)
-- Dependencies: 209
-- Name: metabase_table_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metabase_table_id_seq', 60, true);


--
-- TOC entry 3948 (class 0 OID 0)
-- Dependencies: 244
-- Name: metric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metric_id_seq', 1, false);


--
-- TOC entry 3949 (class 0 OID 0)
-- Dependencies: 252
-- Name: metric_important_field_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.metric_important_field_id_seq', 1, false);


--
-- TOC entry 3950 (class 0 OID 0)
-- Dependencies: 293
-- Name: native_query_snippet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.native_query_snippet_id_seq', 1, false);


--
-- TOC entry 3951 (class 0 OID 0)
-- Dependencies: 254
-- Name: permissions_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_group_id_seq', 3, true);


--
-- TOC entry 3952 (class 0 OID 0)
-- Dependencies: 256
-- Name: permissions_group_membership_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_group_membership_id_seq', 2, true);


--
-- TOC entry 3953 (class 0 OID 0)
-- Dependencies: 258
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_id_seq', 11, true);


--
-- TOC entry 3954 (class 0 OID 0)
-- Dependencies: 260
-- Name: permissions_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.permissions_revision_id_seq', 1, false);


--
-- TOC entry 3955 (class 0 OID 0)
-- Dependencies: 234
-- Name: pulse_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pulse_card_id_seq', 1, false);


--
-- TOC entry 3956 (class 0 OID 0)
-- Dependencies: 236
-- Name: pulse_channel_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pulse_channel_id_seq', 1, false);


--
-- TOC entry 3957 (class 0 OID 0)
-- Dependencies: 238
-- Name: pulse_channel_recipient_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pulse_channel_recipient_id_seq', 1, false);


--
-- TOC entry 3958 (class 0 OID 0)
-- Dependencies: 232
-- Name: pulse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pulse_id_seq', 1, false);


--
-- TOC entry 3959 (class 0 OID 0)
-- Dependencies: 266
-- Name: query_execution_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.query_execution_id_seq', 206, true);


--
-- TOC entry 3960 (class 0 OID 0)
-- Dependencies: 215
-- Name: report_card_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_card_id_seq', 33, true);


--
-- TOC entry 3961 (class 0 OID 0)
-- Dependencies: 217
-- Name: report_cardfavorite_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_cardfavorite_id_seq', 1, false);


--
-- TOC entry 3962 (class 0 OID 0)
-- Dependencies: 219
-- Name: report_dashboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_dashboard_id_seq', 2, true);


--
-- TOC entry 3963 (class 0 OID 0)
-- Dependencies: 221
-- Name: report_dashboardcard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.report_dashboardcard_id_seq', 36, true);


--
-- TOC entry 3964 (class 0 OID 0)
-- Dependencies: 225
-- Name: revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.revision_id_seq', 37, true);


--
-- TOC entry 3965 (class 0 OID 0)
-- Dependencies: 240
-- Name: segment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.segment_id_seq', 1, false);


--
-- TOC entry 3966 (class 0 OID 0)
-- Dependencies: 291
-- Name: task_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.task_history_id_seq', 30, true);


--
-- TOC entry 3967 (class 0 OID 0)
-- Dependencies: 229
-- Name: view_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.view_log_id_seq', 71, true);


--
-- TOC entry 3313 (class 2606 OID 29154)
-- Name: activity activity_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT activity_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 29367)
-- Name: card_label card_label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_label
    ADD CONSTRAINT card_label_pkey PRIMARY KEY (id);


--
-- TOC entry 3397 (class 2606 OID 29558)
-- Name: collection collection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT collection_pkey PRIMARY KEY (id);


--
-- TOC entry 3403 (class 2606 OID 29578)
-- Name: collection_revision collection_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_revision
    ADD CONSTRAINT collection_revision_pkey PRIMARY KEY (id);


--
-- TOC entry 3425 (class 2606 OID 29695)
-- Name: computation_job computation_job_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computation_job
    ADD CONSTRAINT computation_job_pkey PRIMARY KEY (id);


--
-- TOC entry 3427 (class 2606 OID 29711)
-- Name: computation_job_result computation_job_result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computation_job_result
    ADD CONSTRAINT computation_job_result_pkey PRIMARY KEY (id);


--
-- TOC entry 3306 (class 2606 OID 29097)
-- Name: core_session core_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_session
    ADD CONSTRAINT core_session_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 30320)
-- Name: core_user core_user_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_email_key UNIQUE (email);


--
-- TOC entry 3258 (class 2606 OID 28698)
-- Name: core_user core_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_user
    ADD CONSTRAINT core_user_pkey PRIMARY KEY (id);


--
-- TOC entry 3414 (class 2606 OID 29641)
-- Name: dashboard_favorite dashboard_favorite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_favorite
    ADD CONSTRAINT dashboard_favorite_pkey PRIMARY KEY (id);


--
-- TOC entry 3355 (class 2606 OID 29332)
-- Name: dashboardcard_series dashboardcard_series_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboardcard_series
    ADD CONSTRAINT dashboardcard_series_pkey PRIMARY KEY (id);


--
-- TOC entry 3322 (class 2606 OID 29184)
-- Name: data_migrations data_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_migrations
    ADD CONSTRAINT data_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 28673)
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 29295)
-- Name: dependency dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dependency
    ADD CONSTRAINT dependency_pkey PRIMARY KEY (id);


--
-- TOC entry 3420 (class 2606 OID 29667)
-- Name: dimension dimension_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT dimension_pkey PRIMARY KEY (id);


--
-- TOC entry 3429 (class 2606 OID 29732)
-- Name: group_table_access_policy group_table_access_policy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT group_table_access_policy_pkey PRIMARY KEY (id);


--
-- TOC entry 3252 (class 2606 OID 29915)
-- Name: databasechangelog idx_databasechangelog_id_author_filename; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangelog
    ADD CONSTRAINT idx_databasechangelog_id_author_filename UNIQUE (id, author, filename);


--
-- TOC entry 3273 (class 2606 OID 29920)
-- Name: metabase_field idx_uniq_field_table_id_parent_id_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_field
    ADD CONSTRAINT idx_uniq_field_table_id_parent_id_name UNIQUE (table_id, parent_id, name);


--
-- TOC entry 3266 (class 2606 OID 29917)
-- Name: metabase_table idx_uniq_table_db_id_schema_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_table
    ADD CONSTRAINT idx_uniq_table_db_id_schema_name UNIQUE (db_id, schema, name);


--
-- TOC entry 3290 (class 2606 OID 28932)
-- Name: report_cardfavorite idx_unique_cardfavorite_card_id_owner_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_cardfavorite
    ADD CONSTRAINT idx_unique_cardfavorite_card_id_owner_id UNIQUE (card_id, owner_id);


--
-- TOC entry 3360 (class 2606 OID 29356)
-- Name: label label_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 29358)
-- Name: label label_slug_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.label
    ADD CONSTRAINT label_slug_key UNIQUE (slug);


--
-- TOC entry 3261 (class 2606 OID 28747)
-- Name: metabase_database metabase_database_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_database
    ADD CONSTRAINT metabase_database_pkey PRIMARY KEY (id);


--
-- TOC entry 3276 (class 2606 OID 28781)
-- Name: metabase_field metabase_field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_field
    ADD CONSTRAINT metabase_field_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 28818)
-- Name: metabase_fieldvalues metabase_fieldvalues_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_fieldvalues
    ADD CONSTRAINT metabase_fieldvalues_pkey PRIMARY KEY (id);


--
-- TOC entry 3269 (class 2606 OID 28764)
-- Name: metabase_table metabase_table_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_table
    ADD CONSTRAINT metabase_table_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 29447)
-- Name: metric_important_field metric_important_field_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric_important_field
    ADD CONSTRAINT metric_important_field_pkey PRIMARY KEY (id);


--
-- TOC entry 3353 (class 2606 OID 29311)
-- Name: metric metric_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric
    ADD CONSTRAINT metric_pkey PRIMARY KEY (id);


--
-- TOC entry 3482 (class 2606 OID 29954)
-- Name: native_query_snippet native_query_snippet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.native_query_snippet
    ADD CONSTRAINT native_query_snippet_name_key UNIQUE (name);


--
-- TOC entry 3484 (class 2606 OID 29952)
-- Name: native_query_snippet native_query_snippet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.native_query_snippet
    ADD CONSTRAINT native_query_snippet_pkey PRIMARY KEY (id);


--
-- TOC entry 3391 (class 2606 OID 29514)
-- Name: permissions permissions_group_id_object_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_group_id_object_key UNIQUE (group_id, object);


--
-- TOC entry 3384 (class 2606 OID 29481)
-- Name: permissions_group_membership permissions_group_membership_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_group_membership
    ADD CONSTRAINT permissions_group_membership_pkey PRIMARY KEY (id);


--
-- TOC entry 3377 (class 2606 OID 29470)
-- Name: permissions_group permissions_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_group
    ADD CONSTRAINT permissions_group_pkey PRIMARY KEY (id);


--
-- TOC entry 3393 (class 2606 OID 29504)
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 3395 (class 2606 OID 29539)
-- Name: permissions_revision permissions_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_revision
    ADD CONSTRAINT permissions_revision_pkey PRIMARY KEY (id);


--
-- TOC entry 3458 (class 2606 OID 29844)
-- Name: qrtz_blob_triggers pk_qrtz_blob_triggers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT pk_qrtz_blob_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 3460 (class 2606 OID 29857)
-- Name: qrtz_calendars pk_qrtz_calendars; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_calendars
    ADD CONSTRAINT pk_qrtz_calendars PRIMARY KEY (sched_name, calendar_name);


--
-- TOC entry 3454 (class 2606 OID 29818)
-- Name: qrtz_cron_triggers pk_qrtz_cron_triggers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT pk_qrtz_cron_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 3470 (class 2606 OID 29870)
-- Name: qrtz_fired_triggers pk_qrtz_fired_triggers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_fired_triggers
    ADD CONSTRAINT pk_qrtz_fired_triggers PRIMARY KEY (sched_name, entry_id);


--
-- TOC entry 3436 (class 2606 OID 29784)
-- Name: qrtz_job_details pk_qrtz_job_details; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_job_details
    ADD CONSTRAINT pk_qrtz_job_details PRIMARY KEY (sched_name, job_name, job_group);


--
-- TOC entry 3474 (class 2606 OID 29880)
-- Name: qrtz_locks pk_qrtz_locks; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_locks
    ADD CONSTRAINT pk_qrtz_locks PRIMARY KEY (sched_name, lock_name);


--
-- TOC entry 3472 (class 2606 OID 29875)
-- Name: qrtz_scheduler_state pk_qrtz_scheduler_state; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_scheduler_state
    ADD CONSTRAINT pk_qrtz_scheduler_state PRIMARY KEY (sched_name, instance_name);


--
-- TOC entry 3452 (class 2606 OID 29805)
-- Name: qrtz_simple_triggers pk_qrtz_simple_triggers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT pk_qrtz_simple_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 3456 (class 2606 OID 29831)
-- Name: qrtz_simprop_triggers pk_qrtz_simprop_triggers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT pk_qrtz_simprop_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 3450 (class 2606 OID 29792)
-- Name: qrtz_triggers pk_qrtz_triggers; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT pk_qrtz_triggers PRIMARY KEY (sched_name, trigger_name, trigger_group);


--
-- TOC entry 3462 (class 2606 OID 29862)
-- Name: qrtz_paused_trigger_grps pk_sched_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_paused_trigger_grps
    ADD CONSTRAINT pk_sched_name PRIMARY KEY (sched_name, trigger_group);


--
-- TOC entry 3331 (class 2606 OID 29207)
-- Name: pulse_card pulse_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_card
    ADD CONSTRAINT pulse_card_pkey PRIMARY KEY (id);


--
-- TOC entry 3335 (class 2606 OID 29230)
-- Name: pulse_channel pulse_channel_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_channel
    ADD CONSTRAINT pulse_channel_pkey PRIMARY KEY (id);


--
-- TOC entry 3337 (class 2606 OID 29245)
-- Name: pulse_channel_recipient pulse_channel_recipient_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_channel_recipient
    ADD CONSTRAINT pulse_channel_recipient_pkey PRIMARY KEY (id);


--
-- TOC entry 3327 (class 2606 OID 29193)
-- Name: pulse pulse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse
    ADD CONSTRAINT pulse_pkey PRIMARY KEY (id);


--
-- TOC entry 3410 (class 2606 OID 29622)
-- Name: query_cache query_cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query_cache
    ADD CONSTRAINT query_cache_pkey PRIMARY KEY (query_hash);


--
-- TOC entry 3407 (class 2606 OID 29612)
-- Name: query_execution query_execution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query_execution
    ADD CONSTRAINT query_execution_pkey PRIMARY KEY (id);


--
-- TOC entry 3412 (class 2606 OID 29631)
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (query_hash);


--
-- TOC entry 3284 (class 2606 OID 28900)
-- Name: report_card report_card_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT report_card_pkey PRIMARY KEY (id);


--
-- TOC entry 3286 (class 2606 OID 29585)
-- Name: report_card report_card_public_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT report_card_public_uuid_key UNIQUE (public_uuid);


--
-- TOC entry 3292 (class 2606 OID 28920)
-- Name: report_cardfavorite report_cardfavorite_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_cardfavorite
    ADD CONSTRAINT report_cardfavorite_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 28945)
-- Name: report_dashboard report_dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT report_dashboard_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 29593)
-- Name: report_dashboard report_dashboard_public_uuid_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT report_dashboard_public_uuid_key UNIQUE (public_uuid);


--
-- TOC entry 3304 (class 2606 OID 28965)
-- Name: report_dashboardcard report_dashboardcard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboardcard
    ADD CONSTRAINT report_dashboardcard_pkey PRIMARY KEY (id);


--
-- TOC entry 3311 (class 2606 OID 29127)
-- Name: revision revision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revision
    ADD CONSTRAINT revision_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 29267)
-- Name: segment segment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segment
    ADD CONSTRAINT segment_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 29110)
-- Name: setting setting_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.setting
    ADD CONSTRAINT setting_pkey PRIMARY KEY (key);


--
-- TOC entry 3478 (class 2606 OID 29911)
-- Name: task_history task_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.task_history
    ADD CONSTRAINT task_history_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 29379)
-- Name: card_label unique_card_label_card_id_label_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_label
    ADD CONSTRAINT unique_card_label_card_id_label_id UNIQUE (card_id, label_id);


--
-- TOC entry 3401 (class 2606 OID 29769)
-- Name: collection unique_collection_personal_owner_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT unique_collection_personal_owner_id UNIQUE (personal_owner_id);


--
-- TOC entry 3418 (class 2606 OID 29653)
-- Name: dashboard_favorite unique_dashboard_favorite_user_id_dashboard_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_favorite
    ADD CONSTRAINT unique_dashboard_favorite_user_id_dashboard_id UNIQUE (user_id, dashboard_id);


--
-- TOC entry 3423 (class 2606 OID 29679)
-- Name: dimension unique_dimension_field_id_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT unique_dimension_field_id_name UNIQUE (field_id, name);


--
-- TOC entry 3432 (class 2606 OID 29750)
-- Name: group_table_access_policy unique_gtap_table_id_group_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT unique_gtap_table_id_group_id UNIQUE (table_id, group_id);


--
-- TOC entry 3374 (class 2606 OID 29459)
-- Name: metric_important_field unique_metric_important_field_metric_id_field_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric_important_field
    ADD CONSTRAINT unique_metric_important_field_metric_id_field_id UNIQUE (metric_id, field_id);


--
-- TOC entry 3386 (class 2606 OID 29493)
-- Name: permissions_group_membership unique_permissions_group_membership_user_id_group_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_group_membership
    ADD CONSTRAINT unique_permissions_group_membership_user_id_group_id UNIQUE (user_id, group_id);


--
-- TOC entry 3379 (class 2606 OID 29472)
-- Name: permissions_group unique_permissions_group_name; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_group
    ADD CONSTRAINT unique_permissions_group_name UNIQUE (name);


--
-- TOC entry 3320 (class 2606 OID 29170)
-- Name: view_log view_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.view_log
    ADD CONSTRAINT view_log_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 1259 OID 29162)
-- Name: idx_activity_custom_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_activity_custom_id ON public.activity USING btree (custom_id);


--
-- TOC entry 3315 (class 1259 OID 29160)
-- Name: idx_activity_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_activity_timestamp ON public.activity USING btree ("timestamp");


--
-- TOC entry 3316 (class 1259 OID 29161)
-- Name: idx_activity_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_activity_user_id ON public.activity USING btree (user_id);


--
-- TOC entry 3280 (class 1259 OID 29567)
-- Name: idx_card_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_card_collection_id ON public.report_card USING btree (collection_id);


--
-- TOC entry 3281 (class 1259 OID 28911)
-- Name: idx_card_creator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_card_creator_id ON public.report_card USING btree (creator_id);


--
-- TOC entry 3365 (class 1259 OID 29380)
-- Name: idx_card_label_card_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_card_label_card_id ON public.card_label USING btree (card_id);


--
-- TOC entry 3366 (class 1259 OID 29381)
-- Name: idx_card_label_label_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_card_label_label_id ON public.card_label USING btree (label_id);


--
-- TOC entry 3282 (class 1259 OID 29591)
-- Name: idx_card_public_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_card_public_uuid ON public.report_card USING btree (public_uuid);


--
-- TOC entry 3287 (class 1259 OID 28933)
-- Name: idx_cardfavorite_card_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cardfavorite_card_id ON public.report_cardfavorite USING btree (card_id);


--
-- TOC entry 3288 (class 1259 OID 28934)
-- Name: idx_cardfavorite_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cardfavorite_owner_id ON public.report_cardfavorite USING btree (owner_id);


--
-- TOC entry 3398 (class 1259 OID 29764)
-- Name: idx_collection_location; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_collection_location ON public.collection USING btree (location);


--
-- TOC entry 3399 (class 1259 OID 29775)
-- Name: idx_collection_personal_owner_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_collection_personal_owner_id ON public.collection USING btree (personal_owner_id);


--
-- TOC entry 3293 (class 1259 OID 29756)
-- Name: idx_dashboard_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dashboard_collection_id ON public.report_dashboard USING btree (collection_id);


--
-- TOC entry 3294 (class 1259 OID 28956)
-- Name: idx_dashboard_creator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dashboard_creator_id ON public.report_dashboard USING btree (creator_id);


--
-- TOC entry 3415 (class 1259 OID 29655)
-- Name: idx_dashboard_favorite_dashboard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dashboard_favorite_dashboard_id ON public.dashboard_favorite USING btree (dashboard_id);


--
-- TOC entry 3416 (class 1259 OID 29654)
-- Name: idx_dashboard_favorite_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dashboard_favorite_user_id ON public.dashboard_favorite USING btree (user_id);


--
-- TOC entry 3295 (class 1259 OID 29599)
-- Name: idx_dashboard_public_uuid; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dashboard_public_uuid ON public.report_dashboard USING btree (public_uuid);


--
-- TOC entry 3301 (class 1259 OID 28976)
-- Name: idx_dashboardcard_card_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dashboardcard_card_id ON public.report_dashboardcard USING btree (card_id);


--
-- TOC entry 3302 (class 1259 OID 28977)
-- Name: idx_dashboardcard_dashboard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dashboardcard_dashboard_id ON public.report_dashboardcard USING btree (dashboard_id);


--
-- TOC entry 3356 (class 1259 OID 29344)
-- Name: idx_dashboardcard_series_card_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dashboardcard_series_card_id ON public.dashboardcard_series USING btree (card_id);


--
-- TOC entry 3357 (class 1259 OID 29343)
-- Name: idx_dashboardcard_series_dashboardcard_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dashboardcard_series_dashboardcard_id ON public.dashboardcard_series USING btree (dashboardcard_id);


--
-- TOC entry 3323 (class 1259 OID 29185)
-- Name: idx_data_migrations_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_data_migrations_id ON public.data_migrations USING btree (id);


--
-- TOC entry 3345 (class 1259 OID 29299)
-- Name: idx_dependency_dependent_on_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dependency_dependent_on_id ON public.dependency USING btree (dependent_on_id);


--
-- TOC entry 3346 (class 1259 OID 29298)
-- Name: idx_dependency_dependent_on_model; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dependency_dependent_on_model ON public.dependency USING btree (dependent_on_model);


--
-- TOC entry 3347 (class 1259 OID 29296)
-- Name: idx_dependency_model; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dependency_model ON public.dependency USING btree (model);


--
-- TOC entry 3348 (class 1259 OID 29297)
-- Name: idx_dependency_model_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dependency_model_id ON public.dependency USING btree (model_id);


--
-- TOC entry 3421 (class 1259 OID 29680)
-- Name: idx_dimension_field_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_dimension_field_id ON public.dimension USING btree (field_id);


--
-- TOC entry 3270 (class 1259 OID 29922)
-- Name: idx_field_parent_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_field_parent_id ON public.metabase_field USING btree (parent_id);


--
-- TOC entry 3271 (class 1259 OID 28787)
-- Name: idx_field_table_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_field_table_id ON public.metabase_field USING btree (table_id);


--
-- TOC entry 3277 (class 1259 OID 28824)
-- Name: idx_fieldvalues_field_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fieldvalues_field_id ON public.metabase_fieldvalues USING btree (field_id);


--
-- TOC entry 3430 (class 1259 OID 29748)
-- Name: idx_gtap_table_id_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_gtap_table_id_group_id ON public.group_table_access_policy USING btree (table_id, group_id);


--
-- TOC entry 3358 (class 1259 OID 29359)
-- Name: idx_label_slug; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_label_slug ON public.label USING btree (slug);


--
-- TOC entry 3259 (class 1259 OID 30321)
-- Name: idx_lower_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_lower_email ON public.core_user USING btree (lower((email)::text));


--
-- TOC entry 3262 (class 1259 OID 29524)
-- Name: idx_metabase_table_db_id_schema; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_metabase_table_db_id_schema ON public.metabase_table USING btree (db_id, schema);


--
-- TOC entry 3263 (class 1259 OID 29437)
-- Name: idx_metabase_table_show_in_getting_started; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_metabase_table_show_in_getting_started ON public.metabase_table USING btree (show_in_getting_started);


--
-- TOC entry 3349 (class 1259 OID 29322)
-- Name: idx_metric_creator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_metric_creator_id ON public.metric USING btree (creator_id);


--
-- TOC entry 3369 (class 1259 OID 29461)
-- Name: idx_metric_important_field_field_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_metric_important_field_field_id ON public.metric_important_field USING btree (field_id);


--
-- TOC entry 3370 (class 1259 OID 29460)
-- Name: idx_metric_important_field_metric_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_metric_important_field_metric_id ON public.metric_important_field USING btree (metric_id);


--
-- TOC entry 3350 (class 1259 OID 29435)
-- Name: idx_metric_show_in_getting_started; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_metric_show_in_getting_started ON public.metric USING btree (show_in_getting_started);


--
-- TOC entry 3351 (class 1259 OID 29323)
-- Name: idx_metric_table_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_metric_table_id ON public.metric USING btree (table_id);


--
-- TOC entry 3387 (class 1259 OID 29510)
-- Name: idx_permissions_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_permissions_group_id ON public.permissions USING btree (group_id);


--
-- TOC entry 3388 (class 1259 OID 29512)
-- Name: idx_permissions_group_id_object; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_permissions_group_id_object ON public.permissions USING btree (group_id, object);


--
-- TOC entry 3380 (class 1259 OID 29494)
-- Name: idx_permissions_group_membership_group_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_permissions_group_membership_group_id ON public.permissions_group_membership USING btree (group_id);


--
-- TOC entry 3381 (class 1259 OID 29496)
-- Name: idx_permissions_group_membership_group_id_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_permissions_group_membership_group_id_user_id ON public.permissions_group_membership USING btree (group_id, user_id);


--
-- TOC entry 3382 (class 1259 OID 29495)
-- Name: idx_permissions_group_membership_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_permissions_group_membership_user_id ON public.permissions_group_membership USING btree (user_id);


--
-- TOC entry 3375 (class 1259 OID 29473)
-- Name: idx_permissions_group_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_permissions_group_name ON public.permissions_group USING btree (name);


--
-- TOC entry 3389 (class 1259 OID 29511)
-- Name: idx_permissions_object; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_permissions_object ON public.permissions USING btree (object);


--
-- TOC entry 3328 (class 1259 OID 29219)
-- Name: idx_pulse_card_card_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pulse_card_card_id ON public.pulse_card USING btree (card_id);


--
-- TOC entry 3329 (class 1259 OID 29218)
-- Name: idx_pulse_card_pulse_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pulse_card_pulse_id ON public.pulse_card USING btree (pulse_id);


--
-- TOC entry 3332 (class 1259 OID 29236)
-- Name: idx_pulse_channel_pulse_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pulse_channel_pulse_id ON public.pulse_channel USING btree (pulse_id);


--
-- TOC entry 3333 (class 1259 OID 29237)
-- Name: idx_pulse_channel_schedule_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pulse_channel_schedule_type ON public.pulse_channel USING btree (schedule_type);


--
-- TOC entry 3324 (class 1259 OID 29762)
-- Name: idx_pulse_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pulse_collection_id ON public.pulse USING btree (collection_id);


--
-- TOC entry 3325 (class 1259 OID 29199)
-- Name: idx_pulse_creator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_pulse_creator_id ON public.pulse USING btree (creator_id);


--
-- TOC entry 3463 (class 1259 OID 29896)
-- Name: idx_qrtz_ft_inst_job_req_rcvry; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_inst_job_req_rcvry ON public.qrtz_fired_triggers USING btree (sched_name, instance_name, requests_recovery);


--
-- TOC entry 3464 (class 1259 OID 29897)
-- Name: idx_qrtz_ft_j_g; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_j_g ON public.qrtz_fired_triggers USING btree (sched_name, job_name, job_group);


--
-- TOC entry 3465 (class 1259 OID 29898)
-- Name: idx_qrtz_ft_jg; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_jg ON public.qrtz_fired_triggers USING btree (sched_name, job_group);


--
-- TOC entry 3466 (class 1259 OID 29899)
-- Name: idx_qrtz_ft_t_g; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_t_g ON public.qrtz_fired_triggers USING btree (sched_name, trigger_name, trigger_group);


--
-- TOC entry 3467 (class 1259 OID 29900)
-- Name: idx_qrtz_ft_tg; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_tg ON public.qrtz_fired_triggers USING btree (sched_name, trigger_group);


--
-- TOC entry 3468 (class 1259 OID 29895)
-- Name: idx_qrtz_ft_trig_inst_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_ft_trig_inst_name ON public.qrtz_fired_triggers USING btree (sched_name, instance_name);


--
-- TOC entry 3433 (class 1259 OID 29882)
-- Name: idx_qrtz_j_grp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_j_grp ON public.qrtz_job_details USING btree (sched_name, job_group);


--
-- TOC entry 3434 (class 1259 OID 29881)
-- Name: idx_qrtz_j_req_recovery; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_j_req_recovery ON public.qrtz_job_details USING btree (sched_name, requests_recovery);


--
-- TOC entry 3437 (class 1259 OID 29885)
-- Name: idx_qrtz_t_c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_c ON public.qrtz_triggers USING btree (sched_name, calendar_name);


--
-- TOC entry 3438 (class 1259 OID 29886)
-- Name: idx_qrtz_t_g; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_g ON public.qrtz_triggers USING btree (sched_name, trigger_group);


--
-- TOC entry 3439 (class 1259 OID 29883)
-- Name: idx_qrtz_t_j; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_j ON public.qrtz_triggers USING btree (sched_name, job_name, job_group);


--
-- TOC entry 3440 (class 1259 OID 29884)
-- Name: idx_qrtz_t_jg; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_jg ON public.qrtz_triggers USING btree (sched_name, job_group);


--
-- TOC entry 3441 (class 1259 OID 29889)
-- Name: idx_qrtz_t_n_g_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_n_g_state ON public.qrtz_triggers USING btree (sched_name, trigger_group, trigger_state);


--
-- TOC entry 3442 (class 1259 OID 29888)
-- Name: idx_qrtz_t_n_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_n_state ON public.qrtz_triggers USING btree (sched_name, trigger_name, trigger_group, trigger_state);


--
-- TOC entry 3443 (class 1259 OID 29890)
-- Name: idx_qrtz_t_next_fire_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_next_fire_time ON public.qrtz_triggers USING btree (sched_name, next_fire_time);


--
-- TOC entry 3444 (class 1259 OID 29892)
-- Name: idx_qrtz_t_nft_misfire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_nft_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time);


--
-- TOC entry 3445 (class 1259 OID 29891)
-- Name: idx_qrtz_t_nft_st; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_nft_st ON public.qrtz_triggers USING btree (sched_name, trigger_state, next_fire_time);


--
-- TOC entry 3446 (class 1259 OID 29893)
-- Name: idx_qrtz_t_nft_st_misfire; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_nft_st_misfire ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_state);


--
-- TOC entry 3447 (class 1259 OID 29894)
-- Name: idx_qrtz_t_nft_st_misfire_grp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_nft_st_misfire_grp ON public.qrtz_triggers USING btree (sched_name, misfire_instr, next_fire_time, trigger_group, trigger_state);


--
-- TOC entry 3448 (class 1259 OID 29887)
-- Name: idx_qrtz_t_state; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_qrtz_t_state ON public.qrtz_triggers USING btree (sched_name, trigger_state);


--
-- TOC entry 3408 (class 1259 OID 29930)
-- Name: idx_query_cache_updated_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_query_cache_updated_at ON public.query_cache USING btree (updated_at);


--
-- TOC entry 3404 (class 1259 OID 29962)
-- Name: idx_query_execution_query_hash_started_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_query_execution_query_hash_started_at ON public.query_execution USING btree (hash, started_at);


--
-- TOC entry 3405 (class 1259 OID 29961)
-- Name: idx_query_execution_started_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_query_execution_started_at ON public.query_execution USING btree (started_at);


--
-- TOC entry 3296 (class 1259 OID 29433)
-- Name: idx_report_dashboard_show_in_getting_started; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_report_dashboard_show_in_getting_started ON public.report_dashboard USING btree (show_in_getting_started);


--
-- TOC entry 3309 (class 1259 OID 29133)
-- Name: idx_revision_model_model_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_revision_model_model_id ON public.revision USING btree (model, model_id);


--
-- TOC entry 3338 (class 1259 OID 29278)
-- Name: idx_segment_creator_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_segment_creator_id ON public.segment USING btree (creator_id);


--
-- TOC entry 3339 (class 1259 OID 29439)
-- Name: idx_segment_show_in_getting_started; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_segment_show_in_getting_started ON public.segment USING btree (show_in_getting_started);


--
-- TOC entry 3340 (class 1259 OID 29279)
-- Name: idx_segment_table_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_segment_table_id ON public.segment USING btree (table_id);


--
-- TOC entry 3479 (class 1259 OID 29977)
-- Name: idx_snippet_collection_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_snippet_collection_id ON public.native_query_snippet USING btree (collection_id);


--
-- TOC entry 3480 (class 1259 OID 29960)
-- Name: idx_snippet_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_snippet_name ON public.native_query_snippet USING btree (name);


--
-- TOC entry 3264 (class 1259 OID 28770)
-- Name: idx_table_db_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_table_db_id ON public.metabase_table USING btree (db_id);


--
-- TOC entry 3475 (class 1259 OID 29913)
-- Name: idx_task_history_db_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_history_db_id ON public.task_history USING btree (db_id);


--
-- TOC entry 3476 (class 1259 OID 29912)
-- Name: idx_task_history_end_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_task_history_end_time ON public.task_history USING btree (ended_at);


--
-- TOC entry 3274 (class 1259 OID 29921)
-- Name: idx_uniq_field_table_id_parent_id_name_2col; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_uniq_field_table_id_parent_id_name_2col ON public.metabase_field USING btree (table_id, name) WHERE (parent_id IS NULL);


--
-- TOC entry 3267 (class 1259 OID 29918)
-- Name: idx_uniq_table_db_id_schema_name_2col; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX idx_uniq_table_db_id_schema_name_2col ON public.metabase_table USING btree (db_id, name) WHERE (schema IS NULL);


--
-- TOC entry 3317 (class 1259 OID 29177)
-- Name: idx_view_log_timestamp; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_view_log_timestamp ON public.view_log USING btree (model_id);


--
-- TOC entry 3318 (class 1259 OID 29176)
-- Name: idx_view_log_user_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_view_log_user_id ON public.view_log USING btree (user_id);


--
-- TOC entry 3503 (class 2606 OID 29978)
-- Name: activity fk_activity_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity
    ADD CONSTRAINT fk_activity_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3489 (class 2606 OID 30133)
-- Name: report_card fk_card_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_card_collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON DELETE SET NULL;


--
-- TOC entry 3520 (class 2606 OID 29983)
-- Name: card_label fk_card_label_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_label
    ADD CONSTRAINT fk_card_label_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- TOC entry 3521 (class 2606 OID 29988)
-- Name: card_label fk_card_label_ref_label_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.card_label
    ADD CONSTRAINT fk_card_label_ref_label_id FOREIGN KEY (label_id) REFERENCES public.label(id) ON DELETE CASCADE;


--
-- TOC entry 3490 (class 2606 OID 30138)
-- Name: report_card fk_card_made_public_by_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_card_made_public_by_id FOREIGN KEY (made_public_by_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3491 (class 2606 OID 30143)
-- Name: report_card fk_card_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_card_ref_user_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3494 (class 2606 OID 30158)
-- Name: report_cardfavorite fk_cardfavorite_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_cardfavorite
    ADD CONSTRAINT fk_cardfavorite_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- TOC entry 3495 (class 2606 OID 30163)
-- Name: report_cardfavorite fk_cardfavorite_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_cardfavorite
    ADD CONSTRAINT fk_cardfavorite_ref_user_id FOREIGN KEY (owner_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3528 (class 2606 OID 29993)
-- Name: collection fk_collection_personal_owner_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection
    ADD CONSTRAINT fk_collection_personal_owner_id FOREIGN KEY (personal_owner_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3529 (class 2606 OID 29998)
-- Name: collection_revision fk_collection_revision_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.collection_revision
    ADD CONSTRAINT fk_collection_revision_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3534 (class 2606 OID 30003)
-- Name: computation_job fk_computation_job_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computation_job
    ADD CONSTRAINT fk_computation_job_ref_user_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3535 (class 2606 OID 30008)
-- Name: computation_job_result fk_computation_result_ref_job_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.computation_job_result
    ADD CONSTRAINT fk_computation_result_ref_job_id FOREIGN KEY (job_id) REFERENCES public.computation_job(id) ON DELETE CASCADE;


--
-- TOC entry 3496 (class 2606 OID 30168)
-- Name: report_dashboard fk_dashboard_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT fk_dashboard_collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON DELETE SET NULL;


--
-- TOC entry 3530 (class 2606 OID 29642)
-- Name: dashboard_favorite fk_dashboard_favorite_dashboard_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_favorite
    ADD CONSTRAINT fk_dashboard_favorite_dashboard_id FOREIGN KEY (dashboard_id) REFERENCES public.report_dashboard(id) ON DELETE CASCADE;


--
-- TOC entry 3531 (class 2606 OID 29647)
-- Name: dashboard_favorite fk_dashboard_favorite_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard_favorite
    ADD CONSTRAINT fk_dashboard_favorite_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3497 (class 2606 OID 30173)
-- Name: report_dashboard fk_dashboard_made_public_by_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT fk_dashboard_made_public_by_id FOREIGN KEY (made_public_by_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3498 (class 2606 OID 30178)
-- Name: report_dashboard fk_dashboard_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboard
    ADD CONSTRAINT fk_dashboard_ref_user_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3499 (class 2606 OID 30183)
-- Name: report_dashboardcard fk_dashboardcard_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboardcard
    ADD CONSTRAINT fk_dashboardcard_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- TOC entry 3500 (class 2606 OID 30188)
-- Name: report_dashboardcard fk_dashboardcard_ref_dashboard_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_dashboardcard
    ADD CONSTRAINT fk_dashboardcard_ref_dashboard_id FOREIGN KEY (dashboard_id) REFERENCES public.report_dashboard(id) ON DELETE CASCADE;


--
-- TOC entry 3518 (class 2606 OID 30018)
-- Name: dashboardcard_series fk_dashboardcard_series_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboardcard_series
    ADD CONSTRAINT fk_dashboardcard_series_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- TOC entry 3519 (class 2606 OID 30023)
-- Name: dashboardcard_series fk_dashboardcard_series_ref_dashboardcard_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboardcard_series
    ADD CONSTRAINT fk_dashboardcard_series_ref_dashboardcard_id FOREIGN KEY (dashboardcard_id) REFERENCES public.report_dashboardcard(id) ON DELETE CASCADE;


--
-- TOC entry 3532 (class 2606 OID 29668)
-- Name: dimension fk_dimension_displayfk_ref_field_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT fk_dimension_displayfk_ref_field_id FOREIGN KEY (human_readable_field_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- TOC entry 3533 (class 2606 OID 29673)
-- Name: dimension fk_dimension_ref_field_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dimension
    ADD CONSTRAINT fk_dimension_ref_field_id FOREIGN KEY (field_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- TOC entry 3486 (class 2606 OID 30033)
-- Name: metabase_field fk_field_parent_ref_field_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_field
    ADD CONSTRAINT fk_field_parent_ref_field_id FOREIGN KEY (parent_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- TOC entry 3487 (class 2606 OID 30038)
-- Name: metabase_field fk_field_ref_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_field
    ADD CONSTRAINT fk_field_ref_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- TOC entry 3488 (class 2606 OID 30043)
-- Name: metabase_fieldvalues fk_fieldvalues_ref_field_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_fieldvalues
    ADD CONSTRAINT fk_fieldvalues_ref_field_id FOREIGN KEY (field_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- TOC entry 3538 (class 2606 OID 30028)
-- Name: group_table_access_policy fk_gtap_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT fk_gtap_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- TOC entry 3536 (class 2606 OID 29733)
-- Name: group_table_access_policy fk_gtap_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT fk_gtap_group_id FOREIGN KEY (group_id) REFERENCES public.permissions_group(id) ON DELETE CASCADE;


--
-- TOC entry 3537 (class 2606 OID 29743)
-- Name: group_table_access_policy fk_gtap_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_table_access_policy
    ADD CONSTRAINT fk_gtap_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- TOC entry 3522 (class 2606 OID 30063)
-- Name: metric_important_field fk_metric_important_field_metabase_field_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric_important_field
    ADD CONSTRAINT fk_metric_important_field_metabase_field_id FOREIGN KEY (field_id) REFERENCES public.metabase_field(id) ON DELETE CASCADE;


--
-- TOC entry 3523 (class 2606 OID 30068)
-- Name: metric_important_field fk_metric_important_field_metric_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric_important_field
    ADD CONSTRAINT fk_metric_important_field_metric_id FOREIGN KEY (metric_id) REFERENCES public.metric(id) ON DELETE CASCADE;


--
-- TOC entry 3516 (class 2606 OID 30053)
-- Name: metric fk_metric_ref_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric
    ADD CONSTRAINT fk_metric_ref_creator_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3517 (class 2606 OID 30058)
-- Name: metric fk_metric_ref_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metric
    ADD CONSTRAINT fk_metric_ref_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- TOC entry 3524 (class 2606 OID 30083)
-- Name: permissions_group_membership fk_permissions_group_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_group_membership
    ADD CONSTRAINT fk_permissions_group_group_id FOREIGN KEY (group_id) REFERENCES public.permissions_group(id) ON DELETE CASCADE;


--
-- TOC entry 3526 (class 2606 OID 30078)
-- Name: permissions fk_permissions_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions
    ADD CONSTRAINT fk_permissions_group_id FOREIGN KEY (group_id) REFERENCES public.permissions_group(id) ON DELETE CASCADE;


--
-- TOC entry 3525 (class 2606 OID 30088)
-- Name: permissions_group_membership fk_permissions_group_membership_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_group_membership
    ADD CONSTRAINT fk_permissions_group_membership_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3527 (class 2606 OID 30093)
-- Name: permissions_revision fk_permissions_revision_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.permissions_revision
    ADD CONSTRAINT fk_permissions_revision_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3508 (class 2606 OID 30108)
-- Name: pulse_card fk_pulse_card_ref_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_card
    ADD CONSTRAINT fk_pulse_card_ref_card_id FOREIGN KEY (card_id) REFERENCES public.report_card(id) ON DELETE CASCADE;


--
-- TOC entry 3510 (class 2606 OID 30329)
-- Name: pulse_card fk_pulse_card_ref_pulse_card_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_card
    ADD CONSTRAINT fk_pulse_card_ref_pulse_card_id FOREIGN KEY (dashboard_card_id) REFERENCES public.report_dashboardcard(id) ON DELETE CASCADE;


--
-- TOC entry 3509 (class 2606 OID 30113)
-- Name: pulse_card fk_pulse_card_ref_pulse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_card
    ADD CONSTRAINT fk_pulse_card_ref_pulse_id FOREIGN KEY (pulse_id) REFERENCES public.pulse(id) ON DELETE CASCADE;


--
-- TOC entry 3512 (class 2606 OID 30123)
-- Name: pulse_channel_recipient fk_pulse_channel_recipient_ref_pulse_channel_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_channel_recipient
    ADD CONSTRAINT fk_pulse_channel_recipient_ref_pulse_channel_id FOREIGN KEY (pulse_channel_id) REFERENCES public.pulse_channel(id) ON DELETE CASCADE;


--
-- TOC entry 3513 (class 2606 OID 30128)
-- Name: pulse_channel_recipient fk_pulse_channel_recipient_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_channel_recipient
    ADD CONSTRAINT fk_pulse_channel_recipient_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3511 (class 2606 OID 30118)
-- Name: pulse_channel fk_pulse_channel_ref_pulse_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse_channel
    ADD CONSTRAINT fk_pulse_channel_ref_pulse_id FOREIGN KEY (pulse_id) REFERENCES public.pulse(id) ON DELETE CASCADE;


--
-- TOC entry 3505 (class 2606 OID 30098)
-- Name: pulse fk_pulse_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse
    ADD CONSTRAINT fk_pulse_collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON DELETE SET NULL;


--
-- TOC entry 3506 (class 2606 OID 30103)
-- Name: pulse fk_pulse_ref_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse
    ADD CONSTRAINT fk_pulse_ref_creator_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3507 (class 2606 OID 30334)
-- Name: pulse fk_pulse_ref_dashboard_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pulse
    ADD CONSTRAINT fk_pulse_ref_dashboard_id FOREIGN KEY (dashboard_id) REFERENCES public.report_dashboard(id) ON DELETE CASCADE;


--
-- TOC entry 3543 (class 2606 OID 29845)
-- Name: qrtz_blob_triggers fk_qrtz_blob_triggers_triggers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_blob_triggers
    ADD CONSTRAINT fk_qrtz_blob_triggers_triggers FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- TOC entry 3541 (class 2606 OID 29819)
-- Name: qrtz_cron_triggers fk_qrtz_cron_triggers_triggers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_cron_triggers
    ADD CONSTRAINT fk_qrtz_cron_triggers_triggers FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- TOC entry 3540 (class 2606 OID 29806)
-- Name: qrtz_simple_triggers fk_qrtz_simple_triggers_triggers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_simple_triggers
    ADD CONSTRAINT fk_qrtz_simple_triggers_triggers FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- TOC entry 3542 (class 2606 OID 29832)
-- Name: qrtz_simprop_triggers fk_qrtz_simprop_triggers_triggers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_simprop_triggers
    ADD CONSTRAINT fk_qrtz_simprop_triggers_triggers FOREIGN KEY (sched_name, trigger_name, trigger_group) REFERENCES public.qrtz_triggers(sched_name, trigger_name, trigger_group);


--
-- TOC entry 3539 (class 2606 OID 29793)
-- Name: qrtz_triggers fk_qrtz_triggers_job_details; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.qrtz_triggers
    ADD CONSTRAINT fk_qrtz_triggers_job_details FOREIGN KEY (sched_name, job_name, job_group) REFERENCES public.qrtz_job_details(sched_name, job_name, job_group);


--
-- TOC entry 3492 (class 2606 OID 30148)
-- Name: report_card fk_report_card_ref_database_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_report_card_ref_database_id FOREIGN KEY (database_id) REFERENCES public.metabase_database(id) ON DELETE CASCADE;


--
-- TOC entry 3493 (class 2606 OID 30153)
-- Name: report_card fk_report_card_ref_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.report_card
    ADD CONSTRAINT fk_report_card_ref_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- TOC entry 3502 (class 2606 OID 30193)
-- Name: revision fk_revision_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.revision
    ADD CONSTRAINT fk_revision_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3514 (class 2606 OID 30198)
-- Name: segment fk_segment_ref_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segment
    ADD CONSTRAINT fk_segment_ref_creator_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3515 (class 2606 OID 30203)
-- Name: segment fk_segment_ref_table_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.segment
    ADD CONSTRAINT fk_segment_ref_table_id FOREIGN KEY (table_id) REFERENCES public.metabase_table(id) ON DELETE CASCADE;


--
-- TOC entry 3501 (class 2606 OID 30013)
-- Name: core_session fk_session_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.core_session
    ADD CONSTRAINT fk_session_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3545 (class 2606 OID 30073)
-- Name: native_query_snippet fk_snippet_collection_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.native_query_snippet
    ADD CONSTRAINT fk_snippet_collection_id FOREIGN KEY (collection_id) REFERENCES public.collection(id) ON DELETE SET NULL;


--
-- TOC entry 3544 (class 2606 OID 29955)
-- Name: native_query_snippet fk_snippet_creator_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.native_query_snippet
    ADD CONSTRAINT fk_snippet_creator_id FOREIGN KEY (creator_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


--
-- TOC entry 3485 (class 2606 OID 30048)
-- Name: metabase_table fk_table_ref_database_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.metabase_table
    ADD CONSTRAINT fk_table_ref_database_id FOREIGN KEY (db_id) REFERENCES public.metabase_database(id) ON DELETE CASCADE;


--
-- TOC entry 3504 (class 2606 OID 30208)
-- Name: view_log fk_view_log_ref_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.view_log
    ADD CONSTRAINT fk_view_log_ref_user_id FOREIGN KEY (user_id) REFERENCES public.core_user(id) ON DELETE CASCADE;


-- Completed on 2021-04-12 22:09:57 -03

--
-- PostgreSQL database dump complete
--

