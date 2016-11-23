--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: JOBマスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "JOBマスタ" (
    "job番号" character varying NOT NULL,
    "job名" character varying,
    "開始日" date,
    "終了日" date,
    "ユーザ番号" character varying,
    "ユーザ名" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "入力社員番号" character varying,
    "分類コード" character varying,
    "分類名" character varying,
    "関連Job番号" character varying,
    "備考" character varying
);


ALTER TABLE "JOBマスタ" OWNER TO kl;

--
-- Name: delayed_jobs; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE delayed_jobs (
    id integer NOT NULL,
    priority integer DEFAULT 0 NOT NULL,
    attempts integer DEFAULT 0 NOT NULL,
    handler text NOT NULL,
    last_error text,
    run_at timestamp without time zone,
    locked_at timestamp without time zone,
    failed_at timestamp without time zone,
    locked_by character varying,
    queue character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE delayed_jobs OWNER TO kl;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE delayed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delayed_jobs_id_seq OWNER TO kl;

--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE delayed_jobs_id_seq OWNED BY delayed_jobs.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE events (
    id integer NOT NULL,
    "社員番号" character varying,
    "開始" character varying,
    "終了" character varying,
    "状態コード" character varying,
    "場所コード" character varying,
    "JOB" character varying,
    "所属コード" character varying,
    "工程コード" character varying,
    "工数" character varying,
    "計上" character varying,
    comment text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "有無" character varying
);


ALTER TABLE events OWNER TO kl;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE events_id_seq OWNER TO kl;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: jpt_holiday_msts; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE jpt_holiday_msts (
    id integer NOT NULL,
    event_date date,
    title character varying,
    description character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE jpt_holiday_msts OWNER TO kl;

--
-- Name: jpt_holiday_msts_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE jpt_holiday_msts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jpt_holiday_msts_id_seq OWNER TO kl;

--
-- Name: jpt_holiday_msts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE jpt_holiday_msts_id_seq OWNED BY jpt_holiday_msts.id;


--
-- Name: keihi_bodies; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE keihi_bodies (
    id integer NOT NULL,
    "申請番号" character varying,
    "日付" date,
    "社員番号" character varying,
    "相手先" character varying,
    "機関名" character varying,
    "発" character varying,
    "着" character varying,
    "発着kubun" character varying,
    "交通費" character varying,
    "日当" character varying,
    "宿泊費" character varying,
    "その他" character varying,
    "JOB" character varying,
    "備考" text,
    "領収書kubun" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE keihi_bodies OWNER TO kl;

--
-- Name: keihi_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE keihi_bodies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE keihi_bodies_id_seq OWNER TO kl;

--
-- Name: keihi_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE keihi_bodies_id_seq OWNED BY keihi_bodies.id;


--
-- Name: keihi_heads; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE keihi_heads (
    "申請番号" character varying NOT NULL,
    "日付" date,
    "社員番号" character varying,
    "申請者" character varying,
    "交通費合計" character varying,
    "日当合計" character varying,
    "宿泊費合計" character varying,
    "その他合計" character varying,
    "旅費合計" character varying,
    "仮払金" character varying,
    "合計" character varying,
    "支給品" character varying,
    "過不足" character varying,
    "承認kubun" character varying,
    "承認者" character varying,
    "清算予定日" date,
    "清算日" date,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "承認済区分" character varying
);


ALTER TABLE keihi_heads OWNER TO kl;

--
-- Name: kintais; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE kintais (
    id integer NOT NULL,
    "日付" date,
    "曜日" character varying,
    "勤務タイプ" character varying,
    "実労働時間" numeric,
    "普通残業時間" numeric,
    "深夜残業時間" numeric,
    "普通保守時間" numeric,
    "深夜保守時間" numeric,
    "保守携帯回数" integer,
    "状態1" character varying,
    "状態2" character varying,
    "状態3" character varying,
    "備考" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "社員番号" character varying,
    "入力済" character varying,
    holiday character varying,
    "代休相手日付" date,
    "代休取得区分" character varying,
    "出勤時刻" timestamp without time zone,
    "退社時刻" timestamp without time zone,
    "遅刻時間" numeric,
    "早退時間" numeric
);


ALTER TABLE kintais OWNER TO kl;

--
-- Name: kintais_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE kintais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE kintais_id_seq OWNER TO kl;

--
-- Name: kintais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE kintais_id_seq OWNED BY kintais.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO kl;

--
-- Name: temps; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE temps (
    id integer NOT NULL,
    date date,
    checked boolean
);


ALTER TABLE temps OWNER TO kl;

--
-- Name: temps_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE temps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE temps_id_seq OWNER TO kl;

--
-- Name: temps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE temps_id_seq OWNED BY temps.id;


--
-- Name: ロールマスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "ロールマスタ" (
    id integer NOT NULL,
    "ロールコード" character varying(10) NOT NULL,
    "ロール名" character varying(40),
    "序列" character varying(10),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "ロールマスタ" OWNER TO kl;

--
-- Name: ロールマスタ_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "ロールマスタ_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ロールマスタ_id_seq" OWNER TO kl;

--
-- Name: ロールマスタ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "ロールマスタ_id_seq" OWNED BY "ロールマスタ".id;


--
-- Name: ロールメンバ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "ロールメンバ" (
    id integer NOT NULL,
    "ロールコード" character varying NOT NULL,
    "社員番号" character varying NOT NULL,
    "氏名　　　　　　" character varying,
    "ロール内序列" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "ロールメンバ" OWNER TO kl;

--
-- Name: ロールメンバ_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "ロールメンバ_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "ロールメンバ_id_seq" OWNER TO kl;

--
-- Name: ロールメンバ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "ロールメンバ_id_seq" OWNED BY "ロールメンバ".id;


--
-- Name: 会社マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "会社マスタ" (
    "会社コード" character varying NOT NULL,
    "会社名" character varying,
    "備考" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "会社マスタ" OWNER TO kl;

--
-- Name: 伝言; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "伝言" (
    id integer NOT NULL,
    from1 character varying,
    from2 character varying,
    "日付" timestamp without time zone,
    "入力者" character varying,
    "用件" character varying,
    "回答" character varying,
    "伝言内容" character varying,
    "確認" boolean,
    "送信" boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "社員番号" character varying
);


ALTER TABLE "伝言" OWNER TO kl;

--
-- Name: 伝言_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "伝言_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "伝言_id_seq" OWNER TO kl;

--
-- Name: 伝言_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "伝言_id_seq" OWNED BY "伝言".id;


--
-- Name: 伝言回答マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "伝言回答マスタ" (
    id integer NOT NULL,
    "種類名" character varying,
    "備考" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "伝言回答マスタ" OWNER TO kl;

--
-- Name: 伝言回答マスタ_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "伝言回答マスタ_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "伝言回答マスタ_id_seq" OWNER TO kl;

--
-- Name: 伝言回答マスタ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "伝言回答マスタ_id_seq" OWNED BY "伝言回答マスタ".id;


--
-- Name: 伝言用件マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "伝言用件マスタ" (
    id integer NOT NULL,
    "種類名" character varying,
    "備考" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    color character varying,
    "優先さ" integer
);


ALTER TABLE "伝言用件マスタ" OWNER TO kl;

--
-- Name: 伝言用件マスタ_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "伝言用件マスタ_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "伝言用件マスタ_id_seq" OWNER TO kl;

--
-- Name: 伝言用件マスタ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "伝言用件マスタ_id_seq" OWNED BY "伝言用件マスタ".id;


--
-- Name: 優先; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "優先" (
    id integer NOT NULL,
    "優先さ" integer,
    "名前" character varying,
    "色" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "優先" OWNER TO kl;

--
-- Name: 優先_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "優先_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "優先_id_seq" OWNER TO kl;

--
-- Name: 優先_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "優先_id_seq" OWNED BY "優先".id;


--
-- Name: 分類マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "分類マスタ" (
    "分類コード" character varying NOT NULL,
    "分類名" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "分類マスタ" OWNER TO kl;

--
-- Name: 回覧; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "回覧" (
    id integer NOT NULL,
    "発行者" character varying,
    "要件" character varying,
    "開始" character varying,
    "終了" character varying,
    "件名" character varying,
    "内容" text,
    "確認" boolean,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "確認要" boolean,
    "確認済" boolean
);


ALTER TABLE "回覧" OWNER TO kl;

--
-- Name: 回覧_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "回覧_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "回覧_id_seq" OWNER TO kl;

--
-- Name: 回覧_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "回覧_id_seq" OWNED BY "回覧".id;


--
-- Name: 回覧用件マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "回覧用件マスタ" (
    id integer NOT NULL,
    "名称" character varying,
    "備考" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    color character varying,
    "優先さ" integer
);


ALTER TABLE "回覧用件マスタ" OWNER TO kl;

--
-- Name: 回覧用件マスタ_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "回覧用件マスタ_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "回覧用件マスタ_id_seq" OWNER TO kl;

--
-- Name: 回覧用件マスタ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "回覧用件マスタ_id_seq" OWNED BY "回覧用件マスタ".id;


--
-- Name: 回覧詳細; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "回覧詳細" (
    id integer NOT NULL,
    "回覧コード" character varying,
    "対象者" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "状態" integer
);


ALTER TABLE "回覧詳細" OWNER TO kl;

--
-- Name: 回覧詳細_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "回覧詳細_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "回覧詳細_id_seq" OWNER TO kl;

--
-- Name: 回覧詳細_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "回覧詳細_id_seq" OWNED BY "回覧詳細".id;


--
-- Name: 場所マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "場所マスタ" (
    "場所コード" character varying NOT NULL,
    "場所名" character varying,
    "場所名カナ" character varying,
    "SUB" character varying,
    "場所区分" character varying,
    "会社コード" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "場所マスタ" OWNER TO kl;

--
-- Name: 場所区分マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "場所区分マスタ" (
    "場所区分コード" character varying NOT NULL,
    "場所区分名" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "場所区分マスタ" OWNER TO kl;

--
-- Name: 工程マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "工程マスタ" (
    "所属コード" character varying NOT NULL,
    "工程コード" character varying NOT NULL,
    "工程名" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "工程マスタ" OWNER TO kl;

--
-- Name: 役職マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "役職マスタ" (
    "役職コード" character varying NOT NULL,
    "役職名" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "役職マスタ" OWNER TO kl;

--
-- Name: 所在マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "所在マスタ" (
    "所在コード" character varying NOT NULL,
    "所在名" character varying,
    "背景色" character varying,
    "文字色" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "所在マスタ" OWNER TO kl;

--
-- Name: 所属マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "所属マスタ" (
    "所属コード" character varying NOT NULL,
    "所属名" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "所属マスタ" OWNER TO kl;

--
-- Name: 承認者マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "承認者マスタ" (
    id integer NOT NULL,
    "申請者" character varying,
    "承認者" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "順番" integer
);


ALTER TABLE "承認者マスタ" OWNER TO kl;

--
-- Name: 承認者マスタ_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "承認者マスタ_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "承認者マスタ_id_seq" OWNER TO kl;

--
-- Name: 承認者マスタ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "承認者マスタ_id_seq" OWNED BY "承認者マスタ".id;


--
-- Name: 担当者マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "担当者マスタ" (
    "担当者コード" character varying NOT NULL,
    "担当者名称" character varying,
    admin boolean DEFAULT false,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    avatar_file_name character varying,
    avatar_content_type character varying,
    avatar_file_size integer,
    avatar_updated_at timestamp without time zone,
    email character varying,
    password_digest character varying,
    supervisor boolean DEFAULT false
);


ALTER TABLE "担当者マスタ" OWNER TO kl;

--
-- Name: 機関マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "機関マスタ" (
    "機関コード" character varying NOT NULL,
    "機関名" character varying,
    "備考" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "機関マスタ" OWNER TO kl;

--
-- Name: 状態マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "状態マスタ" (
    "状態コード" character varying NOT NULL,
    "状態名" character varying,
    "状態区分" character varying,
    "勤怠状態名" character varying,
    "マーク" character varying,
    "色" character varying,
    "文字色" character varying,
    "WEB使用区分" character varying,
    "勤怠使用区分" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "状態マスタ" OWNER TO kl;

--
-- Name: 社員マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "社員マスタ" (
    "社員番号" character varying NOT NULL,
    "連携用社員番号" character varying,
    "氏名" character varying,
    "所属コード" character varying,
    "直間区分" character varying,
    "役職コード" character varying,
    "内線電話番号" character varying,
    "伝言件数" character varying,
    "回覧件数" character varying,
    "所在コード" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "有給残数" numeric,
    "残業区分" character varying,
    "勤務タイプ" character varying,
    "区分" boolean DEFAULT false,
    "タイムライン区分" boolean DEFAULT false,
    login_time date,
    "序列" integer DEFAULT 0
);


ALTER TABLE "社員マスタ" OWNER TO kl;

--
-- Name: 設備マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "設備マスタ" (
    id integer NOT NULL,
    "設備コード" character varying,
    "設備名" character varying,
    "備考" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "設備マスタ" OWNER TO kl;

--
-- Name: 設備マスタ_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "設備マスタ_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "設備マスタ_id_seq" OWNER TO kl;

--
-- Name: 設備マスタ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "設備マスタ_id_seq" OWNED BY "設備マスタ".id;


--
-- Name: 設備予約; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "設備予約" (
    id integer NOT NULL,
    "設備コード" character varying,
    "予約者" character varying,
    "相手先" character varying,
    "開始" character varying,
    "終了" character varying,
    "用件" text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "設備予約" OWNER TO kl;

--
-- Name: 設備予約_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "設備予約_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "設備予約_id_seq" OWNER TO kl;

--
-- Name: 設備予約_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "設備予約_id_seq" OWNED BY "設備予約".id;


--
-- Name: 通信制御マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "通信制御マスタ" (
    id integer NOT NULL,
    "社員番号" character varying,
    "メール" character varying,
    "送信許可区分" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE "通信制御マスタ" OWNER TO kl;

--
-- Name: 通信制御マスタ_id_seq; Type: SEQUENCE; Schema: public; Owner: kl
--

CREATE SEQUENCE "通信制御マスタ_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "通信制御マスタ_id_seq" OWNER TO kl;

--
-- Name: 通信制御マスタ_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kl
--

ALTER SEQUENCE "通信制御マスタ_id_seq" OWNED BY "通信制御マスタ".id;


--
-- Name: 駅マスタ; Type: TABLE; Schema: public; Owner: kl
--

CREATE TABLE "駅マスタ" (
    "駅コード" character varying NOT NULL,
    "駅名" character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    "駅名カナ" character varying,
    "選択回数" integer
);


ALTER TABLE "駅マスタ" OWNER TO kl;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY delayed_jobs ALTER COLUMN id SET DEFAULT nextval('delayed_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY jpt_holiday_msts ALTER COLUMN id SET DEFAULT nextval('jpt_holiday_msts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY keihi_bodies ALTER COLUMN id SET DEFAULT nextval('keihi_bodies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY kintais ALTER COLUMN id SET DEFAULT nextval('kintais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY temps ALTER COLUMN id SET DEFAULT nextval('temps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "ロールマスタ" ALTER COLUMN id SET DEFAULT nextval('"ロールマスタ_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "ロールメンバ" ALTER COLUMN id SET DEFAULT nextval('"ロールメンバ_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "伝言" ALTER COLUMN id SET DEFAULT nextval('"伝言_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "伝言回答マスタ" ALTER COLUMN id SET DEFAULT nextval('"伝言回答マスタ_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "伝言用件マスタ" ALTER COLUMN id SET DEFAULT nextval('"伝言用件マスタ_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "優先" ALTER COLUMN id SET DEFAULT nextval('"優先_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "回覧" ALTER COLUMN id SET DEFAULT nextval('"回覧_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "回覧用件マスタ" ALTER COLUMN id SET DEFAULT nextval('"回覧用件マスタ_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "回覧詳細" ALTER COLUMN id SET DEFAULT nextval('"回覧詳細_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "承認者マスタ" ALTER COLUMN id SET DEFAULT nextval('"承認者マスタ_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "設備マスタ" ALTER COLUMN id SET DEFAULT nextval('"設備マスタ_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "設備予約" ALTER COLUMN id SET DEFAULT nextval('"設備予約_id_seq"'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "通信制御マスタ" ALTER COLUMN id SET DEFAULT nextval('"通信制御マスタ_id_seq"'::regclass);


--
-- Data for Name: JOBマスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "JOBマスタ" ("job番号", "job名", "開始日", "終了日", "ユーザ番号", "ユーザ名", created_at, updated_at, "入力社員番号", "分類コード", "分類名", "関連Job番号", "備考") FROM stdin;
\.


--
-- Data for Name: delayed_jobs; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY delayed_jobs (id, priority, attempts, handler, last_error, run_at, locked_at, failed_at, locked_by, queue, created_at, updated_at) FROM stdin;
\.


--
-- Name: delayed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('delayed_jobs_id_seq', 1, false);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY events (id, "社員番号", "開始", "終了", "状態コード", "場所コード", "JOB", "所属コード", "工程コード", "工数", "計上", comment, created_at, updated_at, "有無") FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: jpt_holiday_msts; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY jpt_holiday_msts (id, event_date, title, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: jpt_holiday_msts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('jpt_holiday_msts_id_seq', 1, false);


--
-- Data for Name: keihi_bodies; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY keihi_bodies (id, "申請番号", "日付", "社員番号", "相手先", "機関名", "発", "着", "発着kubun", "交通費", "日当", "宿泊費", "その他", "JOB", "備考", "領収書kubun", created_at, updated_at) FROM stdin;
\.


--
-- Name: keihi_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('keihi_bodies_id_seq', 1, false);


--
-- Data for Name: keihi_heads; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY keihi_heads ("申請番号", "日付", "社員番号", "申請者", "交通費合計", "日当合計", "宿泊費合計", "その他合計", "旅費合計", "仮払金", "合計", "支給品", "過不足", "承認kubun", "承認者", "清算予定日", "清算日", created_at, updated_at, "承認済区分") FROM stdin;
\.


--
-- Data for Name: kintais; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY kintais (id, "日付", "曜日", "勤務タイプ", "実労働時間", "普通残業時間", "深夜残業時間", "普通保守時間", "深夜保守時間", "保守携帯回数", "状態1", "状態2", "状態3", "備考", created_at, updated_at, "社員番号", "入力済", holiday, "代休相手日付", "代休取得区分", "出勤時刻", "退社時刻", "遅刻時間", "早退時間") FROM stdin;
\.


--
-- Name: kintais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('kintais_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY schema_migrations (version) FROM stdin;
20160710014811
20160423133520
20160329032042
20151214032228
20160216041145
20160601145858
20151226042301
20160225101809
20160202102311
20151216072327
20151222030817
20160323080232
20160119102040
20160323064631
20160219032150
20160329032120
20160224161859
20160708154152
20151130064407
20160329032020
20160604075735
20151216044221
20160423113755
20160521081923
20151202043334
20151208081118
20160521070417
20160328035015
20160229063934
20160612144014
20160204040429
20160521054318
20160801040045
20160727100331
20160801092923
20160915091717
20160928074125
20160929024146
20161005071134
20161005071536
20161020080216
20161020102828
20161021034614
20161025075428
20161027045502
20161027074922
20161028081312
20161031022405
20161031023034
20161102080904
20161102080927
20161102054832
20161103041950
20161103042550
20161103042638
20161123034105
20161123070901
\.


--
-- Data for Name: temps; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY temps (id, date, checked) FROM stdin;
\.


--
-- Name: temps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('temps_id_seq', 1, false);


--
-- Data for Name: ロールマスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "ロールマスタ" (id, "ロールコード", "ロール名", "序列", created_at, updated_at) FROM stdin;
\.


--
-- Name: ロールマスタ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"ロールマスタ_id_seq"', 1, false);


--
-- Data for Name: ロールメンバ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "ロールメンバ" (id, "ロールコード", "社員番号", "氏名　　　　　　", "ロール内序列", created_at, updated_at) FROM stdin;
\.


--
-- Name: ロールメンバ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"ロールメンバ_id_seq"', 1, false);


--
-- Data for Name: 会社マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "会社マスタ" ("会社コード", "会社名", "備考", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 伝言; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "伝言" (id, from1, from2, "日付", "入力者", "用件", "回答", "伝言内容", "確認", "送信", created_at, updated_at, "社員番号") FROM stdin;
\.


--
-- Name: 伝言_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"伝言_id_seq"', 1, false);


--
-- Data for Name: 伝言回答マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "伝言回答マスタ" (id, "種類名", "備考", created_at, updated_at) FROM stdin;
\.


--
-- Name: 伝言回答マスタ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"伝言回答マスタ_id_seq"', 1, false);


--
-- Data for Name: 伝言用件マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "伝言用件マスタ" (id, "種類名", "備考", created_at, updated_at, color, "優先さ") FROM stdin;
\.


--
-- Name: 伝言用件マスタ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"伝言用件マスタ_id_seq"', 1, false);


--
-- Data for Name: 優先; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "優先" (id, "優先さ", "名前", "色", created_at, updated_at) FROM stdin;
\.


--
-- Name: 優先_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"優先_id_seq"', 1, false);


--
-- Data for Name: 分類マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "分類マスタ" ("分類コード", "分類名", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 回覧; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "回覧" (id, "発行者", "要件", "開始", "終了", "件名", "内容", "確認", created_at, updated_at, "確認要", "確認済") FROM stdin;
\.


--
-- Name: 回覧_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"回覧_id_seq"', 1, false);


--
-- Data for Name: 回覧用件マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "回覧用件マスタ" (id, "名称", "備考", created_at, updated_at, color, "優先さ") FROM stdin;
\.


--
-- Name: 回覧用件マスタ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"回覧用件マスタ_id_seq"', 1, false);


--
-- Data for Name: 回覧詳細; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "回覧詳細" (id, "回覧コード", "対象者", created_at, updated_at, "状態") FROM stdin;
\.


--
-- Name: 回覧詳細_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"回覧詳細_id_seq"', 1, false);


--
-- Data for Name: 場所マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "場所マスタ" ("場所コード", "場所名", "場所名カナ", "SUB", "場所区分", "会社コード", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 場所区分マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "場所区分マスタ" ("場所区分コード", "場所区分名", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 工程マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "工程マスタ" ("所属コード", "工程コード", "工程名", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 役職マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "役職マスタ" ("役職コード", "役職名", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 所在マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "所在マスタ" ("所在コード", "所在名", "背景色", "文字色", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 所属マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "所属マスタ" ("所属コード", "所属名", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 承認者マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "承認者マスタ" (id, "申請者", "承認者", created_at, updated_at, "順番") FROM stdin;
\.


--
-- Name: 承認者マスタ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"承認者マスタ_id_seq"', 1, false);


--
-- Data for Name: 担当者マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "担当者マスタ" ("担当者コード", "担当者名称", admin, created_at, updated_at, avatar_file_name, avatar_content_type, avatar_file_size, avatar_updated_at, email, password_digest, supervisor) FROM stdin;
\.


--
-- Data for Name: 機関マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "機関マスタ" ("機関コード", "機関名", "備考", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 状態マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "状態マスタ" ("状態コード", "状態名", "状態区分", "勤怠状態名", "マーク", "色", "文字色", "WEB使用区分", "勤怠使用区分", created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: 社員マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "社員マスタ" ("社員番号", "連携用社員番号", "氏名", "所属コード", "直間区分", "役職コード", "内線電話番号", "伝言件数", "回覧件数", "所在コード", created_at, updated_at, "有給残数", "残業区分", "勤務タイプ", "区分", "タイムライン区分", login_time, "序列") FROM stdin;
\.


--
-- Data for Name: 設備マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "設備マスタ" (id, "設備コード", "設備名", "備考", created_at, updated_at) FROM stdin;
\.


--
-- Name: 設備マスタ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"設備マスタ_id_seq"', 1, false);


--
-- Data for Name: 設備予約; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "設備予約" (id, "設備コード", "予約者", "相手先", "開始", "終了", "用件", created_at, updated_at) FROM stdin;
\.


--
-- Name: 設備予約_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"設備予約_id_seq"', 1, false);


--
-- Data for Name: 通信制御マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "通信制御マスタ" (id, "社員番号", "メール", "送信許可区分", created_at, updated_at) FROM stdin;
\.


--
-- Name: 通信制御マスタ_id_seq; Type: SEQUENCE SET; Schema: public; Owner: kl
--

SELECT pg_catalog.setval('"通信制御マスタ_id_seq"', 1, false);


--
-- Data for Name: 駅マスタ; Type: TABLE DATA; Schema: public; Owner: kl
--

COPY "駅マスタ" ("駅コード", "駅名", created_at, updated_at, "駅名カナ", "選択回数") FROM stdin;
\.


--
-- Name: delayed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY delayed_jobs
    ADD CONSTRAINT delayed_jobs_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: jpt_holiday_msts_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY jpt_holiday_msts
    ADD CONSTRAINT jpt_holiday_msts_pkey PRIMARY KEY (id);


--
-- Name: keihi_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY keihi_bodies
    ADD CONSTRAINT keihi_bodies_pkey PRIMARY KEY (id);


--
-- Name: kintais_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY kintais
    ADD CONSTRAINT kintais_pkey PRIMARY KEY (id);


--
-- Name: temps_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY temps
    ADD CONSTRAINT temps_pkey PRIMARY KEY (id);


--
-- Name: ロールマスタ_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "ロールマスタ"
    ADD CONSTRAINT "ロールマスタ_pkey" PRIMARY KEY (id);


--
-- Name: ロールメンバ_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "ロールメンバ"
    ADD CONSTRAINT "ロールメンバ_pkey" PRIMARY KEY (id);


--
-- Name: 伝言_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "伝言"
    ADD CONSTRAINT "伝言_pkey" PRIMARY KEY (id);


--
-- Name: 伝言回答マスタ_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "伝言回答マスタ"
    ADD CONSTRAINT "伝言回答マスタ_pkey" PRIMARY KEY (id);


--
-- Name: 伝言用件マスタ_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "伝言用件マスタ"
    ADD CONSTRAINT "伝言用件マスタ_pkey" PRIMARY KEY (id);


--
-- Name: 優先_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "優先"
    ADD CONSTRAINT "優先_pkey" PRIMARY KEY (id);


--
-- Name: 回覧_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "回覧"
    ADD CONSTRAINT "回覧_pkey" PRIMARY KEY (id);


--
-- Name: 回覧用件マスタ_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "回覧用件マスタ"
    ADD CONSTRAINT "回覧用件マスタ_pkey" PRIMARY KEY (id);


--
-- Name: 回覧詳細_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "回覧詳細"
    ADD CONSTRAINT "回覧詳細_pkey" PRIMARY KEY (id);


--
-- Name: 承認者マスタ_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "承認者マスタ"
    ADD CONSTRAINT "承認者マスタ_pkey" PRIMARY KEY (id);


--
-- Name: 設備マスタ_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "設備マスタ"
    ADD CONSTRAINT "設備マスタ_pkey" PRIMARY KEY (id);


--
-- Name: 設備予約_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "設備予約"
    ADD CONSTRAINT "設備予約_pkey" PRIMARY KEY (id);


--
-- Name: 通信制御マスタ_pkey; Type: CONSTRAINT; Schema: public; Owner: kl
--

ALTER TABLE ONLY "通信制御マスタ"
    ADD CONSTRAINT "通信制御マスタ_pkey" PRIMARY KEY (id);


--
-- Name: delayed_jobs_priority; Type: INDEX; Schema: public; Owner: kl
--

CREATE INDEX delayed_jobs_priority ON delayed_jobs USING btree (priority, run_at);


--
-- Name: index_JOBマスタ_on_job番号; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_JOBマスタ_on_job番号" ON "JOBマスタ" USING btree ("job番号");


--
-- Name: index_keihi_heads_on_申請番号; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_keihi_heads_on_申請番号" ON keihi_heads USING btree ("申請番号");


--
-- Name: index_ロールマスタ_on_ロールコード; Type: INDEX; Schema: public; Owner: kl
--

CREATE INDEX "index_ロールマスタ_on_ロールコード" ON "ロールマスタ" USING btree ("ロールコード");


--
-- Name: index_ロールメンバ_on_社員番号_and_ロールコード; Type: INDEX; Schema: public; Owner: kl
--

CREATE INDEX "index_ロールメンバ_on_社員番号_and_ロールコード" ON "ロールメンバ" USING btree ("社員番号", "ロールコード");


--
-- Name: index_会社マスタ_on_会社コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_会社マスタ_on_会社コード" ON "会社マスタ" USING btree ("会社コード");


--
-- Name: index_分類マスタ_on_分類コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_分類マスタ_on_分類コード" ON "分類マスタ" USING btree ("分類コード");


--
-- Name: index_場所マスタ_on_場所コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_場所マスタ_on_場所コード" ON "場所マスタ" USING btree ("場所コード");


--
-- Name: index_場所区分マスタ_on_場所区分コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_場所区分マスタ_on_場所区分コード" ON "場所区分マスタ" USING btree ("場所区分コード");


--
-- Name: index_工程マスタ_on_所属コード_and_工程コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_工程マスタ_on_所属コード_and_工程コード" ON "工程マスタ" USING btree ("所属コード", "工程コード");


--
-- Name: index_役職マスタ_on_役職コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_役職マスタ_on_役職コード" ON "役職マスタ" USING btree ("役職コード");


--
-- Name: index_所在マスタ_on_所在コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_所在マスタ_on_所在コード" ON "所在マスタ" USING btree ("所在コード");


--
-- Name: index_所属マスタ_on_所属コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_所属マスタ_on_所属コード" ON "所属マスタ" USING btree ("所属コード");


--
-- Name: index_承認者マスタ_on_承認者_and_申請者; Type: INDEX; Schema: public; Owner: kl
--

CREATE INDEX "index_承認者マスタ_on_承認者_and_申請者" ON "承認者マスタ" USING btree ("承認者", "申請者");


--
-- Name: index_担当者マスタ_on_担当者コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_担当者マスタ_on_担当者コード" ON "担当者マスタ" USING btree ("担当者コード");


--
-- Name: index_機関マスタ_on_機関コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_機関マスタ_on_機関コード" ON "機関マスタ" USING btree ("機関コード");


--
-- Name: index_状態マスタ_on_状態コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_状態マスタ_on_状態コード" ON "状態マスタ" USING btree ("状態コード");


--
-- Name: index_社員マスタ_on_社員番号; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_社員マスタ_on_社員番号" ON "社員マスタ" USING btree ("社員番号");


--
-- Name: index_駅マスタ_on_駅コード; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX "index_駅マスタ_on_駅コード" ON "駅マスタ" USING btree ("駅コード");


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: kl
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

