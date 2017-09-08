--{} --> Represents comments or Titles
CREATE (BIGFILE or SMALLFILE) (TEMPORARY or UNDO) TABLESPACE tablespacename
--DATAFILE CLAUSE WITH FILE SPECIFICATION
(
	DATAFILE {file_specification} (filename or ASM_filename) (SIZE 32M) (REUSE) (AUTOEXTEND (ON or OFF)) (NEXT 32M) (MAXSIZE (UNLIMITED or (SIZE 32M)),
	(filename or ASM_filename), (filename or ASM_filename) (SIZE 32M) (BLOCKSIZE SIZE 32M) REUSE
)
--PERMANENT TABLESPACE ATTRIBUTE CLAUSE
(
	(MINIMUN EXTENT SIZE 32M) (BLOCKSIZE 16K) (LOGGING or NOLOGGING orFILESYSTEM_LIKE_LOGGING) (FORCE LOGGING)
	--TABLESPACE ENCRYPTION CLAUSE
	(ENCRYPTION (USING encryption_algorithm_name) or (DECRYPT))
	--DEFAULT TABLESPACE PARAMETERS
	DEFAULT
	--default_table_compression
	(TABLE (COMPRESS FOR OLTP) or (COMPRESS FOR QUERY (LOW or HIGH)) or (COMPRESS FOR ARCHIVE (LOW or HIGH)) or (NOCOMPRESS))
	--(default_index_compression)
	(INDEX (COMPRESS ADVANCED (LOW or HIGH)) or (NOCOMPRESS))
	--(inmemory_clause)
	((INMEMORY (((MEMCOMPRESS FOR (DML)((QUERY or CAPACITY)(LOW or HIGH))) or (NO MEMCOMPRESS)) and/or (PRIORITY (NONE or LOW or MEDIUM or HIGH or CRITICAL) )
	(DISTRIBUTE BY (AUTO and/or ((ROWID RANGE) or PARTITION or SUBPARTITION)) and/or (FOR SERVICE (DEFAULT or ALL or (service_name) or NONE))) and/or ((DUPLICATE (ALL))(NO DUPLICATE)))) or (NO INMEMORY))

	--(ilm_clause)
	ILM ((ADD POLICY(
	-- ilm_compression_policy
	(((COMPRESS) or (ROW STORE COMPRESS (BASIC or ADVANCED)) or (COLUMN STORE COMPRESS FOR ((QUERY or ARCHIVE) (LOW OR HIGH) ((NO) ROW LEVEL LOCKING))) or (NOCOMPRESS))
	 (SEGMENT or GROUP) ((AFTER 32 {integer} (DAY or DAYS) or (MONTH or MONTHS) or (YEAR OF YEARS) OF ((NO ACCESS) or (NO MODIFICATION) or (CREATION))) or ( ON function_name)))
		or
	((ROW STORE COMPRESS ADVANCED) or (COLUMN STORE COMPRESS FOR QUERY) ROW AFTER (32 {integer} (DAY or DAYS) or (MONTH or MONTHS) or (YEAR OF YEARS)) OF NO MODIFICATION)
		or
	--ilm_tiering_policy
	(TIER TO tablespacename (SEGMENT or GROUP) (ON function_name)) or (TIER TO tablespacename READ ONLY (SEGMENT or GROUP) (AFTER 32{integer} (DAY or DAYS) or (MONTH or MONTHS)
	or (YEAR or YEARS) OF (NO ACCESS) or
	(NO MODIFICATION) or (CREATION)) or (ON function_name))
		or
	--_____________________________________ilm_inmemory_policy_______________________________________________
	(SET INMEMORY (inmemory_attributes)) or (MODIFY INMEMORY inmemory_memcompress) or (NO INMEMORY) (SEGMENT) and \
	((AFTER 32{integer} (DAY or DAYS) or (MONTH or MONTHS) or (YEAR OF YEARS) OF (NO ACCESS) or \
	(NO MODIFICATION) or (CREATION)) or (ON function_name))
	  )) (DELETE or ENABLE or DISABLE POLICY ilm_policy_name) (DELATE_ALL or ENABLE_ALL or DISABLE_ALL))

  --inmemory_memcompress
  (MEMCOMPRESS FOR (DML)((QUERY or CAPACITY)(LOW or HIGH)))

	-- storage clause
	STORAGE((INITIAL SIZE 32M) and/or (NEXT SIZE 32M) and/or (MINEXTENTS 8) and/or (MAXEXTENTS (64 or UNLIMITED)) and/or (MAXSIZE (UNLIMITED or (SIZE 32G))) and/or (PCTINCREASE 32) \
	and/or (FREELISTS 32) and/or (FREELIST GROUPS 32) and/or (OPTIMAL (NULL or (SIZE 64K)))\
	and/or (BUFFER_POOL (KEEP or RECYCLE or DEFAULT)) and/or (FLASH_CACHE (KEEP or NONE or DEFAULT)) and/or ENCRYPT)
 	--Online or offline
	(ONLINE OR OFFLINE)
	   or
	--EXTENT MANAGEMENT CLAUSE
	EXTENT MANAGEMENT LOCAL ((AUTOALLOCATE) or (UNIFORM (SIZE SIZE 32M)))
	--SEGMENT MANAGEMENT CLAUSE
	SEGMENT SPACE MANAGEMENT (AUTO or MANUAL)
	--FLASHBACK MODE CLAUSE
	FLASHBACK (ON or OFF)
)
--Temporary Tablespace CLAUSE
(TEMPORARY TABLESPACE) or (LOCAL TEMPORARY TABLESPACE FOR (ALL or LEAF)) tablespacename (TEMPFILE {file_specification} (filename or ASM_filename) (SIZE 32M) (REUSE) (AUTOEXTEND (ON or OFF)) (NEXT 32M) (MAXSIZE (UNLIMITED or (SIZE 32M)),
(filename or ASM_filename), (filename or ASM_filename) (SIZE 32M) (BLOCKSIZE SIZE 32M) REUSE) and/or ({tablespace_group_clause} TABLESPACE GROUP (TablespaceGroupName)) and/or \
 ({extend_management_clause} EXTENT MANAGEMENT LOCAL ((AUTOALLOCATE) or (UNIFORM (SIZE SIZE 32M)))) and/or ({tablespace_encryption_clause} (ENCRYPTION (USING encryption_algorithm_name) or (DECRYPT)))

 --Undo Tablespace CLAUSE
UNDO TABLESPACE tablespacename (DATAFILE {file_specification} (filename or ASM_filename) (SIZE 32M) (REUSE) (AUTOEXTEND (ON or OFF)) (NEXT 32M) (MAXSIZE (UNLIMITED or (SIZE 32M)),
(filename or ASM_filename), (filename or ASM_filename) (SIZE 32M) (BLOCKSIZE SIZE 32M) REUSE) and/or\
({extend_management_clause} EXTENT MANAGEMENT LOCAL ((AUTOALLOCATE) or (UNIFORM (SIZE SIZE 32M)))) and/or ({tablespace_retention_clause} RETENTION (GAURANTEE or NOGAURANTEE)) and/or\
({tablespace_encryption_clause} ENCRYPTION (USING encryption_algorithm_name) or (DECRYPT)) ;






































