-- Tablespace Set
CREATE TABLESPACE SET tablespaceset1 IN SHARDSPACE shardgroup1 USING TEMPLATE
		(DATAFILE SIZE 100m
		 EXTENT MANAGEMENT LOCAL
		 SEGMENT SPACE MANAGEMENT AUTO
		);