CREATE SCHEMA data;

CREATE TABLE data.authority (
    id integer NOT NULL,
    name character varying
);

INSERT INTO data.authority(id, name) VALUES(1, 'ROLE_ADMIN');

CREATE TABLE data."user" (
    id integer NOT NULL,
    email character varying(250) NOT NULL,
    enabled boolean NOT NULL,
    password character varying(250) NOT NULL,
    username character varying(250) NOT NULL
);

INSERT INTO data.user(id, email, enabled, password, username) VALUES(1, 'powell.joshua@epa.gov', true, '$2y$07$IVx1MCFc.ksiD.xkwWMJxutD5qFDblNXs/qa6xEvRjk9s7C.mvLv6', 'jpowel01');

CREATE TABLE data.user_authority (
    user_id integer NOT NULL,
    authority_id integer NOT NULL
);

INSERT INTO data.user_authority(user_id, authority_id) VALUES(1, 1);

CREATE TABLE data.regions (
    id integer NOT NULL,
    name character varying NOT NULL,
    code character varying
);


ALTER TABLE data.regions OWNER TO postgres;

ALTER TABLE data.regions ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME data.regions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY data.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);

CREATE TABLE data.area_of_interest (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    position integer
);


ALTER TABLE data.area_of_interest OWNER TO postgres;

ALTER TABLE data.area_of_interest ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME data.area_of_interest_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY data.area_of_interest
    ADD CONSTRAINT area_of_interest_pkey PRIMARY KEY (id);

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

CREATE TABLE data.additional_information (
    id integer NOT NULL,
    description character varying,
    regioncode character varying
);


ALTER TABLE data.additional_information OWNER TO postgres;

ALTER TABLE data.additional_information ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME data.additional_information_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY data.additional_information
    ADD CONSTRAINT additional_information_pkey PRIMARY KEY (id);

CREATE TABLE data.area_of_interest_items (
    id integer NOT NULL,
    parentid integer NOT NULL,
    name character varying NOT NULL,
    value character varying,
    position integer
);


ALTER TABLE data.area_of_interest_items OWNER TO postgres;

ALTER TABLE data.area_of_interest_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME data.area_of_interest_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY data.area_of_interest_items
    ADD CONSTRAINT area_of_interest_items_pkey PRIMARY KEY (id);

ALTER TABLE ONLY data.area_of_interest_items
    ADD CONSTRAINT parent_id_fk_constraint FOREIGN KEY (parentid) REFERENCES data.area_of_interest(id);

CREATE TABLE data.area_of_interest_sub_items (
    id integer NOT NULL,
    parentid integer NOT NULL,
    name character varying NOT NULL,
    value character varying,
    position integer
);

ALTER TABLE data.area_of_interest_sub_items ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME data.area_of_interest_sub_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY data.area_of_interest_sub_items
    ADD CONSTRAINT area_of_interest_items_pk PRIMARY KEY (id);

ALTER TABLE ONLY data.area_of_interest_sub_items
    ADD CONSTRAINT area_of_interest_items_fk_sub FOREIGN KEY (parentid) REFERENCES data.area_of_interest_items(id);

CREATE TABLE data.steps_to_help_prepare (
    id integer NOT NULL,
    name character varying NOT NULL,
    sub_title character varying,
    description character varying,
    position integer
);

ALTER TABLE data.steps_to_help_prepare ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME data.steps_to_help_prepare_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY data.steps_to_help_prepare
    ADD CONSTRAINT steps_to_help_prepare_pkey PRIMARY KEY (id);

