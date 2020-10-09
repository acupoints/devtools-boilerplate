literal@artemisia MINGW64 ~/Desktop/1010/heroku-ruby-boilerplate (master)
$ heroku run rails db:migrate --app damp-plateau-39759
Running rails db:migrate on ⬢ damp-plateau-39759... up, run.4112 (Hobby)
D, [2020-10-09T19:13:06.331210 #4] DEBUG -- :    (2.3ms)  SELECT pg_try_advisory_lock(6585399259737777360)
D, [2020-10-09T19:13:06.367518 #4] DEBUG -- :    (1.6ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
D, [2020-10-09T19:13:06.377670 #4] DEBUG -- :   ActiveRecord::InternalMetadata Load (1.0ms)  SELECT "ar_internal_metadata".* FROM "ar_internal_metadata" WHERE "ar_internal_metadata"."key" = $1 LIMIT $2  [["key", "environment"], ["LIMIT", 1]]
D, [2020-10-09T19:13:06.387000 #4] DEBUG -- :    (0.9ms)  SELECT pg_advisory_unlock(6585399259737777360)

literal@artemisia MINGW64 ~/Desktop/1010/heroku-ruby-boilerplate (master)
$ heroku run rails db:migrate --app damp-plateau-39759
Running rails db:migrate on ⬢ damp-plateau-39759... up, run.9038 (Hobby)
D, [2020-10-09T19:17:55.336075 #4] DEBUG -- :    (0.8ms)  SELECT pg_try_advisory_lock(6585399259737777360)
D, [2020-10-09T19:17:55.348890 #4] DEBUG -- :    (1.4ms)  SELECT "schema_migrations"."version" FROM "schema_migrations" ORDER BY "schema_migrations"."version" ASC
I, [2020-10-09T19:17:55.350145 #4]  INFO -- : Migrating to CreateFyrbTags (20201009140310)
== 20201009140310 CreateFyrbTags: migrating ===================================
-- create_table(:fyrb_tags)
D, [2020-10-09T19:17:55.353984 #4] DEBUG -- :    (0.7ms)  BEGIN
D, [2020-10-09T19:17:55.395415 #4] DEBUG -- :    (41.3ms)  CREATE TABLE "fyrb_tags" ("id" bigserial primary key, "name" character varying, "description" text, "color" character varying, "fyrb_user_id" bigint NOT NULL, "created_at" timestamp(6) NOT NULL, "updated_at" timestamp(6) NOT NULL, CONSTRAINT "fk_rails_f0acfd5923"
FOREIGN KEY ("fyrb_user_id")
  REFERENCES "fyrb_users" ("id")
)
D, [2020-10-09T19:17:55.403652 #4] DEBUG -- :    (3.7ms)  CREATE  INDEX  "index_fyrb_tags_on_fyrb_user_id" ON "fyrb_tags"  ("fyrb_user_id")
   -> 0.0510s
== 20201009140310 CreateFyrbTags: migrated (0.0512s) ==========================

D, [2020-10-09T19:17:55.412293 #4] DEBUG -- :   primary::SchemaMigration Create (2.1ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20201009140310"]]
D, [2020-10-09T19:17:55.414189 #4] DEBUG -- :    (1.7ms)  COMMIT
I, [2020-10-09T19:17:55.414292 #4]  INFO -- : Migrating to CreateFyrbTools (20201009140406)
== 20201009140406 CreateFyrbTools: migrating ==================================
-- create_table(:fyrb_tools)
D, [2020-10-09T19:17:55.416200 #4] DEBUG -- :    (0.6ms)  BEGIN
D, [2020-10-09T19:17:55.426114 #4] DEBUG -- :    (9.8ms)  CREATE TABLE "fyrb_tools" ("id" bigserial primary key, "name" character varying, "description" text, "active" integer, "fyrb_user_id" bigint NOT NULL, "created_at" timestamp(6) NOT NULL, "updated_at" timestamp(6) NOT NULL, CONSTRAINT "fk_rails_127bdcab9d"
FOREIGN KEY ("fyrb_user_id")
  REFERENCES "fyrb_users" ("id")
)
D, [2020-10-09T19:17:55.431394 #4] DEBUG -- :    (2.7ms)  CREATE  INDEX  "index_fyrb_tools_on_fyrb_user_id" ON "fyrb_tools"  ("fyrb_user_id")
   -> 0.0164s
== 20201009140406 CreateFyrbTools: migrated (0.0165s) =========================

D, [2020-10-09T19:17:55.432819 #4] DEBUG -- :   primary::SchemaMigration Create (0.8ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20201009140406"]]
D, [2020-10-09T19:17:55.434885 #4] DEBUG -- :    (1.9ms)  COMMIT
I, [2020-10-09T19:17:55.434987 #4]  INFO -- : Migrating to CreateFyrbFragments (20201009140849)
== 20201009140849 CreateFyrbFragments: migrating ==============================
-- create_table(:fyrb_fragments)
D, [2020-10-09T19:17:55.436996 #4] DEBUG -- :    (0.7ms)  BEGIN
D, [2020-10-09T19:17:55.451334 #4] DEBUG -- :    (14.2ms)  CREATE TABLE "fyrb_fragments" ("id" bigserial primary key, "title" character varying, "introduction" text, "detail" text, "summary" text, "group" text, "level" integer, "fyrb_tool_id" bigint NOT NULL, "fyrb_micropost_id" bigint NOT NULL, "created_at" timestamp(6) NOT NULL, "updated_at" timestamp(6) NOT NULL, CONSTRAINT "fk_rails_355a0b496a"
FOREIGN KEY ("fyrb_tool_id")
  REFERENCES "fyrb_tools" ("id")
, CONSTRAINT "fk_rails_fb3062e167"
FOREIGN KEY ("fyrb_micropost_id")
  REFERENCES "fyrb_microposts" ("id")
)
D, [2020-10-09T19:17:55.461522 #4] DEBUG -- :    (3.7ms)  CREATE  INDEX  "index_fyrb_fragments_on_fyrb_tool_id" ON "fyrb_fragments"  ("fyrb_tool_id")
D, [2020-10-09T19:17:55.480901 #4] DEBUG -- :    (11.5ms)  CREATE  INDEX  "index_fyrb_fragments_on_fyrb_micropost_id" ON "fyrb_fragments"  ("fyrb_micropost_id")
   -> 0.0453s
== 20201009140849 CreateFyrbFragments: migrated (0.0454s) =====================

D, [2020-10-09T19:17:55.486310 #4] DEBUG -- :   primary::SchemaMigration Create (4.7ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20201009140849"]]
D, [2020-10-09T19:17:55.487930 #4] DEBUG -- :    (1.4ms)  COMMIT
I, [2020-10-09T19:17:55.488015 #4]  INFO -- : Migrating to CreateFyrbTerms (20201009143430)
== 20201009143430 CreateFyrbTerms: migrating ==================================
-- create_table(:fyrb_terms)
D, [2020-10-09T19:17:55.490036 #4] DEBUG -- :    (0.7ms)  BEGIN
D, [2020-10-09T19:17:55.522524 #4] DEBUG -- :    (32.4ms)  CREATE TABLE "fyrb_terms" ("id" bigserial primary key, "phrase" character varying, "annotation" text, "fyrb_user_id" bigint NOT NULL, "fyrb_micropost_id" bigint NOT NULL, "created_at" timestamp(6) NOT NULL, "updated_at" timestamp(6) NOT NULL, CONSTRAINT "fk_rails_7a6ccd2698"
FOREIGN KEY ("fyrb_user_id")
  REFERENCES "fyrb_users" ("id")
, CONSTRAINT "fk_rails_722647a03d"
FOREIGN KEY ("fyrb_micropost_id")
  REFERENCES "fyrb_microposts" ("id")
)
D, [2020-10-09T19:17:55.537034 #4] DEBUG -- :    (8.6ms)  CREATE  INDEX  "index_fyrb_terms_on_fyrb_user_id" ON "fyrb_terms"  ("fyrb_user_id")
D, [2020-10-09T19:17:55.552640 #4] DEBUG -- :    (6.8ms)  CREATE  INDEX  "index_fyrb_terms_on_fyrb_micropost_id" ON "fyrb_terms"  ("fyrb_micropost_id")
   -> 0.0639s
== 20201009143430 CreateFyrbTerms: migrated (0.0640s) =========================

D, [2020-10-09T19:17:55.556733 #4] DEBUG -- :   primary::SchemaMigration Create (3.5ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20201009143430"]]
D, [2020-10-09T19:17:55.558460 #4] DEBUG -- :    (1.5ms)  COMMIT
I, [2020-10-09T19:17:55.558566 #4]  INFO -- : Migrating to CreateFyrbStatements (20201009143831)
== 20201009143831 CreateFyrbStatements: migrating =============================
-- create_table(:fyrb_statements)
D, [2020-10-09T19:17:55.560728 #4] DEBUG -- :    (0.7ms)  BEGIN
D, [2020-10-09T19:17:55.571789 #4] DEBUG -- :    (10.9ms)  CREATE TABLE "fyrb_statements" ("id" bigserial primary key, "original" text, "comprehension" text, "fyrb_term_id" bigint NOT NULL, "fyrb_micropost_id" bigint NOT NULL, "created_at" timestamp(6) NOT NULL, "updated_at" timestamp(6) NOT NULL, CONSTRAINT "fk_rails_dbf602364b"
FOREIGN KEY ("fyrb_term_id")
  REFERENCES "fyrb_terms" ("id")
, CONSTRAINT "fk_rails_37ac196326"
FOREIGN KEY ("fyrb_micropost_id")
  REFERENCES "fyrb_microposts" ("id")
)
D, [2020-10-09T19:17:55.577148 #4] DEBUG -- :    (2.7ms)  CREATE  INDEX  "index_fyrb_statements_on_fyrb_term_id" ON "fyrb_statements"  ("fyrb_term_id")
D, [2020-10-09T19:17:55.582435 #4] DEBUG -- :    (2.8ms)  CREATE  INDEX  "index_fyrb_statements_on_fyrb_micropost_id" ON "fyrb_statements"  ("fyrb_micropost_id")
   -> 0.0232s
== 20201009143831 CreateFyrbStatements: migrated (0.0233s) ====================

D, [2020-10-09T19:17:55.583714 #4] DEBUG -- :   primary::SchemaMigration Create (0.7ms)  INSERT INTO "schema_migrations" ("version") VALUES ($1) RETURNING "version"  [["version", "20201009143831"]]
D, [2020-10-09T19:17:55.586310 #4] DEBUG -- :    (2.4ms)  COMMIT
D, [2020-10-09T19:17:55.592730 #4] DEBUG -- :   ActiveRecord::InternalMetadata Load (0.8ms)  SELECT "ar_internal_metadata".* FROM "ar_internal_metadata" WHERE "ar_internal_metadata"."key" = $1 LIMIT $2  [["key", "environment"], ["LIMIT", 1]]
D, [2020-10-09T19:17:55.600976 #4] DEBUG -- :    (1.0ms)  SELECT pg_advisory_unlock(6585399259737777360)

literal@artemisia MINGW64 ~/Desktop/1010/heroku-ruby-boilerplate (master)