CREATE TABLE data.steps_to_help_prepare_items
(
    id integer NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    parentid integer NOT NULL,
    name character varying COLLATE pg_catalog."default" NOT NULL,
    content character varying COLLATE pg_catalog."default",
    aoi_items_id integer,
    aoi_sub_items_id integer,
    aoi_id integer,
    sub_title character varying,
    CONSTRAINT steps_to_help_prepare_items_pkey PRIMARY KEY (id),
    CONSTRAINT aoi_items_id_fk FOREIGN KEY (aoi_items_id)
        REFERENCES data.area_of_interest_items (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT aoi_sub_items_id_fk FOREIGN KEY (aoi_sub_items_id)
        REFERENCES data.area_of_interest_sub_items (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT steps_to_help_prepare_fk_items FOREIGN KEY (parentid)
        REFERENCES data.steps_to_help_prepare (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT aoi_id_fk FOREIGN KEY (aoi_id)
        REFERENCES data.area_of_interest (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION    
);

ALTER TABLE data.steps_to_help_prepare_items OWNER TO postgres;

CREATE TABLE data.steps_to_help_prepare_sub_items
(
    id integer NOT NULL,
    parentid integer NOT NULL,
    content character varying COLLATE pg_catalog."default" NOT NULL,
    aoi_items_id integer,
    aoi_sub_items_id integer,
    CONSTRAINT steps_to_help_prepare_sub_items_pkey PRIMARY KEY (id),
    CONSTRAINT aoi_items_id_fk FOREIGN KEY (aoi_items_id)
        REFERENCES data.area_of_interest_items (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT aoi_sub_items_id_fk FOREIGN KEY (aoi_sub_items_id)
        REFERENCES data.area_of_interest_sub_items (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT steps_to_help_prepare_fk_sub_items FOREIGN KEY (parentid)
        REFERENCES data.steps_to_help_prepare_items (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

ALTER TABLE data.steps_to_help_prepare_sub_items OWNER TO postgres;

DELETE FROM data.additional_information;

DELETE FROM data.regions;

INSERT INTO data.regions(
    name, code)
VALUES ('Northeast', 'NE');

INSERT INTO data.regions(
    name, code)
VALUES ('Southeast & Caribbean', 'SE');

INSERT INTO data.regions(
    name, code)
VALUES ('Midwest', 'MW');

INSERT INTO data.regions(
    name, code)
VALUES ('Great Plains', 'GP');

INSERT INTO data.regions(
    name, code)
VALUES ('Southwest', 'SW');

INSERT INTO data.regions(
    name, code)
VALUES ('Northwest', 'NW');

INSERT INTO data.regions(
    name, code)
VALUES ('Hawai''i & Pacific Islands', 'HI');

INSERT INTO data.regions(
    name, code)
VALUES ('Alaska', 'AK');

INSERT INTO data.additional_information (description, regioncode) VALUES ('<p class="indented" id="region_summary"><p>The Northeast is projected to experience increased precipitation, more frequent and intense storms, and higher average temperatures. These projected changes pose challenges to communities as they protect water and waste infrastructure, maintain water quality, and protect air quality and public health. Many communities are building resilience to the risks they face under current climatic conditions.</p>

				<div>Use the links below for additional information about:</div>

				<ul><li><a href="https://www.globalchange.gov/explore/northeast" target="_blank">Climate Impacts on the Northeast</a></li>
					<li><a href="https://19january2017snapshot.epa.gov/climate-impacts/climate-change-impacts-state_.html" target="_blank">What Climate Change Means for Your State</a></li>
					<li><a href="/arc-x/regional-guides-adapting-climate-change" target="_blank">How Communities in the Northeast are Adapting</a></li>
				</ul></p>', 'NE');
INSERT INTO data.additional_information (description, regioncode) VALUES ('<p class="indented" id="region_summary"><p>The Midwest is projected to experience extreme heat, heavy downpours, and flooding that will affect infrastructure, health, agriculture, forestry, transportation, air and water quality, and more. Climate change will also exacerbate a range of risks to the Great Lakes.</p>

				<div>Use the links below for additional information about:</div>

				<ul><li><a href="https://www.globalchange.gov/explore/midwest" target="_blank">Climate Impacts on the Midwest</a></li>
					<li><a href="https://19january2017snapshot.epa.gov/climate-impacts/climate-change-impacts-state_.html" target="_blank">What Climate Change Means for Your State</a></li>
					<li><a href="/arc-x/regional-guides-adapting-climate-change" target="_blank">How Communities in the Midwest are Adapting</a></li>
				</ul></p>', 'MW');
INSERT INTO data.additional_information (description, regioncode) VALUES ('<p class="indented" id="region_summary"><p>The southeast region is projected to experience higher average temperatures, increased precipitation, and more frequent and intense storms. These projected changes pose challenges to communities as they diversify water source, protect sensitive wetlands and protect people from heat waves. Climate impacts vary from a wet northern area to a dry southwest area.</p>

				<div>Use the links below for additional information about:</div>

				<ul><li><a href="https://www.globalchange.gov/explore/southeast-caribbean" target="_blank">Climate Impacts on the Southeast</a></li>
					<li><a href="https://19january2017snapshot.epa.gov/climate-impacts/climate-change-impacts-state_.html" target="_blank">What Climate Change Means for Your State</a></li>
					<li><a href="/arc-x/regional-guides-adapting-climate-change" target="_blank">How Communities in the Southeast are Adapting</a></li>
				</ul></p>', 'SE');
INSERT INTO data.additional_information (description, regioncode) VALUES ('<p class="indented" id="region_summary"><p>The Hawai''i and Pacific Islands are projected to experience warmer oceans leading to increased coral bleaching and disease outbreaks and changing distribution of tuna fisheries. Freshwater supplies will become more limited on many islands. Coastal flooding and erosion will increase. Mounting threats to food and water security, infrastructure, health, and safety are expected to lead to increasing human migration.</p>

				<div>Use the links below for additional information about:</div>

				<ul><li><a href="https://www.globalchange.gov/explore/hawai%CA%BBi-pacific-islands" target="_blank">Climate Impacts on Hawai''i and Pacific Islands</a></li>
					<li><a href="https://19january2017snapshot.epa.gov/climate-impacts/climate-change-impacts-state_.html" target="_blank">What Climate Change Means for Your State</a></li>
					<li><a href="/arc-x/regional-guides-adapting-climate-change" target="_blank">How Communities in Hawai''i and Pacific Islands are Adapting</a></li>
				</ul></p>', 'HI');
INSERT INTO data.additional_information (description, regioncode) VALUES ('<p class="indented" id="region_summary"><p>The Great Plains is projected to experience rising temperatures leading to increased demand for water and energy. In parts of the region, this will constrain development, stress natural resources, and increase competition for water. New agricultural practices will be needed to cope with changing conditions.</p>

				<div>Use the links below for additional information about:</div>

				<ul><li><a href="https://www.globalchange.gov/explore/great-plains" target="_blank">Climate Impacts on the Great Plains</a></li>
					<li><a href="https://19january2017snapshot.epa.gov/climate-impacts/climate-change-impacts-state_.html" target="_blank">What Climate Change Means for Your State</a></li>
					<li><a href="/arc-x/regional-guides-adapting-climate-change" target="_blank">How Communities in the Great Plains are Adapting</a></li>
				</ul></p>', 'GP');
INSERT INTO data.additional_information (description, regioncode) VALUES ('<p class="indented" id="region_summary"><p>The Northwest is projected to experience changes in the timing of streamflow that will reduce water supplies for competing demands. Sea level rise, erosion, inundation, risks to infrastructure, and increasing ocean acidity pose major threats. Increasing wildfire, insect outbreaks, and tree diseases are causing widespread tree die-off.</p>

				<div>Use the links below for additional information about:</div>

				<ul><li><a href="https://www.globalchange.gov/explore/northwest" target="_blank">Climate Impacts on the Northwest</a></li>
					<li><a href="https://19january2017snapshot.epa.gov/climate-impacts/climate-change-impacts-state_.html" target="_blank">What Climate Change Means for Your State</a></li>
					<li><a href="/arc-x/regional-guides-adapting-climate-change" target="_blank">How Communities in the Northwest are Adapting</a></li>
				</ul></p>', 'NW');
INSERT INTO data.additional_information (description, regioncode) VALUES ('<p class="indented" id="region_summary"><p>The Southwest is projected to experience increased heat, drought, insect outbreaks, and wildfires. Declining water supplies, reduced agricultural yields, health impacts in cities due to heat, and flooding and erosion in coastal areas are additional concerns.</p>

				<div>Use the links below for additional information about:</div>

				<ul><li><a href="https://www.globalchange.gov/explore/southwest" target="_blank">Climate Impacts on the Southwest</a></li>
					<li><a href="https://19january2017snapshot.epa.gov/climate-impacts/climate-change-impacts-state_.html" target="_blank">What Climate Change Means for Your State</a></li>
					<li><a href="/arc-x/regional-guides-adapting-climate-change" target="_blank">How Communities in the Southwest are Adapting</a></li>
				</ul></p>', 'SW');
INSERT INTO data.additional_information (description, regioncode) VALUES ('<p class="indented" id="region_summary"><p>Alaska has warmed twice as fast as the rest of the nation, bringing widespread impacts. Sea ice is rapidly receding and glaciers are shrinking. Thawing permafrost is leading to more wildfire, and affecting infrastructure and wildlife habitat. Rising ocean temperatures and acidification will alter valuable marine fisheries.</p>

				<div>Use the links below for additional information about:</div>

				<ul><li><a href="https://www.globalchange.gov/explore/alaska" target="_blank">Climate Impacts on Alaska</a></li>
					<li><a href="https://19january2017snapshot.epa.gov/climate-impacts/climate-change-impacts-state_.html" target="_blank">What Climate Change Means for Your State</a></li>
					<li><a href="/arc-x/regional-guides-adapting-climate-change" target="_blank">How Communities in Alaska are Adapting</a></li>
				</ul></p>', 'AK');
